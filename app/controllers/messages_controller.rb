class MessagesController < ApplicationController
 	def index
	  @messages = Message.all
	end
	def show
    @user = User.find_by_username(params[:username])
    @users_messages = @user.messages
    @friend = User.find(params[:friend])
    @mes1 = @users_messages.where(:reciever_id => @friend.id)
    @mes2 = Message.where(:reciever_id => current_user.id,:user_id => @friend.id)
    @mes = @mes1 + @mes2
   @mes = @mes.shuffle
    @mes = @mes.sort_by {|m| m.created_at }

  end

  def count
    @user = User.find(params[:user])
    @friend = User.find(params[:friend])
    @mes1 = @user.messages.where(:reciever_id => @friend.id)
    @mes2 = Message.where(:reciever_id => current_user.id,:user_id => @friend.id)
    @mes = @mes1 + @mes2
    @count = @mes.count
  end

	def create

    @message = Message.create!(content: params[:message][:content],reciever_id: params[:message][:reciever_id] , :created_at => Time.now, :user_id => current_user.id)
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end
	end  
end
