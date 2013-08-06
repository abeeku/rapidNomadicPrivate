require 'spec_helper'

describe "PasswordResets" do 
  it "emails user when requesting password reset" do
    user = FactoryGirl.create(:user)                                       
    visit login_path
    click_link "Forgot Your Password?"

    fill_in "Email", :with => user.email
	click_button "Send Password Reset Email"
	current_path.should eq(root_path)
	page.should have_content("The password reset email was sent to #{user.email}.")
    last_email.to.should include(user.email)
    
  end
end

















































