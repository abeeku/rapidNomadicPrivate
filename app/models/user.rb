class User < ActiveRecord::Base
  has_secure_password
  before_save { |user| user.email = email.downcase }
  

  
 has_attached_file :profile, :styles => {  :medium => ["250x250>", :jpg], :thumb => ["80x80#", :jpg ], :menubar => ["40x40#", :jpg] } , 
                  :default_url => '/assets/missing_:style.png',
                  :path => ":rails_root/app/assets/:class/:attachment/:id/:hash_:style.:extension",
                  :hash_secret => "spongetianabob"#,
                  #:url => "/:class/:attachment/:id/:hash_:style.:extension" 
                  
     
                

  
  has_one :user_info
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships,:source => :friend, :conditions => "status ='accepted'"
  has_many :pending_friends, :through => :friendships,:source => :friend, :conditions => "status ='pending'"
  has_many :requested_friends, :through => :friendships,:source => :friend, :conditions => "status ='requested'"

  has_many :posts, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
#validates_attachment_presence :profile
validates_attachment_size :profile, :less_than => 6.megabytes
  validates_attachment_content_type :profile,
  :content_type => ['image/jpeg', 'image/pjpeg',
                                   'image/jpg', 'image/png', 'image/tif', 'image/gif'], :message => "has to be in a proper format"
  attr_accessible :email,
                  :first_name,
                  :last_name,
                  :password,
                  :username,
                  :password_confirmation,
                  :date_of_birth,
                  :admin,
                  :profile, :requested_friends, :pending_friends
  #Remember Me Cookie Token
  before_create { generate_token(:cookie_token) }


 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, :uniqueness => { case_sensitive: false }
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  #End Token

  #Password Reset Email
     def send_password_reset

       generate_token(:password_reset_token)
       self.password_reset_sent_at = Time.zone.now
       save!(validate: false)
       UserMailer.password_reset(self).deliver
     end
  #End Reset Email

  #Registration Validations
  validates :email,
            :presence => true,
            :length => { :minimum => 4 }
  validates :first_name,:last_name, :username, :password, :password_confirmation,
            :presence => true #, on: create
  validates :username,
            :uniqueness => {
                :case_sensitive => false,
                :message => 'Sorry, someone already picked that username :(' },
            :length => {
                :minimum => 6,
                :maximum => 20,
                :too_short => "Username has to be at least %{count} characters",
                :too_long => "Username has to be at less than %{count} characters"
            }
 #End Validations

  def full_name
    [first_name, last_name].join(' ')
  end

 


 # def create_remember_token
 #   self.remember_token = SecureRandom.urlsafe_base64
 # end



 # def randomize_file_name
    
 #   extension = File.extname(profile_file_name).downcase
 #   self.image.instance_write(:file_name, "#{SecureRandom.urlsafe_base64}#{extension}")
  #end
  
end
