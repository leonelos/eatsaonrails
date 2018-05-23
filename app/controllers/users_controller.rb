class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token 
	def register 
		@user = User.new(user_params)
		if @user.save
			render json: {status: 200}
			#redirect_to @employee
		else
			render json: {status: 400, errors: @user.errors}
			#render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end 

end
