class Service < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :content]

  validates_presence_of :title
  validates_uniqueness_of :title



end
