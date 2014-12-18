class Article < ActiveRecord::Base
	acts_as_paranoid
	paginates_per 15

	belongs_to :tag

	scope :published, -> { where( publish_switch:true) }

  # Not fit so well with old test
  # searchable do
  #   text :title
  # end

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
	# Set max time for search article
	def get_article(direction, article_id)
    current_id = get_current_id(direction, article_id)
    begin
      article = Article.find(current_id)
      raise 'Current article not published error' unless article.published?
    rescue
    	article = get_article(direction, current_id)
    end
    article
	end

  def get_current_id( direction, article_id)
    start_id = Article.first.id
    end_id = Article.last.id
    id = direction ? article_id -1 : article_id + 1
    
    case id
    when (start_id - 1) then
      id = end_id
    when (end_id + 1) then
      id = start_id
    else
    end
    id
  end
end
