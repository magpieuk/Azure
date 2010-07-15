ActionController::Routing::Routes.draw do |map|
  map.resources :services

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :services, :collection => {:update_positions => :post}
  end
end
