class HomepageCell < Cell::ViewModel
	def article_list
		@articles = Article.all.published
		render
	end
end