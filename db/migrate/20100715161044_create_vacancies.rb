class CreateVacancies < ActiveRecord::Migration

  def self.up
    create_table :vacancies do |t|
      t.string :job_title
      t.string :reference
      t.string :starting_salary
      t.string :past_probation
      t.date :start_date
      t.date :closing_date
      t.text :description
      t.integer :position
      t.timestamps
    end

    add_index :vacancies, :id

    load(Rails.root.join('db', 'seeds', 'vacancies.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Vacancies"})

    Page.find_all_by_link_url("/vacancies").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/vacancies"})

    drop_table :vacancies
  end

end
