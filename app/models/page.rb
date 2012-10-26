class Page < ActiveRecord::Base

  attr_accessible :at_main, :section_id, :permalink, :announce, :text, :title, :featured_image, :is_subsection, :static_attached

	belongs_to :section

	before_validation :make_permalink

	def	self.show(permalink)
		find_by_permalink!(permalink)
	end

	def self.news(except_article)
		news_section = Section.find_by_is_news_section(TRUE)
		if news_section
			where("section_id = ? AND at_main = TRUE AND is_subsection = FALSE AND permalink != ?", news_section.id, except_article).order("created_at DESC")
		end
	end


	protected

	def make_permalink
		if self.section.show_in_menu
			self.permalink = Utility.make_permalink(title, permalink)
		else
			self.permalink = ''
		end
	end

end
