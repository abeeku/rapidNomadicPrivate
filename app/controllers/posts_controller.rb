class PostsController < ApplicationController
  def new
   @new_post  = current_user.posts.build

  end
  def index
    @posts = Post.all
  end
  def create

  	@post = current_user.posts.build(params[:post])
  	if @post.content.to_s.strip.length == 0
      flash[:notice] = 'Write something in your post first!'
      redirect_to request.referrer
    else
      @post.created_at = Time.now
      if @post.save
        redirect_to request.referrer
      else
        flash[:notice] = 'Post could\'nt be saved'
        redirect_to request.referrer
      end

  end

  end

end
