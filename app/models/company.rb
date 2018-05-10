class Company < ApplicationRecord
	has_many :employee, dependent: :restrict_with_error
	validates :name, presence: true, length: {minimum: 2, maximum: 20}, format: { with: /\A[a-zA-Z _]*\Z/ }
end
