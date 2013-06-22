class PostsController < ApplicationController
  def new
   @new_post  = current_user.posts.build

  end
  def index
    @posts = Post.all
  end
  def create

  	@post = current_user.posts.build(params[:post])
  	@post.created_at = Time.now
  	if @post.save
  		redirect_to request.referrer
  	else
  	end
  end

end
