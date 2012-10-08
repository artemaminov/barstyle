class Section < ActiveRecord::Base

  attr_accessible :name, :permalink, :position

	has_many :pages

	before_validation :make_permalink


	protected

	def make_permalink
		self.permalink = name.to_url
	end
end
