class FoursquareController < ApplicationController

	def index

		if params[:near].blank?
			render json: { error: 'near parameter is required' }, status: :bad_request 
		else
			client = Foursquare2::Client.new(client_id: ENV['foursquare_api_id'], client_secret: ENV['foursquare_api_secret'], api_version: '20170623')

			@cafes = client.search_venues(near: params[:near], query: params[:query])
		end
		
	end

end