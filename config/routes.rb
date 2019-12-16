Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users
    resources :movies
    resources :ratings
    resources :categories

    root to: 'users#index'
  end

  resources :ratings
  resources :movies, only: %i[index show]

  root 'movies#index'
end
