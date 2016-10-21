class RegistrationsController < Devise::RegistrationsController

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:account_update) do |u|
			u.permit(:first_name, :last_name, :phone_number, :email, :password, :password_confirmation)
		end
	end
	def sign_up_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :phone_number, :password_confirmation)
	end
end