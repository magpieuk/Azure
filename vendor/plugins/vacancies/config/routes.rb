ActionController::Routing::Routes.draw do |map|
  map.resources :vacancies

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :vacancies, :collection => {:update_positions => :post}
  end
end
