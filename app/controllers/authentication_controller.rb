class AuthenticationController < ApplicationController
 #skip_before_action :authenticate_request

 def authenticate
   command = AuthenticateAccount.call(params[:email], params[:password])

   if command.success?
     render json: { auth_token: command.result }
   else
     render json: { error: command.errors }, status: :unauthorized
   end
 end

 def login
 	@account = Account.new
 	#current_user = { id: 2 }
	#secret = 'my_secret_key'
	#token = JWT.encode(current_user, secret, 'HS256')
	#render json: {
	#	token: token
	#}
 end
end