class CreatePlayers < ActiveRecord::Migration[5.2]
 
  def change

  	create_table :players do |t|
		t.string :username
  		t.string :moniker
  		t.string :password_digest
  	end
  
  end

end
