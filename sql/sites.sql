CREATE TABLE `multisite_sites` (
  `id` int(10) unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `hostname` varchar(24) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `banner_photo_id` int(10) unsigned DEFAULT NULL,

  `plan` varchar(36) DEFAULT NULL,
  `stripe_id` varchar(128) DEFAULT NULL,
  `subscription_id` varchar(128) DEFAULT NULL,
  `domain` varchar(64) DEFAULT NULL,
  `internal` tinyint(1) NOT NULL DEFAULT '0',
  `trial` tinyint(1) NOT NULL DEFAULT '0',
  `upgraded` datetime DEFAULT NULL,
  `session_id` varchar(128) DEFAULT NULL,
  `marketing_visit_id` int(10) unsigned DEFAULT NULL,

  `disabled` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL

/*
  `page_photo_id` int(10) unsigned DEFAULT NULL,
  `paypal_email` varchar(128) DEFAULT NULL,
  `sponsor_label` varchar(24) DEFAULT NULL,
  `always_enable_sponsorship` tinyint(1) NOT NULL DEFAULT '0',
  `email_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `rescue_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `campaign_code` varchar(16) DEFAULT NULL,
  `campaign_subcode` varchar(16) DEFAULT NULL,
*/
);
