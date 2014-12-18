require 'rails_helper'

RSpec.describe Tag, :type => :model do
  describe 'Tag model' do
    describe 'Article published' do
      before do
        @tag1 = Factory(:tag, name:'tag_name_1')
        @tag2 = Factory(:tag, name:'tag_name_2')
        Factory(:article, tag_id: @tag1.id)
        @tag_with_published_articles = Tag.article_published
      end

      it 'should return tag with article existed' do
        expect(@tag_with_published_articles.first).to eq(@tag1)
      end

      it 'should not return tag with no article' do
        expect(@tag_with_published_articles.include?(@tag2)).to eq(false)
      end

      it 'should return all tags with article existed' do
        tag3 = Factory(:tag, name:'tag_name_3')
        Factory(:article, tag_id: tag3.id)

        expect(Tag.article_published.include?(tag3)).to eq(true)
      end

      it 'should not return tags with only not published articles ' do
        tag4 = Factory(:tag, name:'tag_name_4')
        Factory(:article, tag_id:tag4.id, publish_switch: false)

        expect(Tag.article_published.include?(tag4)).to eq(false)
      end

    end
  end
end
