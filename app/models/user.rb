class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :profile, :styles => {  :medium => ["250x250>", :jpg], :thumb => ["80x80#", :jpg ], :menubar => ["40x40#", :jpg] } , 
                  :default_url => '/assets/missing_:style.png'
  has_one :user_info
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships,:source => :friend, :conditions => "status ='accepted'"
  has_many :pending_friends, :through => :friendships,:source => :friend, :conditions => "status ='pending'"
  has_many :requested_friends, :through => :friendships,:source => :friend, :conditions => "status ='requested'"

  has_many :posts, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
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

  before_save { |user| user.email = email.downcase }


 # def create_remember_token
 #   self.remember_token = SecureRandom.urlsafe_base64
 # end
end
