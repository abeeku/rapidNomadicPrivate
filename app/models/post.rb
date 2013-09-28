class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :as => :commentable
  #acts_as_commentable
  acts_as_votable
  attr_accessible :content, :whose_wall, :created_at
  define_index do
    indexes content
    indexes comments.content, as: :comment_content
    indexes [user.first_name, user.last_name], as: :user_name
    set_property :delta => true
  end
end


