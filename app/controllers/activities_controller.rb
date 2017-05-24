class ActivitiesController < ApplicationController
	def index
	   @post = Post.new
	   @post_comment = PostComment.new
	   @activities = PublicActivity::Activity.order('created_at DESC')
	end
end
