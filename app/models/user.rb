class User < ApplicationRecord
	validates :name, presence: true, length: {minimum: 2, maximum: 15}, format: { with: /\A[a-zA-Z _]*\Z/ }
	validates :email, presence: true, uniqueness: true
	#validates :password, presence: true #due to we are working with has_secure_token this is not necessary
  	#validates :password_confirmation, presence: true

	belongs_to :role, optional: true
	has_secure_password
	has_secure_token

  	def self.valid_login?(email, password)
    	user = find_by(email: email)
    	if user && user.authenticate(password)
      		user
    	end
  	end

  	def allow_token_to_be_used_only_once
    	regenerate_token
    	touch(:token_created_at)
  	end
  
  	def logout
    	invalidate_token
  	end
  
  	def self.with_unexpired_token(token, period)
    	where(token: token).where('token_created_at >= ?', period).first
  	end
  
  	private

  	# This method is not available in has_secure_token
  	def invalidate_token
    	update_columns(token: '')
    	touch(:token_created_at)
  	end
end
