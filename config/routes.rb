Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/copy', to: 'copies#index'
  get '/copy/:key' => 'copies#copy_data'
end
