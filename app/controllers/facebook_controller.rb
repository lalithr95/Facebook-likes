require 'koala'
require 'Date'
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
			result = Array.new
			data = @graph.get_connection("me", "likes", {limit: 100})
			while data.next_page
				data.each do |like|
					datetime = DateTime.iso8601(like['created_time'])
					year = datetime.year
					month = datetime.month
					day = datetime.day
					result << "Date.UTC(#{year},#{month},#{day})"
				end
				data = data.next_page
			end

			render json: {
				data: reduce_obj(result)
			}
		else
			render json: {
				status: false
			}
		end
	end

	private
	def reduce_obj result
		state = Hash.new
		result.each do |elem|
			if state[elem]
				state[elem] += 1
			else
				state[elem] = 1
			end
		end
		result = Array.new
		state.sort.to_h.each do |k, v|
			result << [k, v]
		end
		result
	end
end
