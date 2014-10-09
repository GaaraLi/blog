class PageController < ApplicationController
  def homepage
  end

  def change_subtitle
  	session[:sub_title] = '=>' + params[:sub_title]
  	redirect_to root_path
  end

  def cv
  	render file: "#{Rails.root}/public/cv.html", layout:default
  end

  def error_404
  	render file: "#{Rails.root}/public/404.html", status:404, layout:false
  end
end
