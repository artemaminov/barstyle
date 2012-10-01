class Menu < ActiveRecord::Base
  attr_accessible :name, :permalink, :position

	has_many :pages
end
