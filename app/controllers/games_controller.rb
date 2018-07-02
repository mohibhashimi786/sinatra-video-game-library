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

	get '/games/:title_slug' do 
		@game = Game.find_by_slug(params[:title_slug])
		erb :'/games/show_game'
	end


	post '/games' do 
		if logged_in?

			@game = Game.create(params[:game])

				if !params[:game_console][:name].empty?
					@game.game_console = GameConsole.create(name: params[:game_console][:name])
				end

			current_player.games << @game 
			current_player.save
			@game.save
			
			redirect to "games/#{@game.title_slug}"

		else

		 	redirect to "/login"

		 end
	end

	 

	

end