Rails.application.routes.draw do
  get 'providers/index'
  get 'providers/search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "providers#index"
end
