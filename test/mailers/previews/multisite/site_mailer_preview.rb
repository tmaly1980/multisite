module Multisite
  # Preview all emails at http://localhost:3000/rails/mailers/site_mailer
  class SiteMailerPreview < ActionMailer::Preview

    # Preview this email at http://localhost:3000/rails/mailers/site_mailer/site_created
    def site_created
      SiteMailer.site_created
    end

  end
end
