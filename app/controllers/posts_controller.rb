class PostsController < ApplicationController
  def new
   @new_post  = current_user.posts.build

  end
  def index
    @posts = Post.all
  end
  def create

  	@post = current_user.posts.build(params[:post])
  	unless @post.content.to_s.strip.length == 0
    @post.created_at = Time.now
  	if @post.save
  		redirect_to request.referrer
  	else
      flash[:notice] = 'Post could\'nt be saved'
      redirect_to request.referrer
  	end
  end
  flash[:notice] = 'Write someting in your post first!'
  redirect_to request.referrer
  end

end
