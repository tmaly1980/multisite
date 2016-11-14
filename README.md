# Multisite
This ruby gem/rails engine provides multiple website functionality to any existing application by checking the subdomain/hostname and filtering content assigned to that host/site. Great for SaaS systems.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'multisite', :git => 'git://github.com/tmaly1980/multisite.git'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install multisite
```

## Usage

First, mount the engine:
```
  mount Multisite::Engine, at: "/"
```

Add to close to the top of app/controllers/application_controller.rb:

```
  include Concerns::MultisiteLoader
```

### Hostname detection/routing

In your main app's config/routes.rb file, you can route to a main (marketing-style) content if no hostname is specified (or 'www'), and route to a per-site instance (ie customer site) if given, using routing constraints:

```
  constraints Multisite::Specified do
  	# routes specific to content for a given site, ie example.site.com:

  	resource :homepages # example
    root "homepages#index" # As an example
  end

  constraints Multisite::NotSpecified do
  # Show marketing/signup/etc content on top domain, ie www.site.com or site.com:

    get "/signup", to: "multisite/sites#new"

  end
```

### Signup page:

``` 
/sites/new 
```
This URL will allow users to signup for a site. You can customize the signup form by copying multisite/sites/new.html.erb to your main app.

Users will be asked for their email and desired password. Upon signup, they will be emailed a message with links for future reference. If you want to customize the email content, simply make your own copy of:
```
views/multisite/site_mailer/site_created.html.erb

and 

views/multisite/site_mailer/site_created.text.erb
```

### Filtering content per site

Content filtering happens automatically based on the model's Multisite::MultisiteRecord concern. Simply add this to your models (or create a base class ApplicationRecord all inherit from):

```
  include Concerns::MultisiteRecord
```

Add a 'multisite_site_id' field to your models (unsigned integer), it will take the current hostname found and determine which content to filter. It uses a default scope for both querying the database and ensuring the site_id is saved properly.

## Contributing
Feel free to contribute!

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
