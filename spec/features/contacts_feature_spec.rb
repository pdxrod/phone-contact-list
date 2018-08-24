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
      expect(page).not_to have_content "Alan" # until user has started pressing keys or typing
    end
  end

  describe "a combination of letters and numbers on the search page - this is called from AJAX on the index page:" do

    it "should be case-insensitive" do
      visit "/search/2"
      expect(page).to have_content "Ashok"
    end

    it "should show contacts with a in their names if you hit 2" do
      visit "/search/2"
      expect(page).to have_content "Alan"
      expect(page).to have_content "Nayani"
      expect(page).to have_content "Jane"
      expect(page).not_to have_content "Jim"
    end

    it "should show contact with a 4 in his number if you hit 4" do
      visit "/search/4"
      expect(page).to have_content "Ashok"
    end

    it "should only show Jim 11 if you hit 1" do
      visit "/search/1"
      expect(page).to have_content "Jim"
      expect(page).not_to have_content "Alan"
      expect(page).not_to have_content "Ashok"
      expect(page).not_to have_content "Nayani"
      expect(page).not_to have_content "Jane"
    end

    it "should only show Jim 11 if you hit 11" do
      visit "/search/11"
      expect(page).to have_content "Jim"
      expect(page).not_to have_content "Alan"
      expect(page).not_to have_content "Ashok"
      expect(page).not_to have_content "Nayani"
      expect(page).not_to have_content "Jane"
    end

    it "should only show Nayani 33 if you hit 9" do
      visit "/search/9"
      expect(page).to have_content "Nayani"
      expect(page).not_to have_content "Alan"
      expect(page).not_to have_content "Ashok"
      expect(page).not_to have_content "Jane"
      expect(page).not_to have_content "Jim"
    end

    it "should only show Nayani 33 if you hit 629" do
      visit "/search/629" #     6 - mNo, 2 - Abc, 9 - wxYz - NAYani
      expect(page).to have_content "Nayani"
      expect(page).not_to have_content "Alan"
      expect(page).not_to have_content "Ashok"
      expect(page).not_to have_content "Jane"
      expect(page).not_to have_content "Jim"
    end

    it "should use numbers in search" do
      visit "/search/9"
      expect(page).to have_content "Nayani"
      expect(page).not_to have_content "Alan"
    end

    it "should use letters in search" do
      visit "/search/Ay"
      expect(page).to have_content "Nayani"
      expect(page).not_to have_content "Alan"
    end

    pending it "should use letters and numbers in search" do
      visit "/search/3y"
      expect(page).to have_content "Nayani"
      expect(page).to have_content "Jane"
      expect(page).not_to have_content "Jim"
    end
  end

end
