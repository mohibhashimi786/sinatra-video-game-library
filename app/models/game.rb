class Game < ActiveRecord::Base

	belongs_to :player
	belongs_to :game_console

end
