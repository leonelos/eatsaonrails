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

  resources :accounts

  #resources :persons

  root 'welcome#index'


  #jwt
  #post 'authenticate', to: 'authentication#authenticate'

  #get 'login', to: 'authentication#login'

  get   "login",       to: "sessions#new"
  post   "login",       to: "sessions#create"
  delete "logout",      to: "sessions#destroy"

  post "register",      to: "users#register"

  	#if you are under postman you should pass yor json like this 
  	#{
	#"user":{
	#	"name" : "test",
	#	"email" : "test@test.com",
	#	"password": "1234",
	#	"password_confirmation": "1234"
	#}
	#}

end
