class UserInfoController < ApplicationController
  include ApplicationHelper
  layout 'profile', only: :index
  def index
    @user = User.find_by_username(params[:username])
    @user_info = @user.user_info

  end

  def new

  end
  def create
    @user_info = current_user.user_info.create(params[:user_info])
    if @user_info.save
      redirect_to request.referrer
    end
  end
  def update
    #@user_info = current_user.user_info.(params[:user_info])
    if current_user.user_info.update_attributes(params[:user_info])
      redirect_to profile_for(current_user)
    end
    #if @user_info.save

   # end
  end
  def edit
  end
end
