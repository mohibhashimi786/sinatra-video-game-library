class CreateGameConsoles < ActiveRecord::Migration[5.2]
  
  def change

  	create_table :game_consoles do |t|
  		t.string :name
  		t.string :player_id
 	end


  end


end
