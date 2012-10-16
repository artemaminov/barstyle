class ApplicationController < ActionController::Base

	protect_from_forgery

	before_filter :get_content


	protected

	def get_content
		# Запрашиваем меню
		# Подразделы меню и новости за исключением текущей

		@menu_sections = Section.list
		@subsections = Page.subsections(params[:section])
		@news = Page.news(params[:page_permalink])
	end

end
