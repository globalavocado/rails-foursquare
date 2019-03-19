class FoursquareController < ApplicationController

	def index
		
		return head :bad_request if params[:near].blank?

		client = Foursquare2::Client.new(client_id: ENV['foursquare_api_id'], client_secret: ENV['foursquare_api_secret'], api_version: '20170623')

		@cafes = client.search_venues(near: params[:near], query: params[:query])


	end

end