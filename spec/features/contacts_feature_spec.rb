require 'spec_helper'

RSpec.describe ContactsController, type: :feature do

  before do
    Contact.delete_all
    names = ["Alan", "Jim", "Jane", "Nayani", "Ashok"]
    5.times do |n|
      FactoryBot.create(:contact, name: names[n], number: "#{n}#{n}")
    end
  end

  describe "testing data" do
    it "should have the right numbers for the right names" do
# To test the app is searching using both numbers and letters - e.g. number
# 1 also means abc, number 9 also means wxyz. Hitting 1 should show
# Alan 00, because Alan has 'a' in his name. Hitting 4 should show Ashok 44,
# because he has 4 in his number. Hitting 9 should show nobody.
    alan = Contact.find_by_name( "Alan" )
    expect(alan.number).to eq "00"
    ashok = Contact.find_by_name( "Ashok" )
    expect(ashok.number).to eq "44"
    end
  end

  describe "visiting contacts page" do
    it "should show the contacts page" do
      visit :contacts
      expect(page).to have_content "Contacts"
      expect(page).not_to have_content "Alan" # until user has started pressing keys
    end
  end

  describe "going to a number" do
    it "should show contact with an a in his name if you hit 1" do
      visit "/1"
      expect(page).to have_content "Alan"
      expect(page).not_to have_content "Ashok"
    end

    it "should show contact with a 4 in his number if you hit 4" do
      visit "/4"
      expect(page).to have_content "Ashok"
      expect(page).not_to have_content "Alan"
    end

    it "should not show either one if you hit 9" do
      visit "/9"
      expect(page).not_to have_content "Alan"
      expect(page).not_to have_content "Ashok"
    end
  end

end
