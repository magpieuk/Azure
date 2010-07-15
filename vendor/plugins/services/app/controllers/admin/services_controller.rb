class Admin::ServicesController < Admin::BaseController
  before_filter :load_lookups
  crudify :service, :title_attribute => :title

  def load_lookups
    @locations = Location.find(:all, :order => "name asc")
    @categories = Category.find(:all, :order => "name asc")
  end

end
