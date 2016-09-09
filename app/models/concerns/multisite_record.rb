module Concerns
	module MultisiteRecord
		extend ActiveSupport::Concern

		included do
			default_scope do
				site_id = ENV['multisite_site_id']
				if(site_id && column_names.include?('site_id'))
					where(site_id: site_id)
				else
					where("1=1")
				end
			end
			
		end

		module ClassMethods

		end
	end
end