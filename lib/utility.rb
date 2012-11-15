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

	def self.t(b)
		b ? I18n.t("answer.positive") : I18n.t("answer.negative")
	end

	def self.yesno
		[[I18n.t("answer.positive"), true], [I18n.t("answer.negative"), false]]
	end

end