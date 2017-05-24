class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :admin_guest_access, except: [:create, :edit, :update, :destroy]
  include ApplicationHelper

  # GET /posts/1/edit
  def edit
    no_access(@post)
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        @post.create_activity key: 'post.created', owner: @post
        format.html { redirect_to user_path(username: @post.user.username), notice: 'Post was successfully created.' }
      else
        format.html { redirect_to user_path(username: @post.user.username) }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        @post.create_activity key: 'post.updated', owner: @post
        format.html { redirect_to user_path(username: @post.user.username), notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_path(username: @post.user.username), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :content)
    end
end
