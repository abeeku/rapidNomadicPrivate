class UserInfo < ActiveRecord::Base
  attr_accessible :bio, :location, :post_color, :user_id, :website
  belongs_to :user
end
