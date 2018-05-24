class Role < ApplicationRecord
	has_many :employee, dependent: :restrict_with_error
	has_many :user
	validates :name, presence: true, length: {minimum: 2, maximum: 15}, format: { with: /\A[a-zA-Z _]*\Z/ }
end
