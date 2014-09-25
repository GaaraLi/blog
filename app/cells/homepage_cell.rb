class HomepageCell < Cell::ViewModel
	def article_list
		@articles = Article.all
		render
	end
end