module Concerns
	module MultisiteRecord
		extend ActiveSupport::Concern

		included do
			# Restrict queries to this site
			default_scope do 
				site_id = ENV['multisite_site_id']
				if(site_id && column_names.include?('site_id'))
					where(site_id: site_id)
				else
					where("1=1")
				end
			end
			
			# XXX TODO add in site_id to saves
		end

		module ClassMethods

		end
	end
end