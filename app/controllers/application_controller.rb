class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :get_menu

	def get_menu
		@menu_sections = Section.order("position")
	end

end
