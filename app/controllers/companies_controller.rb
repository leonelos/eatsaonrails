class CompaniesController < ApiController
	before_action :require_token_authentication
	before_action :isSuperAdmin? || 
				  :isAdmin?, except: [:index, :show] || 
				  :isEditor?, except: [:index, :show, :update] ||
				  :isEmployee?, except: [] 
	def index
		@companies = Company.all
		render json: {status: 200, companies: @companies}
	end
	def new
		@company = Company.new
	end 
	def edit
		@company = Company.find(params[:id])
	end
	def create 
		@company = Company.new(company_params)
		if @company.save
			render json: {status: 200}
			#redirect_to @company
		else
			render json: {status: 400, errors: @company.errors}
			#render 'new'
		end
	end
	def update 
		@company = Company.find(params[:id])
		if @company.update(company_params) #you can use update_attributes also
			redirect_to @company
		else
			render 'edit'
		end
	end
	def destroy 
		@company = Company.find(params[:id])
		#unless @company.destroy
		#	flash[:error] ="The Company: #{@company.name} cannot be deleted because it's been referenced"
		#else
		#	flash[:error] = "The Company was succesfully deleted" 
		#end 
		
		render json: {status: 200}
		#redirect_to companies_path
	end 
	def show 
		@company = Company.find(params[:id]) 
		render json: {status: 200, company: @company} 
	end

	private
		def company_params
			params.require(:company).permit(:name, :work_area)
		end 
end
