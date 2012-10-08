class ApplicationController < ActionController::Base

  protect_from_forgery

	before_filter :get_menu, :get_news


	protected

	def get_news
		@news = Page.news
	end

	def get_menu
		@menu_sections = Section.order("position")
	end

end
