class Page < ActiveRecord::Base

  attr_accessible :main, :section_id, :permalink, :announce, :text, :title, :featured_image, :is_subsection, :static_attached

	belongs_to :section

	before_validation :make_permalink

	def	self.current(permalink)
		find_by_permalink!(permalink)
	end

	# TODO section_id = 1 hardcode
	def self.news(except_article = '')
		where("section_id = 1 AND main = TRUE AND is_subsection = FALSE AND permalink != ?", except_article).order("created_at DESC")
	end

	# TODO permalink == 'news' hardcode
	def self.at_main(permalink)
		if permalink == 'news'
			joins(:section).where("sections.permalink = ? AND main = FALSE", permalink).order("created_at DESC")
		else
			joins(:section).where("sections.permalink = ? AND main = TRUE", permalink).order("CASE WHEN announce = '' THEN 1 ELSE 0 END, created_at DESC")
		end
	end


	protected

	def make_permalink
		self.permalink = title.to_url.gsub(/[\<\>\']/, '') if permalink.empty?
	end

end
