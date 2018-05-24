class ApiController < ActionController::Base
	def require_token_authentication
		authenticate_token || render_unauthorized("Access denied")
	end
	      
	def current_user
	    @current_user ||= authenticate_token
	end
	  
	def isSuperAdmin? 
		unless current_user.role_id == 6
			render_unauthorized("Access denied") 
		end
	end

	def isAdmin? 
		unless current_user.role_id == 7
			render_unauthorized("Access denied") 
		end
	end

	def isEditor? 
		unless current_user.role_id == 8
			render_unauthorized("Access denied") 
		end
	end

	def isEmployee? 
		unless current_user.role_id == 9
			render_unauthorized("Access denied") 
		end
	end

	protected
	  
	def render_unauthorized(message)
		errors = { errors: [ { detail: message } ] }
	    render json: errors, status: :unauthorized
	end
	  
	private
	  
	def authenticate_token
		Rails.logger.debug("holas")
	    authenticate_with_http_token do |token, options|
	      	Rails.logger.debug(token)
	      	if user = User.with_unexpired_token(token, 2.days.ago)
	        	# Compare the tokens in a time-constant manner, to mitigate timing attacks.
	        	ActiveSupport::SecurityUtils.secure_compare(
	                        ::Digest::SHA256.hexdigest(token),
	                        ::Digest::SHA256.hexdigest(user.token))
	        	user
	      	end
	    end
	end  
end
