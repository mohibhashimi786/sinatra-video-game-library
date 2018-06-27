module Slugifiable

	module ClassMethod

		def find_by_slug(slug)

			all.find {|instance| instance.slug == slug}

		end


	end


	module InstanceMethod

		def slug

			self.name.downcase.gsub(" ", "-")

		end

	end





end

