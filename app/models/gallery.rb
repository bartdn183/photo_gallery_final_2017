class Gallery < ApplicationRecord

	include PublicActivity::Model

	has_many :pictures, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :gallery_comments, dependent: :destroy
	belongs_to :user

	validates :name, presence: true, uniqueness: true
	validates :user_id, presence: true

	def to_param
		name
	end


end
