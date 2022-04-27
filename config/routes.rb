Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  #

  root 'static_pages#home'

  #Public Auth Functions
  get '/login', to: 'static_pages#home'
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'
  get '/auth/logout' => 'auth0#logout'

  #User Pages
  get '/dashboard', to: 'static_pages#user_dashboard'

  #user Management Pages
  get '/user/newinformation', to: 'user#new_information_page'
  post '/user/newinformation', to: 'user#update_user_information'
end
