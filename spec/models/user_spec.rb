require 'spec_helper'


  


describe do
 before do
    @user = User.new(first_name: "Example",username: "exampel" ,last_name: "User", email: "user@example.com", password: "secret", password_confirmation: "secret")
  end
 subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should be_valid }


  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
  
  
  
  
  
  describe User do
    it 'is invalid without username' do 
        user = User.new
        user.should_not be_valid
      end
  
    it 'include posts ' do
        post1 = Post.new(content: 'hgfdhfhghghgh')
        post2 = Post.new(content: 'hgfdhfhghghgh')
        user = User.new(username: "Ash", posts: [post1, post2])
        user.posts.should include(post1)
    end  
  end
  
  
  
  
  
  
  
   describe "when username is too long" do
    before { @user.username = "a" * 51 }
    it { should_not be_valid }
  end
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end
describe "when password is not present" do
  before { @user.password = @user.password_confirmation = " " }
  it { should_not be_valid }
end
describe "when password doesn't match confirmation" do
  before { @user.password_confirmation = "mismatch" }
  it { should_not be_valid }
end
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end
end