class AddColumnPushlishedToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :published_at, :datetime
  end
end
