Rails.application.routes.draw do

  
  get 'acess/index'
  get 'acess/login'
  root "demo#index"
  match ':controller(/:action(/:id))', :via => [:get, :post]
end
