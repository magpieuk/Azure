class Album < ActiveRecord::Base

  acts_as_indexed :fields => [:name]

  validates_presence_of :name
  validates_uniqueness_of :name

  belongs_to :cover_image, :class_name => 'Image'

  has_many :images, :dependent => :destroy
  
end
