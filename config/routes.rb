Rails.application.routes.draw do
  
  resources :categories
  resources :films
  devise_for :users, :controllers => { registrations: "users/registrations" }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'welcome#index'
end
