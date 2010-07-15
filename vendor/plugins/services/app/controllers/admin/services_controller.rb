class Admin::ServicesController < Admin::BaseController

  crudify :service, :title_attribute => :title

end
