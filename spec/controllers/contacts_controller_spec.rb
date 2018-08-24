require 'spec_helper'

RSpec.describe ContactsController, type: :controller do
  describe "get contacts page" do
    it "should get the contacts page" do
      contact = FactoryBot.create(:contact)
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
