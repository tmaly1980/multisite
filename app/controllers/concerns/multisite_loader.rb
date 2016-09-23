module Concerns
	module MultisiteLoader
		extend ActiveSupport::Concern

		included do
			before_action :loadSite

			def multisiteAbort
				logger.fatal("Please define 'Rails.configuration.internal_domains' in config/application.rb to enable multi-site support")
				raise Error.new("Sorry, multisite support is not enabled.")
			end

			def internalDomains
				Rails.configuration.try(:internal_domains) || multisiteAbort # Stored in config/application.rb
			end
			def loadSite

				# get hostname/domain
				hostParts = request.host.sub(/^www[.]/,"").split(".") # remove 'www'
				hostname = hostParts.length > 2 ? 
					hostParts.shift : '' # first piece IF more than two
				domain = hostParts.join(".") # Rest

				logger.debug "H="+hostname+", D="+domain
				logger.debug "INTERNAL="+internalDomains.join(";")
				# look up 
				if(domain && !internalDomains.include?(domain))
					logger.debug("DOM="+domain)
					@currentSite = Multisite::Site.find_by_domain(domain)
					logger.debug(@currentSite)
				end
				if(!@currentSite && hostname) # Try next
					logger.debug("HOST="+hostname)
					@currentSite = Multisite::Site.find_by_hostname(hostname)
					logger.debug(@currentSite)
				end
				if(!@currentSite)
					return # www
				end

				return invalidSite if !@currentSite


				# store site_id globally
				ENV['multisite_site_id'] = @currentSite.id.to_s

				@site_design = Multisite::SiteDesign.instance
				@sidebar = Multisite::Sidebar.instance
				
			end

			def invalidSite
				@branded = false
				render 'multisite/sites/not_found'
			end

			
		end

		module ClassMethods
		end
	end
end
