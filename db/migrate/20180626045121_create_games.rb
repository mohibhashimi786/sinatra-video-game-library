class CreateGames < ActiveRecord::Migration[5.2]
  def change

  	create_table :games do |t|
  		t.string :title
  		t.string :genre
  		t.integer :game_console_id
  		t.integer :player_id
  	end

  end
end
