class AddArticlePublishSwitchToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :publish_switch, :boolean, default: false
  end
end
