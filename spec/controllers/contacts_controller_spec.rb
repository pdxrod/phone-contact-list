require 'spec_helper'

RSpec.describe ContactsController do
  describe "get contacts page" do
    it "should show the contacts page" do
      contact = FactoryBot.create(:contact)
      get :index
      page.should have_content("Contacts")
    end
  end
end
