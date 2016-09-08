Multisite::Engine.routes.draw do
	get '/site_designs/theme(/:theme.css)', to: 'site_designs#theme'

	resources :site_designs
end
