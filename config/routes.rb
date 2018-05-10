Rails.application.routes.draw do
  get 'welcome/index'

  resources :employees

  resources :roles

  resources :companies

  root 'welcome#index'
end
