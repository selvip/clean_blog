class User < ApplicationRecord
	has_many :blog_post, dependent: :destroy
	
	validates :name, length: {maximum:45}
	validates :name, presence: true

	validates :email, length: {maximum:45}
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :email, presence: true
end
