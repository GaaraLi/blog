class PageController < ApplicationController
  def homepage
    puts '============='
    puts 'in controller'
    puts '============='
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
    render file: "#{Rails.root}/public/cv.html", layout:default
  end

  def CV_en
  	render file: "#{Rails.root}/public/cv-en.html", layout:default
  end

  def error_404
  	render file: "#{Rails.root}/public/404.html", status:404, layout:false
  end
end
