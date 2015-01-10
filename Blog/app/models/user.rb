class User < ActiveRecord::Base
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
	def create_new
		puts "create new user"
	end
end
