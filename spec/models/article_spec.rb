require 'rails_helper'

RSpec.describe Article, :type => :model do
  it "should create successfully" do
  	Factory(:article)
  	expect(Article.last.title).to eq('Test Titile')
  end
end
