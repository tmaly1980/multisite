require_dependency "multisite/multisite_record"
module Multisite
	class Sidebar < Multisite::MultisiteRecord
		#validates :title, presence: true, length: { minimum: 5 }
		acts_as_singleton
	end
end
