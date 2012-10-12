module ApplicationHelper

	def normalize(title)
		title.mb_chars.downcase
	end

	def truncate_words(text, length = 100, end_string = '...')
		words = text.split()
		words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
	end

end
