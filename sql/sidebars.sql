CREATE TABLE multisite_sidebars
(
  `id` int(10) unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `site_id` int(10) unsigned DEFAULT NULL,
  `subtitle` varchar(64) DEFAULT NULL,
  `facebook_like_box_url` varchar(128) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
);

