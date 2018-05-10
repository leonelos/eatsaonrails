class RolesController < ApplicationController
	def index
		@roles = Role.all
	end
	def new
		@role = Role.new
	end 
	def edit
		@role = Role.find(params[:id])
	end
	def create 
		@role = Role.new(role_params)
		if @role.save
			redirect_to @role
		else
			render 'new'
		end
	end
	def update 
		@role = Role.find(params[:id])
		if @role.update(role_params) #you can use update_attributes also
			redirect_to @role
		else
			render 'edit'
		end
	end
	def destroy 
		@role = Role.find(params[:id])
		unless @role.destroy
			flash[:error] ="The Role: #{@role.name} cannot be deleted because it's been referenced"
		else
			flash[:error] = "The Role was succesfully deleted" 
		end 
		
		redirect_to roles_path
	end 
	def show 
		@role = Role.find(params[:id]) 
	end

	private
		def role_params
			params.require(:role).permit(:name)
		end 
end
