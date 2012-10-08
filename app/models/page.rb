class Page < ActiveRecord::Base

	scope :news, joins(:section).where('sections.position = 1').limit(5)

  attr_accessible :main, :section_id, :permalink, :text, :title, :featured_image

	belongs_to :section

	before_validation :make_permalink


	protected

	def make_permalink
		self.permalink = title.to_url
	end
end
