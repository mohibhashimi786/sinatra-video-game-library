module Slugifiable

	module ClassMethod

		def find_by_slug(slug)

			self.all.find {|instance| instance.slug == slug}

		end

		def find_by_slug(title_slug)

			self.all.find {|instance| instance.title_slug == title_slug}

		end



	end


	module InstanceMethod

		def slug

			self.moniker.downcase.gsub(" ", "-")

		end


		def title_slug

			self.title.downcase.gsub(" ", "-")

		end


	end





end

