class Section < ActiveRecord::Base

  attr_accessible :show_in_menu, :name, :permalink, :position, :is_news_section
	attr_accessor :pages_at_main

	has_many :pages

	before_validation :make_permalink

	validates :name, presence: true
	validates :show_in_menu, :is_news_section, inclusion: { in: [true, false] }
	validates :permalink, uniqueness: true

	# Menu list
	def self.list
		where("show_in_menu = TRUE").order("position")
	end

	# Current menu section
	def self.current(permalink)
		current_section = find_by_permalink!(permalink)
		if current_section.is_news_section
			current_section.pages_at_main = current_section.pages.order("created_at DESC")
		else
			current_section.pages_at_main = current_section.pages.where("at_main = TRUE").order("CASE WHEN pages.announce = '' THEN 1 ELSE 0 END, created_at DESC")
		end
		return current_section
	end

	# Subsections
	def self.subsections(section)
		current(section).pages.where("is_subsection = TRUE").order("subsection_position ASC")
	end


	protected

	def make_permalink
		unless name.blank?
			self.permalink = Utility.make_permalink(name, permalink, self)
		end
	end
end