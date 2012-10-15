module ApplicationHelper

	def normalize(title)
		title.mb_chars.downcase
	end

	def aws_image_tag(source, options = {})
		image_url = image_tag(source, options)
		# image_id = image_url.match(/(?<=\/images\/)(\d)+(?=\/)/)
		image_url.gsub(/\/page_preview\//, "/#{options[:style]}/").html_safe
	end

end
