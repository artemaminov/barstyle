class Section < ActiveRecord::Base

  attr_accessible :name, :permalink, :position

	has_many :pages

	before_validation :make_permalink

	# Menu list
	def self.list
		order("position")
	end

	# Current menu section
	def self.current(permalink)
		find_by_permalink!(permalink)
	end

	# Subsections
	def self.subsections(current_section)
		current(current_section).pages.where("is_subsection = TRUE")
	end

	#def pages_at_main
	#	Page.at_main(self.permalink)
	#end


	protected

	def make_permalink
		self.permalink = name.to_url.gsub(/[\<\>\']/, '') if permalink.empty?
	end
end
