class PostComment < ApplicationRecord

	include PublicActivity::Model

	belongs_to :post
	belongs_to :user

	validates :comment_entry, :user_id, :post_id, presence: true
end
