ActionController::Routing::Routes.draw do |map|
  map.resources :staffs

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :staffs, :collection => {:update_positions => :post}
  end
end
