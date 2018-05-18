Rails.application.routes.draw do
  get 'welcome/index'

  resources :employees do 
  	collection do
  		get 'all/(:company_param/(:role_param))', :action => :all
  		get 'employees_table/(:company_param/(:role_param))', :action => :employees_table
  	end	
  end

  resources :roles

  resources :companies

  #resources :persons

  root 'welcome#index'
end
