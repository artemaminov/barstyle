class ApplicationController < ActionController::Base

	protect_from_forgery

	rescue_from ActiveRecord::RecordNotFound, with: :render_404

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to '/admin', :alert => exception.message
	end

	def current_ability
		@current_ability ||= Ability.new(current_admin_user)
	end


	private

	def render_404
		@title = t('errors.default')
		render template: "app/_not_found", layout: 'layouts/application', status: :not_found
	end

end