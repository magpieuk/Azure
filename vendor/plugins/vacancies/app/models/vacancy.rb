class Vacancy < ActiveRecord::Base

  acts_as_indexed :fields => [:job_title, :reference, :starting_salary, :past_probation, :closing_date, :description]

  belongs_to :file_download, :class_name => 'Resource'

end
