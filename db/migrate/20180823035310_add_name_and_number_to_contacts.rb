class AddNameAndNumberToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :name, :string
    add_column :contacts, :number, :string
  end
end
