require 'koala'
class FacebookController < ApplicationController
	# Loads basic functionality
	def index
	end

	# sets access token to session
	def create
		@access_token = request.env['omniauth.auth']['credentials']['token']
		session[:access_token] = @access_token
		redirect_to "/facebook"
	end

	# api call to fetch likes
	def likes
		if session[:access_token]
			@graph = Koala::Facebook::API.new(session[:access_token])
			render json: {
				data: @graph.get_connection("me", "likes", {limit: 100}).next_page
			}
		else
			render json: {
				status: false
			}
		end
	end
end
