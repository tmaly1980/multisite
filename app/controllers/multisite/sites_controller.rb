require_dependency "multisite/multisite_controller"

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
			# XXX MAKE ATOMIC TRANSACTION
			Multisite::Site.transaction do
				#abort site_params.inspect
				@site = Multisite::Site.new(site_params)
				if @site.save
					# Save email account. No validation/conflict because new site
					# May already be signed in via facebook/etc
					# @site.user = current_user ? current_user : User.new(site_params[:user])
					# @site.user.save

					# Save owner 
					# Since Site belongsTo User, Site has user_id, but User doesn't have site_id
					# So we have to manually assign site_id to User
					@site.user.multisite_site_id = @site.id
					@site.user.save

					#abort(@site.user.inspect)
					
					# login as account.
					sign_in(@site.user)

					# Send email to user of new site/link
					Multisite::SiteMailer.site_created(@site,@site.url(@default_domain,serverPort!)).deliver_later
					# Only need to pass default domain because we're not on the site yet.

					# Redirect to site, passing cookie along for auto sign-in
				
					redirect_to "http://"+@site.hostname+"."+@default_domain+serverPort!+"/?"+sessionQueryString,
						flash[:notice] => "Your website has been created"
					return
				end
			end

				render :new
		end

		def available
			if site_params[:hostname]
				if Multisite::Site.exists?(hostname: site_params[:hostname])
					respond_to do |format|
						format.json { render(json: { error: "Sorry, that website is already taken" }) and return }
					end
				else
					respond_to do |format|
						format.json { render json: { success: 'That website is available!' } }
					end
				end
			else

				respond_to do |format|
					format.json { render json: { error: 'Please provide a hostname' } }
				end
				
			end


		end
	
	  private
	  	def site_params
			params.require(:site).permit!
		end

		def user_methods # If specific controller wants to block something else, it can alter.
			super - ['new','create'] # Will allow new/create for anonymous
		end
	end
end
