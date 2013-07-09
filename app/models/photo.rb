class Photo < ActiveRecord::Base
  attr_accessible :name, :privacy, :user_id, :description, :image
  has_attached_file :image, :styles => { :profile => "150x150", :orig => "800x800" }
  belongs_to :user
  has_many :comments, :as => :commentable
end
