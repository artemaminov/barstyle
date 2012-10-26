class ApplicationController < ActionController::Base

	protect_from_forgery

	#unless Rails.application.config.consider_all_requests_local
		rescue_from ActionController::RoutingError, ActiveRecord::RecordNotFound, with: :render_404
	#end


	private

	def render_404
		@title = t('errors.default')
		render template: "app/_not_found", layout: 'layouts/application', status: :not_found
	end

end