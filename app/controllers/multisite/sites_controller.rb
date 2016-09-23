require_dependency "multisite/multisite_controller"


# singleton
module Multisite
	class SitesController < MultisiteController

		def index
			show and return render 'show'
		end
		def edit
			@site = Multisite::Site.first	
		end
		
		def update
			@site = Multisite::Site.first
			if @site.update(site_params)
				redirect_to "/"
				#@site
			else
				render :edit
			end
		end
		
		def show
			# singleton, find first
			@site = Multisite::Site.first
		end

		def new
			@site = Multisite::Site.new	
		end
		def create
			@site = Multisite::Site.new(site_params)
			if @site.save
				# Save email account. No validation/conflict because new site
				@site.user = User.new(site_params[:user])
				@site.user.save

				# XXX TODO
				
				# login as account.
				sign_in(@site.user)

				# Redirect to site, passing cookie along for auto sign-in
			
				redirect_to "http://"+@site.hostname+"."+Multisite.default_domain+"/?"+sessionCookieString
			else
				render :new
			end
		end
	
	  private
	  	def site_params
			params.require(:site).permit!
		end
	end
end
