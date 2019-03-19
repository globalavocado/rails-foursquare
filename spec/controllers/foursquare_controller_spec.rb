require 'rails_helper'

RSpec.describe FoursquareController do
	
	describe '#index' do

		let(:client) { double }
		let(:near) { 'EC1' }
		let(:query) { 'coffee' }
		let(:params) { { near: near, query: query } }

		before do
			allow(Foursquare2::Client).to receive(:new).and_return(client)
		end

		it 'should return http status code 200' do
			expect(client).to receive(:search_venues).with(near: near, query: query)
			response = get :index, params: params
			expect(response).to have_http_status('200')
		end

	end

end