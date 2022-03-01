DROP TABLE IF EXISTS `account_data`;
CREATE TABLE `account_data` (
  `id` INT(11) NOT NULL,
  `vp` INT(11) DEFAULT '0',
  `dp` INT(11) DEFAULT '0',
  `location` VARCHAR(255) DEFAULT NULL,
  `nickname` VARCHAR(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `currency_transactions`;
CREATE TABLE `currency_transactions` (
  `realmid` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1',
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `guid` INT(10) UNSIGNED NOT NULL,
  `unix_time` INT(10) UNSIGNED NOT NULL,
  `operation` ENUM('LOOT_MOB','LOOT_ITEM','MAIL','QUEST_REWARD','TRADE','SELL_ITEM','GUILD_BANK','AUCTION','TRANSMOGRIFICATION') NOT NULL,
  `param` INT(10) UNSIGNED DEFAULT NULL,
  `attachments` TEXT NOT NULL,
  `amount_before` INT(10) UNSIGNED DEFAULT NULL,
  `amount_after` INT(10) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_guid` (`guid`),
  KEY `idx_operation` (`operation`),
  KEY `idx_unix_time` (`unix_time`),
  KEY `idx_param` (`param`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;


INSERT INTO `currency_transactions`(`realmid`,`id`,`guid`,`unix_time`,`operation`,`param`,`attachments`,`amount_before`,`amount_after`) VALUES (1,1,1,1636074664,'QUEST_REWARD',30039,'',0,2),(1,2,2,1636074826,'QUEST_REWARD',29612,'',0,9800),(1,3,2,1636075009,'QUEST_REWARD',31853,'',9800,19600),(1,4,2,1636075024,'QUEST_REWARD',29690,'',19600,29400),(1,5,2,1636075543,'QUEST_REWARD',31765,'',29400,127400),(1,6,2,1636075663,'QUEST_REWARD',31766,'',127400,225400),(1,7,2,1636075857,'LOOT_MOB',73158,'',225400,228061);
