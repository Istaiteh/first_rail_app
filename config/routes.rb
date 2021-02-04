Rails.application.routes.draw do


  root "demo#index"
  get 'admin', :to => "access#index"
  match ':controller(/:action(/:id))', :via => [:get, :post]
end
