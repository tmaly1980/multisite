require_dependency "multisite/multisite_controller"


# singleton
module Multisite
	class SiteDesignsController < MultisiteController
		def theme
			@SiteDesign = Multisite::SiteDesign.instance
			# render CSS from ERB file
			theme = params[:theme] || 'default'

			#render layout: false, content_type: "text/css", template: 'themes/'+theme+'.css.erb'
			rootPath = Rails.root.join("app","assets","less")
			enginePath = Multisite::Engine.root.join("app","assets","less")

			paths = [rootPath,enginePath]
			STDERR.puts(paths.join("\n"))
			parser = Less::Parser.new :paths => paths

			# take params passed and interpret into variables
			runtime_vars = params.map do |key,val|
				"@"+key+": '"+val+"';"
			end
			runtime_vars.unshift("@import 'lib';")
			runtime_vars.push("@import 'themes/"+theme+"';")
			# this here loads the theme

			STDERR.puts(runtime_vars.join("\n"))

			cssout = parser.parse(runtime_vars.join("\n")).to_css
			render content_type: "text/css", plain: cssout
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
