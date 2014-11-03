class Admin::TagsController < ApplicationController
  http_basic_authenticate_with name:'admin', password:'realwol', except:[:show]
	def index
		@tags = Tag.all
	end
end