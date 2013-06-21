class SessionsController < ApplicationController
#  skip_before_filter :authorize
#  before_filter :not_logged_in, only: [:new, :create]
  def new

  end

  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
       # session[:user_id] = user.id
        cookies.permanent[:cookie_token] = user.cookie_token

=begin
        if params[:remember_me]
          cookies.permanent[:cookie_token] = user.cookie_token
        else
          cookies[:cookie_token] = user.cookie_token
        end
=end
 redirect_to request.referrer, notice: 'Logged in'
      else

        flash.now.alert = 'Your account was found, but your password is wrong'
        render 'new'
      end
    else
      user = User.find_by_username(params[:email])
      if user
        if user.authenticate(params[:password])
         # session[:user_id] = user.id
          if params[:remember_me]
            cookies.permanent[:cookie_token] = user.cookie_token
          else
            cookies[:cookie_token] = user.cookie_token

          end

          redirect_to request.referrer, notice: 'Logged in'
        end
      else
        flash.now.alert = 'No account was found with that username or password'
        render 'new'
      end

    end
  end

  def destroy
 #    session[:user_id] = nil
 #   reset_session
    cookies.delete(:cookie_token)
    redirect_to root_url, notice: 'Logged Out'
  end
end
