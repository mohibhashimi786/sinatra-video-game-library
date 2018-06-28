require_relative "concerns/slugifiable.rb"

class Player < ActiveRecord::Base

	validates :email, presence: true
	validates :moniker, presence: true

	extend Slugifiable::ClassMethod
	include Slugifiable::InstanceMethod
	
	has_secure_password
	has_many :games
	
end

