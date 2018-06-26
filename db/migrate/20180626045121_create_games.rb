class CreateGames < ActiveRecord::Migration[5.2]
  def change

  	create_table :games do |t|
  		t.string :name
  		t.string :genre
  		t.integer :player_id
  		t.integer :game_console_id
  	end

  end
end
