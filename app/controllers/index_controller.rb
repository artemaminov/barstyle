class IndexController < ApplicationController

  def home
		# Rendering home page
	end

	def show_section
		# Rendering section if found
		current_section = Section.find_by_permalink!(params[:section])
		if current_section
			@title = current_section.name
			@section = current_section
		end

	rescue
			@title =t('errors.default')
			render :template => "shared/_not_found", :status => :not_found
	end

	def show_page
		# Rendering desired page if found
		page = Page.find_by_permalink!(params[:page_permalink])
		if page
			@title = page.section.name
			@content = page
		end

	rescue
		@title = t('errors.default')
		render :template => "shared/_not_found", :status => :not_found

	end

end