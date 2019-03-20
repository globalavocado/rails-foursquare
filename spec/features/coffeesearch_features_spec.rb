require 'rails_helper'

feature 'coffeeshop list' do

let(:client) { double }
let(:location) { double :location,
	address: '70 St John St',
	postalCode: 'EC1',
	lat: '51.5215',
	lng: '-0.1015'
	}
let(:workshop_coffee) { double :workshop_coffee, name: 'Workshop Coffee Co.', location: location }
let(:cafes) { double :cafes, venues: [workshop_coffee], geocode: geocode }
let(:geocode) { double :geocode, feature: feature }
let(:feature) { double :feature, displayName: 'EC1'}

		before do
			allow(Foursquare2::Client).to receive(:new).and_return(client)
		end

  context 'no search has been performed', :vcr do
    scenario 'should initially return results for postcode EC1' do
    	expect(client).to receive(:search_venues).with(near: 'EC1', query: 'coffee').and_return(cafes)
      visit '/foursquare?near=EC1&query=coffee'
      expect(page).to have_content 'coffee shops in EC1'
      expect(page).to have_content 'Workshop Coffee Co.'
    end
  end
  
end