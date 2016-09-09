require_dependency "multisite/multisite_controller"


# singleton
module Multisite
	class SiteDesignsController < MultisiteController
		include Concerns::CssRender

		def theme
			@SiteDesign = Multisite::SiteDesign.instance

			# render CSS from ERB file
			theme = params[:theme] || 'default'

			# Use a "concern" to render the less/css, so we can reuse elsewhere easily.
			return render_css(theme, params, @SiteDesign)
		end
		def index
			show and return render 'show'
		end
		def edit
			@SiteDesign = Multisite::SiteDesign.instance	
		end
		
		def update
			@SiteDesign = Multisite::SiteDesign.instance
			if @SiteDesign.update(SiteDesign_params)
				redirect_to @SiteDesign
			else
				render :edit
			end
		end
		
		def show
			# singleton, find first
			@SiteDesign = Multisite::SiteDesign.instance
		end
	
	  private
	  	def SiteDesign_params
			params.require(:SiteDesign).permit!
		end
	end
end
