module ApplicationHelper

	def normalize(title)
		title.mb_chars.downcase
	end

	def aws_image_tag(source, options = {})
		if options[:only_url]
			return source.gsub(/\/page_preview\//, "/#{options[:style]}/").html_safe
		end
		image_tag = image_tag(source, options)
		# image_id = image_url.match(/(?<=\/images\/)(\d)+(?=\/)/)
		image_tag.gsub(/\/page_preview\//, "/#{options[:style]}/").html_safe
	end

end
