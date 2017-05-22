class MyRegistrationsController < Devise::RegistrationsController

  def create
    super
    if @user.persisted?
      Welcome.welcome_email(@user).deliver
      Welcome.user_created(@user).deliver
    end
  end

end