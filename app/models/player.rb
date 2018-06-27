class Player < ActiveRecord::Base


	has_secure_password
	has_many :game_consoles
	has_many :games, through: :game_consoles
	
end

