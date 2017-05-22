class UsersController < ApplicationController
  def admin_panel
    @pending_users = User.where(role: "pending")
    @active_users = User.where.not(role: "pending")
  end
end
