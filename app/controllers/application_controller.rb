class ApplicationController < ActionController::Base

	protect_from_forgery

	rescue_from ActiveRecord::RecordNotFound, :with => :render_404

end