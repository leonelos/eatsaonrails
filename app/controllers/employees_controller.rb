class EmployeesController < ApiController
	before_action :require_token_authentication
	#before_action :current_user
	def index
		@employees = Employee.all

		render json: {status: 200, employees: @employees} 
	end
	def new
		@employee = Employee.new
	end 
	def edit
		@employee = Employee.find(params[:id])
	end
	def create 
		@employee = Employee.new(employee_params)
		if @employee.save
			render json: {status: 200}
			#redirect_to @employee
		else
			render json: {status: 400, errors: @employee.errors}
			#render 'new'
		end
	end
	def update 
		@employee = Employee.find(params[:id])
		if @employee.update(employee_params) #you can use update_attributes also
			render json: {status: 200}
			#redirect_to @employee
		else
			render json: {status: 400, errors: @employee.errors}
			#render 'edit'
		end
	end
	def destroy 
		@employee = Employee.find(params[:id])
		@employee.destroy
		render json: {status: 200}
		#redirect_to employees_path
		#redirect_to request.referrer
	end 
	def show 
		@employee = Employee.find(params[:id])
		render json: {status: 200, employee: @employee} 
	end
	#----------------------------------CUSTOM------------------------------------#
	def all
		@employees = Employee.where(nil)
		@employees = @employees.company_id(params[:company_param]) if params[:company_param].present?
		@employees = @employees.role_id(params[:role_param]) if params[:role_param].present?
		#@employees = Employee.where("company_id = #{params[:company_param]}").where("role_id = #{params[:role_param]}")
		
		render template: "employees/all"
	end
	def employees_table
		@employees = Employee.where(nil)
		@employees = @employees.company_id(params[:company_param]) if params[:company_param].present?
		@employees = @employees.role_id(params[:role_param]) if params[:role_param].present?
		#@employees = Employee.where("company_id = #{params[:company_param]}").where("role_id = #{params[:role_param]}")
		
		#render template: "employees/employees_table"
		render json: {status: 200, employees: @employees} 
	end


	private
		def employee_params
			params.require(:employee).permit(:name, :lastname, :dni, :age, :birthday, :address, :company_id, :role_id)
		end 
end
