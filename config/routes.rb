Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "video_games#index"
  resources :notes
  resources :statuses
  resources :ratings
  devise_for :users
  resources :users
  resources :developers
  resources :publishers
  resources :video_games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
