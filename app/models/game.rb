class Game < ActiveRecord::Base

	
	belongs_to :player
	belongs_to :game_console


	def title_slug

		self.title.downcase.gsub(" ", "-")

	end


	def self.find_by_slug(title_slug)

		self.all.find {|instance| instance.title_slug == title_slug}

	end


end
