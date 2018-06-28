class PlayersController < ApplicationController


	get '/signup' do 

		erb :"/players/create_player" 

	end

	post '/signup' do
		if logged_in?
			redirect to "/games"
		else
			if Player.create(params[:player]).valid?
				@player = Player.create(params[:player])
				session[:user_id] = @player.id 
			
				redirect to "/games"
			else
				redirect to "/signup"
			end
		end
	end




end