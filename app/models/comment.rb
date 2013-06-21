class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_one :user
  attr_accessible :content, :user_id
end
