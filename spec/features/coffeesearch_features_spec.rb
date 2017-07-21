require 'rails_helper'

feature 'coffeeshop list' do

  context 'no search has been performed', :vcr do
    scenario 'should initially return results for postcode EC1' do
      visit '/foursquare'
      expect(page).to have_content 'coffee shops in EC1'
      expect(page).to have_content 'Workshop Coffee Co.'
    end
  end
  
end