require 'rails_helper'

RSpec.describe Article, :type => :model do
  it "should create successfully" do
  	Factory(:article)
  	expect(Article.last.title).to eq('Test Titile')
  end

  describe 'get_article ' do
  	before do
      @first_article = Factory(:article)  
  	  @second_article = Factory(:article, title:'Test Title3', content: 'Test Content3')  
      @last_article = Factory(:article, title:'Test Title2', content: 'Test Content2')
  	end

    it "should return next article" do
	    expect(@first_article.next_article.id).to eq(@second_article.id)
    end
    it "should return previous_article" do
	    expect(@last_article.previous_article.id).to eq(@second_article.id)
    end
    it "should return the first article if next article is empty" do
	    expect(@last_article.next_article.id).to eq(@first_article.id)
    end
    it "should return the first article if previous article is empty" do
      expect(@first_article.previous_article.id).to eq(@last_article.id)
    end
  end
end
