Rails.application.routes.draw do
  resources :ratings
  resources :movies
  devise_for :users
end
