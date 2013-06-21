class UsersController < ApplicationController
#  before_filter :not_logged_in , only: [:new,:create]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
     @user = User.find_by_username(params[:username])
     @new_post  = current_user.posts.build
    @all_posts = Post.find_all_by_whose_wall(@user.id)
  end

  def create
@user = User.new(params[:user])
    if @user.save
      cookies[:cookie_token] = @user.cookie_token
      redirect_to root_url, :notice => 'Thank you for registering. Please check your email to activate your account'
    else
      render 'new'
    end
  end
end
