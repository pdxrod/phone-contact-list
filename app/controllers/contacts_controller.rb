class ContactsController < ApplicationController

  def index
    @contacts = contacts_for_number params["number"]
    respond_to do |format|
      format.html
      format.json { render json: @contacts }
    end
  end

  def search
    @contacts = Contact.all
    respond_to do |format|
      format.html
      format.json { render json: @contacts }
    end
  end

  private
    LETTERS = ["~", "~", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
    def contacts_for_number( number )
      return [] if number.nil?
      letters = LETTERS[ number ]
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
