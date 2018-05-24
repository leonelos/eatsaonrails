class RolesController < ApiController
	before_action :require_token_authentication
	before_action :isSuperAdmin? || 
				  :isAdmin?, except: [:index, :show] || 
				  :isEditor?, except: [:index, :show, :update] || 
				  :isEmployee?, except: []
	def index
		@roles = Role.all
		render json: {status: 200, roles: @roles} 
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
			#redirect_to @role
			render json: {status: 200}
		else
			#render 'new'
			render json: {status: 400, errors: @role.errors}
		end
	end
	def update 
		@role = Role.find(params[:id])
		if @role.update(role_params) #you can use update_attributes also
			render json: {status: 200}
			#redirect_to @role
		else
			#render 'edit'
			render json: {status: 400, errors: @role.errors}
		end
	end
	def destroy 
		@role = Role.find(params[:id])
		#unless @role.destroy
		#	flash[:error] ="The Role: #{@role.name} cannot be deleted because it's been referenced"
		#else
		#	flash[:error] = "The Role was succesfully deleted" 
		#end 
		
		render json: {status: 200}
		#redirect_to roles_path
	end 
	def show 
		@role = Role.find(params[:id]) 
		render json: {status: 200, role: @role} 
	end

	private
		def role_params
			params.require(:role).permit(:name)
		end 
end
