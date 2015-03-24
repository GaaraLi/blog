class HomepageCell < Cell::ViewModel
	def article_list
		@articles = Article.all.published.paginate(page: params[:page])
		render
	end
end