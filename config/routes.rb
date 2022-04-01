Rails.application.routes.draw do
  devise_for :users

  root to: 'diaries#index'
  resources :users, only: :show
  resources :diaries, except: :index
end
