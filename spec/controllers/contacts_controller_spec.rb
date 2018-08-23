require 'spec_helper'

RSpec.describe ContactsController, type: :controller do
  describe "get contacts page" do
    it "should get the contacts page" do
      contact = FactoryBot.create(:contact)
      result = get :index
    end
  end
end
