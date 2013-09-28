require 'spec_helper'

describe "Home page" do
   it "should have the content 'World Wall if there is a user logged in '" do
    
	visit root_path
	expect(page).to have_content('World Wall')
	end
  end
