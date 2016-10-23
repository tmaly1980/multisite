module Multisite
  class SiteMailer < ApplicationMailer

    def site_created(site,site_url)
      @site = site
      @user = @site.user
      @site_url = site_url

      # Site owner
      mail(to: @user.email, subject: "Your new website for #{@site.title}")

  	end
  end
end
