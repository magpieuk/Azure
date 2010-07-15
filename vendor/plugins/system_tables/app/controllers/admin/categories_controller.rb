class Admin::CategoriesController < Admin::BaseController

  crudify :category, :title_attribute => :name

end
