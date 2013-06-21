class PasswordResetsController < ApplicationController
  before_filter :not_logged_in
  def new

  end

  def create
   user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_url, :notice => "The password reset email was sent to #{user.email}."
  end

  def edit
    @user = User.find_by_password_reset_token(params[:id])
  end
  def update
    @user = User.find_by_password_reset_token(params[:id])
    if @user.password_reset_sent_at < 4.hours.ago
        redirect_to new_password_reset_path, alert: "This password reset link has expired. Try Again"
    elsif @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Password has been changed"
    else
      render :edit
    end
  end
end
