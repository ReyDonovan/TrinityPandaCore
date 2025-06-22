-- creature_template
ALTER TABLE `creature_template` ADD `femaleName` char(100) NOT NULL DEFAULT '' AFTER `name`;  
  
  -- creature_template_locale
 ALTER TABLE `creature_template_locale` ADD `FemaleName` text AFTER `Name`;