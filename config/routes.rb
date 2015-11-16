Rails.application.routes.draw do
  
  resources :films
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: "users/registrations" }
  root to: 'welcome#index'
end
