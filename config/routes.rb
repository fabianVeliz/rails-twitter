Rails.application.routes.draw do

  devise_for :users

  resources :tweets, only: [:new, :create, :show]
  resources :followings, only: [:create, :destroy], param: :slug

  get ':slug',     to: 'users#profile', as: 'user_profile'
  get 'users/all', to: 'users#index',   as: 'users'

  root 'home#index'

end
