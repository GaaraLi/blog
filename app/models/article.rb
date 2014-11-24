class Article < ActiveRecord::Base
	acts_as_paranoid
	paginates_per 1

	belongs_to :tag

	def previous_article
		get_article(true,self.id)
	end

	def next_article
		get_article(false,self.id)
	end

	private
	#TODO: opt the if .. else ..
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
        	Article.find(current_id)
        rescue ActiveRecord::RecordNotFound
        	get_article(direction, current_id)
        end
	end
end
