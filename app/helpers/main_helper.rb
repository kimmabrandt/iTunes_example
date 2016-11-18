module MainHelper
	def verify_input(artist)
		#TO DO: SANITIZ INPUT
		#Accept ltters, numbers, spaces, dashes, underscore
		puts 'replaced with ' + artist.gsub(/[^0-9a-z_\-\s]/i, '')
		return artist.gsub(/[^0-9a-z_\-\s]/i, '')
	end
end
