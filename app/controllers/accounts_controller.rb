class AccountsController < ApplicationController
	before_action :require_token_authentication
	def new
		@account = Account.new
	end
	def create 
		@account = Account.new(account_params)
		if @account.save
			redirect_to @account
		else
			render 'new'
		end
	end
	def show
		@account = Account.find(params[:id]) 
	end
	private
		def account_params
			params.require(:account).permit(:name, :email, :password)
		end 
end
