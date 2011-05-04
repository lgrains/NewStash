class CreateYardages < ActiveRecord::Migration
  def self.up
    create_table :yardages do |t|
      t.string :title
      t.text :description
      t.float :length
      t.float :width
      t.decimal :cost_per_yard
      t.integer :treatment_method
      t.string :manufacturer
      t.string :fabric_line_name
      t.string :fabric_designer
      t.integer :fabric_type

      t.timestamps
    end
  end

  def self.down
    drop_table :yardages
  end
end
