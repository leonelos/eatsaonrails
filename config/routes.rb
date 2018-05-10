Rails.application.routes.draw do
  get 'welcome/index'

  resources :employees

  resources :roles

  resources :companies

  #resources :persons

  root 'welcome#index'
end
