require_dependency "multisite/multisite_controller"


# singleton
module Multisite
	class SiteDesignsController < MultisiteController
		include Concerns::CssRender

		def sidebar
			@site_design = Multisite::SiteDesign.instance
			render partial: 'multisite/site_designs/sidebar'
		end

		def edit_sidebar # View form
			render partial: 'multisite/site_designs/edit_sidebar'
		end

		def update_sidebar # Process ajax update
			@site_design = Multisite::SiteDesign.instance
			@site_design.save(params.require(:site_design).permit!) unless params.site_design.blank?

			render partial: 'multisite/site_designs/sidebar'
		end


		def theme
			@site_design = Multisite::SiteDesign.instance

			# render CSS from ERB file
			theme = params[:theme] || 'default'

			# Use a "concern" to render the less/css, so we can reuse elsewhere easily.
			return render_css(theme, params, @site_design)
		end
		def index
			show and return render 'show'
		end
		def edit
			@site_design = Multisite::SiteDesign.instance	
		end
		
		def update
			@site_design = Multisite::SiteDesign.instance
			if @site_design.update(SiteDesign_params)
				redirect_to @site_design
			else
				render :edit
			end
		end
		
		def show
			# singleton, find first
			@site_design = Multisite::SiteDesign.instance
		end
	
	  private
	  	def SiteDesign_params
			params.require(:SiteDesign).permit!
		end
	end
end
