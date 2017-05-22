class Welcome < ApplicationMailer

	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome email Bart & Monicas photo gallery')
	end

	def notification_email(user)
		@user = user
		@url = 'https://photo-gallery-bm.herokuapp.com/users/sign_in'
		mail(to: @user.email, subject: 'Your account is activated!')
	end

	def user_created(user)
		@user = user
		@recipients = "bartdn183@gmail.com, msand063@fiu.edu"
		mail(to: @recipients, subject: 'New user signed up and waiting for activation!')
		
	end

end