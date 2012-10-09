class IndexController < ApplicationController

  def home
		# Rendering home page
	end

	def show_section
		# Rendering section if found
		current_section = Section.find_by_permalink(params[:section])
		if current_section
			@section = current_section
		else

		end
		at_main = Page.at_main(current_section.permalink)
		if at_main
			@at_main = at_main
		end
	end

	def show_page
		# Rendering desired page if found
		page = Page.find_by_permalink(params[:page_permalink])
		if page
			@body = page
		else

		end

	end

end