class Game < ActiveRecord::Base

	belongs_to :player
	belongs to :game_console

end
