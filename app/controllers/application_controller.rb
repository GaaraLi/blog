class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method [:mark_down]

  # Highlight code with Pygments
  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      language = "ruby" if language.blank?
      # Fix first line missing table
      code = code.insert(0,"    ")
      # Fix last line odd enter line
      code.chomp!
      CodeRay.scan(code, language).div(:tab_width=>2)
    end
  end

  protected
  def mark_down(text)
    options = {
      :autolink => true,
      :no_intra_emphasis => true,
      # :fenced_code_blocks => true,
      :lax_html_blocks => true,
      :strikethrough => true,
      :superscript => true,
      :tables => true,
      :hightlights => true
    }
	  Redcarpet::Markdown.new(HTMLwithCoderay, options).render(text).html_safe
  end
end
