class User < ApplicationRecord
  attr_accessor :remember_token
  before_create :create_remember_digest

  has_secure_password

  private
    def self.new_token
      SecureRandom.urlsafe_base64.to_s
    end

    def self.encrypt_token(token)
      Digest::SHA1.hexdigest(token)
    end

    def create_remember_digest
      self.remember_token = User.new_token
      self.remember_digest = User.encrypt_token(remember_token)
    end
end
