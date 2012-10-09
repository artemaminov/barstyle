class Page < ActiveRecord::Base

	scope :news, joins(:section).where('sections.position = 1 AND main = FALSE').limit(5)

  attr_accessible :main, :section_id, :permalink, :text, :title, :featured_image

	belongs_to :section

	before_validation :make_permalink

	def self.at_main(page_permalink)
		joins(:section).where("sections.permalink = '#{page_permalink}' AND main = TRUE")
	end


	protected

	def make_permalink
		self.permalink = title.to_url
	end
end
