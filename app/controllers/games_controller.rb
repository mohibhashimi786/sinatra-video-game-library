
require 'rack-flash'

class GamesController < ApplicationController
	configure do
   
    use Rack::Flash 
   
	    
	end

	get '/games' do 
			@games = Game.all 

			if logged_in?
			erb :"/games/games", :layout => :display_layout
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

	
	post '/games' do 
		
		if logged_in?

			@game = Game.create(params[:game])

				if !params[:game_console][:name].empty?
					@game.game_console = GameConsole.create(name: params[:game_console][:name])
				end

			current_player.games << @game 
			current_player.save
			@game.save

			flash[:message] = "Success, your game has been posted."
			redirect to "games/#{@game.title_slug}"

		else

		 	redirect to "/login"

		 end
	end

	get '/games/:title_slug' do 
		@game = Game.find_by_slug(params[:title_slug])
			if logged_in? && @game
				erb :'/games/show_game', :layout => :display_layout
			else
				redirect to '/login'
			end
	end

	get '/games/:title_slug/edit' do 
		
		if !logged_in?
			redirect to "/login"
		else
			@game = Game.find_by_slug(params[:title_slug])
			@consoles = GameConsole.all

			if current_player.id == @game.player_id
			erb :"/games/edit_game"
			else
			redirect to "/games/games"
			end

		end

	end

	patch '/games/:title_slug' do 
		if !logged_in?
			redirect to "/login"
		else

			@game = Game.find_by_slug(params[:title_slug])
			@game.update(params[:game])

			if !params[:game_console][:name].empty?
				@game.game_console = GameConsole.create(name: params[:game_console][:name])
			end
			@game.save
			current_player.save

			flash[:message] = "Success, your game has been updated."

			redirect to "/games/#{@game.title_slug}"
		
		end
	end


	delete '/games/:title_slug/delete' do 
		if !logged_in?
			redirect to "/login"
		else

			@game = Game.find_by_slug(params[:title_slug])
			
			if @game && current_player.id == @game.player_id
				
				@game.delete

				flash[:message] = "Game has been deleted."

				redirect to "/games"

			else
				"/games/#{@game.title_slug}"
			end
		end
	end
	

end