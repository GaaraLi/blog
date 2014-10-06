require 'rails_helper'

describe PageController, :type => :routing do
	describe "routing" do
		it " routes to root" do
			expect(get("/")).to route_to("page#homepage")
		end

		it " route to 404" do
			expect(get("/hello/world")).to route_to(:controller=>"page",:action=>"error_404",:path=>"hello/world")
			# expect(get("/hello/world")).to route_to("page#error_404")
		end
	end
end	
