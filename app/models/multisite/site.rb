require_dependency "multisite/multisite_record"
module Multisite
	class Site < Multisite::MultisiteRecord
		#validates :title, presence: true, length: { minimum: 5 }

		belongs_to :user
		accepts_nested_attributes_for :user # user_attributes

		def owner?(given_user)
			return false if user_id.blank? # No owner.

			if given_user.instance_of? Fixnum
				user_id == given_user
			elsif given_user.instance_of? User
				user_id == given_user.id
			else
				false
			end 
		end

		def url(default_domain,port=80)
			if(!domain)
				domain = hostname + "." + default_domain
			end
			"http://"+domain+(!port.blank? && port != 80 ? ":"+port.to_s : '')
		end
	end
end
