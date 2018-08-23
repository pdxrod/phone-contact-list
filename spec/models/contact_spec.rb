require 'rails_helper'

RSpec.describe Contact, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @contact = Contact.new(name: "Fred Bloggs", number: "2021113333")
  end

  describe "contact" do
    it "creates a contact" do
      expect(@contact.name).to eq "Fred Bloggs"
      expect(@contact.number).to eq "2021113333"
    end
  end

end
