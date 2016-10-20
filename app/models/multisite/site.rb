require_dependency "multisite/multisite_record"
module Multisite
	class Site < Multisite::MultisiteRecord
		#validates :title, presence: true, length: { minimum: 5 }

		belongs_to :user
		accepts_nested_attributes_for :user

		def url(default_domain)
			if(!domain)
				domain = hostname + "." + default_domain
			end
			"http://"+domain
		end
	end
end
