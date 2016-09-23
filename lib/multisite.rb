require "multisite/engine"

module Multisite # SWEET!!!!
	class Specified
		def self.matches?(request) # For router, asked for specific site
			specified = Multisite.site_specified(request)
			STDERR.puts("SPECIFYING?="+specified)
			return !specified.empty?
		end
	end

	class NotSpecified
		def self.matches?(request) # For router, asked for specific site
			STDERR.puts("NOT SPECIFYING!")
			return !Multisite::Specified.matches?(request)
		end
	end

		def Multisite.site_specified(request) # give domain if custom (not internal), otherwise hostname, or nil if on www
			STDERR.puts("SITE_SPEC!!!")
			fqdn = request.host.sub(/^www[.]/,"") # remove 'www'

		  	# NEED TO ACCOUNT FOR internal_domains
		  	domain = default_domain(request)

		  	if(fqdn.end_with? domain) # just hostname
		  		fqdn.sub(domain,'') # Remove off, but returns that piece, so do two-liner
		  		hostname = fqdn # MUST be on separate line
		  		return hostname
		  	else
		  		return fqdn
		  	end
		  	return nil
		end

		def Multisite.internal_domains
			Rails.configuration.try(:internal_domains) || self.abort # Stored in config/application.rb
		end

		def Multisite.http_host(request)
			request.host.sub(/^www[.]/,"")
		end

		def Multisite.default_domain(request)
			domain = internal_domains[0]
			internal_domains.each do |d|
				if http_host(request).ends_with? d
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
