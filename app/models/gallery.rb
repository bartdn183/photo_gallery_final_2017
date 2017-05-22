class Gallery < ApplicationRecord

	has_many :pictures, :dependent => :destroy

	validates :name, presence: true, uniqueness: true

	def to_param
		name
	end


end
