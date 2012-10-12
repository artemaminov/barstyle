class Page < ActiveRecord::Base

  attr_accessible :main, :section_id, :permalink, :announce, :text, :title, :featured_image

	belongs_to :section

	before_validation :make_permalink

	def self.news(except_article = nil)
		joins(:section).where('sections.position = 1 AND main = FALSE').limit(5)
	end

	def self.at_main(permalink)
		joins(:section).where("sections.permalink = '#{permalink}' AND main = TRUE")
	end


	protected

	def make_permalink
		self.permalink = title.to_url if !self.permalink
	end
end
