Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users
    resources :movies
    resources :categories

    root to: 'users#index'
  end

  resources :ratings, only: :create
  resources :categories, only: :show
  resources :movies, only: %i[index show]

  root 'movies#index'
end
