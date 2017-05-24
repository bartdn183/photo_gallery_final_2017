class ActivitiesController < ApplicationController
	def index
	   @post = Post.new
	   @activities = PublicActivity::Activity.order('created_at DESC')
	end
end
