class HomeController < ApplicationController
  def index
  	@users = User.all

  	respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blog_entries }
    end
  end
end
