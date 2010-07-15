ActionController::Routing::Routes.draw do |map|

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :system_tables, :collection => {:update_positions => :post}
  end
  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :categories, :collection => {:update_positions => :post}
  end
  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :locations, :collection => {:update_positions => :post}
  end

end
