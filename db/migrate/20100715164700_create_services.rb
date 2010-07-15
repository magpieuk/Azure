class CreateServices < ActiveRecord::Migration

  def self.up
    create_table :services do |t|
      t.string :title
      t.text :content
      t.integer :contact_id
      t.integer :location_id
      t.integer :category_id
      t.integer :position

      t.timestamps
    end

    add_index :services, :id

    load(Rails.root.join('db', 'seeds', 'services.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Services"})

    Page.find_all_by_link_url("/services").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/services"})

    drop_table :services
  end

end
