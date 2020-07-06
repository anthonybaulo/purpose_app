Rails.application.routes.draw do
  
  # Use devise user routes
  devise_for :users

  # Add my user routes
  resources :users, only: [:index, :show] do
    # Create routes for following/followers
    member do
      get :following, :followers
    end
  end
  resources :mission_statements
  resources :posts
  resources :relationships, only: [:create, :destroy]
  resources :timers

  root 'static_pages#welcome'
  get '/help',        to: 'static_pages#help'
  get '/about',       to: 'static_pages#about'
  get '/contact',     to: 'static_pages#contact'
  get '/home',        to: 'users#home'
  get '/feed',        to: 'users#feed'
  get '/events',      to: 'users#events'
  get '/public_feed', to: 'posts#public'

end
