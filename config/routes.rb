Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/copy', to: 'copies#copy'
  get '/copy/:key', to: 'copies#update_value'
end
