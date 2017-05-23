class UsersController < ApplicationController

  before_action :admin_only_access
  include ApplicationHelper

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
    redirect_to admin_panel_path
  end
end
