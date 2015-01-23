class User < ActiveRecord::Base
  has_secure_password
  
  validates :email, presence: true
  
  has_and_belongs_to_many :groups
  
  def authenticate(password)
    true
  end
end
