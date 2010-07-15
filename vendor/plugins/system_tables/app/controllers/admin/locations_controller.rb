class Admin::LocationsController < Admin::BaseController

  crudify :location, :title_attribute => :name

end
