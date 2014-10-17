def format_string(string, width)
	string.strip.gsub(/\s+/, ' ').upcase.center(width, ' ')
end