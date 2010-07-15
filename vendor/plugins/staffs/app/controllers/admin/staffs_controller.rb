class Admin::StaffsController < Admin::BaseController

  crudify :staff, :title_attribute => :name

end
