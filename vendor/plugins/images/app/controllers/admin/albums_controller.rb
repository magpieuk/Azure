class Admin::AlbumsController < Admin::BaseController

  crudify :album, :title_attribute => :name

end
