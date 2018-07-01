class GamesController < ApplicationController


	get '/games' do 
			@games = Games.all 

			if logged_in?
			erb :"/games/games"
			else
			redirect to "/login"
			end

	end


	get '/games/new' do 
		if !logged_in?
			redirect to "/"

		else
			erb :'/games/create_game'
		end
	end
	



	

end