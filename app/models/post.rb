class Post < ActiveRecord::Base
  belongs_to :user
  has_many  :comments, :as => :commentable
  attr_accessible :content, :whose_wall, :created_at
end
