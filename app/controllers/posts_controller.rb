class PostsController < ApplicationController
  layout '3col'
include ApplicationHelper
  def new
   @new_post  = current_user.posts.build

  end
  def index

    if params[:search]
      @posts = Post.search(params[:search], page: 1, per_page: 20)
    end

  end
   def dislike
     @post = Post.find(params[:post_id])
     current_user.dislikes @post
     redirect_to request.referrer
   end
  def unlike
    @post = Post.find(params[:post_id])
    current_user.unlike @post
    redirect_to profile_for(@post.user)
  end
  def share
    @post = Post.find(params[:post_id])

    @shared_post = current_user.posts.build(content: @post.content, whose_wall: current_user.id)
    if @shared_post.save
      redirect_to profile_for(current_user)
    end
  end
  def like
    @post = Post.find(params[:post_id])
    current_user.likes @post
    redirect_to request.referrer
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
