class Comment < ActiveRecord::Base
	belongs_to :articles

	validates_presence_of :name, :email, :body

	validate :articles_should_be_published

	def articles_should_be_published
		errors.add(:article_id, "is not published yet") if articles && !articles.published?
	end
end
