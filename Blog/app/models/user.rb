class User < ActiveRecord::Base
	validates_presence_of :email,:password
	validates :password, confirmation:true
	has_one :profiles
	has_many :articles, -> { order 'published_at DESC, title ASC'}, :dependent => :destroy
end
