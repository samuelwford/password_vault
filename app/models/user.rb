class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_secure_password
  
  has_and_belongs_to_many :groups
  has_many :activities, -> { order(created_at: :desc) }
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def send_password_reset
    password_reset_token = User.new_token
    self.password_reset_token = User.digest(password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self, password_reset_token).deliver
  end
  
  private
  
  def create_remember_token
    self.remember_token = User.digest(User.new_token)
  end
  
  def self.find_for_google_oauth2(access_token)
      data = access_token.info
      user = User.where(email: data["email"]).first
      unless user
        password = User.new_token
        if data["email"].end_with?("1up.fm")
          user = User.create(name: data["name"],
             email: data["email"],
             password: password,
             password_confirmation: password,
             active: true
          )
        end
      end
      user
  end
end
