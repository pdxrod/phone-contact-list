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
# Given Jim11, it would not find anything, even if there is a Jim 11 in the database
    def self.all_possible_matches_from_phone_numbers( some_letters, some_contacts )
      numbers = some_letters.to_s.split ''
      numbers.each do |number|
        return [] unless NUMBERS.include? number
      end
      contacts = []
      letter_groups = []
      numbers.each do |number|
        letter_groups << LETTERS[ number.to_i ] # [abc def]
      end
      letter_arrays = []
      letter_groups.each do |letter_group|
        letters = letter_group.split '' # [a, b, c]
        letter_arrays << letters        # [ [a, b, c], [d, e, f] ]
      end
      letter_arrays.size.times do |i|
        letter_arrays.size.times do |j|
          unless i == j
            one = letter_arrays[ i ]
            two = letter_arrays[ j ]
            one.size.times do |k|
              two.size.times do |l|
                first = one[ k ]
                second = two[ l ]
                string = first + second
                contacts.concat some_contacts.select {|contact| contact.name.downcase.include? string}
              end
            end
          end
        end
        return contacts
      end
    end

end
