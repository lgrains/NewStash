class AddColumnsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :role_id, :integer, :null => false
    add_column :users, :full_name, :string
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :zip, :string

  end

  def self.down
    remove_column :users, :role_id
    remove_column :users, :full_name
    remove_column :users, :street_address
    remove_column :users, :city
    remove_column :users, :state
    remove_column :users, :country
    remove_column :users, :zip
  end


end
