require 'rails_helper'

RSpec.describe Contact, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"

  before do
    Contact.delete_all
    names = ["Alan", "Jim", "Jane", "Nayani", "Ashok"]
    5.times do |n|
      FactoryBot.create(:contact, name: names[n], number: "#{n}#{n}")
    end
    @contact = Contact.find_by_name "Jim"
  end

  describe "contact" do
    it "creates a contact" do
      expect(@contact.name).to eq "Jim"
      expect(@contact.number).to eq "11"
    end
  end

  describe "contact class methods for analyzing user entry" do
    it "finds the right contacts for 629" do
      contacts = Contact.locate 629
      expect(contacts.size).to eq 1
      expect(contacts[0].name).to eq "Nayani"
    end

    it "finds the right contacts for 1" do
      contacts = Contact.locate 1
      expect(contacts.size).to eq 1
      expect(contacts[0].name).to eq "Jim"
    end

    it "finds the right contacts for 11" do
      contacts = Contact.locate 11
      expect(contacts.size).to eq 1
      expect(contacts[0].name).to eq "Jim"
    end

    it "finds the right contacts for 'sho'" do
      contacts = Contact.locate "sho"
      expect(contacts.size).to eq 1
      expect(contacts[0].name).to eq "Ashok"
    end

    it "finds the right contacts for 'an'" do
      contacts = Contact.locate "an"
      expect(contacts.size).to eq 3
      # Alan Jane Nayani
    end

    it "finds no contacts for 'f00'" do
      contacts = Contact.locate "f00"
      expect(contacts.size).to eq 0
    end
  end

end
