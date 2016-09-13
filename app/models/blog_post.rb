class BlogPost < ApplicationRecord
	belongs_to :user
	
	validates :title, length: {maximum:50}
	validates :title, presence: true

	validates :user_id, presence: true
	validates :content, presence: true
	
end
