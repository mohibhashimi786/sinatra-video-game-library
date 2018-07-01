require_relative "concerns/slugifiable.rb"

class Player < ActiveRecord::Base

	validates :email, presence: true
	validates_uniqueness_of :email
	validates :moniker, presence: true
	validates :password_confirmation, presence: true, on: :create 
  	validates :password, confirmation: true, presence: true,
                       length: { minimum: 8 }, on: :create
    

	extend Slugifiable::ClassMethod
	include Slugifiable::InstanceMethod
	
	has_secure_password
	has_many :games
	
end

