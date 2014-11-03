class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :mark_down

  def mark_down(text)
	  mark = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                   autolink:true,
                                   tables:true,
                                   space_after:true,
                                   no_intra_emphasis:true,
                                   hard_wrap:true,
                                   strikethrough:true)
	  mark.render(text).html_safe
  end

  def syntax_highlighter( html)
  	doc= Nokogiri::HTML( html)
  	doc.search("//pre[@lang]").each do |pre|
  		pre.replace Albino.colorize( pre.text.rstrip, pre[:lang])
  	end
  	doc.to_s
  end

end
