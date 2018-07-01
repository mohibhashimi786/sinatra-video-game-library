class PlayersController < ApplicationController
	
	get '/players/:slug' do
		@player = Player.find_by_slug(params[:slug])

		erb :"/players/show"
	end


	get '/signup' do 

			if logged_in?
				redirect to "/games"
			else
			erb :"/players/create_player", :layout => :intro_layout
			end

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

		if !logged_in?
		erb :"players/login"
		else
		redirect to "/games"
		end

	end

	post '/login' do 

		@player = Player.find_by(moniker: params[:player][:moniker])

		if @player && @player.authenticate(params[:player][:password])
			session[:user_id] = @player.id 
			redirect to "/games"
		else
			redirect to "/login"
		end


	end

	get '/logout' do 
		if logged_in?
			session.clear 
			redirect to "/login"
		else
			redirect to "/"
		end
	end


end