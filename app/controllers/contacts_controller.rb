class ContactsController < ApplicationController

  def index
    @contacts = contacts_for_number params["number"]
    respond_to do |format|
      format.html
      format.json { render json: @contacts }
    end
  end

  def search
    string = params["string"] ? params["string"].to_s.downcase : ""
    @contacts = contacts_for_letters_and_numbers string
    respond_to do |format|
      format.html
      format.json { render json: @contacts }
    end
  end

  private
    LETTERS = ["~", "~", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
    NUMBERS = "0123456789".split ''

    def contacts_for_letters_and_numbers( string )
      letters_and_numbers = string.split ''
      contacts = []
      letters_and_numbers.each do |letter_or_number|
        if NUMBERS.include? letter_or_number
          contacts.concat contacts_for_number( letter_or_number )
        else
          contacts.concat contacts_for_letter( letter_or_number )
        end
      end
      return contacts.uniq
    end

    def contacts_for_letter( letter )
      contacts = []
      Contact.all.each do |contact|

puts "\ncontacts for letter - including #{contact.name} for letter #{letter}" if contact.name.downcase.include?( letter )

        contacts << contact if contact.name.downcase.include?( letter )
      end
      contacts
    end

    def contacts_for_number( number )
      return [] if number.nil?
      letters = LETTERS[ number.to_i ]
      contacts = []
      Contact.all.each do |contact|
        contacts << contact if contact.number.include?( number.to_s ) || contains_letter?( contact.name, letters )
      end
      return contacts
    end

    def contains_letter?( name, string )
      letters = string.split ''
      lower = name.downcase
      letters.each do |letter|
        return true if lower.include? letter
      end
      return false
    end

end
