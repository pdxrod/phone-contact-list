class PopulateDatabase < ActiveRecord::Migration[5.2]
  def change
    Contact.delete_all
    names = ["Alan", "Jim", "Jane", "Nayani", "Ashok"]
    5.times do |n|
      Contact.create(name: names[n], number: "#{n}#{n}")
    end
  end
end
