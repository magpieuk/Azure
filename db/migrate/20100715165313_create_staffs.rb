class CreateStaffs < ActiveRecord::Migration

  def self.up
    create_table :staffs do |t|
      t.string :name
      t.string :job_title
      t.integer :location_id
      t.integer :photo_id
      t.string :email
      t.string :telephone
      t.text :description
      t.integer :position

      t.timestamps
    end

    add_index :staffs, :id

    load(Rails.root.join('db', 'seeds', 'staffs.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Staffs"})

    Page.find_all_by_link_url("/staffs").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/staffs"})

    drop_table :staffs
  end

end
