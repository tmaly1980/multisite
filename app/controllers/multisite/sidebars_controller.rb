require_dependency "multisite/multisite_controller"


# singleton
module Multisite
	class SidebarsController < MultisiteController

		def edit
			@sidebar = Multisite::Sidebar.instance	
		end
		
		def update
			@sidebar = Multisite::Sidebar.instance
			if @sidebar.update(sidebar_params)
				redirect_to @sidebar
			else
				render :edit
			end
		end
		
		def show
			# singleton, find first
			@sidebar = Multisite::Sidebar.instance
		end
	
	  private
	  	def sidebar_params
			params.require(:sidebar).permit!
		end
	end
end
