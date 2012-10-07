class IndexController < ApplicationController

  def index
		page = Page.find_by_permalink(params[:permalink])
		if page
			@body = page
			render 'index/_page'
		end
	end

end