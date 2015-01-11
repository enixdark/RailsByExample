require 'digest'
class User < ActiveRecord::Base
	attr_accessor :password
	validates_presence_of :email,:password
	validates :password, confirmation:true
	validates :email,uniqueness: true

	validates_format_of :email, with: /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i, multiline: true

	validates_length_of :email, :within => 5..50
	validates_length_of :password, :within => 5..50

	has_one :profiles
	has_many :replies, :through => :articles, :source => :comments
	has_many :articles, -> { order 'published_at DESC, title ASC'}, :dependent => :destroy
	after_create :create_new

	before_save :encrypt_new_password
	def create_new
		puts "create new user"
	end

	def self.authenticate(email,password)
		begin
			user = find_by_email(email)
			return user if user.authenticated?(password)
		rescue Exception => e
			puts e.message
		end

	end

	def authenticated?(password)
		self.hashed_password == encrypt(password)
	end

	protected
		def encrypt_new_password
			return if password.blank?
			self.hashed_password = encrypt(password)
		end

		def password_required?
			hashed_password.blank? || password.present?
		end

		def encrypt(string)
			Digest::SHA1.hexdigest(string)
		end

end
