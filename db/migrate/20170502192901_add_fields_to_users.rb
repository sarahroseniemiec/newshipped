class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :coname, :string
  end
end
