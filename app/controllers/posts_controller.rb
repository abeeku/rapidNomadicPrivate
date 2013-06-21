class PostsController < ApplicationController
  def new
   @new_post  = current_user.posts.build
  end

end
