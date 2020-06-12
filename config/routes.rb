Rails.application.routes.draw do

  devise_for :users
  resources :users, :only => [:index, :show, :destroy]
  root 'static_pages#home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
  # get 'users/index'
  # get 'users/show'
  # get 'users/destroy'    
end
