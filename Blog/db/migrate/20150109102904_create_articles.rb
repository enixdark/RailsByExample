class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
       t.title :string
       t.body :string

       t.timestamps null: false
    end
  end
end
