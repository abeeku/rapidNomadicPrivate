class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :photos
  has_many :comments
  attr_accessible :email,
                  :first_name,
                  :last_name,
                  :password,
                  :username,
                  :password_confirmation,
                  :date_of_birth,
                  :admin
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
