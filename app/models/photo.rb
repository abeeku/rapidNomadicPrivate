class Photo < ActiveRecord::Base
  attr_accessible :name, :privacy, :profile, :image, :user_id, :description
  belongs_to :user
  has_many :comments, :as => :commentable
  mount_uploader :image, ImageUploader

  scope :profile_pics, where(:profile => true)
end
