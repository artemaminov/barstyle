class IndexController < ApplicationController

	before_filter :get_content

  def home
		# Home page
	end

	def show_section
		# Section if found
		current_section = Section.current(params[:section])
		if current_section
			@title = current_section.name
			@section = current_section
			@pages_at_main = Page.at_main(params[:section])
		end
	end

	def show_page
		# Desired page if found
		page = Page.current(params[:page_permalink])
		if page
			@title = page.section.name
			@content = page
		end
	end

	def render_404
		@title =t('errors.default')
		render :template => "shared/_not_found", :status => :not_found
	end


	protected

	def get_content
		# Requesting menu, menu subsections and news except current
		@menu_sections = Section.list
		@news = Page.news(params.fetch(:page_permalink, ''))
		@subsections = Section.subsections(params.fetch(:section, ''))
	end

end