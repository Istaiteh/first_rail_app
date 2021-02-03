Rails.application.routes.draw do
  root "demo#index"
  match ':controller(/:action(/:id))', :via => :get
end
