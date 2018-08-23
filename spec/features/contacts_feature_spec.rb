require 'spec_helper'

RSpec.describe ContactsController, type: :feature do
  describe "visit contacts page" do
    it "should show the contacts page" do
      contact = FactoryBot.create(:contact)
      visit :index
    end
  end
end
