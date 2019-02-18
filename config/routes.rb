Rails.application.routes.draw do
  
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  get "/login", to: 'sessions#new'
  post "/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy'
  
  #insert the contact page later

  # I probably dont need this routes
  get 'organisations/new'
  get 'shifts/new'

  #defining the restful routes for users
  resources :users do
    resources :shifts
  end

  #defining the routes for organisations
  resources :organisations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root "application#hello"
end
