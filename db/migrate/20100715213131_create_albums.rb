class CreateAlbums < ActiveRecord::Migration

  def self.up
    create_table :albums do |t|
      t.string :name
      t.integer :cover_image_id
      t.boolean :show_in_gallery
      t.integer :position

      t.timestamps
    end

    add_index :albums, :id

    load(Rails.root.join('db', 'seeds', 'albums.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Albums"})

    Page.find_all_by_link_url("/albums").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/albums"})

    drop_table :albums
  end

end
