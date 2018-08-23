require 'spec_helper'

RSpec.describe ContactsController, type: :feature do

  before do
    5.times do
      FactoryBot.create(:contact)
    end
  end

  describe "visiting contacts page" do
    it "should show the contacts page" do
      visit :contacts
      expect(page).to have_content "Contacts"
      expect(page).not_to have_content "Fred Bloggs" # until user has started pressing keys
    end
  end

end
