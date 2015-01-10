class AddColumnToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :bio, :text
    add_column :profiles, :color, :string
    add_column :profiles, :twitter, :string
  end
end
