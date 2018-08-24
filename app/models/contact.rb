class Contact < ApplicationRecord

  LETTERS = ["~", "~", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
  NUMBERS = "0123456789".split ''

  def self.locate( numbers_or_letters )
    all_contacts = Contact.all # It's easier and perhaps faster to match in memory using Ruby rather than use '%' matching in SQL
    letters_or_numbers = numbers_or_letters.to_s.downcase
    contacts = []
    contacts.concat all_contacts.select {|contact| contact.name.downcase.include?( letters_or_numbers )}
    contacts.concat all_contacts.select {|contact| contact.number.downcase.include?( letters_or_numbers )}
    contacts.concat all_possible_matches_from_phone_numbers letters_or_numbers, all_contacts
    return contacts.uniq
  end

  private
# Given 23, it would find all names containing any of ad ae af bd be bf cd ce cf
    def self.all_possible_matches_from_phone_numbers( some_letters, some_contacts )
      numbers = some_letters.to_s.split ''
      numbers.each do |number|
        return [] unless NUMBERS.include? number
      end
      contacts = []
      letter_groups = []
      numbers.each do |number|
        letter_groups << LETTERS[ number.to_i ] # [abc, def, pqrs]
      end
      letter_arrays = []
      letter_groups.each do |letter_group|
        letters = letter_group.split '' # [a, b, c]
        letter_arrays << letters        # [ [a, b, c], [d, e, f], [p, q, r, s] ]
      end                               # Thanks again, stackoverflow
      letter_arrays.first.product(*letter_arrays[1..-1]).map(&:join).each do |str|
        contacts.concat some_contacts.select {|contact| contact.name.downcase.include? str}
      end
      return contacts
    end

end
