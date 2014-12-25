# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#
require 'bcrypt'
class User < ActiveRecord::Base
    has_secure_password
    attr_accessor :password, :password_confirmation,:remember_token

    validates_presence_of :password, :on => :create
    before_save { |user| user.email = email.downcase }


    REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: {with: REGEX_EMAIL}, uniqueness: { case_sensitive: false }
    validates :name, presence: true, length: {maximum: 30,minimum: 6}
    validates :password, presence: true, length: {maximum: 30,minimum: 6}, confirmation: true
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true

    # Encrypt password when create or set a new password
    def password=(pass)
      @password = pass
      unless pass.blank?
        self.password_digest = BCrypt::Password.create(pass)
      end
    end


    # Remembers a user in the database for use in persistent sessions.
    def remember
        @remember_token = User.new_token
        self.update_attribute(:remember_digest,User.digest(remember_token))
    end

    def forget
        self.update_attribute(:remember_digest,nil)
    end

    # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    class << self
    # Returns the hash digest of the given string.
        def digest(string)
            cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                BCrypt::Engine.cost
            BCrypt::Password.create(string, cost: cost)
        end

        # Returns a random token.
        def new_token
            SecureRandom.urlsafe_base64
        end
    end


end
