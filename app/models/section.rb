class Section < ActiveRecord::Base

  attr_accessible :name, :permalink, :position

	has_many :pages

	before_validation :make_permalink

	def self.current(permalink)
		current = find_by_permalink!(permalink)
	end

	def pages_at_main
		Page.at_main(self.permalink)
	end


	protected

	def make_permalink
		self.permalink = name.to_url if !self.permalink
	end
end
