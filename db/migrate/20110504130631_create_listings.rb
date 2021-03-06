class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.string :title
      t.string :resource_type
      t.integer :resource_id

      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end
