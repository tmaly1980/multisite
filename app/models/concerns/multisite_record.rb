module Concerns
	module MultisiteRecord
		extend ActiveSupport::Concern

		included do
			# Restrict queries AND creates to this site
			default_scope do 
				site_id = ENV['multisite_site_id']
				if(site_id && column_names.include?('multisite_site_id'));
					where(multisite_site_id: site_id) 
				else
					self
				end
			end

			# XXX may need before_save if related records dont have site_id...

			# before_save do |model|
			# 	site_id = ENV['multisite_site_id'] # Doesn't exist yet when creating site

			# 	#logger.fatal "ADDING SITE_ID "+site_id+" TO="+self.to_s+", includes="
			# 	#logger.fatal("INC?"+(column_names.include?('multisite_site_id') ? "YA" : "NOA"))

			# 	#abort self.to_s
			# 	if(site_id && column_names.include?('multisite_site_id'));
			# 		multisite_site_id = site_id
			# 	end				
			# end
			
			# XXX TODO add in site_id to saves
		end

		module ClassMethods

		end
	end
end