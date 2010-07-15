class Admin::StaffsController < Admin::BaseController

  before_filter :load_locations

  crudify :staff, :title_attribute => :name

  def load_locations
    @locations = Location.find(:all, :order => "name asc")
  end

end
