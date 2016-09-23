module Concerns
	module MultisiteLoader
		extend ActiveSupport::Concern

		included do
			before_action :loadSiteUserSession
			before_action :loadSite

			def sessionKey
				Rails.application.config.session_options[:key]
			end

			def sessionQueryString
				sessionKey+"="+cookies[sessionKey]
			end

			def loadSiteUserSession # Might be cross-site, ie www?_rescue_session=1234 => mysite?_rescue_session=1234
				if sessval = params[sessionKey]
					request.session_options[:id] = sessval
				end
			end

			def loadSite
				sitename = Multisite.site_specified(request)
				# give domain if custom (not internal), otherwise hostname, or nil if nothing

				logger.debug("SITENAME="+sitename)

				# look up 
				if(sitename[/\./]) # Domain-y
					logger.debug("DOMAIN="+sitename)
					@currentSite = Multisite::Site.find_by_domain(sitename)
					logger.debug(@currentSite)
				end
				if(!@currentSite && sitename) # Try next
					logger.debug("HOST="+sitename)
					@currentSite = Multisite::Site.find_by_hostname(sitename)
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

				@default_domain = Multisite.default_domain(request)
				
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
