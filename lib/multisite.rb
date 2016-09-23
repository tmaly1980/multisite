require "multisite/engine"

module Multisite # SWEET!!!!
	class Specified
		def matches? # For router, asked for specific site
			Multisite.site_specified
		end
	end

	class NotSpecified
		def matches? # For router, asked for specific site
			!Multisite.site_specified
		end
	end

		def Multisite.site_specified # give domain if custom (not internal), otherwise hostname, or nil if on www
			STDERR.puts("SITE_SPEC!!!")
			fqdn = request.host.sub(/^www[.]/,"") # remove 'www'

		  	# NEED TO ACCOUNT FOR internal_domains
		  	if(fqdn.end_with? default_domain) # just hostname
		  		fqdn.sub(default_domain,'') # Remove off
		  	else
		  		domain = fqdn
		  	end
		end

		def Multisite.internal_domains
			Rails.configuration.try(:internal_domains) || self.abort # Stored in config/application.rb
		end

		def Multisite.http_host
			request.host.sub(/^www[.]/,"")
		end

		def Multisite.default_domain
			domain = internal_domains[0]
			internal_domains.each do |d|
				if http_host.ends_with? d
					return d
				end
			end
			return domain
		end

		def Multisite.abort
			logger.fatal("Please define 'Rails.configuration.internal_domains' in config/application.rb to enable multi-site support")
			raise Error.new("Sorry, multisite support is not enabled.")
		end
	 
	#end
end
