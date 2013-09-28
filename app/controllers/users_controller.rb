class UsersController < ApplicationController
  include ApplicationHelper
  layout 'application'
layout 'profile', :only => :wall
#  before_filter :not_logged_in , only: [:new,:create]
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

   def profile

     @user = User.find_by_username(params[:username])

     @new_post  = current_user.posts.build if current_user
     @all_posts = Post.find_all_by_whose_wall(@user.id)

   end


  def show
 @user = User.find_by_username!(params[:username])
     require 'will_paginate/array'
     @new_post  = current_user.posts.build if current_user
     @all_posts = Post.where(:whose_wall => @user.id).paginate(:page => params[:page], :per_page => 10).order('id DESC')

     respond_to do |format|
       format.js
       format.html # show.html.erb
       format.xml  { render :xml => @all_posts }
     end
  end
# def update
#   @user = User.find(params[:id])
# #
#
#    if @user.update_attributes(params[:user])
#      redirect_to profile_for(@user)
#    else
#      if defined? params[:user_info][:bio]
#        @user.user_info.bio = params[:user_info][:bio]
#        if @user.save
#          redirect_to request.referrer
#        else
#          flash[:success] = 'Bio unsuccessful update'
#          redirect_to request.referrer
#        end
#    end
#
#### if @user.update_attribute(:profile, params[:user][:profile])
# #     flash[:notice] = 'Profile Picture updated'
# #     redirect_to request.referrer
#  #  else
#   #   flash[:success] = 'Profile Picture unsuccessful update'
#   #   redirect_to request.referrer
#  #  end
#
#
#       end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to profile_for(@user)
    else
      if defined? params[:user][:avatar]
        if @user.update_attribute(:profile, params[:user][:profile])
   redirect_to profile_for(@user)
  else
   flash[:success] = 'Profile Picture unsuccessful update'
   redirect_to profile_for(@user)
  end
      end

    end

  end


   def wall

     @user = User.find_by_username!(params[:username])
     require 'will_paginate/array'
     @user_info = @user.user_info
     @new_post  = current_user.posts.build if current_user
     @comment = Comment.new

     @all_posts = Post.where(:whose_wall => @user.id).paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
     respond_to do |format|
       format.js
       format.html # show.html.erb
       format.xml  { render :xml => @all_posts }
     end
   end
  def create
@user = User.new(params[:user])
    if @user.save
      @user_info = UserInfo.new(user_id: @user.id)
      cookies[:cookie_token] = @user.cookie_token
      redirect_to root_url, :notice => 'Thank you for registering. Please check your email to activate your account'
    else
      render 'new'
    end
  end
end
