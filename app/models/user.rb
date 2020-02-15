class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :create_remember_token

  has_secure_password
  has_many :posts

  def self.new_token
    SecureRandom.urlsafe_base64
  end
  
  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def create_remember_token
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
