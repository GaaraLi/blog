class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name:'admin', password:'realwol', except:[:show]

  def index
    page = params[:page] || 1
    @articles = Article.all.order("publish_switch desc").page(page)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      begin
        @article = Article.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render file: "#{Rails.root}/public/404.html", status:404, layout:false
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :tag_id, :publish_switch)
    end
end
