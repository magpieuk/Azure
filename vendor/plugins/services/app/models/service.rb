class Service < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :content]

  belongs_to :location
  belongs_to :category
  belongs_to :album
  belongs_to :staff, :foreign_key => "contact_id"

  validates_presence_of :title
  validates_uniqueness_of :title


end
