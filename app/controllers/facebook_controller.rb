class FacebookController < ApplicationController
	def index
	end

	def create
		@access_token = request.env['omniauth.auth']['credentials']['token']
		session[:access_token] = @access_token
		redirect_to "/facebook"
	end
end
