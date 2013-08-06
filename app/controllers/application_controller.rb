class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authorize

  delegate :allow? , :to => :current_permission
helper :layout

  helper_method :allow?

private
  def title(page_title)
    content_for (:title) { page_title }
  end

  def yield_or_default(section, default = "")
    content_for?(section) ? content_for(section) : default
  end
  def current_user
  @current_user ||=  User.find_by_cookie_token!(cookies[:cookie_token]) if cookies[:cookie_token]
  end
  helper_method :current_user, :yield_or_default

  def not_logged_in
      redirect_to request.referrer, alert: 'You are already logged in' if current_user
  end

  def current_permission
   @current_permission ||= Permission.new(current_user)
  end

   def authorize
     if !current_permission.allow?(params[:controller],params[:action])
       redirect_to root_url, :alert => "You are not allowed to do that"
     end
   end
  def logged_in
    redirect_to login_url, alert: 'You must log in to do this' if current_user.nil?

  end
end
