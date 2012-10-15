class Page < ActiveRecord::Base

  attr_accessible :main, :section_id, :permalink, :announce, :text, :title, :featured_image, :is_subsection, :static_attached

	belongs_to :section

	before_validation :make_permalink

	def self.news(except_article = nil)
		joins(:section).where('sections.position = 1 AND main = FALSE').order('created_at DESC').limit(5)
	end

	def self.at_main(permalink)
		joins(:section).where("sections.permalink = '#{permalink}' AND main = TRUE")
	end


	protected

	def make_permalink
		self.permalink = title.to_url if permalink.empty?
	end

end
