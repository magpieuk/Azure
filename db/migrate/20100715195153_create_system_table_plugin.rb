class CreateSystemTablePlugin < ActiveRecord::Migration
  def self.up
    load(Rails.root.join('db', 'seeds', 'system_tables.rb'))
  end

  def self.down
  end
end
