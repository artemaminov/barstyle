class Utility
	def self.make_permalink(title, permalink)
			title.to_url.gsub(/[\<\>\']/, '') if permalink.blank?
	end
end