module Multisite
  # Preview all emails at http://localhost:3000/rails/mailers/multisite/site_mailer
  class Multisite::SiteMailerPreview < ActionMailer::Preview

    # Preview this email at http://localhost:3000/rails/mailers/multisite/site_mailer/site_created
    def site_created
      Multisite::SiteMailer.site_created
    end

  end
end
