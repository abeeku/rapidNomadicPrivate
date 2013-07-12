class FriendshipsController < ApplicationController

  def create
 @friend_id = params[:friendship][:friend_id]
    @friend = User.find(@friend_id)
   Friendship.request(current_user, @friend)
    flash[:notice] = "Friend Request was sent to #{@friend.first_name}"
    redirect_to request.referrer
  end

   def accept
     @friend_id = params[:id]
     @friend = User.find(@friend_id)
     Friendship.accept(current_user,@friend)
     flash[:notice] = "You are now friends with #{@friend.full_name}"
     redirect_to request.referrer
   end
end
