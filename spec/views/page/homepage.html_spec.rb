require 'rails_helper'
describe "page/homepage.html.haml", :type => :view do
	let(:article) {FactoryGirl(:article)}

	it 'homepage got the right title' do
		render
		expect(rendered).to match /realwolll/
	end
end