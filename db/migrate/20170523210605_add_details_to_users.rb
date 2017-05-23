class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :zip, :integer
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :phone, :string
    add_column :users, :school, :text
    add_column :users, :work, :text
    add_column :users, :hobbies, :text
    add_column :users, :birthday, :date
  end
end
