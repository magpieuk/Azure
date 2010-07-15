class CreateLocations < ActiveRecord::Migration

  def self.up
    create_table :locations do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :locations, :id

  end

  def self.down
    drop_table :locations
  end

end
