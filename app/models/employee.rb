class Employee < ApplicationRecord
	belongs_to :role, optional: true
	belongs_to :company, optional: true 
	validates :name, presence: true, length: {minimum: 2, maximum: 15}, format: { with: /\A[a-zA-Z _]*\Z/ }
	validates :lastname, presence: true, length: {minimum: 2, maximum: 15}, format: { with: /\A[a-zA-Z _]*\Z/ }
	validates :dni, presence: true, length: {minimum: 8, maximum: 15}, format: { with: /\A[0-9]*\Z/ }
	validates :birthday, presence: true
	#validates :role, presence: true
	scope :company_id, lambda {|company_id| where(:company_id => company_id)}
	scope :role_id, lambda {|role_id| where(:role_id => role_id)}
end
