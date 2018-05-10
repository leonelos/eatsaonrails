class CompaniesController < ApplicationController
	def index
		@companies = Company.all
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
			redirect_to @company
		else
			render 'new'
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
		unless @company.destroy
			flash[:error] ="The Company: #{@company.name} cannot be deleted because it's been referenced"
		else
			flash[:error] = "The Company was succesfully deleted" 
		end 
		
		redirect_to companies_path
	end 
	def show 
		@company = Company.find(params[:id]) 
	end

	private
		def company_params
			params.require(:company).permit(:name, :work_area)
		end 
end
