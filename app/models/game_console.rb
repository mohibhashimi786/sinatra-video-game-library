require_relative "concerns/slugifiable.rb"

class GameConsole < ActiveRecord::Base

	extend Slugifiable::ClassMethod
	include Slugifiable::InstanceMethod
	
	has_many :games
	
end
