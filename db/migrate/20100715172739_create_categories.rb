class CreateCategories < ActiveRecord::Migration

  def self.up
    create_table :categories do |t|
      t.string :name
      t.integer :position
      t.timestamps
    end
    add_index :categories, :id
  end

  def self.down
    drop_table :categories
  end

end
