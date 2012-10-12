class IndexController < ApplicationController

  def home
		# Rendering home page
	end

	def show_section
		# Rendering section if found
		current_section = Section.current(params[:section])
		if current_section
			@title = current_section.name
			@section = current_section
		end

	rescue
			@title = t(:default, :scope => :errors)
			render :template => "shared/_not_found", :status => :not_found
	end

	def show_page
		# Rendering desired page if found
		page = Page.find_by_permalink(params[:page_permalink])
		if page
			@title = page.title
			@content = page
		else

		end

	end

end