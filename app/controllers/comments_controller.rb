class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :admin_guest_access, only: [:create, :edit, :update, :destroy]
  include ApplicationHelper

  def edit
    no_access(@comment)
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        @comment.create_activity key: 'comment.created', owner: @comment
        format.html { redirect_back fallback_location: user_path(username: current_user.username), notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to picture_url(id: @comment.picture_id) }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to picture_path(id: @comment.picture_id), notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: user_path(username: current_user.username), notice: 'Comment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment_entry, :gallery_id, :picture_id, :user_id)
    end
end
