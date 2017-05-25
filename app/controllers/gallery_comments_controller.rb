class GalleryCommentsController < ApplicationController
  before_action :set_gallery_comment, only: [:edit, :update, :destroy]
  before_action :admin_guest_access, only: [:create, :edit, :update, :destroy]
  include ApplicationHelper

  def edit
    no_access(@gallery_comment)
  end

  def create
    @gallery_comment = GalleryComment.new(gallery_comment_params)
    @gallery_comment.user_id = current_user.id

    respond_to do |format|
      if @gallery_comment.save
        @gallery_comment.create_activity key: 'gallery_comment.created', owner: @gallery_comment
        format.html { redirect_back fallback_location: user_path(username: current_user.username), notice: 'Gallery comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @gallery_comment.update(gallery_comment_params)
        format.html { redirect activities_url, notice: 'Gallery comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @gallery_comment.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: user_path(username: current_user.username), notice: 'Gallery comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery_comment
      @gallery_comment = GalleryComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_comment_params
      params.require(:gallery_comment).permit(:comment_entry, :user_id, :gallery_id)
    end
end
