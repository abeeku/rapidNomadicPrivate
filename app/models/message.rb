class Message < ActiveRecord::Base
  attr_accessible :content, :reciever_id, :user_id
end
