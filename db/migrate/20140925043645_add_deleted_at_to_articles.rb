class AddDeletedAtToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :deleted_at, :datetime
  end
end
