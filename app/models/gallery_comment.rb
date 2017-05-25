class GalleryComment < ApplicationRecord

	include PublicActivity::Model

	belongs_to :gallery
	belongs_to :user

	validates :comment_entry, :user_id, :gallery_id, presence: true
end
