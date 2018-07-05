class GameConsolesController < ApplicationController

	get '/game_consoles' do 
		
		@game_consoles = GameConsole.all
		
		if logged_in?

			erb :"/game_consoles/game_consoles", :layout => :display_layout
		else
			redirect to "/login"
		end
	end


	get '/game_consoles/:console_slug' do 
		
		@console = GameConsole.find_by_slug(params[:console_slug])
		
		if logged_in?

			erb :"/game_consoles/show_game_console", :layout => :display_layout

		else
			redirect to "/login"
		end
	end




end
