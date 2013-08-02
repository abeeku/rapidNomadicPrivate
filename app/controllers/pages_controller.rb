class PagesController < ApplicationController
  layout '3col'
  def dashboard
  end

  def world_wall
     @posts = Post.all
  end

  def friend_activity
  end
end
