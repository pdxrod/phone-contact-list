require 'spec_helper'

describe "basic spec" do

  it "should create a valid contact" do
    Contact.delete_all
    expect( Contact.count ).to eq 0
    FactoryBot.create :contact
    expect( Contact.count ).to eq 1
  end

end
