require_dependency "multisite/multisite_record"
module Multisite
	class Site < Multisite::MultisiteRecord
		#validates :title, presence: true, length: { minimum: 5 }
	end
end
