$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "multisite/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "multisite"
  s.version     = "1.0.0"#Multisite::VERSION
  s.authors     = ["Tomas Maly"]
  s.email       = ["tmaly1980@gmail.com"]
  s.homepage    = "http://hopefulpress.com/"
  s.summary     = "Multiple site apps"
  s.description = "Multiple website signup and host/domain based application transparency"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"

  s.add_development_dependency "sqlite3"
end
