class Page < ActiveRecord::Base

  attr_accessible :at_main, :section_id, :permalink, :announce, :text, :title, :featured_image, :is_subsection, :static_attached, :subsection_position

	belongs_to :section

	before_validation :make_permalink, :main_page_handler

	validates :section_id, :title, :text, presence: true
	validates :at_main, :is_subsection, inclusion: { in: [true, false] }
	validates :permalink, uniqueness: true

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
		unless title.blank? || section.nil?
			self.permalink = Utility.make_permalink(title, permalink, section)
		end
	end

	def main_page_handler
		unless section.nil?
			unless section.show_in_menu?
				self.at_main, self.is_subsection = true, false
			end
		end
	end

end
