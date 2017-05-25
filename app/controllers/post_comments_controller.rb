class PostCommentsController < ApplicationController
  before_action :set_post_comment, only: [:edit, :update, :destroy]
  before_action :admin_guest_access, only: [:create, :edit, :update, :destroy]
  include ApplicationHelper

  # GET /post_comments/1/edit
  def edit
  end

  # POST /post_comments
  # POST /post_comments.json
  def create
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.user_id = current_user.id

    respond_to do |format|
      if @post_comment.save
        @post_comment.create_activity key: 'post_comment.created', owner: @post_comment
        format.html { redirect_back fallback_location: user_path(username: current_user.username), notice: 'Post comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post_comment.update(post_comment_params)
        format.html { redirect_back fallback_location: user_path(username: current_user.username), notice: 'Post comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /post_comments/1
  # DELETE /post_comments/1.json
  def destroy
    @post_comment.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: user_path(username: current_user.username), notice: 'Post comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_comment
      @post_comment = PostComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_comment_params
      params.require(:post_comment).permit(:comment_entry, :user_id, :post_id)
    end
end
