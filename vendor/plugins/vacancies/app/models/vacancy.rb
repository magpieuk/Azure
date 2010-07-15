class Vacancy < ActiveRecord::Base

  acts_as_indexed :fields => [:job_title, :reference, :starting_salary, :past_probation, :closing_date, :description]

  validates_presence_of :job_title
  validates_uniqueness_of :job_title

  belongs_to :file_download, :class_name => 'Resource'


end
