Rails.application.routes.draw do

  devise_for :users
  resources :users,              only: [:index, :show, :destroy]
  resources :mission_statements
  
  root 'static_pages#home'
  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/home',    to: 'users#home'

end
