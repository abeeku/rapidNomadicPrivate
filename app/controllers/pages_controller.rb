class PagesController < ApplicationController
  layout '3col', :except => 'friend_activity'
  def dashboard
  end

  def world_wall
     @posts = Post.order('created_at DESC').all
  end

  def friend_activity
 # if current_user
    @friends_posts = Post.where("user_id IN (?)", current_user.friends)
   # else
    
   # end
  end
end
