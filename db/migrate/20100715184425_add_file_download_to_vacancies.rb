class AddFileDownloadToVacancies < ActiveRecord::Migration
  def self.up
    add_column :vacancies, :file_download_id, :integer
  end

  def self.down
    remove_column :vacancies, :file_download_id
  end
end
