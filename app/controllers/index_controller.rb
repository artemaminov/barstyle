class IndexController < ApplicationController

	before_filter :get_content

	def show_page
		# Desired page if found
		page = Page.show(@page_permalink)
		if page
			@title = page.section.name
			@content = page
		end
	end

	def show_section
		# Section if found
		current_section = Section.current(@current_section_name)
		if current_section
			@news_section = current_section.is_news_section
			@title = current_section.name
			@section = current_section
			@pages_at_main = current_section.pages_at_main
		end
	end

	def render_404
		@title =t('errors.default')
		render :template => "shared/_not_found", :status => :not_found
	end


	protected

	def get_content
		@page_permalink = params.fetch(:page_permalink, '')
		@current_section_name = params.fetch(:section, '')
		# Requesting menu, menu subsections and news except current
		@menu_sections = Section.list
		@news = Page.news(@page_permalink)
		@subsections = Section.subsections(@current_section_name)
	end

end