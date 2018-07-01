class PlayersController < ApplicationController
	

	get '/signup' do 


		erb :"/players/create_player", :layout => :intro_layout

	end

	post '/signup' do

			if Player.create(params[:player]).valid? 
				@player = Player.create(params[:player])
				session[:user_id] = @player.id 
			
				redirect to "/games"
			else
				redirect to "/signup"
			end
	end
	
	get '/login' do 

		erb :"players/login"

	end

	post '/login' do 

		@player = Player.find(params[:moniker])

		if @player && @player.authenticate(params[:password])
			session[:user_id] = @player.id 
			redirect to "/games"
		else
			redirect to "/login"
		end
	end

end