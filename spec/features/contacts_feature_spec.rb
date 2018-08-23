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
    end
  end
  
end
