class Utility
	def self.make_permalink(title, permalink, section)
		if section.show_in_menu
			if permalink.blank?
				title.to_url.gsub(/[\<\>\']/, '')
			else
				permalink
			end
		else
			''
		end
	end
end