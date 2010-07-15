class CreateSystemTables < ActiveRecord::Migration

  def self.up
    create_table :system_tables do |t|
      t.string :name
      t.integer :position
      t.timestamps
    end

    add_index :system_tables, :id

    load(Rails.root.join('db', 'seeds', 'system_tables.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "System Tables"})
    drop_table :system_tables
  end

end
