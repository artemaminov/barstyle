class Section < ActiveRecord::Base

  attr_accessible :name, :permalink, :position

	has_many :pages

	before_validation :make_permalink

	def pages_at_main
		Page.at_main(self.permalink)
	end

	def self.list
		order("position")
	end


	protected

	def make_permalink
		self.permalink = name.to_url.gsub(/[\<\>\']/, '') if permalink.empty?
	end
end
