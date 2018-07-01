module Slugifiable

	module ClassMethod

		def find_by_slug(slug)

			self.all.find {|instance| instance.slug == slug}

		end


	end


	module InstanceMethod

		def slug

			self.moniker.downcase.gsub(" ", "-")

		end

	end





end

