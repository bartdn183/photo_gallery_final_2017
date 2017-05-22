module ApplicationHelper

	def admin_only_access

		unless current_user.role == "admin"
			redirect_to root_url
		end

	end

	def admin_guest_access

		unless (current_user.role == "admin") || (current_user.role == "guest")
			redirect_to root_url
		end

	end

end
