Multisite::Engine.routes.draw do
	get '/site_designs/theme(/:theme)', to: 'site_designs#theme', as: 'theme_css'

	resources :sites, :site_design, :sidebar

end
