require 'test_helper'

module Multisite
  class SiteMailerTest < ActionMailer::TestCase
    test "site_created" do
      mail = SiteMailer.site_created
      assert_equal "Site created", mail.subject
      assert_equal ["to@example.org"], mail.to
      assert_equal ["from@example.com"], mail.from
      assert_match "Hi", mail.body.encoded
    end

  end
end
