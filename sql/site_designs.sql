CREATE TABLE multisite_site_designs
(
  `id` int(10) unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `site_id` int(10) unsigned DEFAULT NULL,
  `logo_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `subtitle` varchar(64) DEFAULT NULL,
  `facebook_url` varchar(128) DEFAULT NULL,
  `twitter_url` varchar(128) DEFAULT NULL,
  `layout` varchar(24) DEFAULT NULL,
  `theme` varchar(24) DEFAULT NULL,
  `color1` varchar(6) DEFAULT NULL,
  `color2` varchar(6) DEFAULT NULL,

  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
);
