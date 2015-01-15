class PageController < ApplicationController
  def homepage
    EmailWorker.perform_async if params[:email]
  end

  def mortal
    render layout:'mortal'
  end

  def change_subtitle
    if params[:sub_title]
  	  session[:sub_title] = '=>' + params[:sub_title]
    end
  	redirect_to root_path
  end

  def ab_test
    # sleep 0.1
    render text: Article.published
  end

  def cv
    render layout:'mortal'
    # render file: "#{Rails.root}/public/cv.html", layout:default
  end

  def CV_en
  	render file: "#{Rails.root}/public/cv-en.html", layout:default
  end

  def error_404
  	render file: "#{Rails.root}/public/404.html", status:404, layout:false
  end
end
