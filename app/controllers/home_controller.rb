class HomeController < ApplicationController

  def index
		@body = Page.find_by_menu_id(1)
  end
end
