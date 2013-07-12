class Message < ActiveRecord::Base
  attr_accessible :content, :reciever_id, :user_id
  belongs_to :user
end
