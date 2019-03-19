require 'rails_helper'

RSpec.describe FoursquareController do
	
	describe '#index' do

		let(:client) { double }

		before do
			allow(Foursquare2::Client).to receive(:new).and_return(client)
		end

		it 'should return http status code 200', :vcr do
			expect(client).to receive(:search_venues).with(near: 'EC1', query: 'coffee')
			response = get :index
			expect(response).to have_http_status('200')
		end
	end

end