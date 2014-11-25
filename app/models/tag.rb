class Tag < ActiveRecord::Base
	acts_as_paranoid
	has_many :articles

  def self.article_published
    self.all.delete_if{|tag| tag.articles.published.count < 1 }
  end

end
