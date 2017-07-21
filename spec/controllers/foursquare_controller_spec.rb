require 'rails_helper'

RSpec.describe FoursquareController do
	
	describe '#index' do

		it 'should return http status code 200', :vcr do
			response = get :index
			expect(response).to have_http_status('200')
		end
	end

end