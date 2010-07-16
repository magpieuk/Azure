class Staff < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :job_title, :email, :telephone, :description]

  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :photo, :class_name => 'Image'

  belongs_to :location

  def summary
    "#{self.name}, #{self.job_title}" rescue ""
  end

end
