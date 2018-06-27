require_relative "concerns/slugifiable.rb"

class Game < ActiveRecord::Base

	extend Slugifiable::ClassMethod
	include Slugifiable::InstanceMethod
	
	belongs_to :player
	belongs_to :game_console

end
