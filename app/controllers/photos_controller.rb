class PhotosController < ApplicationController
  layout 'profile', only: :index
  def index
    @user = User.find_by_username(params[:username])
    @user_info = @user.user_info
  end
  def new
   @photo = Photo.new(:user_id => current_user.id)
  end
  def change
    @photo = Photo.find(params[:id])
  end
   def show
      @photo =c Photo.find(params[:id])
      @comment = Comment.new
      @commentable = @photo
      @comments = @commentable.comments
   end
  def update
   @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
          redirect_to controller: 'photos', action: 'show', id: @photo.id
    else
    render 'edit'
    end
  end
  def destroy
    @user = User.find_by_username(params[:username])
    if @user == current_user
      @photo = Photo.find(params[:id])
      if @photo.destroy
        redirect_to request.referrer
      end
    end
  end
  def create
       @photo = Photo.new(params[:photo])
    if @photo.save
      redirect_to profile_url(current_user.username)
    end




  end
end
