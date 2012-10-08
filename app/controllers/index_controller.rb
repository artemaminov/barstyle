class IndexController < ApplicationController

  def home
		# Rendering home page

	end

	def show_page
		# Rendering desired page if found
		@current_section = params[:section]
		page_permalink = params[:page_permalink]
		if page_permalink
			page = Page.find_by_permalink(page_permalink)
			if page
				@body = page
				render 'index/_page'
			end

		# Show default page according section
		else

		end

	end

end