Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  get "/login", to: 'sessions#new'
  post "/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy'
  
  #insert the contact page later

  #defining the restful routes for users
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root "application#hello"
end
