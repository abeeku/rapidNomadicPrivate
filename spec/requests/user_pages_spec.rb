require 'spec_helper'


describe "User pages" do
before do
	@user = User.new(first_name: "Example",username: "exampel" ,last_name: "User", email: "user@example.com", password: "secret", password_confirmation: "secret")
  end
  subject { page }

  describe "signup page" do
	before { visit register_path }

    
	it { should have_selector('h2',    text: 'Register') }
	
  end
  
 
end