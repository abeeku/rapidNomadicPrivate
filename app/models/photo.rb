class Photo < ActiveRecord::Base
  attr_accessible :name, :privacy, :user_id, :description, :image
  has_attached_file :image, :styles => { :profile => ["150x150", :jpg], :orig => "800x800" }
  belongs_to :user
  has_many :comments, :as => :commentable
  validates_attachment_content_type :image,
  :content_type => ['image/jpeg', 'image/pjpeg',
                                   'image/jpg', 'image/png', 'image/tif', 'image/gif'], :message => "has to be in a proper format"
end
