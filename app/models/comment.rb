class Comment < ApplicationRecord

	belongs_to :user
	belongs_to :gallery
	belongs_to :picture

	validates :comment_entry, :gallery_id, :picture_id, :user_id, presence: true
	
end
