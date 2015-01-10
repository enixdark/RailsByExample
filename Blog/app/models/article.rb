class Article < ActiveRecord::Base
	validates_presence_of :body,:title

	belongs_to :users
	has_and_belongs_to_many :categories
	has_many :comments

	scope :published, lambda { where("articles.published_at is NOT NULL")}
	scope :draft, lambda { where("articles.published_at is NULL")}
	scope :recent, lambda { published.where("articles.published_at > ?",1.week.ago.to_date) }
	scope :where_title, lambda { |t| where("articles.title LIKE ?", "%#{t}%") }

	def published?
		published_at.present?
	end
end
