class Message < ActiveRecord::Base
  attr_accessible :content, :reciever_id, :user_id, :reciever, :user, :created_at
  belongs_to :user
  default_scope :order => 'created_at ASC'
  belongs_to :reciever, :foreign_key => :reciever_id, :class_name => 'User'
end
