class Article < ActiveRecord::Base
	acts_as_paranoid
	paginates_per 1

	belongs_to :tag

	scope :published, -> { where( publish_switch:true) }

	def previous_article
		get_article(true,self.id)
	end

	def next_article
		get_article(false,self.id)
	end

	def published?
		self.publish_switch
	end

	private
	#TODO: opt the if .. else ..
	# set max time for search article
	def get_article(direction, article_id)
		start_id = Article.first.id
		end_id = Article.last.id
		if direction
	      current_id = end_id
	      current_id = article_id.to_i - 1 if article_id != start_id
		else
		  current_id = start_id
		  current_id = article_id.to_i + 1 if article_id != end_id
		end

    begin
      article = Article.find(current_id)
      article = get_article(direction, current_id) unless article.published?
    rescue
    	article = get_article(direction, current_id)
    end
    article
	end
end
