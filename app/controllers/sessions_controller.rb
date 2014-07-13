class SessionsController < ApplicationController
	def create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to back_url
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end

	private
	def back_url
    if request.env["omniauth.origin"].present?
      request.env["omniauth.origin"]
    else
      root_url
    end
  end
end
