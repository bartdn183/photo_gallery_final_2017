class ActivitiesController < ApplicationController
	def index
	   @post = Post.new
	   @post_comment = PostComment.new
	   @gallery_comment = GalleryComment.new
	   @activities = PublicActivity::Activity.order('created_at DESC')
	end
end
