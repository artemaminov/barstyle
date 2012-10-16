class Page < ActiveRecord::Base

  attr_accessible :main, :section_id, :permalink, :announce, :text, :title, :featured_image, :is_subsection, :static_attached

	belongs_to :section

	before_validation :make_permalink

	def self.subsections(section)
		joins(:section).where("sections.permalink = '#{section}' AND is_subsection = TRUE")
	end

	# TODO section_id = 1 hardcode
	def self.news(except_article = nil)
		where("section_id = 1 AND main = TRUE AND is_subsection = FALSE AND NOT permalink = '#{except_article}'").order("created_at DESC").limit(5)
	end

	# TODO permalink == 'news' hardcode
	def self.at_main(permalink)
		if permalink == 'news'
			joins(:section).where("sections.permalink = '#{permalink}' AND main = FALSE").order("created_at DESC")
		else
			joins(:section).where("sections.permalink = '#{permalink}' AND main = TRUE").order("CASE WHEN announce='' THEN 1 ELSE 0 END, created_at DESC")
		end
	end


	protected

	def make_permalink
		self.permalink = title.to_url.gsub(/[\<\>\']/, '') if permalink.empty?
	end

end
