class ApplicationController < ActionController::Base

	protect_from_forgery

	rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound, with: :render_404


	private

	def render_404
		@title = t('errors.default')
		@menu_sections = Section.list
		render template: "app/_not_found", layout: 'layouts/application', status: :not_found
	end

end