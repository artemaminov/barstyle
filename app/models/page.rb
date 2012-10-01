class Page < ActiveRecord::Base
  attr_accessible :main, :menu_id, :permalink, :text, :title

	belongs_to :menu

end
