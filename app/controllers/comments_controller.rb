class CommentsController < ApplicationController

  before_filter :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    if @comment.save
      redirect_to @commentable
    end
  end

  private

  def load_commentable
  ###  resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)###
     @commentable = if params[:post_id]
    Post.find(params[:post_id])
  elsif params[:photo_id]
    Photo.find(params[:photo_id])
  elsif params[:event_id]
    Event.find(params[:event_id])
  end
  end

end
