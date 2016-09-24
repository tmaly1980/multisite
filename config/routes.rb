Multisite::Engine.routes.draw do
	get '/site_designs/theme(/:theme.css)', to: 'site_designs#theme'

	resource :sites, :site_design, :sidebar
end
