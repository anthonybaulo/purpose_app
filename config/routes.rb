Rails.application.routes.draw do
  
  # Use devise user routes
  devise_for :users

  # Add my user routes
  resources :users, only: [:index, :show] do
    # Create routes for following/followers
    member do
      get :following, :followers, :feed
    end
  end
  resources :mission_statements
  resources :posts
  resources :relationships, only: [:create, :destroy]

  root 'static_pages#welcome'
  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/home',    to: 'users#home'

end
