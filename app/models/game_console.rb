class GameConsole < ActiveRecord::Base

	has_many :games
	
		def console_slug

			self.name.downcase.gsub(" ", "-")

		end

		def self.find_by_slug(console_slug)

			self.all.find {|instance| instance.console_slug == console_slug}

		end

end
