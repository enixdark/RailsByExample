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

class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :name,:password, :password_confirmation
  attr_accessor :password, :password_confirmation

  validates_presence_of :password, :on => :create
  before_save { |user| user.email = email.downcase }

  REGEX_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: REGEX_EMAIL}, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: {maximum: 30,minimum: 6}
  # validates :password, presence: true, length: {maximum: 30,minimum: 6}, confirmation: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  def password=(pass)
    @password = pass
    unless pass.blank?
      self.password_digest = BCrypt::Password.create(pass)
    end
  end

end
