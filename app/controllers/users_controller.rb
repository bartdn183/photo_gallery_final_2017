class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :admin_only_access, except: [:show]
  before_action :admin_guest_access, only: [:show]
  include ApplicationHelper

  def show
    @post = Post.new
    @posts = @user.posts.order('created_at DESC')
    @activities = PublicActivity::Activity.order('created_at DESC')
  end

  def admin_panel
    @pending_users = User.where(role: "pending")
    @active_users = User.where.not(role: "pending")
  end

   def delete_account
    user = User.find(params[:user])
    user.destroy
    
    redirect_to admin_panel_path
  end

  def update_role
    user = User.find(params[:user])
    user.role = params[:role]
    user.save
    Welcome.notification_email(user).deliver_now
    user.create_activity key: 'user.signedup', owner: user
    redirect_to admin_panel_path
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end
end
