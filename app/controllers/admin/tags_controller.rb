class Admin::TagsController < ApplicationController
  http_basic_authenticate_with name:'admin', password:'realwol', except:[:show]

  def index
    @tags = Tag.all
    respond_to do |format|
      format.html
      format.json { render :json => @tags }
      format.text { render :text => @tags }
    end
  end
end