class Player < ActiveRecord::Base

	validates :email, presence: true
	validates_uniqueness_of :email
	validates :moniker, presence: true
	validates_uniqueness_of :moniker
	validates :password_confirmation, presence: true, on: :create 
  	validates :password, confirmation: true, presence: true,
                       length: { minimum: 8 }, on: :create
    
	
	has_secure_password
	has_many :games


		def slug

			self.moniker.downcase.gsub(" ", "-")

		end

		def self.find_by_slug(slug)

			self.all.find {|instance| instance.slug == slug}

		end

	
end

