class AddTagIdInArticle < ActiveRecord::Migration
  def change
  	add_column :articles, :tag_id, :string
  end
end
