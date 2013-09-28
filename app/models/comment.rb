class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  attr_accessible :content, :user_id
  after_save :set_post_delta_flag
  after_destroy :set_post_delta_flag

  private

  def set_post_delta_flag
    commentable.delta = true
    commentable.save
  end
end
