class Post < ApplicationRecord

	include PublicActivity::Model
	include PublicActivity::Common

	belongs_to :user
	has_many :post_comments, dependent: :destroy
	validates :user_id, :content, presence: true

end
