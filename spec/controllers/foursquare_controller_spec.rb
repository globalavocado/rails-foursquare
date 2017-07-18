require 'rails_helper'

RSpec.describe FoursquareController do
	
	describe '#index' do
		
		use_vcr_cassette

		it 'should return 200' do
			response = get :index
			expect(response).to have_http_status('200')
		end
	end

end