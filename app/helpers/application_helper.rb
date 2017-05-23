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

	def bootstrap_class_for(flash_type)
		case flash_type
			when "success"
				"alert-success" 
			when "error"
				"alert-danger"
			when "alert"
				"alert-warning"
			when "notice"
				"alert-info"
			else 
				falsh_type.to_s
		end
	end

end
