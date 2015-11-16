Rails.application.routes.draw do
  
  resources :films
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'welcome#index'
end
