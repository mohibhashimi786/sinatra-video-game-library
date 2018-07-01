class GamesController < ApplicationController


	get '/games' do 
			@games = Game.all 

			if logged_in?
			erb :"/games/games"
			else
			redirect to "/login"
			end

	end


	get '/games/new' do 
		@consoles = GameConsole.all 
		if !logged_in?
			redirect to "/"

		else
			erb :'/games/create_game'
		end
	end

	#post '/games' do 
	#	if logged_in?
	#		if !params[:game][:title].empty? && !params[:game][:genre].empty?
	#			@game = Game.create(title: params[:game][:title], genre: params[:game][:genre])
	#				if !params([:game_console][:name]).empty?
	#					@game.game_console = GameConsole.create(name: params[:game_console][:name])
	#			current_player.games << @game
	#	binding.pry
	#end



	

end