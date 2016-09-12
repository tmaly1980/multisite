Multisite::Engine.routes.draw do
	get '/site_designs/theme(/:theme.css)', to: 'site_designs#theme'

	resource :site_design, :sidebar

end
