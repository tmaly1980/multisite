module Concerns
	module CssRender
		extend ActiveSupport::Concern

		included do
			def render_css(theme='default', params={}, object={})
			# loads themes/<theme>.less, lib.less, and sets vars from query string + db record
			# looks under app/assets/less of main app and /engines/multisite

				#render layout: false, content_type: "text/css", template: 'themes/'+theme+'.css.erb'
				rootPath = Rails.root.join("app","assets","less")
				enginePath = Multisite::Engine.root.join("app","assets","less")
						# or wherever WE are

				paths = [rootPath,enginePath]
				STDERR.puts(paths.join("\n"))
				parser = Less::Parser.new :paths => paths

				invalid_keys = ["id","created_at","updated_at","site_id","user_id"]

				settings = object.attributes || {}
				settings.merge!(params)

				STDERR.puts settings

				# take params passed and interpret into variables
				runtime_vars = settings.compact.except(*invalid_keys).map do |key,val|
					"@"+key.to_s+": "+val.to_s+";"
				end
				# Put theme and lib first so custom vars go last and take precedence
				runtime_vars.unshift("@import 'themes/"+theme+"';")
				runtime_vars.unshift("@import 'lib';")
				runtime_less = runtime_vars.join("\n")

				STDERR.puts(runtime_vars.join("\n"))

				cssout = parser.parse(runtime_less).to_css
				render content_type: "text/css", plain: cssout
			end
		end

		module ClassMethods
		end
	end
end