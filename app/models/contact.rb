class Contact < ApplicationRecord

  LETTERS = ["~", "~", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
  NUMBERS = "0123456789".split ''

  def self.locate( numbers_or_letters )
    all_contacts = Contact.all # It's easier and perhaps faster to match in memory using Ruby rather than use '%' matching in SQL
    letters_or_numbers = numbers_or_letters.to_s
    contacts = []
    contacts.concat all_contacts.select {|contact| contact.name.downcase.include?( letters_or_numbers )}
    contacts.concat all_contacts.select {|contact| contact.number.to_s.downcase.include?( letters_or_numbers )}


    return contacts.uniq
  end

end
