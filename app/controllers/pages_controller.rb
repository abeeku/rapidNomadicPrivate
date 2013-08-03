class PagesController < ApplicationController
  layout '3col', :except => 'friend_activity'
  def dashboard
  end

  def world_wall
     @posts = Post.all
  end

  def friend_activity
    @friends_posts = Post.where("user_id IN (?)", current_user.friends)
  end
end
