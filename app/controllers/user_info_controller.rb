class UserInfoController < ApplicationController
  layout 'profile', only: :index
  def index
    @user = User.find_by_username(params[:username])
  end

  def edit
  end
end
