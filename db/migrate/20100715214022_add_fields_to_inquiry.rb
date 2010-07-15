class AddFieldsToInquiry < ActiveRecord::Migration

  def self.up
    add_column :inquiries, :category_id, :integer
    add_column :inquiries, :location_id, :integer
    add_column :inquiries, :address, :text
  end
  def self.down
    remove_column :inquiries, :category_id
    remove_column :inquiries, :location_id
    remove_column :inquiries, :address
  end

end
