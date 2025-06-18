/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 8.0.31 : Database - characters
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*Table structure for table `account_achievement` */

DROP TABLE IF EXISTS `account_achievement`;

CREATE TABLE `account_achievement` (
  `account` int unsigned NOT NULL,
  `guid` int unsigned NOT NULL,
  `achievement` smallint unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`,`achievement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `account_achievement` */

LOCK TABLES `account_achievement` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_achievement_progress` */

DROP TABLE IF EXISTS `account_achievement_progress`;

CREATE TABLE `account_achievement_progress` (
  `account` int unsigned NOT NULL,
  `criteria` smallint unsigned NOT NULL,
  `counter` bigint unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `account_achievement_progress` */

LOCK TABLES `account_achievement_progress` WRITE;

insert  into `account_achievement_progress`(`account`,`criteria`,`counter`,`date`) values 
(2,19661,1,1642601127),
(2,20678,1,1642601127),
(6,4093,3,1645014467),
(6,5215,2,1645014499),
(6,20678,2,1645014499);

UNLOCK TABLES;

/*Table structure for table `account_battle_pet` */

DROP TABLE IF EXISTS `account_battle_pet`;

CREATE TABLE `account_battle_pet` (
  `id` bigint unsigned NOT NULL DEFAULT '0',
  `accountId` int unsigned NOT NULL DEFAULT '0',
  `species` smallint unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(16) NOT NULL DEFAULT '',
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `level` tinyint unsigned NOT NULL DEFAULT '1',
  `xp` smallint unsigned NOT NULL DEFAULT '0',
  `health` smallint unsigned NOT NULL DEFAULT '0',
  `maxHealth` smallint unsigned NOT NULL DEFAULT '0',
  `power` smallint unsigned NOT NULL DEFAULT '0',
  `speed` smallint unsigned NOT NULL DEFAULT '0',
  `quality` tinyint unsigned NOT NULL DEFAULT '0',
  `breed` tinyint unsigned NOT NULL DEFAULT '0',
  `flags` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `account_battle_pet` */

LOCK TABLES `account_battle_pet` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_battle_pet_slots` */

DROP TABLE IF EXISTS `account_battle_pet_slots`;

CREATE TABLE `account_battle_pet_slots` (
  `accountId` int unsigned NOT NULL DEFAULT '0',
  `slot1` bigint unsigned NOT NULL DEFAULT '0',
  `slot2` bigint unsigned NOT NULL DEFAULT '0',
  `slot3` bigint unsigned NOT NULL DEFAULT '0',
  `flags` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `account_battle_pet_slots` */

LOCK TABLES `account_battle_pet_slots` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_data` */

DROP TABLE IF EXISTS `account_data`;

CREATE TABLE `account_data` (
  `accountId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`accountId`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `account_data` */

LOCK TABLES `account_data` WRITE;

insert  into `account_data`(`accountId`,`type`,`time`,`data`) values 
(2,0,1642601127,'SET flaggedTutorials \"v##$##E##(\"\r\nSET cameraDistanceMaxFactor \"1\"\r\n'),
(6,0,1645014430,'SET flaggedTutorials \"v##$##%##-##\'##(##.##0##Z##E##:\"\r\nSET cameraDistanceMaxFactor \"1\"\r\n');

UNLOCK TABLES;

/*Table structure for table `account_instance_times` */

DROP TABLE IF EXISTS `account_instance_times`;

CREATE TABLE `account_instance_times` (
  `accountId` int unsigned NOT NULL,
  `instanceId` int unsigned NOT NULL DEFAULT '0',
  `releaseTime` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`,`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `account_instance_times` */

LOCK TABLES `account_instance_times` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_spell` */

DROP TABLE IF EXISTS `account_spell`;

CREATE TABLE `account_spell` (
  `account` int unsigned NOT NULL DEFAULT '0',
  `spell` mediumint unsigned NOT NULL DEFAULT '0',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`account`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `account_spell` */

LOCK TABLES `account_spell` WRITE;

UNLOCK TABLES;

/*Table structure for table `account_tutorial` */

DROP TABLE IF EXISTS `account_tutorial`;

CREATE TABLE `account_tutorial` (
  `accountId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `tut0` int unsigned NOT NULL DEFAULT '0',
  `tut1` int unsigned NOT NULL DEFAULT '0',
  `tut2` int unsigned NOT NULL DEFAULT '0',
  `tut3` int unsigned NOT NULL DEFAULT '0',
  `tut4` int unsigned NOT NULL DEFAULT '0',
  `tut5` int unsigned NOT NULL DEFAULT '0',
  `tut6` int unsigned NOT NULL DEFAULT '0',
  `tut7` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `account_tutorial` */

LOCK TABLES `account_tutorial` WRITE;

insert  into `account_tutorial`(`accountId`,`tut0`,`tut1`,`tut2`,`tut3`,`tut4`,`tut5`,`tut6`,`tut7`) values 
(2,17,2,0,0,0,0,0,0),
(6,4199963,4194306,0,0,0,0,0,0);

UNLOCK TABLES;

/*Table structure for table `addons` */

DROP TABLE IF EXISTS `addons`;

CREATE TABLE `addons` (
  `name` varchar(120) NOT NULL DEFAULT '',
  `crc` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Addons';

/*Data for the table `addons` */

LOCK TABLES `addons` WRITE;

insert  into `addons`(`name`,`crc`) values 
('Blizzard_AchievementUI',0),
('Blizzard_ArchaeologyUI',0),
('Blizzard_ArenaUI',0),
('Blizzard_AuctionUI',0),
('Blizzard_AuthChallengeUI',0),
('Blizzard_BarbershopUI',0),
('Blizzard_BattlefieldMinimap',0),
('Blizzard_BindingUI',0),
('Blizzard_BlackMarketUI',0),
('Blizzard_Calendar',0),
('Blizzard_ChallengesUI',0),
('Blizzard_ClientSavedVariables',0),
('Blizzard_CombatLog',0),
('Blizzard_CombatText',0),
('Blizzard_CompactRaidFrames',0),
('Blizzard_CUFProfiles',0),
('Blizzard_DebugTools',0),
('Blizzard_EncounterJournal',0),
('Blizzard_GlyphUI',0),
('Blizzard_GMChatUI',0),
('Blizzard_GMSurveyUI',0),
('Blizzard_GuildBankUI',0),
('Blizzard_GuildControlUI',0),
('Blizzard_GuildUI',0),
('Blizzard_InspectUI',0),
('Blizzard_ItemAlterationUI',0),
('Blizzard_ItemSocketingUI',0),
('Blizzard_ItemUpgradeUI',0),
('Blizzard_LookingForGuildUI',0),
('Blizzard_MacroUI',0),
('Blizzard_MovePad',0),
('Blizzard_PetBattleUI',0),
('Blizzard_PetJournal',0),
('Blizzard_PVPUI',0),
('Blizzard_QuestChoice',0),
('Blizzard_RaidUI',0),
('Blizzard_ReforgingUI',0),
('Blizzard_StoreUI',0),
('Blizzard_TalentUI',0),
('Blizzard_TimeManager',0),
('Blizzard_TokenUI',0),
('Blizzard_TradeSkillUI',0),
('Blizzard_TrainerUI',0),
('Blizzard_VoidStorageUI',0);

UNLOCK TABLES;

/*Table structure for table `armory_character_stats` */

DROP TABLE IF EXISTS `armory_character_stats`;

CREATE TABLE `armory_character_stats` (
  `guid` int NOT NULL,
  `data` longtext NOT NULL,
  `item_level` smallint unsigned DEFAULT NULL,
  `gear_score` smallint unsigned DEFAULT NULL,
  `achievement_points` smallint unsigned DEFAULT NULL,
  `save_date` int DEFAULT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='World of Warcraft Armory table';

/*Data for the table `armory_character_stats` */

LOCK TABLES `armory_character_stats` WRITE;

UNLOCK TABLES;

/*Table structure for table `auctionhouse` */

DROP TABLE IF EXISTS `auctionhouse`;

CREATE TABLE `auctionhouse` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `auctioneerguid` int unsigned NOT NULL DEFAULT '0',
  `itemguid` int unsigned NOT NULL DEFAULT '0',
  `itemowner` int unsigned NOT NULL DEFAULT '0',
  `buyoutprice` int unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `buyguid` int unsigned NOT NULL DEFAULT '0',
  `lastbid` int unsigned NOT NULL DEFAULT '0',
  `startbid` int unsigned NOT NULL DEFAULT '0',
  `deposit` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `item_guid` (`itemguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `auctionhouse` */

LOCK TABLES `auctionhouse` WRITE;

UNLOCK TABLES;

/*Table structure for table `banned_addons` */

DROP TABLE IF EXISTS `banned_addons`;

CREATE TABLE `banned_addons` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Version` varchar(255) NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `idx_name_ver` (`Name`,`Version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `banned_addons` */

LOCK TABLES `banned_addons` WRITE;

UNLOCK TABLES;

/*Table structure for table `blackmarket_auctions` */

DROP TABLE IF EXISTS `blackmarket_auctions`;

CREATE TABLE `blackmarket_auctions` (
  `auctionId` int unsigned NOT NULL DEFAULT '0',
  `templateId` int unsigned NOT NULL DEFAULT '0',
  `startTime` int unsigned NOT NULL DEFAULT '0',
  `endTime` int unsigned NOT NULL DEFAULT '0',
  `currentBidder` int unsigned NOT NULL DEFAULT '0',
  `currentBid` bigint unsigned NOT NULL DEFAULT '0',
  `minIncrement` bigint unsigned NOT NULL DEFAULT '0',
  `numBids` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `blackmarket_auctions` */

LOCK TABLES `blackmarket_auctions` WRITE;

insert  into `blackmarket_auctions`(`auctionId`,`templateId`,`startTime`,`endTime`,`currentBidder`,`currentBid`,`minIncrement`,`numBids`) values 
(1,132,1750063352,1750179318,0,600000000,30000000,0),
(2,7,1750063275,1750087345,0,300000000,15000000,0),
(3,503,1750063258,1750134849,0,15000000,750000,0),
(4,43,1750063240,1750224590,0,300000000,15000000,0),
(5,10,1750063300,1750169485,0,300000000,15000000,0),
(6,119,1750063305,1750136767,0,600000000,30000000,0),
(7,212,1750063240,1750178754,0,300000000,15000000,0),
(8,182,1750063333,1750186825,0,300000000,15000000,0),
(9,99,1750063308,1750180136,0,3000000,150000,0),
(10,13,1750063300,1750132749,0,300000000,15000000,0),
(11,129,1750063309,1750173437,0,300000000,15000000,0),
(12,71,1750063275,1750131571,0,300000000,15000000,0);

UNLOCK TABLES;

/*Table structure for table `bugreport` */

DROP TABLE IF EXISTS `bugreport`;

CREATE TABLE `bugreport` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `type` longtext NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Debug System';

/*Data for the table `bugreport` */

LOCK TABLES `bugreport` WRITE;

UNLOCK TABLES;

/*Table structure for table `calendar_events` */

DROP TABLE IF EXISTS `calendar_events`;

CREATE TABLE `calendar_events` (
  `id` bigint unsigned NOT NULL DEFAULT '0',
  `creator` int unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint unsigned NOT NULL DEFAULT '4',
  `dungeon` int NOT NULL DEFAULT '-1',
  `eventtime` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  `time2` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `calendar_events` */

LOCK TABLES `calendar_events` WRITE;

UNLOCK TABLES;

/*Table structure for table `calendar_invites` */

DROP TABLE IF EXISTS `calendar_invites`;

CREATE TABLE `calendar_invites` (
  `id` bigint unsigned NOT NULL DEFAULT '0',
  `event` bigint unsigned NOT NULL DEFAULT '0',
  `invitee` int unsigned NOT NULL DEFAULT '0',
  `sender` int unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `statustime` int unsigned NOT NULL DEFAULT '0',
  `rank` tinyint unsigned NOT NULL DEFAULT '0',
  `text` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `calendar_invites` */

LOCK TABLES `calendar_invites` WRITE;

UNLOCK TABLES;

/*Table structure for table `channels` */

DROP TABLE IF EXISTS `channels`;

CREATE TABLE `channels` (
  `name` varchar(128) NOT NULL,
  `team` int unsigned NOT NULL,
  `announce` tinyint unsigned NOT NULL DEFAULT '1',
  `ownership` tinyint unsigned NOT NULL DEFAULT '1',
  `password` varchar(32) DEFAULT NULL,
  `bannedList` text,
  `lastUsed` int unsigned NOT NULL,
  PRIMARY KEY (`name`,`team`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Channel System';

/*Data for the table `channels` */

LOCK TABLES `channels` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_account_data` */

DROP TABLE IF EXISTS `character_account_data`;

CREATE TABLE `character_account_data` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`guid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_account_data` */

LOCK TABLES `character_account_data` WRITE;

insert  into `character_account_data`(`guid`,`type`,`time`,`data`) values 
(1,1,1750063380,'SET autoQuestPopUps \"v\"\r\nSET trackedQuests \"v&H5\"\r\nSET trackedAchievements \"v\"\r\nSET cameraSavedDistance \"10.548002\"\r\nSET cameraSavedPitch \"23.549991\"\r\nSET minimapTrackedInfov2 \"229384\"\r\nSET minimapShapeshiftTracking \"v\"\r\nSET reputationsCollapsed \"v##$\"\r\nSET activeCUFProfile \"Primary\"\r\nSET EJLootClass \"10\"\r\n'),
(1,7,1750063381,'VERSION 5\n\nADDEDVERSION 19\n\nCHANNELS\nEND\n\nZONECHANNELS 35651587\n\nCOLORS\n\nSYSTEM 255 255 0 N\nSAY 255 255 255 N\nPARTY 170 170 255 N\nRAID 255 127 0 N\nGUILD 64 255 64 N\nOFFICER 64 192 64 N\nYELL 255 64 64 N\nWHISPER 255 128 255 N\nWHISPER_FOREIGN 255 128 255 N\nWHISPER_INFORM 255 128 255 N\nEMOTE 255 128 64 N\nTEXT_EMOTE 255 128 64 N\nMONSTER_SAY 255 255 159 N\nMONSTER_PARTY 170 170 255 N\nMONSTER_YELL 255 64 64 N\nMONSTER_WHISPER 255 181 235 N\nMONSTER_EMOTE 255 128 64 N\nCHANNEL 255 192 192 N\nCHANNEL_JOIN 192 128 128 N\nCHANNEL_LEAVE 192 128 128 N\nCHANNEL_LIST 192 128 128 N\nCHANNEL_NOTICE 192 192 192 N\nCHANNEL_NOTICE_USER 192 192 192 N\nAFK 255 128 255 N\nDND 255 128 255 N\nIGNORED 255 0 0 N\nSKILL 85 85 255 N\nLOOT 0 170 0 N\nMONEY 255 255 0 N\nOPENING 128 128 255 N\nTRADESKILLS 255 255 255 N\nPET_INFO 128 128 255 N\nCOMBAT_MISC_INFO 128 128 255 N\nCOMBAT_XP_GAIN 111 111 255 N\nCOMBAT_HONOR_GAIN 224 202 10 N\nCOMBAT_FACTION_CHANGE 128 128 255 N\nBG_SYSTEM_NEUTRAL 255 120 10 N\nBG_SYSTEM_ALLIANCE 0 174 239 N\nBG_SYSTEM_HORDE 255 0 0 N\nRAID_LEADER 255 72 9 N\nRAID_WARNING 255 72 0 N\nRAID_BOSS_EMOTE 255 221 0 N\nRAID_BOSS_WHISPER 255 221 0 N\nFILTERED 255 0 0 N\nRESTRICTED 255 0 0 N\nBATTLENET 255 255 255 N\nACHIEVEMENT 255 255 0 N\nGUILD_ACHIEVEMENT 64 255 64 N\nARENA_POINTS 255 255 255 N\nPARTY_LEADER 118 200 255 N\nTARGETICONS 255 255 0 N\nBN_WHISPER 0 255 246 N\nBN_WHISPER_INFORM 0 255 246 N\nBN_CONVERSATION 0 177 240 N\nBN_CONVERSATION_NOTICE 0 177 240 N\nBN_CONVERSATION_LIST 0 177 240 N\nBN_INLINE_TOAST_ALERT 130 197 255 N\nBN_INLINE_TOAST_BROADCAST 130 197 255 N\nBN_INLINE_TOAST_BROADCAST_INFORM 130 197 255 N\nBN_INLINE_TOAST_CONVERSATION 130 197 255 N\nBN_WHISPER_PLAYER_OFFLINE 255 255 0 N\nCOMBAT_GUILD_XP_GAIN 111 111 255 N\nCURRENCY 0 170 0 N\nQUEST_BOSS_EMOTE 255 128 64 N\nPET_BATTLE_COMBAT_LOG 231 222 171 N\nPET_BATTLE_INFO 225 222 93 N\nINSTANCE_CHAT 255 127 0 N\nINSTANCE_CHAT_LEADER 255 72 9 N\nCHANNEL1 255 192 192 N\nCHANNEL2 255 192 192 N\nCHANNEL3 255 192 192 N\nCHANNEL4 255 192 192 N\nCHANNEL5 255 192 192 N\nCHANNEL6 255 192 192 N\nCHANNEL7 255 192 192 N\nCHANNEL8 255 192 192 N\nCHANNEL9 255 192 192 N\nCHANNEL10 255 192 192 N\nEND\n\nWINDOW 1\nNAME General\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 1\nSHOWN 1\nMESSAGES\nSYSTEM\nSYSTEM_NOMENU\nSAY\nEMOTE\nYELL\nWHISPER\nPARTY\nPARTY_LEADER\nRAID\nRAID_LEADER\nRAID_WARNING\nGUILD\nOFFICER\nMONSTER_SAY\nMONSTER_YELL\nMONSTER_EMOTE\nMONSTER_WHISPER\nMONSTER_BOSS_EMOTE\nMONSTER_BOSS_WHISPER\nERRORS\nAFK\nDND\nIGNORED\nBG_HORDE\nBG_ALLIANCE\nBG_NEUTRAL\nCOMBAT_FACTION_CHANGE\nSKILL\nLOOT\nMONEY\nCHANNEL\nACHIEVEMENT\nGUILD_ACHIEVEMENT\nBN_WHISPER\nBN_WHISPER_INFORM\nBN_CONVERSATION\nBN_INLINE_TOAST_ALERT\nCURRENCY\nBN_WHISPER_PLAYER_OFFLINE\nPET_BATTLE_INFO\nINSTANCE_CHAT\nINSTANCE_CHAT_LEADER\nEND\n\nCHANNELS\nSucheNachGruppe\nEND\n\nZONECHANNELS 35651587\n\nEND\n\nWINDOW 2\nNAME Combat Log\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 2\nSHOWN 0\nMESSAGES\nOPENING\nTRADESKILLS\nPET_INFO\nCOMBAT_XP_GAIN\nCOMBAT_HONOR_GAIN\nCOMBAT_MISC_INFO\nCOMBAT_GUILD_XP_GAIN\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 3\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 4\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 5\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 6\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 7\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 8\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 9\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 10\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\n'),
(2,1,1645014431,'SET autoQuestPopUps \"v\"\r\nSET trackedQuests \"v&AD\"\r\nSET trackedAchievements \"v\"\r\nSET cameraSavedDistance \"15.000000\"\r\nSET cameraSavedPitch \"21.249992\"\r\nSET minimapTrackedInfov2 \"229384\"\r\nSET minimapShapeshiftTracking \"v\"\r\nSET reputationsCollapsed \"v##$\"\r\nSET activeCUFProfile \"Primary\"\r\nSET EJLootClass \"2\"\r\n'),
(2,7,1645014432,'VERSION 5\n\nADDEDVERSION 19\n\nCHANNELS\nEND\n\nZONECHANNELS 35651587\n\nCOLORS\n\nSYSTEM 255 255 0 N\nSAY 255 255 255 N\nPARTY 170 170 255 N\nRAID 255 127 0 N\nGUILD 64 255 64 N\nOFFICER 64 192 64 N\nYELL 255 64 64 N\nWHISPER 255 128 255 N\nWHISPER_FOREIGN 255 128 255 N\nWHISPER_INFORM 255 128 255 N\nEMOTE 255 128 64 N\nTEXT_EMOTE 255 128 64 N\nMONSTER_SAY 255 255 159 N\nMONSTER_PARTY 170 170 255 N\nMONSTER_YELL 255 64 64 N\nMONSTER_WHISPER 255 181 235 N\nMONSTER_EMOTE 255 128 64 N\nCHANNEL 255 192 192 N\nCHANNEL_JOIN 192 128 128 N\nCHANNEL_LEAVE 192 128 128 N\nCHANNEL_LIST 192 128 128 N\nCHANNEL_NOTICE 192 192 192 N\nCHANNEL_NOTICE_USER 192 192 192 N\nAFK 255 128 255 N\nDND 255 128 255 N\nIGNORED 255 0 0 N\nSKILL 85 85 255 N\nLOOT 0 170 0 N\nMONEY 255 255 0 N\nOPENING 128 128 255 N\nTRADESKILLS 255 255 255 N\nPET_INFO 128 128 255 N\nCOMBAT_MISC_INFO 128 128 255 N\nCOMBAT_XP_GAIN 111 111 255 N\nCOMBAT_HONOR_GAIN 224 202 10 N\nCOMBAT_FACTION_CHANGE 128 128 255 N\nBG_SYSTEM_NEUTRAL 255 120 10 N\nBG_SYSTEM_ALLIANCE 0 174 239 N\nBG_SYSTEM_HORDE 255 0 0 N\nRAID_LEADER 255 72 9 N\nRAID_WARNING 255 72 0 N\nRAID_BOSS_EMOTE 255 221 0 N\nRAID_BOSS_WHISPER 255 221 0 N\nFILTERED 255 0 0 N\nRESTRICTED 255 0 0 N\nBATTLENET 255 255 255 N\nACHIEVEMENT 255 255 0 N\nGUILD_ACHIEVEMENT 64 255 64 N\nARENA_POINTS 255 255 255 N\nPARTY_LEADER 118 200 255 N\nTARGETICONS 255 255 0 N\nBN_WHISPER 0 255 246 N\nBN_WHISPER_INFORM 0 255 246 N\nBN_CONVERSATION 0 177 240 N\nBN_CONVERSATION_NOTICE 0 177 240 N\nBN_CONVERSATION_LIST 0 177 240 N\nBN_INLINE_TOAST_ALERT 130 197 255 N\nBN_INLINE_TOAST_BROADCAST 130 197 255 N\nBN_INLINE_TOAST_BROADCAST_INFORM 130 197 255 N\nBN_INLINE_TOAST_CONVERSATION 130 197 255 N\nBN_WHISPER_PLAYER_OFFLINE 255 255 0 N\nCOMBAT_GUILD_XP_GAIN 111 111 255 N\nCURRENCY 0 170 0 N\nQUEST_BOSS_EMOTE 255 128 64 N\nPET_BATTLE_COMBAT_LOG 231 222 171 N\nPET_BATTLE_INFO 225 222 93 N\nINSTANCE_CHAT 255 127 0 N\nINSTANCE_CHAT_LEADER 255 72 9 N\nCHANNEL1 255 192 192 N\nCHANNEL2 255 192 192 N\nCHANNEL3 255 192 192 N\nCHANNEL4 255 192 192 N\nCHANNEL5 255 192 192 N\nCHANNEL6 255 192 192 N\nCHANNEL7 255 192 192 N\nCHANNEL8 255 192 192 N\nCHANNEL9 255 192 192 N\nCHANNEL10 255 192 192 N\nEND\n\nWINDOW 1\nNAME General\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 1\nSHOWN 1\nMESSAGES\nSYSTEM\nSYSTEM_NOMENU\nSAY\nEMOTE\nYELL\nWHISPER\nPARTY\nPARTY_LEADER\nRAID\nRAID_LEADER\nRAID_WARNING\nGUILD\nOFFICER\nMONSTER_SAY\nMONSTER_YELL\nMONSTER_EMOTE\nMONSTER_WHISPER\nMONSTER_BOSS_EMOTE\nMONSTER_BOSS_WHISPER\nERRORS\nAFK\nDND\nIGNORED\nBG_HORDE\nBG_ALLIANCE\nBG_NEUTRAL\nCOMBAT_FACTION_CHANGE\nSKILL\nLOOT\nMONEY\nCHANNEL\nACHIEVEMENT\nGUILD_ACHIEVEMENT\nBN_WHISPER\nBN_WHISPER_INFORM\nBN_CONVERSATION\nBN_INLINE_TOAST_ALERT\nCURRENCY\nBN_WHISPER_PLAYER_OFFLINE\nPET_BATTLE_INFO\nINSTANCE_CHAT\nINSTANCE_CHAT_LEADER\nEND\n\nCHANNELS\nLookingForGroup\nEND\n\nZONECHANNELS 35651587\n\nEND\n\nWINDOW 2\nNAME Combat Log\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 2\nSHOWN 0\nMESSAGES\nOPENING\nTRADESKILLS\nPET_INFO\nCOMBAT_XP_GAIN\nCOMBAT_HONOR_GAIN\nCOMBAT_MISC_INFO\nCOMBAT_GUILD_XP_GAIN\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 3\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 4\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 5\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 6\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 7\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 8\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 9\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\nWINDOW 10\nSIZE 0\nCOLOR 0 0 0 40\nLOCKED 1\nUNINTERACTABLE 0\nDOCKED 0\nSHOWN 0\nMESSAGES\nEND\n\nCHANNELS\nEND\n\nZONECHANNELS 0\n\nEND\n\n');

UNLOCK TABLES;

/*Table structure for table `character_achievement` */

DROP TABLE IF EXISTS `character_achievement`;

CREATE TABLE `character_achievement` (
  `guid` int unsigned NOT NULL,
  `achievement` smallint unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`achievement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_achievement` */

LOCK TABLES `character_achievement` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_achievement_progress` */

DROP TABLE IF EXISTS `character_achievement_progress`;

CREATE TABLE `character_achievement_progress` (
  `guid` int unsigned NOT NULL,
  `criteria` smallint unsigned NOT NULL,
  `counter` bigint unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_achievement_progress` */

LOCK TABLES `character_achievement_progress` WRITE;

insert  into `character_achievement_progress`(`guid`,`criteria`,`counter`,`date`) values 
(1,167,1,1642601127),
(1,641,1,1642601127),
(1,655,1,1642601127),
(1,656,1,1642601127),
(1,657,1,1642601127),
(1,753,1,1642601127),
(1,2020,200,1642601127),
(1,3631,2,1642601163),
(1,4092,17,1642601163),
(1,4224,17,1642601163),
(1,4944,1,1642601192),
(1,4956,1,1642601192),
(1,5212,1,1642601127),
(1,5301,1,1642601127),
(1,5373,12,1642601190),
(1,5529,1,1642601192),
(1,19395,3000,1642601127),
(1,19661,1,1642601127),
(1,20735,2,1750063380),
(2,167,1,1645014430),
(2,641,1,1645014430),
(2,655,1,1645014430),
(2,656,1,1645014430),
(2,753,1,1645014430),
(2,754,1,1645014430),
(2,755,1,1645014430),
(2,834,1,1645014430),
(2,1146,1,1645014435),
(2,2020,200,1645014430),
(2,3631,1,1645014524),
(2,4092,50,1645014524),
(2,4093,3,1645014467),
(2,4224,53,1645014524),
(2,4944,8,1645014499),
(2,4946,8,1645014499),
(2,4948,7,1645014499),
(2,4953,1,1645014466),
(2,5212,2,1645014499),
(2,5215,2,1645014499),
(2,5233,2,1645014499),
(2,5301,8,1645014430),
(2,5328,3168,1645014524),
(2,5329,3168,1645014524),
(2,5330,3168,1645014524),
(2,5331,4275,1645014524),
(2,5332,3068,1645014524),
(2,5371,2,1645014459),
(2,5372,16,1645014494),
(2,5373,76,1645014461),
(2,5512,8,1645014499),
(2,5529,8,1645014499),
(2,16826,68,1645014524),
(2,19395,3000,1645014430),
(2,19481,3100,1645014430),
(2,20735,1,1645014430),
(2,22926,3000,1645014430);

UNLOCK TABLES;

/*Table structure for table `character_action` */

DROP TABLE IF EXISTS `character_action`;

CREATE TABLE `character_action` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `spec` tinyint unsigned NOT NULL DEFAULT '0',
  `button` tinyint unsigned NOT NULL DEFAULT '0',
  `action` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`,`button`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_action` */

LOCK TABLES `character_action` WRITE;

insert  into `character_action`(`guid`,`spec`,`button`,`action`,`type`) values 
(1,0,72,100780,0),
(1,0,81,107079,0),
(2,0,0,35395,0),
(2,0,9,59752,0);

UNLOCK TABLES;

/*Table structure for table `character_arena_stats` */

DROP TABLE IF EXISTS `character_arena_stats`;

CREATE TABLE `character_arena_stats` (
  `guid` int NOT NULL,
  `slot` tinyint NOT NULL,
  `matchMakerRating` smallint NOT NULL,
  PRIMARY KEY (`guid`,`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_arena_stats` */

LOCK TABLES `character_arena_stats` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_aura` */

DROP TABLE IF EXISTS `character_aura`;

CREATE TABLE `character_aura` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `slot` tinyint unsigned NOT NULL,
  `caster_guid` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier',
  `item_guid` bigint unsigned NOT NULL DEFAULT '0',
  `spell` mediumint unsigned NOT NULL DEFAULT '0',
  `effect_mask` int unsigned NOT NULL DEFAULT '0',
  `recalculate_mask` int unsigned DEFAULT '0',
  `stackcount` tinyint unsigned NOT NULL DEFAULT '1',
  `maxduration` int NOT NULL DEFAULT '0',
  `remaintime` int NOT NULL DEFAULT '0',
  `remaincharges` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`,`effect_mask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_aura` */

LOCK TABLES `character_aura` WRITE;

insert  into `character_aura`(`guid`,`slot`,`caster_guid`,`item_guid`,`spell`,`effect_mask`,`recalculate_mask`,`stackcount`,`maxduration`,`remaintime`,`remaincharges`) values 
(1,2,504403158265495553,0,59074,1,1,1,-1,-1,0),
(1,3,504403158265495553,0,59087,1,1,1,-1,-1,0),
(1,4,504403158265495553,0,100709,1,1,1,-1,-1,0),
(1,5,504403158265495553,0,108561,3,3,1,-1,-1,0),
(1,255,504403158265495553,0,300010,1,1,1,-1,-1,0);

UNLOCK TABLES;

/*Table structure for table `character_aura_effect` */

DROP TABLE IF EXISTS `character_aura_effect`;

CREATE TABLE `character_aura_effect` (
  `guid` int unsigned NOT NULL,
  `slot` tinyint unsigned NOT NULL,
  `effect` tinyint unsigned NOT NULL,
  `base_amount` int NOT NULL DEFAULT '0',
  `amount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`slot`,`effect`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_aura_effect` */

LOCK TABLES `character_aura_effect` WRITE;

insert  into `character_aura_effect`(`guid`,`slot`,`effect`,`base_amount`,`amount`) values 
(1,2,0,0,0),
(1,3,0,0,0),
(1,4,0,1000,1000),
(1,5,0,108557,108557),
(1,5,1,0,0),
(1,255,0,0,0);

UNLOCK TABLES;

/*Table structure for table `character_banned` */

DROP TABLE IF EXISTS `character_banned`;

CREATE TABLE `character_banned` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bandate` int unsigned NOT NULL DEFAULT '0',
  `unbandate` int unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Ban List';

/*Data for the table `character_banned` */

LOCK TABLES `character_banned` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_battleground_data` */

DROP TABLE IF EXISTS `character_battleground_data`;

CREATE TABLE `character_battleground_data` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `instanceId` int unsigned NOT NULL COMMENT 'Instance Identifier',
  `team` smallint unsigned NOT NULL,
  `joinX` float NOT NULL DEFAULT '0',
  `joinY` float NOT NULL DEFAULT '0',
  `joinZ` float NOT NULL DEFAULT '0',
  `joinO` float NOT NULL DEFAULT '0',
  `joinMapId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `taxiStart` int unsigned NOT NULL DEFAULT '0',
  `taxiEnd` int unsigned NOT NULL DEFAULT '0',
  `taxiPathPoint` smallint unsigned NOT NULL,
  `mountSpell` mediumint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_battleground_data` */

LOCK TABLES `character_battleground_data` WRITE;

insert  into `character_battleground_data`(`guid`,`instanceId`,`team`,`joinX`,`joinY`,`joinZ`,`joinO`,`joinMapId`,`taxiStart`,`taxiEnd`,`taxiPathPoint`,`mountSpell`) values 
(1,0,0,0,0,0,0,65535,0,0,0,0),
(2,0,0,0,0,0,0,65535,0,0,0,0);

UNLOCK TABLES;

/*Table structure for table `character_battleground_random` */

DROP TABLE IF EXISTS `character_battleground_random`;

CREATE TABLE `character_battleground_random` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_battleground_random` */

LOCK TABLES `character_battleground_random` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_battleground_stats` */

DROP TABLE IF EXISTS `character_battleground_stats`;

CREATE TABLE `character_battleground_stats` (
  `guid` int unsigned NOT NULL,
  `total_count` int unsigned NOT NULL DEFAULT '0',
  `total_wins` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_battleground_stats` */

LOCK TABLES `character_battleground_stats` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_battleground_weekend` */

DROP TABLE IF EXISTS `character_battleground_weekend`;

CREATE TABLE `character_battleground_weekend` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_battleground_weekend` */

LOCK TABLES `character_battleground_weekend` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_bonus_roll` */

DROP TABLE IF EXISTS `character_bonus_roll`;

CREATE TABLE `character_bonus_roll` (
  `guid` int unsigned NOT NULL,
  `bonus_chance` float DEFAULT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_bonus_roll` */

LOCK TABLES `character_bonus_roll` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_completed_challenges` */

DROP TABLE IF EXISTS `character_completed_challenges`;

CREATE TABLE `character_completed_challenges` (
  `guid` int unsigned NOT NULL,
  `map` int unsigned NOT NULL DEFAULT '0',
  `best_time` int unsigned NOT NULL DEFAULT '0',
  `last_time` int unsigned NOT NULL DEFAULT '0',
  `best_medal` tinyint unsigned NOT NULL DEFAULT '0',
  `best_medal_date` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`map`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_completed_challenges` */

LOCK TABLES `character_completed_challenges` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_cuf_profiles` */

DROP TABLE IF EXISTS `character_cuf_profiles`;

CREATE TABLE `character_cuf_profiles` (
  `guid` int unsigned NOT NULL COMMENT 'Character Guid',
  `id` tinyint unsigned NOT NULL COMMENT 'Profile Id (0-4)',
  `name` varchar(12) NOT NULL COMMENT 'Profile Name',
  `frameHeight` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Frame Height',
  `frameWidth` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Frame Width',
  `sortBy` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame Sort By',
  `healthText` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Frame Health Text',
  `boolOptions` int unsigned NOT NULL DEFAULT '0' COMMENT 'Many Configurable Bool Options',
  `unk146` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Unk Int8',
  `unk147` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Unk Int8',
  `unk148` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Unk Int8',
  `unk150` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Unk Int16',
  `unk152` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Unk Int16',
  `unk154` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Unk Int16',
  PRIMARY KEY (`guid`,`id`),
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_cuf_profiles` */

LOCK TABLES `character_cuf_profiles` WRITE;

insert  into `character_cuf_profiles`(`guid`,`id`,`name`,`frameHeight`,`frameWidth`,`sortBy`,`healthText`,`boolOptions`,`unk146`,`unk147`,`unk148`,`unk150`,`unk152`,`unk154`) values 
(1,0,'Primary',36,72,0,0,117441180,0,0,0,0,0,0),
(2,0,'Primary',36,72,0,0,117441180,0,0,0,0,0,0);

UNLOCK TABLES;

/*Table structure for table `character_currency` */

DROP TABLE IF EXISTS `character_currency`;

CREATE TABLE `character_currency` (
  `guid` int unsigned NOT NULL,
  `currency` smallint unsigned NOT NULL,
  `total_count` int unsigned NOT NULL,
  `week_count` int unsigned NOT NULL,
  `season_count` int unsigned NOT NULL,
  `flags` int unsigned NOT NULL,
  PRIMARY KEY (`guid`,`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_currency` */

LOCK TABLES `character_currency` WRITE;

insert  into `character_currency`(`guid`,`currency`,`total_count`,`week_count`,`season_count`,`flags`) values 
(1,390,0,0,0,30),
(1,392,0,0,0,30),
(1,395,0,0,0,30),
(2,390,0,0,0,30),
(2,392,0,0,0,30),
(2,395,0,0,95,30);

UNLOCK TABLES;

/*Table structure for table `character_declinedname` */

DROP TABLE IF EXISTS `character_declinedname`;

CREATE TABLE `character_declinedname` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `genitive` varchar(15) NOT NULL DEFAULT '',
  `dative` varchar(15) NOT NULL DEFAULT '',
  `accusative` varchar(15) NOT NULL DEFAULT '',
  `instrumental` varchar(15) NOT NULL DEFAULT '',
  `prepositional` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_declinedname` */

LOCK TABLES `character_declinedname` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_deserter` */

DROP TABLE IF EXISTS `character_deserter`;

CREATE TABLE `character_deserter` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `deserter_mod` tinyint unsigned NOT NULL DEFAULT '0',
  `last_deserter_time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_deserter` */

LOCK TABLES `character_deserter` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_equipmentsets` */

DROP TABLE IF EXISTS `character_equipmentsets`;

CREATE TABLE `character_equipmentsets` (
  `guid` int NOT NULL DEFAULT '0',
  `setguid` bigint NOT NULL AUTO_INCREMENT,
  `setindex` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(31) NOT NULL,
  `iconname` varchar(100) NOT NULL,
  `ignore_mask` int unsigned NOT NULL DEFAULT '0',
  `item0` int unsigned NOT NULL DEFAULT '0',
  `item1` int unsigned NOT NULL DEFAULT '0',
  `item2` int unsigned NOT NULL DEFAULT '0',
  `item3` int unsigned NOT NULL DEFAULT '0',
  `item4` int unsigned NOT NULL DEFAULT '0',
  `item5` int unsigned NOT NULL DEFAULT '0',
  `item6` int unsigned NOT NULL DEFAULT '0',
  `item7` int unsigned NOT NULL DEFAULT '0',
  `item8` int unsigned NOT NULL DEFAULT '0',
  `item9` int unsigned NOT NULL DEFAULT '0',
  `item10` int unsigned NOT NULL DEFAULT '0',
  `item11` int unsigned NOT NULL DEFAULT '0',
  `item12` int unsigned NOT NULL DEFAULT '0',
  `item13` int unsigned NOT NULL DEFAULT '0',
  `item14` int unsigned NOT NULL DEFAULT '0',
  `item15` int unsigned NOT NULL DEFAULT '0',
  `item16` int unsigned NOT NULL DEFAULT '0',
  `item17` int unsigned NOT NULL DEFAULT '0',
  `item18` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`setguid`),
  UNIQUE KEY `idx_set` (`guid`,`setguid`,`setindex`),
  KEY `Idx_setindex` (`setindex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_equipmentsets` */

LOCK TABLES `character_equipmentsets` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_gifts` */

DROP TABLE IF EXISTS `character_gifts`;

CREATE TABLE `character_gifts` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `item_guid` int unsigned NOT NULL DEFAULT '0',
  `entry` int unsigned NOT NULL DEFAULT '0',
  `flags` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_gifts` */

LOCK TABLES `character_gifts` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_glyphs` */

DROP TABLE IF EXISTS `character_glyphs`;

CREATE TABLE `character_glyphs` (
  `guid` int unsigned NOT NULL,
  `spec` tinyint unsigned NOT NULL DEFAULT '0',
  `glyph1` smallint unsigned DEFAULT '0',
  `glyph2` smallint unsigned DEFAULT '0',
  `glyph3` smallint unsigned DEFAULT '0',
  `glyph4` smallint unsigned DEFAULT '0',
  `glyph5` smallint unsigned DEFAULT '0',
  `glyph6` smallint unsigned DEFAULT '0',
  PRIMARY KEY (`guid`,`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_glyphs` */

LOCK TABLES `character_glyphs` WRITE;

insert  into `character_glyphs`(`guid`,`spec`,`glyph1`,`glyph2`,`glyph3`,`glyph4`,`glyph5`,`glyph6`) values 
(1,0,0,0,0,0,0,0),
(2,0,0,0,0,0,0,0);

UNLOCK TABLES;

/*Table structure for table `character_homebind` */

DROP TABLE IF EXISTS `character_homebind`;

CREATE TABLE `character_homebind` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `mapId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `zoneId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Zone Identifier',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_homebind` */

LOCK TABLES `character_homebind` WRITE;

insert  into `character_homebind`(`guid`,`mapId`,`zoneId`,`posX`,`posY`,`posZ`) values 
(1,860,5834,1470.97,3466.06,181.64),
(2,0,9,-8914.57,-133.909,80.5378);

UNLOCK TABLES;

/*Table structure for table `character_instance` */

DROP TABLE IF EXISTS `character_instance`;

CREATE TABLE `character_instance` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `instance` int unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_instance` */

LOCK TABLES `character_instance` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_inventory` */

DROP TABLE IF EXISTS `character_inventory`;

CREATE TABLE `character_inventory` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `bag` int unsigned NOT NULL DEFAULT '0',
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `item` int unsigned NOT NULL DEFAULT '0' COMMENT 'Item Global Unique Identifier',
  PRIMARY KEY (`item`),
  UNIQUE KEY `guid` (`guid`,`bag`,`slot`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_inventory` */

LOCK TABLES `character_inventory` WRITE;

insert  into `character_inventory`(`guid`,`bag`,`slot`,`item`) values 
(1,0,4,4),
(1,0,5,2),
(1,0,6,6),
(1,0,8,12),
(1,0,23,8),
(1,0,24,10),
(1,0,25,14),
(2,0,4,16),
(2,0,6,20),
(2,0,7,18),
(2,0,9,27),
(2,0,15,24),
(2,0,23,22),
(2,0,24,25),
(2,0,25,26);

UNLOCK TABLES;

/*Table structure for table `character_loot_lockout` */

DROP TABLE IF EXISTS `character_loot_lockout`;

CREATE TABLE `character_loot_lockout` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Character GUID',
  `entry` int unsigned NOT NULL DEFAULT '0' COMMENT 'Looted object entry',
  `difficulty` int unsigned NOT NULL DEFAULT '7',
  `type` int unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_loot_lockout` */

LOCK TABLES `character_loot_lockout` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_pet` */

DROP TABLE IF EXISTS `character_pet`;

CREATE TABLE `character_pet` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `entry` int unsigned NOT NULL DEFAULT '0',
  `owner` int unsigned NOT NULL DEFAULT '0',
  `modelid` int unsigned DEFAULT '0',
  `CreatedBySpell` mediumint unsigned NOT NULL DEFAULT '0',
  `PetType` tinyint unsigned NOT NULL DEFAULT '0',
  `level` smallint unsigned NOT NULL DEFAULT '1',
  `exp` int unsigned NOT NULL DEFAULT '0',
  `Reactstate` tinyint unsigned NOT NULL DEFAULT '0',
  `name` varchar(21) NOT NULL DEFAULT 'Pet',
  `renamed` tinyint unsigned NOT NULL DEFAULT '0',
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `curhealth` int unsigned NOT NULL DEFAULT '1',
  `curmana` int unsigned NOT NULL DEFAULT '0',
  `savetime` int unsigned NOT NULL DEFAULT '0',
  `abdata` text,
  `specialization` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `idx_slot` (`slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Pet System';

/*Data for the table `character_pet` */

LOCK TABLES `character_pet` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_pet_current` */

DROP TABLE IF EXISTS `character_pet_current`;

CREATE TABLE `character_pet_current` (
  `owner` int unsigned NOT NULL,
  `pet_id` int unsigned NOT NULL,
  PRIMARY KEY (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_pet_current` */

LOCK TABLES `character_pet_current` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_pet_declinedname` */

DROP TABLE IF EXISTS `character_pet_declinedname`;

CREATE TABLE `character_pet_declinedname` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `owner` int unsigned NOT NULL DEFAULT '0',
  `genitive` varchar(12) NOT NULL DEFAULT '',
  `dative` varchar(12) NOT NULL DEFAULT '',
  `accusative` varchar(12) NOT NULL DEFAULT '',
  `instrumental` varchar(12) NOT NULL DEFAULT '',
  `prepositional` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `owner_key` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_pet_declinedname` */

LOCK TABLES `character_pet_declinedname` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_queststatus` */

DROP TABLE IF EXISTS `character_queststatus`;

CREATE TABLE `character_queststatus` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `explored` tinyint unsigned NOT NULL DEFAULT '0',
  `timer` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_queststatus` */

LOCK TABLES `character_queststatus` WRITE;

insert  into `character_queststatus`(`guid`,`quest`,`status`,`explored`,`timer`) values 
(1,29406,3,0,1642601210),
(2,28770,3,0,1645014524);

UNLOCK TABLES;

/*Table structure for table `character_queststatus_daily` */

DROP TABLE IF EXISTS `character_queststatus_daily`;

CREATE TABLE `character_queststatus_daily` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_queststatus_daily` */

LOCK TABLES `character_queststatus_daily` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_queststatus_monthly` */

DROP TABLE IF EXISTS `character_queststatus_monthly`;

CREATE TABLE `character_queststatus_monthly` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_queststatus_monthly` */

LOCK TABLES `character_queststatus_monthly` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_queststatus_objective` */

DROP TABLE IF EXISTS `character_queststatus_objective`;

CREATE TABLE `character_queststatus_objective` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `objectiveId` int unsigned NOT NULL DEFAULT '0',
  `amount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`objectiveId`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_queststatus_objective` */

LOCK TABLES `character_queststatus_objective` WRITE;

insert  into `character_queststatus_objective`(`guid`,`objectiveId`,`amount`) values 
(1,252339,1),
(2,254546,0);

UNLOCK TABLES;

/*Table structure for table `character_queststatus_rewarded` */

DROP TABLE IF EXISTS `character_queststatus_rewarded`;

CREATE TABLE `character_queststatus_rewarded` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_queststatus_rewarded` */

LOCK TABLES `character_queststatus_rewarded` WRITE;

insert  into `character_queststatus_rewarded`(`guid`,`quest`,`active`) values 
(1,30027,1),
(1,30039,1),
(2,28762,1);

UNLOCK TABLES;

/*Table structure for table `character_queststatus_seasonal` */

DROP TABLE IF EXISTS `character_queststatus_seasonal`;

CREATE TABLE `character_queststatus_seasonal` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  `event` int unsigned NOT NULL DEFAULT '0' COMMENT 'Event Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_queststatus_seasonal` */

LOCK TABLES `character_queststatus_seasonal` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_queststatus_weekly` */

DROP TABLE IF EXISTS `character_queststatus_weekly`;

CREATE TABLE `character_queststatus_weekly` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `quest` int unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`guid`,`quest`),
  KEY `idx_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_queststatus_weekly` */

LOCK TABLES `character_queststatus_weekly` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_reputation` */

DROP TABLE IF EXISTS `character_reputation`;

CREATE TABLE `character_reputation` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `faction` smallint unsigned NOT NULL DEFAULT '0',
  `standing` float NOT NULL DEFAULT '0',
  `flags` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`faction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_reputation` */

LOCK TABLES `character_reputation` WRITE;

insert  into `character_reputation`(`guid`,`faction`,`standing`,`flags`) values 
(1,21,0,64),
(1,46,0,4),
(1,47,0,0),
(1,54,0,0),
(1,59,0,16),
(1,67,0,0),
(1,68,0,0),
(1,69,0,0),
(1,70,0,2),
(1,72,0,0),
(1,76,0,0),
(1,81,0,0),
(1,83,0,0),
(1,86,0,0),
(1,87,0,2),
(1,92,0,2),
(1,93,0,2),
(1,169,0,12),
(1,270,0,16),
(1,289,0,4),
(1,349,0,0),
(1,369,0,64),
(1,469,0,0),
(1,470,0,64),
(1,471,0,0),
(1,509,0,0),
(1,510,0,0),
(1,529,0,0),
(1,530,0,0),
(1,549,0,0),
(1,550,0,0),
(1,551,0,0),
(1,569,0,0),
(1,570,0,0),
(1,571,0,0),
(1,574,0,4),
(1,576,0,0),
(1,577,0,64),
(1,589,0,0),
(1,609,0,0),
(1,729,0,0),
(1,730,0,0),
(1,749,0,0),
(1,809,0,16),
(1,889,0,0),
(1,890,0,0),
(1,891,0,0),
(1,892,0,0),
(1,909,0,16),
(1,910,0,2),
(1,911,0,0),
(1,922,0,0),
(1,930,0,0),
(1,932,0,80),
(1,933,0,16),
(1,934,0,80),
(1,935,0,16),
(1,936,0,28),
(1,941,0,0),
(1,942,0,16),
(1,946,0,0),
(1,947,0,0),
(1,948,0,8),
(1,949,0,24),
(1,952,0,0),
(1,953,0,4),
(1,967,0,16),
(1,970,0,0),
(1,978,0,0),
(1,980,0,24),
(1,989,0,16),
(1,990,0,16),
(1,1005,0,0),
(1,1011,0,0),
(1,1012,0,16),
(1,1015,0,0),
(1,1031,0,0),
(1,1037,0,0),
(1,1038,0,16),
(1,1050,0,0),
(1,1052,0,0),
(1,1064,0,0),
(1,1067,0,0),
(1,1068,0,0),
(1,1073,0,16),
(1,1077,0,16),
(1,1082,0,0),
(1,1085,0,0),
(1,1090,0,16),
(1,1091,0,0),
(1,1094,0,0),
(1,1097,0,12),
(1,1098,0,16),
(1,1104,0,16),
(1,1105,0,16),
(1,1106,0,16),
(1,1117,0,12),
(1,1118,0,12),
(1,1119,0,2),
(1,1124,0,0),
(1,1126,0,0),
(1,1133,0,0),
(1,1134,0,0),
(1,1135,0,16),
(1,1136,0,4),
(1,1137,0,0),
(1,1138,0,0),
(1,1154,0,4),
(1,1155,0,4),
(1,1156,0,16),
(1,1158,0,16),
(1,1162,0,8),
(1,1163,0,0),
(1,1168,0,0),
(1,1169,0,0),
(1,1171,0,0),
(1,1172,0,0),
(1,1173,0,0),
(1,1174,0,0),
(1,1177,0,0),
(1,1178,0,0),
(1,1204,0,16),
(1,1216,260,81),
(1,1228,0,0),
(1,1242,0,0),
(1,1245,0,8),
(1,1269,0,16),
(1,1270,0,0),
(1,1271,0,16),
(1,1272,0,0),
(1,1273,0,16),
(1,1275,0,16),
(1,1276,0,16),
(1,1277,0,16),
(1,1278,0,16),
(1,1279,0,16),
(1,1280,0,16),
(1,1281,0,16),
(1,1282,0,16),
(1,1283,0,16),
(1,1302,0,0),
(1,1337,0,16),
(1,1341,0,16),
(1,1345,0,16),
(1,1351,0,0),
(1,1352,0,0),
(1,1353,0,0),
(1,1357,0,4),
(1,1358,0,16),
(1,1359,0,0),
(1,1374,0,0),
(1,1375,0,0),
(1,1376,0,0),
(1,1387,0,0),
(1,1388,0,0),
(1,1416,0,0),
(1,1419,0,0),
(1,1433,0,20),
(1,1435,0,16),
(1,1440,0,16),
(1,1492,0,16),
(2,21,0,64),
(2,46,0,4),
(2,47,68.75,17),
(2,54,68.75,17),
(2,59,0,16),
(2,67,0,14),
(2,68,0,6),
(2,69,68.75,17),
(2,70,0,2),
(2,72,275,17),
(2,76,0,6),
(2,81,0,6),
(2,83,0,4),
(2,86,0,4),
(2,87,0,2),
(2,92,0,2),
(2,93,0,2),
(2,169,0,12),
(2,270,0,16),
(2,289,0,4),
(2,349,0,0),
(2,369,0,64),
(2,469,0,25),
(2,470,0,64),
(2,471,0,20),
(2,509,0,16),
(2,510,0,2),
(2,529,0,0),
(2,530,0,6),
(2,549,0,4),
(2,550,0,4),
(2,551,0,4),
(2,569,0,4),
(2,570,0,4),
(2,571,0,4),
(2,574,0,4),
(2,576,0,0),
(2,577,0,64),
(2,589,0,0),
(2,609,0,0),
(2,729,0,6),
(2,730,0,16),
(2,749,0,0),
(2,809,0,16),
(2,889,0,6),
(2,890,0,16),
(2,891,0,24),
(2,892,0,14),
(2,909,0,16),
(2,910,0,0),
(2,911,0,6),
(2,922,0,6),
(2,930,68.75,17),
(2,932,0,80),
(2,933,0,16),
(2,934,0,80),
(2,935,0,16),
(2,936,0,28),
(2,941,0,6),
(2,942,0,16),
(2,946,0,16),
(2,947,0,0),
(2,948,0,8),
(2,949,0,24),
(2,952,0,0),
(2,953,0,4),
(2,967,0,16),
(2,970,0,0),
(2,978,0,16),
(2,980,0,24),
(2,989,0,16),
(2,990,0,16),
(2,1005,0,20),
(2,1011,0,16),
(2,1012,0,16),
(2,1015,0,2),
(2,1031,0,16),
(2,1037,0,136),
(2,1038,0,16),
(2,1050,0,16),
(2,1052,0,0),
(2,1064,0,6),
(2,1067,0,0),
(2,1068,0,16),
(2,1073,0,16),
(2,1077,0,16),
(2,1082,0,4),
(2,1085,0,6),
(2,1090,0,16),
(2,1091,0,16),
(2,1094,0,16),
(2,1097,0,12),
(2,1098,0,16),
(2,1104,0,16),
(2,1105,0,16),
(2,1106,0,16),
(2,1117,0,12),
(2,1118,0,12),
(2,1119,0,0),
(2,1124,0,6),
(2,1126,0,16),
(2,1133,0,6),
(2,1134,68.75,17),
(2,1135,0,16),
(2,1136,0,4),
(2,1137,0,4),
(2,1138,0,0),
(2,1154,0,4),
(2,1155,0,4),
(2,1156,0,16),
(2,1158,0,16),
(2,1162,0,8),
(2,1163,0,0),
(2,1168,0,16),
(2,1169,0,28),
(2,1171,0,64),
(2,1172,0,0),
(2,1173,0,16),
(2,1174,0,16),
(2,1177,0,0),
(2,1178,0,6),
(2,1204,0,16),
(2,1216,0,0),
(2,1228,0,2),
(2,1242,0,16),
(2,1245,0,8),
(2,1269,0,16),
(2,1270,0,16),
(2,1271,0,16),
(2,1272,0,152),
(2,1273,0,16),
(2,1275,0,16),
(2,1276,0,16),
(2,1277,0,16),
(2,1278,0,16),
(2,1279,0,16),
(2,1280,0,16),
(2,1281,0,16),
(2,1282,0,16),
(2,1283,0,16),
(2,1302,0,152),
(2,1337,0,16),
(2,1341,0,16),
(2,1345,0,16),
(2,1351,0,0),
(2,1352,0,6),
(2,1353,0,17),
(2,1357,0,4),
(2,1358,0,16),
(2,1359,0,16),
(2,1374,0,0),
(2,1375,0,2),
(2,1376,0,144),
(2,1387,0,144),
(2,1388,0,2),
(2,1416,0,0),
(2,1419,0,16),
(2,1433,0,20),
(2,1435,0,16),
(2,1440,0,16),
(2,1492,0,16);

UNLOCK TABLES;

/*Table structure for table `character_research_digsites` */

DROP TABLE IF EXISTS `character_research_digsites`;

CREATE TABLE `character_research_digsites` (
  `guid` int NOT NULL COMMENT 'Global Unique Identifier',
  `digsiteId` int NOT NULL,
  `currentFindGUID` int NOT NULL DEFAULT '0',
  `remainingFindCount` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`digsiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `character_research_digsites` */

LOCK TABLES `character_research_digsites` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_research_history` */

DROP TABLE IF EXISTS `character_research_history`;

CREATE TABLE `character_research_history` (
  `guid` int NOT NULL COMMENT 'Global Unique Identifier',
  `projectId` int NOT NULL,
  `researchCount` int NOT NULL,
  `firstResearchTimestamp` int NOT NULL,
  PRIMARY KEY (`guid`,`projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `character_research_history` */

LOCK TABLES `character_research_history` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_research_projects` */

DROP TABLE IF EXISTS `character_research_projects`;

CREATE TABLE `character_research_projects` (
  `guid` int NOT NULL COMMENT 'Global Unique Identifier',
  `projectId` int NOT NULL,
  PRIMARY KEY (`guid`,`projectId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `character_research_projects` */

LOCK TABLES `character_research_projects` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_service` */

DROP TABLE IF EXISTS `character_service`;

CREATE TABLE `character_service` (
  `id` int unsigned NOT NULL,
  `guid` int unsigned NOT NULL DEFAULT '0',
  `service` int unsigned NOT NULL DEFAULT '0',
  `data1` int unsigned NOT NULL DEFAULT '0',
  `data2` int unsigned NOT NULL DEFAULT '0',
  `data3` int unsigned NOT NULL DEFAULT '0',
  `data4` text,
  `creation_date` int unsigned NOT NULL,
  `execution_date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_service` */

LOCK TABLES `character_service` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_skills` */

DROP TABLE IF EXISTS `character_skills`;

CREATE TABLE `character_skills` (
  `guid` int unsigned NOT NULL COMMENT 'Global Unique Identifier',
  `skill` smallint unsigned NOT NULL,
  `value` smallint unsigned NOT NULL,
  `max` smallint unsigned NOT NULL,
  PRIMARY KEY (`guid`,`skill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_skills` */

LOCK TABLES `character_skills` WRITE;

insert  into `character_skills`(`guid`,`skill`,`value`,`max`) values 
(1,43,1,5),
(1,44,1,5),
(1,54,1,5),
(1,95,1,5),
(1,136,1,5),
(1,162,1,5),
(1,183,1,1),
(1,229,1,5),
(1,414,1,1),
(1,415,1,1),
(1,473,1,5),
(1,777,1,1),
(1,810,1,1),
(1,829,1,1),
(1,899,1,1),
(1,905,300,300),
(1,934,1,1),
(2,43,1,5),
(2,44,1,5),
(2,54,1,5),
(2,55,1,5),
(2,95,1,5),
(2,98,300,300),
(2,160,1,5),
(2,162,1,5),
(2,172,1,5),
(2,183,1,1),
(2,229,1,5),
(2,413,1,1),
(2,414,1,1),
(2,415,1,1),
(2,433,1,1),
(2,754,1,1),
(2,777,1,1),
(2,800,1,1),
(2,810,1,1),
(2,934,1,1);

UNLOCK TABLES;

/*Table structure for table `character_social` */

DROP TABLE IF EXISTS `character_social`;

CREATE TABLE `character_social` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `friend` int unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Global Unique Identifier',
  `flags` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Friend Flags',
  `note` varchar(48) NOT NULL DEFAULT '' COMMENT 'Friend Note',
  PRIMARY KEY (`guid`,`friend`,`flags`),
  KEY `friend` (`friend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_social` */

LOCK TABLES `character_social` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_spell` */

DROP TABLE IF EXISTS `character_spell`;

CREATE TABLE `character_spell` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `character_spell` */

LOCK TABLES `character_spell` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_spell_charges` */

DROP TABLE IF EXISTS `character_spell_charges`;

CREATE TABLE `character_spell_charges` (
  `guid` int unsigned NOT NULL,
  `category` int unsigned NOT NULL,
  `reset_time` bigint unsigned NOT NULL,
  `used_charges` int unsigned NOT NULL,
  PRIMARY KEY (`guid`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_spell_charges` */

LOCK TABLES `character_spell_charges` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_spell_cooldown` */

DROP TABLE IF EXISTS `character_spell_cooldown`;

CREATE TABLE `character_spell_cooldown` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `item` int unsigned NOT NULL DEFAULT '0' COMMENT 'Item Identifier',
  `time` bigint unsigned NOT NULL DEFAULT '0',
  `category_end` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_spell_cooldown` */

LOCK TABLES `character_spell_cooldown` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_stats` */

DROP TABLE IF EXISTS `character_stats`;

CREATE TABLE `character_stats` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `maxhealth` int unsigned NOT NULL DEFAULT '0',
  `maxpower1` int unsigned NOT NULL DEFAULT '0',
  `maxpower2` int unsigned NOT NULL DEFAULT '0',
  `maxpower3` int unsigned NOT NULL DEFAULT '0',
  `maxpower4` int unsigned NOT NULL DEFAULT '0',
  `maxpower5` int unsigned NOT NULL DEFAULT '0',
  `strength` int unsigned NOT NULL DEFAULT '0',
  `agility` int unsigned NOT NULL DEFAULT '0',
  `stamina` int unsigned NOT NULL DEFAULT '0',
  `intellect` int unsigned NOT NULL DEFAULT '0',
  `spirit` int unsigned NOT NULL DEFAULT '0',
  `armor` int unsigned NOT NULL DEFAULT '0',
  `resHoly` int unsigned NOT NULL DEFAULT '0',
  `resFire` int unsigned NOT NULL DEFAULT '0',
  `resNature` int unsigned NOT NULL DEFAULT '0',
  `resFrost` int unsigned NOT NULL DEFAULT '0',
  `resShadow` int unsigned NOT NULL DEFAULT '0',
  `resArcane` int unsigned NOT NULL DEFAULT '0',
  `blockPct` float unsigned NOT NULL DEFAULT '0',
  `dodgePct` float unsigned NOT NULL DEFAULT '0',
  `parryPct` float unsigned NOT NULL DEFAULT '0',
  `critPct` float unsigned NOT NULL DEFAULT '0',
  `rangedCritPct` float unsigned NOT NULL DEFAULT '0',
  `spellCritPct` float unsigned NOT NULL DEFAULT '0',
  `attackPower` int unsigned NOT NULL DEFAULT '0',
  `rangedAttackPower` int unsigned NOT NULL DEFAULT '0',
  `spellPower` int unsigned NOT NULL DEFAULT '0',
  `resilience` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_stats` */

LOCK TABLES `character_stats` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_talent` */

DROP TABLE IF EXISTS `character_talent`;

CREATE TABLE `character_talent` (
  `guid` int unsigned NOT NULL,
  `spell` mediumint unsigned NOT NULL,
  `spec` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`,`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_talent` */

LOCK TABLES `character_talent` WRITE;

UNLOCK TABLES;

/*Table structure for table `character_void_storage` */

DROP TABLE IF EXISTS `character_void_storage`;

CREATE TABLE `character_void_storage` (
  `itemId` bigint unsigned NOT NULL,
  `playerGuid` int unsigned NOT NULL,
  `itemEntry` mediumint unsigned NOT NULL,
  `slot` tinyint unsigned NOT NULL,
  `creatorGuid` int unsigned NOT NULL DEFAULT '0',
  `randomProperty` int unsigned NOT NULL DEFAULT '0',
  `suffixFactor` int unsigned NOT NULL DEFAULT '0',
  `upgradeId` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemId`),
  UNIQUE KEY `idx_player_slot` (`playerGuid`,`slot`),
  KEY `idx_player` (`playerGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `character_void_storage` */

LOCK TABLES `character_void_storage` WRITE;

UNLOCK TABLES;

/*Table structure for table `characters` */

DROP TABLE IF EXISTS `characters`;

CREATE TABLE `characters` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `account` int unsigned NOT NULL DEFAULT '0' COMMENT 'Account Identifier',
  `name` varchar(12) DEFAULT NULL,
  `slot` tinyint unsigned NOT NULL DEFAULT '0',
  `race` tinyint unsigned NOT NULL DEFAULT '0',
  `class` tinyint unsigned NOT NULL DEFAULT '0',
  `gender` tinyint unsigned NOT NULL DEFAULT '0',
  `level` tinyint unsigned NOT NULL DEFAULT '0',
  `xp` int unsigned NOT NULL DEFAULT '0',
  `money` bigint unsigned NOT NULL DEFAULT '0',
  `playerBytes` int unsigned NOT NULL DEFAULT '0',
  `playerBytes2` int unsigned NOT NULL DEFAULT '0',
  `playerFlags` int unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `instance_id` int unsigned NOT NULL DEFAULT '0',
  `instance_mode_mask` tinyint unsigned NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `taximask` text NOT NULL,
  `online` tinyint unsigned NOT NULL DEFAULT '0',
  `cinematic` tinyint unsigned NOT NULL DEFAULT '0',
  `totaltime` int unsigned NOT NULL DEFAULT '0',
  `leveltime` int unsigned NOT NULL DEFAULT '0',
  `logout_time` int unsigned NOT NULL DEFAULT '0',
  `is_logout_resting` tinyint unsigned NOT NULL DEFAULT '0',
  `rest_bonus` float NOT NULL DEFAULT '0',
  `resettalents_cost` int unsigned NOT NULL DEFAULT '0',
  `resettalents_time` int unsigned NOT NULL DEFAULT '0',
  `talentTree` varchar(10) NOT NULL DEFAULT '0 0',
  `trans_x` float NOT NULL DEFAULT '0',
  `trans_y` float NOT NULL DEFAULT '0',
  `trans_z` float NOT NULL DEFAULT '0',
  `trans_o` float NOT NULL DEFAULT '0',
  `transguid` mediumint unsigned NOT NULL DEFAULT '0',
  `extra_flags` smallint unsigned NOT NULL DEFAULT '0',
  `stable_slots` tinyint unsigned NOT NULL DEFAULT '0',
  `at_login` smallint unsigned NOT NULL DEFAULT '0',
  `zone` smallint unsigned NOT NULL DEFAULT '0',
  `death_expire_time` int unsigned NOT NULL DEFAULT '0',
  `taxi_path` text,
  `totalKills` int unsigned NOT NULL DEFAULT '0',
  `todayKills` smallint unsigned NOT NULL DEFAULT '0',
  `yesterdayKills` smallint unsigned NOT NULL DEFAULT '0',
  `chosenTitle` int unsigned NOT NULL DEFAULT '0',
  `watchedFaction` int unsigned NOT NULL DEFAULT '0',
  `drunk` tinyint unsigned NOT NULL DEFAULT '0',
  `health` int unsigned NOT NULL DEFAULT '0',
  `power1` int unsigned NOT NULL DEFAULT '0',
  `power2` int unsigned NOT NULL DEFAULT '0',
  `power3` int unsigned NOT NULL DEFAULT '0',
  `power4` int unsigned NOT NULL DEFAULT '0',
  `power5` int unsigned NOT NULL DEFAULT '0',
  `latency` mediumint unsigned NOT NULL DEFAULT '0',
  `speccount` tinyint unsigned NOT NULL DEFAULT '1',
  `activespec` tinyint unsigned NOT NULL DEFAULT '0',
  `exploredZones` longtext,
  `equipmentCache` longtext,
  `knownTitles` longtext,
  `actionBars` tinyint unsigned NOT NULL DEFAULT '0',
  `grantableLevels` tinyint unsigned NOT NULL DEFAULT '0',
  `deleteInfos_Account` int unsigned DEFAULT NULL,
  `deleteInfos_Name` varchar(12) DEFAULT NULL,
  `deleteDate` int unsigned DEFAULT NULL,
  `lootspec` int unsigned NOT NULL DEFAULT '0',
  `project_transfer` int unsigned DEFAULT NULL,
  `project_original_cloned` int unsigned DEFAULT NULL,
  `project_original_migrated` int unsigned DEFAULT NULL,
  `project_original_realm_id` int unsigned DEFAULT NULL,
  `project_original_guid` int unsigned DEFAULT NULL,
  `project_clone_created` int unsigned DEFAULT NULL,
  `project_clone_realm_id` int unsigned DEFAULT NULL,
  `project_clone_guid` int unsigned DEFAULT NULL,
  `project_migrant_created` int unsigned DEFAULT NULL,
  `project_migrant_realm_id` int unsigned DEFAULT NULL,
  `project_migrant_guid` int unsigned DEFAULT NULL,
  `last_login` int unsigned NOT NULL DEFAULT '0',
  `taxi_path_point` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_account` (`account`),
  KEY `idx_online` (`online`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `characters` */

LOCK TABLES `characters` WRITE;

insert  into `characters`(`guid`,`account`,`name`,`slot`,`race`,`class`,`gender`,`level`,`xp`,`money`,`playerBytes`,`playerBytes2`,`playerFlags`,`position_x`,`position_y`,`position_z`,`map`,`instance_id`,`instance_mode_mask`,`orientation`,`taximask`,`online`,`cinematic`,`totaltime`,`leveltime`,`logout_time`,`is_logout_resting`,`rest_bonus`,`resettalents_cost`,`resettalents_time`,`talentTree`,`trans_x`,`trans_y`,`trans_z`,`trans_o`,`transguid`,`extra_flags`,`stable_slots`,`at_login`,`zone`,`death_expire_time`,`taxi_path`,`totalKills`,`todayKills`,`yesterdayKills`,`chosenTitle`,`watchedFaction`,`drunk`,`health`,`power1`,`power2`,`power3`,`power4`,`power5`,`latency`,`speccount`,`activespec`,`exploredZones`,`equipmentCache`,`knownTitles`,`actionBars`,`grantableLevels`,`deleteInfos_Account`,`deleteInfos_Name`,`deleteDate`,`lootspec`,`project_transfer`,`project_original_cloned`,`project_original_migrated`,`project_original_realm_id`,`project_original_guid`,`project_clone_created`,`project_clone_realm_id`,`project_clone_guid`,`project_migrant_created`,`project_migrant_realm_id`,`project_migrant_guid`,`last_login`,`taxi_path_point`) values 
(1,2,'Zgn',0,24,10,0,1,90,17,34080258,16777220,0,1431.18,3462.67,171.162,860,0,49,1.98261,'34 0 0 2 0 0 1 0 0 0 0 32 8 0 0 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 128 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32 16 0 0 0 140 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,1,93,93,1750063389,0,300,0,0,'0 0 ',0,0,0,0,0,0,0,0,5736,0,'',0,0,0,0,4294967295,0,133,50,100,0,0,3,0,1,0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1024 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','0 0 0 0 0 0 0 0 72019 0 77509 0 72020 0 0 0 77526 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','0 0 0 0 0 0 0 0 ',0,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1750063380,0),
(2,6,'Barcuk',0,1,2,0,2,506,53,67832580,33554435,0,-8926.82,-117.443,82.3079,0,0,49,2.8926,'34 0 0 2 0 0 1 0 0 0 0 32 8 0 0 128 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 128 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 32 16 0 0 0 140 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,1,122,53,1645014552,0,0.00155,0,0,'0 0 ',0,0,0,0,0,4,0,0,6170,0,'',0,0,0,0,4294967295,0,164,40,0,0,0,0,0,1,0,'0 0 0 536870912 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','0 0 0 0 0 0 0 0 58233 0 0 0 44 0 43 0 0 0 57255 0 0 0 0 0 0 0 0 0 0 0 52557 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ','0 0 0 0 0 0 0 0 ',0,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1645014430,0);

UNLOCK TABLES;

/*Table structure for table `corpse` */

DROP TABLE IF EXISTS `corpse`;

CREATE TABLE `corpse` (
  `corpseGuid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `phaseMask` int unsigned NOT NULL DEFAULT '1',
  `displayId` int unsigned NOT NULL DEFAULT '0',
  `itemCache` text NOT NULL,
  `bytes1` int unsigned NOT NULL DEFAULT '0',
  `bytes2` int unsigned NOT NULL DEFAULT '0',
  `flags` tinyint unsigned NOT NULL DEFAULT '0',
  `dynFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `time` int unsigned NOT NULL DEFAULT '0',
  `corpseType` tinyint unsigned NOT NULL DEFAULT '0',
  `instanceId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier',
  PRIMARY KEY (`corpseGuid`),
  KEY `idx_type` (`corpseType`),
  KEY `idx_instance` (`instanceId`),
  KEY `idx_player` (`guid`),
  KEY `idx_time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Death System';

/*Data for the table `corpse` */

LOCK TABLES `corpse` WRITE;

UNLOCK TABLES;

/*Table structure for table `creature_respawn` */

DROP TABLE IF EXISTS `creature_respawn`;

CREATE TABLE `creature_respawn` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawnTime` int unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `instanceId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`,`instanceId`),
  KEY `idx_instance` (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Grid Loading System';

/*Data for the table `creature_respawn` */

LOCK TABLES `creature_respawn` WRITE;

insert  into `creature_respawn`(`guid`,`respawnTime`,`mapId`,`instanceId`) values 
(5794,1645014855,0,0),
(62769,1638047951,530,0),
(62774,1638047951,530,0),
(62775,1638047951,530,0),
(62780,1638047951,530,0),
(62781,1638047951,530,0),
(64585,1638047951,530,0),
(64616,1638047951,530,0),
(64617,1638047951,530,0),
(64653,1638047951,530,0),
(64654,1638047951,530,0),
(64661,1638047951,530,0),
(64662,1638047951,530,0),
(64664,1638047951,530,0),
(64665,1638047951,530,0),
(64669,1638047951,530,0),
(64670,1638047951,530,0),
(64671,1638047951,530,0),
(64673,1638047951,530,0),
(64675,1638047951,530,0),
(64676,1638047951,530,0),
(64677,1638047951,530,0),
(64678,1638047951,530,0),
(64679,1638047951,530,0),
(64680,1638047951,530,0),
(64682,1638047951,530,0),
(64685,1638047951,530,0),
(64688,1638047951,530,0),
(64689,1638047951,530,0),
(64697,1638047951,530,0),
(64699,1638047951,530,0),
(64700,1638047951,530,0),
(64702,1638047951,530,0),
(64705,1638047951,530,0),
(64707,1638047951,530,0),
(65690,1638047951,530,0),
(65691,1638047951,530,0),
(65699,1638047951,530,0),
(65704,1638047951,530,0),
(67068,1638104630,530,0),
(69027,1638104630,530,0),
(69132,1638048108,530,0),
(69135,1638048108,530,0),
(72412,1638047951,530,0),
(74534,1638048108,530,0),
(74553,1638104630,530,0),
(75751,1638048239,571,0),
(75753,1638048071,571,0),
(75754,1638048071,571,0),
(75757,1638048071,571,0),
(75758,1638048071,571,0),
(75759,1638048071,571,0),
(75760,1638048071,571,0),
(75761,1638048071,571,0),
(75762,1638048239,571,0),
(75810,1642600689,571,0),
(75811,1642600689,571,0),
(75812,1642600689,571,0),
(75955,1642600689,571,0),
(76039,1642600689,571,0),
(76653,1642600689,571,0),
(76654,1642600689,571,0),
(76655,1642600689,571,0),
(97823,1638388393,571,0),
(97824,1638388393,571,0),
(97825,1638388393,571,0),
(97826,1638388393,571,0),
(97827,1638388393,571,0),
(97828,1638388393,571,0),
(97829,1638388393,571,0),
(97830,1638388393,571,0),
(97831,1638388393,571,0),
(97832,1638388393,571,0),
(97833,1638388393,571,0),
(97834,1638388393,571,0),
(97835,1638388393,571,0),
(97836,1638388393,571,0),
(101206,1638048071,571,0),
(101208,1638388107,571,0),
(101209,1642600689,571,0),
(101210,1638388107,571,0),
(101213,1638388109,571,0),
(101214,1642600705,571,0),
(101218,1642600705,571,0),
(101219,1638388109,571,0),
(101222,1638388109,571,0),
(101223,1642600705,571,0),
(101224,1638048071,571,0),
(101231,1642600705,571,0),
(101233,1642600705,571,0),
(101239,1642600705,571,0),
(101242,1638388107,571,0),
(101245,1638388107,571,0),
(101248,1642600705,571,0),
(101249,1638048071,571,0),
(101250,1638048071,571,0),
(101252,1638388107,571,0),
(101253,1638388107,571,0),
(101254,1638388107,571,0),
(101255,1638388107,571,0),
(101263,1638388107,571,0),
(101264,1638388109,571,0),
(101267,1638388109,571,0),
(101268,1642600705,571,0),
(101269,1638388107,571,0),
(101270,1638388107,571,0),
(101271,1638388107,571,0),
(101272,1638388107,571,0),
(101273,1638388107,571,0),
(101274,1638388107,571,0),
(101275,1638388107,571,0),
(101276,1638388107,571,0),
(101277,1638388107,571,0),
(101416,1638104750,530,0),
(101417,1638104750,530,0),
(101433,1638104750,530,0),
(103573,1638048071,571,0),
(103586,1638388064,571,0),
(103588,1638048071,571,0),
(103589,1638048224,571,0),
(103590,1638048071,571,0),
(103593,1638388064,571,0),
(103599,1638388082,571,0),
(103601,1638048224,571,0),
(103603,1638388064,571,0),
(103604,1638388064,571,0),
(103605,1638048071,571,0),
(103610,1638388064,571,0),
(103614,1638388064,571,0),
(103617,1638388082,571,0),
(103619,1638048224,571,0),
(103622,1638048071,571,0),
(103630,1638048071,571,0),
(103631,1638048071,571,0),
(103637,1638388064,571,0),
(103638,1638048071,571,0),
(103758,1642600695,571,0),
(105908,1642600689,571,0),
(105909,1642600689,571,0),
(105910,1642600689,571,0),
(105911,1642600689,571,0),
(105918,1638048071,571,0),
(105921,1638048146,571,0),
(105923,1638048146,571,0),
(105924,1638388054,571,0),
(105926,1638048071,571,0),
(105929,1638048071,571,0),
(105931,1638048071,571,0),
(105932,1638048071,571,0),
(105933,1638048071,571,0),
(105936,1638048071,571,0),
(105938,1638048071,571,0),
(105939,1638048071,571,0),
(105941,1638048071,571,0),
(105943,1638048071,571,0),
(105945,1638048071,571,0),
(105950,1638048071,571,0),
(105952,1638048071,571,0),
(105953,1638388054,571,0),
(105964,1638048071,571,0),
(105965,1638048071,571,0),
(105966,1638048071,571,0),
(105968,1638048071,571,0),
(107057,1642600689,571,0),
(107058,1642600689,571,0),
(107059,1642600689,571,0),
(107060,1642600689,571,0),
(107061,1642600689,571,0),
(107062,1642600689,571,0),
(107063,1642600689,571,0),
(107064,1642600689,571,0),
(108796,1638048071,571,0),
(108797,1638048071,571,0),
(108805,1638048071,571,0),
(108808,1638048071,571,0),
(108822,1638048071,571,0),
(108834,1638048071,571,0),
(108837,1638048071,571,0),
(108840,1638048071,571,0),
(108851,1638048071,571,0),
(108854,1638048071,571,0),
(114243,1638048071,571,0),
(139119,1638048239,571,0),
(139131,1638048239,571,0),
(139136,1638048239,571,0),
(139139,1638048239,571,0),
(139142,1638048239,571,0),
(161937,1638048071,0,0),
(165304,1638048071,0,0),
(165458,1638048071,0,0),
(165639,1638048071,0,0),
(167665,1638048071,0,0),
(167666,1638048071,0,0),
(168095,1638048071,0,0),
(168130,1638048071,0,0),
(168140,1638048071,0,0),
(168170,1638048071,0,0),
(168193,1638048071,0,0),
(168205,1638048071,0,0),
(168208,1638048071,0,0),
(168212,1638048071,0,0),
(168215,1638048071,0,0),
(168220,1638048071,0,0),
(168221,1638048071,0,0),
(168224,1638048071,0,0),
(168227,1638048071,0,0),
(168238,1638048071,0,0),
(176326,1638048071,0,0),
(178088,1645014606,0,0),
(178270,1645014619,0,0),
(178334,1645014570,0,0),
(178335,1645014581,0,0),
(178338,1645014593,0,0),
(178339,1645014598,0,0),
(178355,1645014586,0,0),
(185757,1638048071,0,0),
(185770,1638048071,0,0),
(185779,1638048071,0,0),
(185784,1638048071,0,0),
(185785,1638048071,0,0),
(185791,1638048071,0,0),
(185793,1638048071,0,0),
(185806,1638048071,0,0),
(185816,1638048071,0,0),
(186686,1638048071,0,0),
(186687,1638048071,0,0),
(187078,1638048071,0,0),
(187112,1638048071,0,0),
(187125,1638048071,0,0),
(187136,1638048071,0,0),
(187143,1638048071,0,0),
(187150,1638048071,0,0),
(187152,1638048071,0,0),
(187157,1638048071,0,0),
(187158,1638048071,0,0),
(187159,1638048071,0,0),
(187161,1638048071,0,0),
(187162,1638048071,0,0),
(187165,1638048071,0,0),
(187166,1638048071,0,0),
(187167,1638048071,0,0),
(187186,1638048071,0,0),
(187200,1638048071,0,0),
(187205,1638048071,0,0),
(187233,1638048071,0,0),
(187235,1638048071,0,0),
(187236,1638048071,0,0),
(187252,1638048071,0,0),
(187265,1638048071,0,0),
(187269,1638388078,0,0),
(187270,1638388078,0,0),
(187343,1638048071,0,0),
(187607,1638048071,0,0),
(187610,1638048071,0,0),
(187623,1638048071,0,0),
(188938,1645014851,0,0),
(188946,1645014851,0,0),
(188949,1645014851,0,0),
(188951,1645014851,0,0),
(188952,1645014851,0,0),
(188956,1645014851,0,0),
(188973,1645014851,0,0),
(188992,1645014851,0,0),
(188996,1645014851,0,0),
(189003,1645014851,0,0),
(189005,1645014851,0,0),
(189008,1645014851,0,0),
(189009,1645014851,0,0),
(189025,1645014851,0,0),
(189032,1645014851,0,0),
(189033,1645014851,0,0),
(189034,1645014851,0,0),
(189036,1645014851,0,0),
(189044,1645014851,0,0),
(189051,1645014851,0,0),
(189052,1645014851,0,0),
(189055,1645014851,0,0),
(189057,1645014851,0,0),
(189059,1645014851,0,0),
(189060,1645014851,0,0),
(189066,1645014851,0,0),
(189069,1645014851,0,0),
(189070,1645014851,0,0),
(189071,1645014851,0,0),
(189316,1638048071,0,0),
(189357,1638048071,0,0),
(189395,1638048071,0,0),
(189429,1638048071,0,0),
(189436,1638048071,0,0),
(189456,1638048071,0,0),
(189459,1638048071,0,0),
(189461,1638048071,0,0),
(189507,1638048071,0,0),
(189512,1638048071,0,0),
(189524,1638048071,0,0),
(189525,1638048071,0,0),
(189545,1638048071,0,0),
(189558,1638048071,0,0),
(189559,1638048071,0,0),
(189572,1638048071,0,0),
(189629,1638048071,0,0),
(189631,1638048071,0,0),
(189636,1638048071,0,0),
(189638,1638048071,0,0),
(189642,1638048071,0,0),
(189643,1638048071,0,0),
(189695,1638048071,0,0),
(192519,1638048071,0,0),
(192520,1642601534,0,0),
(192521,1638388046,0,0),
(192524,1638388078,0,0),
(192831,1638388099,0,0),
(192832,1638388078,0,0),
(193015,1638388048,0,0),
(193017,1638388099,0,0),
(193120,1642601534,0,0),
(193121,1638388099,0,0),
(193122,1638048071,0,0),
(193198,1638388048,0,0),
(193240,1638388046,0,0),
(193242,1638048071,0,0),
(193267,1638388058,0,0),
(193270,1638388046,0,0),
(193290,1638388099,0,0),
(193313,1638388046,0,0),
(193325,1638048071,0,0),
(193328,1638388048,0,0),
(193329,1638048071,0,0),
(193335,1638388058,0,0),
(193336,1638388099,0,0),
(193337,1638388099,0,0),
(193340,1642601534,0,0),
(193341,1638388046,0,0),
(193342,1638388046,0,0),
(193344,1638048071,0,0),
(193347,1638388046,0,0),
(193348,1638388078,0,0),
(193349,1638388058,0,0),
(193350,1642601534,0,0),
(193354,1638388058,0,0),
(193355,1638388058,0,0),
(193356,1638388046,0,0),
(193357,1638388046,0,0),
(193360,1638388058,0,0),
(193363,1638388099,0,0),
(193364,1638388099,0,0),
(193365,1638388099,0,0),
(193367,1638388099,0,0),
(193368,1638388058,0,0),
(193369,1638048071,0,0),
(193372,1638388099,0,0),
(193376,1638388046,0,0),
(193383,1638388046,0,0),
(193384,1638388099,0,0),
(193386,1638388058,0,0),
(193389,1642601534,0,0),
(193390,1638388058,0,0),
(193392,1638388048,0,0),
(193395,1638388099,0,0),
(193400,1642600593,0,0),
(193402,1638388058,0,0),
(193403,1638388099,0,0),
(193404,1638388048,0,0),
(193412,1638388046,0,0),
(193413,1638388048,0,0),
(193417,1638388058,0,0),
(193419,1638388046,0,0),
(193420,1638388099,0,0),
(193422,1638388048,0,0),
(193425,1638048071,0,0),
(193426,1638388078,0,0),
(193430,1638388048,0,0),
(193434,1638048071,0,0),
(193437,1638048071,0,0),
(193442,1638388048,0,0),
(193443,1638388048,0,0),
(193445,1638388046,0,0),
(193448,1638388048,0,0),
(193449,1638388078,0,0),
(193469,1638388046,0,0),
(193644,1638388058,0,0),
(193645,1638388046,0,0),
(193772,1638388058,0,0),
(193778,1638388048,0,0),
(193828,1638388058,0,0),
(193835,1638388078,0,0),
(193844,1638388046,0,0),
(194127,1642601534,0,0),
(194141,1638388078,0,0),
(194158,1638388099,0,0),
(194220,1638388048,0,0),
(194221,1638388048,0,0),
(194248,1638388058,0,0),
(194272,1638388048,0,0),
(194273,1638388048,0,0),
(194284,1638388078,0,0),
(194285,1638388078,0,0),
(194287,1638388048,0,0),
(194329,1638388048,0,0),
(194350,1638388058,0,0),
(194367,1638388048,0,0),
(194422,1638048071,0,0),
(194497,1638388099,0,0),
(194569,1638388058,0,0),
(194577,1638388048,0,0),
(194612,1638388099,0,0),
(194632,1638388058,0,0),
(194646,1638388058,0,0),
(194877,1638048071,1,0),
(195504,1638048071,1,0),
(195538,1638048071,1,0),
(195539,1638048071,1,0),
(195555,1638048071,1,0),
(195561,1638104742,1,0),
(195578,1642600498,1,0),
(195579,1642600498,1,0),
(195581,1638048071,1,0),
(195583,1642600498,1,0),
(195584,1638048071,1,0),
(195587,1638048071,1,0),
(195588,1638048228,1,0),
(195591,1638048228,1,0),
(195592,1638048228,1,0),
(195593,1638048071,1,0),
(195594,1642600498,1,0),
(195596,1642600498,1,0),
(195602,1638048071,1,0),
(195605,1638048071,1,0),
(195607,1638048071,1,0),
(195609,1638048071,1,0),
(195616,1638048071,1,0),
(195622,1638048071,1,0),
(195623,1638048071,1,0),
(195632,1638048071,1,0),
(195633,1638048071,1,0),
(195634,1638048071,1,0),
(195635,1638048071,1,0),
(195636,1638048071,1,0),
(195638,1638048071,1,0),
(195639,1638048071,1,0),
(195640,1638048071,1,0),
(195641,1638048071,1,0),
(195645,1638048071,1,0),
(195647,1638048071,1,0),
(195648,1638048071,1,0),
(195653,1638048071,1,0),
(195659,1638048071,1,0),
(195660,1638048071,1,0),
(195666,1638048071,1,0),
(195667,1638048071,1,0),
(195668,1638048071,1,0),
(195669,1638048071,1,0),
(195670,1638048071,1,0),
(195684,1638048071,1,0),
(195685,1638048071,1,0),
(195687,1638048071,1,0),
(195690,1638048071,1,0),
(195692,1638048071,1,0),
(195693,1638048071,1,0),
(195694,1638048071,1,0),
(195695,1638048071,1,0),
(195703,1638048071,1,0),
(195707,1638048071,1,0),
(195717,1638048071,1,0),
(195719,1638048071,1,0),
(195720,1638048071,1,0),
(195733,1638048071,1,0),
(195740,1638048071,1,0),
(195743,1638048071,1,0),
(195745,1638048071,1,0),
(195747,1638048071,1,0),
(195752,1638048071,1,0),
(195753,1638048071,1,0),
(195760,1638048071,1,0),
(195761,1638048071,1,0),
(195763,1638048071,1,0),
(195764,1638048071,1,0),
(195765,1638048071,1,0),
(195766,1638048071,1,0),
(195767,1638048071,1,0),
(195771,1638048071,1,0),
(195795,1638048071,1,0),
(195812,1638048071,1,0),
(195817,1638048071,1,0),
(195819,1638048071,1,0),
(195820,1638048071,1,0),
(195821,1638048071,1,0),
(195831,1638048071,1,0),
(195838,1638048071,1,0),
(195841,1638048071,1,0),
(195843,1638048071,1,0),
(195848,1638048071,1,0),
(195851,1638048071,1,0),
(196197,1638048071,0,0),
(196208,1638048265,0,0),
(196219,1638048265,0,0),
(201190,1638388058,0,0),
(201202,1638048071,0,0),
(201204,1638388058,0,0),
(201205,1638048071,0,0),
(201226,1638048071,0,0),
(201227,1638388058,0,0),
(201228,1638048071,0,0),
(201235,1638388058,0,0),
(201241,1638048071,0,0),
(201242,1638048071,0,0),
(201243,1638048071,0,0),
(201252,1638048071,0,0),
(201258,1642600593,0,0),
(201263,1638048071,0,0),
(201264,1638048071,0,0),
(201267,1638048071,0,0),
(201271,1638388058,0,0),
(201272,1642601352,0,0),
(201275,1638388058,0,0),
(201282,1638388058,0,0),
(201286,1642601352,0,0),
(201288,1638388058,0,0),
(201296,1638388058,0,0),
(201304,1638388058,0,0),
(201306,1638388058,0,0),
(201307,1638048071,0,0),
(201308,1645013516,0,0),
(201314,1638048071,0,0),
(201315,1638388058,0,0),
(201317,1638388058,0,0),
(201322,1638048071,0,0),
(201323,1638388058,0,0),
(201325,1638048071,0,0),
(201333,1638388058,0,0),
(201338,1638048071,0,0),
(204636,1638048071,1,0),
(204690,1638048071,1,0),
(204780,1638048071,1,0),
(204827,1638048071,1,0),
(204828,1638048071,1,0),
(204843,1638048071,1,0),
(204878,1638048071,1,0),
(204885,1638048071,1,0),
(204914,1638048071,1,0),
(204918,1638048071,1,0),
(204919,1638048071,1,0),
(204921,1638048071,1,0),
(204932,1638048071,1,0),
(204933,1638048071,1,0),
(204942,1638048071,1,0),
(204949,1638048071,1,0),
(205005,1638048071,1,0),
(205007,1638048071,1,0),
(205009,1642600705,1,0),
(205010,1638048071,1,0),
(205014,1638048071,1,0),
(205031,1638048071,1,0),
(205038,1638048071,1,0),
(205039,1638048071,1,0),
(205043,1638048071,1,0),
(205044,1638048071,1,0),
(205045,1638048071,1,0),
(205056,1638048071,1,0),
(205057,1638048071,1,0),
(205063,1638048071,1,0),
(205066,1638048071,1,0),
(205072,1638048071,1,0),
(205076,1638048071,1,0),
(205082,1638048071,1,0),
(216648,1638048071,0,0),
(216663,1638048146,0,0),
(216939,1642600683,0,0),
(217024,1638048146,0,0),
(217030,1638048071,0,0),
(217035,1638048071,0,0),
(217037,1638048071,0,0),
(217104,1638048071,0,0),
(217115,1638048071,0,0),
(217159,1638048071,0,0),
(217165,1638048146,0,0),
(217167,1638048071,0,0),
(217227,1638048146,0,0),
(217351,1638048071,0,0),
(217355,1638048071,0,0),
(217447,1638048146,0,0),
(217516,1638048071,0,0),
(217558,1638048071,0,0),
(217950,1638048146,0,0),
(218524,1638048071,0,0),
(236721,1638048071,1,0),
(236732,1638048071,1,0),
(236739,1638048071,1,0),
(236779,1638048071,1,0),
(236780,1638048071,1,0),
(236781,1638048071,1,0),
(236812,1638048071,1,0),
(236932,1638048071,1,0),
(241703,1638048071,1,0),
(241743,1638048071,1,0),
(241774,1638048071,1,0),
(241809,1638048071,1,0),
(241829,1638048071,1,0),
(241832,1638048071,1,0),
(241833,1638048071,1,0),
(241835,1638048071,1,0),
(241839,1638048071,1,0),
(241840,1638048071,1,0),
(241843,1638048071,1,0),
(241851,1638048071,1,0),
(241863,1638048071,1,0),
(241875,1638048071,1,0),
(241876,1638048071,1,0),
(241885,1638048071,1,0),
(241894,1638048071,1,0),
(241900,1638048071,1,0),
(241909,1638048071,1,0),
(241913,1638048071,1,0),
(241914,1638048071,1,0),
(241920,1638048071,1,0),
(241921,1638048071,1,0),
(241931,1638048071,1,0),
(241932,1638048071,1,0),
(241934,1638048071,1,0),
(241937,1638048071,1,0),
(241948,1638048071,1,0),
(241949,1638048071,1,0),
(241959,1638048071,1,0),
(242015,1638048071,1,0),
(242942,1638048071,1,0),
(242968,1638048071,1,0),
(243030,1638048071,1,0),
(243143,1638048071,1,0),
(243186,1638048071,1,0),
(243187,1638048071,1,0),
(243208,1638048071,1,0),
(243226,1638048071,1,0),
(243237,1638048071,1,0),
(243247,1638048071,1,0),
(243248,1638104742,1,0),
(243261,1638104742,1,0),
(243270,1638048071,1,0),
(243271,1638048071,1,0),
(243309,1638048071,1,0),
(243321,1638048071,1,0),
(243344,1638048071,1,0),
(243346,1638048071,1,0),
(243355,1638048071,1,0),
(243365,1638048071,1,0),
(243366,1638048071,1,0),
(243396,1638048071,1,0),
(243397,1638048071,1,0),
(243398,1638048071,1,0),
(243411,1638388054,1,0),
(243412,1638048071,1,0),
(243413,1638048071,1,0),
(243421,1638048071,1,0),
(243431,1638048071,1,0),
(243432,1638048071,1,0),
(243433,1638048071,1,0),
(243441,1638048071,1,0),
(243451,1638048071,1,0),
(243452,1638048071,1,0),
(243480,1638048071,1,0),
(243481,1638048071,1,0),
(243492,1638388054,1,0),
(243493,1638048071,1,0),
(243495,1638048071,1,0),
(243501,1638388054,1,0),
(243506,1638048071,1,0),
(243514,1638048071,1,0),
(243517,1642600498,1,0),
(243521,1638048071,1,0),
(243526,1638048071,1,0),
(243528,1638388054,1,0),
(243529,1642600498,1,0),
(243531,1638388054,1,0),
(243532,1638048071,1,0),
(243535,1638048071,1,0),
(243536,1642600498,1,0),
(243537,1638388054,1,0),
(243539,1638048071,1,0),
(243547,1638048071,1,0),
(243549,1642600498,1,0),
(243554,1638388109,1,0),
(243559,1638388109,1,0),
(243561,1638388054,1,0),
(243563,1638048071,1,0),
(243566,1638388054,1,0),
(243567,1638048071,1,0),
(243570,1638048071,1,0),
(243615,1638048071,1,0),
(243620,1638048071,1,0),
(243625,1638048071,1,0),
(243630,1638048071,1,0),
(243654,1638048071,1,0),
(243667,1642600498,1,0),
(243668,1638048071,1,0),
(243746,1638048071,1,0),
(243779,1638048071,1,0),
(243783,1638048071,1,0),
(244035,1638104742,1,0),
(244056,1638104742,1,0),
(244103,1638104742,1,0),
(244115,1638388054,1,0),
(244132,1638388054,1,0),
(244133,1638104742,1,0),
(244134,1638388054,1,0),
(244135,1638388054,1,0),
(244136,1638104742,1,0),
(244137,1638104742,1,0),
(244138,1638104742,1,0),
(244139,1638388054,1,0),
(244140,1638388054,1,0),
(244300,1638048071,1,0),
(244301,1638048071,1,0),
(244361,1638048071,1,0),
(244367,1638048071,1,0),
(244376,1638048071,1,0),
(244391,1638048071,1,0),
(244394,1638048071,1,0),
(244676,1638048071,1,0),
(244777,1638048071,1,0),
(244819,1638048071,1,0),
(244820,1638048071,1,0),
(244834,1638048071,1,0),
(244835,1638048071,1,0),
(244854,1638048071,1,0),
(244876,1638048071,1,0),
(244903,1638048071,1,0),
(244917,1638048071,1,0),
(245169,1638048071,1,0),
(245249,1638048071,1,0),
(245250,1638048071,1,0),
(245274,1638048071,1,0),
(245283,1638048071,1,0),
(245295,1638048071,1,0),
(245298,1638048071,1,0),
(245302,1638048071,1,0),
(245310,1638048071,1,0),
(245312,1638048071,1,0),
(245315,1638048071,1,0),
(245323,1638048071,1,0),
(245329,1638048071,1,0),
(245335,1638048071,1,0),
(245337,1638048071,1,0),
(245339,1638048071,1,0),
(245356,1638048071,1,0),
(245383,1638048071,1,0),
(245394,1638048071,1,0),
(250817,1642600705,1,0),
(250820,1638048071,1,0),
(250824,1642601545,1,0),
(250834,1642600705,1,0),
(250835,1642600705,1,0),
(250836,1638048071,1,0),
(250837,1638048071,1,0),
(250838,1642600705,1,0),
(250840,1642600705,1,0),
(250841,1638048071,1,0),
(250842,1638048071,1,0),
(250843,1642601545,1,0),
(250844,1638048071,1,0),
(250845,1642600705,1,0),
(250847,1638048071,1,0),
(250851,1638048071,1,0),
(250855,1642601545,1,0),
(250858,1638048071,1,0),
(250863,1638048071,1,0),
(250870,1638048071,1,0),
(250871,1638048071,1,0),
(250875,1642601545,1,0),
(250876,1642601545,1,0),
(250878,1638048071,1,0),
(250883,1638048071,1,0),
(250895,1638048071,1,0),
(250896,1638048071,1,0),
(250910,1642601545,1,0),
(250913,1638048071,1,0),
(250961,1638048071,1,0),
(251000,1642600705,1,0),
(251003,1638048071,1,0),
(251007,1638048071,1,0),
(251051,1638048071,1,0),
(251061,1642601545,1,0),
(251374,1638048071,1,0),
(251375,1638048071,1,0),
(251378,1638048071,1,0),
(251380,1638048071,1,0),
(252093,1638048071,1,0),
(252221,1638048071,1,0),
(252360,1638048071,1,0),
(254100,1638388062,1,0),
(254269,1638388062,1,0),
(254451,1638388062,1,0),
(255238,1638388062,1,0),
(255268,1638388062,1,0),
(255281,1638388062,1,0),
(255283,1638388062,1,0),
(255298,1638388062,1,0),
(255299,1638388062,1,0),
(255300,1638388062,1,0),
(255303,1638388062,1,0),
(255306,1638388062,1,0),
(255307,1638388062,1,0),
(255308,1638388062,1,0),
(255309,1638388062,1,0),
(255310,1638388062,1,0),
(255312,1638388062,1,0),
(255314,1638388062,1,0),
(255349,1638388062,1,0),
(255350,1638388062,1,0),
(255352,1638388062,1,0),
(260311,1638388093,1,0),
(260441,1638388082,1,0),
(260550,1638388082,1,0),
(260554,1638048071,1,0),
(260697,1638388101,1,0),
(260709,1638048071,1,0),
(261019,1638388080,1,0),
(261035,1638048071,1,0),
(261224,1638388082,1,0),
(261283,1638048071,1,0),
(261905,1638388101,1,0),
(262102,1638388101,1,0),
(262118,1638048071,1,0),
(262129,1638388082,1,0),
(262131,1638388101,1,0),
(262174,1638048071,1,0),
(262194,1638048071,1,0),
(262274,1638048071,1,0),
(262369,1642601496,1,0),
(262722,1642601496,1,0),
(262729,1642600701,1,0),
(262754,1642601496,1,0),
(262755,1642600701,1,0),
(262757,1642600719,1,0),
(262807,1642600701,1,0),
(262825,1642600701,1,0),
(262838,1642600701,1,0),
(262844,1642600701,1,0),
(262847,1642601496,1,0),
(262897,1642601496,1,0),
(262945,1642600701,1,0),
(263465,1642601496,1,0),
(263525,1642600699,1,0),
(263537,1642600699,1,0),
(263543,1642600719,1,0),
(263567,1642600699,1,0),
(263568,1642600719,1,0),
(263570,1642601496,1,0),
(263572,1642600719,1,0),
(263573,1642600699,1,0),
(263577,1642600719,1,0),
(263579,1642600701,1,0),
(263583,1642600699,1,0),
(263584,1642600719,1,0),
(263592,1642601496,1,0),
(263602,1642601496,1,0),
(263606,1642601498,1,0),
(263619,1642600699,1,0),
(263631,1642600699,1,0),
(263662,1642600699,1,0),
(263724,1642601498,1,0),
(263738,1642600699,1,0),
(263847,1642600699,1,0),
(263924,1642600677,1,0),
(263928,1642600699,1,0),
(263932,1642600699,1,0),
(263953,1642600677,1,0),
(263961,1642600677,1,0),
(263964,1642600677,1,0),
(263970,1642600677,1,0),
(263975,1642600699,1,0),
(264047,1642600699,1,0),
(264185,1642600677,1,0),
(264419,1642601518,1,0),
(264420,1642601518,1,0),
(264424,1642601518,1,0),
(264437,1642601518,1,0),
(264439,1642601518,1,0),
(264443,1642601518,1,0),
(264588,1642601518,1,0),
(264618,1642601498,1,0),
(264671,1642601498,1,0),
(264681,1642601498,1,0),
(264686,1642601498,1,0),
(264688,1642601498,1,0),
(264696,1642601498,1,0),
(264704,1642601498,1,0),
(264712,1642601498,1,0),
(264805,1642601498,1,0),
(264807,1642601518,1,0),
(264821,1642601498,1,0),
(266003,1642601545,1,0),
(266004,1642601545,1,0),
(266122,1638048071,1,0),
(266151,1638048071,1,0),
(266164,1638048071,1,0),
(266173,1638048071,1,0),
(266191,1638048071,1,0),
(266193,1638048071,1,0),
(266195,1638048071,1,0),
(266216,1638048071,1,0),
(266259,1638048071,1,0),
(266273,1638048071,1,0),
(266274,1638048071,1,0),
(266275,1638048071,1,0),
(266277,1638048071,1,0),
(266279,1638048071,1,0),
(266284,1638048071,1,0),
(266285,1638048071,1,0),
(266292,1638048071,1,0),
(269540,1642600677,1,0),
(270096,1642600655,1,0),
(270117,1642600677,1,0),
(270139,1642600665,1,0),
(270154,1642600677,1,0),
(270155,1642600677,1,0),
(270213,1642600677,1,0),
(270571,1642600677,1,0),
(272655,1642600677,1,0),
(272658,1642600665,1,0),
(272663,1642600677,1,0),
(273002,1638048071,1,0),
(273260,1638048071,1,0),
(273970,1638048071,1,0),
(274004,1638048071,1,0),
(274043,1638048071,1,0),
(274048,1638048071,1,0),
(274063,1638048071,1,0),
(274095,1638048071,1,0),
(277147,1642600713,1,0),
(277148,1642600713,1,0),
(277289,1638388066,1,0),
(277311,1642600713,1,0),
(277476,1642600713,1,0),
(277503,1638388066,1,0),
(277725,1638388066,1,0),
(277928,1638388066,1,0),
(278591,1638388066,1,0),
(352325,1638048071,571,0),
(352331,1638048071,571,0),
(352336,1638048071,571,0),
(352341,1638048071,571,0),
(352342,1638048071,571,0),
(352353,1638048071,571,0),
(352379,1638048071,571,0),
(352390,1638048071,571,0),
(352391,1638388054,571,0),
(352392,1642600705,571,0),
(352408,1638388054,571,0),
(352414,1638388054,571,0),
(352415,1638388054,571,0),
(352417,1642600705,571,0),
(352419,1638048071,571,0),
(352432,1638048071,571,0),
(352438,1638388054,571,0),
(352439,1638388054,571,0),
(523058,1638048071,870,0),
(523092,1638048071,870,0),
(523093,1638048071,870,0),
(523094,1638048071,870,0),
(523095,1638048071,870,0),
(523174,1638048071,870,0),
(523247,1638048071,870,0),
(527909,1638048071,870,0),
(527921,1638048071,870,0),
(563990,1638388066,1,0),
(564001,1638388066,1,0),
(564002,1638388066,1,0),
(564003,1638388066,1,0),
(564004,1638388066,1,0),
(582289,1638048115,1064,0),
(582376,1638048115,1064,0),
(582382,1638048115,1064,0),
(582391,1638048115,1064,0);

UNLOCK TABLES;

/*Table structure for table `custom_transmogrification` */

DROP TABLE IF EXISTS `custom_transmogrification`;

CREATE TABLE `custom_transmogrification` (
  `GUID` int unsigned NOT NULL COMMENT 'Item guidLow',
  `FakeEntry` int unsigned NOT NULL COMMENT 'Item entry',
  `Owner` int unsigned NOT NULL COMMENT 'Player guidLow',
  PRIMARY KEY (`GUID`),
  KEY `Owner` (`Owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='don''t work just yet.';

/*Data for the table `custom_transmogrification` */

LOCK TABLES `custom_transmogrification` WRITE;

UNLOCK TABLES;

/*Table structure for table `custom_transmogrification_sets` */

DROP TABLE IF EXISTS `custom_transmogrification_sets`;

CREATE TABLE `custom_transmogrification_sets` (
  `Owner` int unsigned NOT NULL COMMENT 'Player guidlow',
  `PresetID` tinyint unsigned NOT NULL COMMENT 'Preset identifier',
  `SetName` text COMMENT 'SetName',
  `SetData` text COMMENT 'Slot1 Entry1 Slot2 Entry2',
  PRIMARY KEY (`Owner`,`PresetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='6_1';

/*Data for the table `custom_transmogrification_sets` */

LOCK TABLES `custom_transmogrification_sets` WRITE;

UNLOCK TABLES;

/*Table structure for table `daily_players_reports` */

DROP TABLE IF EXISTS `daily_players_reports`;

CREATE TABLE `daily_players_reports` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `creation_time` int unsigned NOT NULL DEFAULT '0',
  `average` float NOT NULL DEFAULT '0',
  `total_reports` bigint unsigned NOT NULL DEFAULT '0',
  `speed_reports` bigint unsigned NOT NULL DEFAULT '0',
  `fly_reports` bigint unsigned NOT NULL DEFAULT '0',
  `jump_reports` bigint unsigned NOT NULL DEFAULT '0',
  `waterwalk_reports` bigint unsigned NOT NULL DEFAULT '0',
  `teleportplane_reports` bigint unsigned NOT NULL DEFAULT '0',
  `climb_reports` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `daily_players_reports` */

LOCK TABLES `daily_players_reports` WRITE;

UNLOCK TABLES;

/*Table structure for table `executed_services` */

DROP TABLE IF EXISTS `executed_services`;

CREATE TABLE `executed_services` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('rename','change_acc','customize','change_race','change_class','change_prof','char_restore','guild_rename','unban','level_down','marketplace','transfer','boost','item_restore','boost_profession','boost_profession_small') NOT NULL,
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT '(player or guild)',
  `old_data` text NOT NULL,
  `new_data` text NOT NULL,
  `execute_date` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `executed_services` */

LOCK TABLES `executed_services` WRITE;

UNLOCK TABLES;

/*Table structure for table `fake_items` */

DROP TABLE IF EXISTS `fake_items`;

CREATE TABLE `fake_items` (
  `guid` int NOT NULL,
  `fakeEntry` int NOT NULL,
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `fake_items` */

LOCK TABLES `fake_items` WRITE;

UNLOCK TABLES;

/*Table structure for table `game_event_condition_save` */

DROP TABLE IF EXISTS `game_event_condition_save`;

CREATE TABLE `game_event_condition_save` (
  `eventEntry` tinyint unsigned NOT NULL,
  `condition_id` int unsigned NOT NULL DEFAULT '0',
  `done` float DEFAULT '0',
  PRIMARY KEY (`eventEntry`,`condition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `game_event_condition_save` */

LOCK TABLES `game_event_condition_save` WRITE;

UNLOCK TABLES;

/*Table structure for table `game_event_save` */

DROP TABLE IF EXISTS `game_event_save`;

CREATE TABLE `game_event_save` (
  `eventEntry` tinyint unsigned NOT NULL,
  `state` tinyint unsigned NOT NULL DEFAULT '1',
  `next_start` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`eventEntry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `game_event_save` */

LOCK TABLES `game_event_save` WRITE;

UNLOCK TABLES;

/*Table structure for table `gameobject_respawn` */

DROP TABLE IF EXISTS `gameobject_respawn`;

CREATE TABLE `gameobject_respawn` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawnTime` int unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `instanceId` int unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Identifier',
  PRIMARY KEY (`guid`,`instanceId`),
  KEY `idx_instance` (`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Grid Loading System';

/*Data for the table `gameobject_respawn` */

LOCK TABLES `gameobject_respawn` WRITE;

UNLOCK TABLES;

/*Table structure for table `gm_subsurveys` */

DROP TABLE IF EXISTS `gm_subsurveys`;

CREATE TABLE `gm_subsurveys` (
  `surveyId` int unsigned NOT NULL AUTO_INCREMENT,
  `subsurveyId` int unsigned NOT NULL DEFAULT '0',
  `rank` int unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  PRIMARY KEY (`surveyId`,`subsurveyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `gm_subsurveys` */

LOCK TABLES `gm_subsurveys` WRITE;

UNLOCK TABLES;

/*Table structure for table `gm_surveys` */

DROP TABLE IF EXISTS `gm_surveys`;

CREATE TABLE `gm_surveys` (
  `surveyId` int unsigned NOT NULL AUTO_INCREMENT,
  `guid` int unsigned NOT NULL DEFAULT '0',
  `mainSurvey` int unsigned NOT NULL DEFAULT '0',
  `overallComment` longtext NOT NULL,
  `createTime` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`surveyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `gm_surveys` */

LOCK TABLES `gm_surveys` WRITE;

UNLOCK TABLES;

/*Table structure for table `gm_tickets` */

DROP TABLE IF EXISTS `gm_tickets`;

CREATE TABLE `gm_tickets` (
  `ticketId` int unsigned NOT NULL AUTO_INCREMENT,
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier of ticket creator',
  `name` varchar(12) NOT NULL COMMENT 'Name of ticket creator',
  `message` text NOT NULL,
  `createTime` int unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `lastModifiedTime` int unsigned NOT NULL DEFAULT '0',
  `closedBy` int NOT NULL DEFAULT '0',
  `assignedTo` int unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text NOT NULL,
  `response` text NOT NULL,
  `completed` tinyint unsigned NOT NULL DEFAULT '0',
  `escalated` tinyint unsigned NOT NULL DEFAULT '0',
  `viewed` tinyint unsigned NOT NULL DEFAULT '0',
  `haveTicket` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `gm_tickets` */

LOCK TABLES `gm_tickets` WRITE;

UNLOCK TABLES;

/*Table structure for table `group_completed_challenges` */

DROP TABLE IF EXISTS `group_completed_challenges`;

CREATE TABLE `group_completed_challenges` (
  `map` int unsigned NOT NULL,
  `attemptId` int unsigned NOT NULL DEFAULT '0',
  `completion_time` int unsigned NOT NULL DEFAULT '0',
  `completion_date` int unsigned NOT NULL DEFAULT '0',
  `medal_earned` tinyint unsigned NOT NULL DEFAULT '0',
  `group_members` tinyint unsigned NOT NULL DEFAULT '0',
  `member_1_guid` int unsigned NOT NULL DEFAULT '0',
  `member_1_spec` int unsigned NOT NULL DEFAULT '0',
  `member_2_guid` int unsigned NOT NULL DEFAULT '0',
  `member_2_spec` int unsigned NOT NULL DEFAULT '0',
  `member_3_guid` int unsigned NOT NULL DEFAULT '0',
  `member_3_spec` int unsigned NOT NULL DEFAULT '0',
  `member_4_guid` int unsigned NOT NULL DEFAULT '0',
  `member_4_spec` int unsigned NOT NULL DEFAULT '0',
  `member_5_guid` int unsigned NOT NULL DEFAULT '0',
  `member_5_spec` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `group_completed_challenges` */

LOCK TABLES `group_completed_challenges` WRITE;

UNLOCK TABLES;

/*Table structure for table `group_instance` */

DROP TABLE IF EXISTS `group_instance`;

CREATE TABLE `group_instance` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `instance` int unsigned NOT NULL DEFAULT '0',
  `permanent` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `group_instance` */

LOCK TABLES `group_instance` WRITE;

UNLOCK TABLES;

/*Table structure for table `group_member` */

DROP TABLE IF EXISTS `group_member`;

CREATE TABLE `group_member` (
  `guid` int unsigned NOT NULL,
  `memberGuid` int unsigned NOT NULL,
  `memberFlags` tinyint unsigned NOT NULL DEFAULT '0',
  `subgroup` tinyint unsigned NOT NULL DEFAULT '0',
  `roles` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`memberGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Groups';

/*Data for the table `group_member` */

LOCK TABLES `group_member` WRITE;

UNLOCK TABLES;

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `guid` int unsigned NOT NULL,
  `leaderGuid` int unsigned NOT NULL,
  `lootMethod` tinyint unsigned NOT NULL,
  `looterGuid` int unsigned NOT NULL,
  `lootThreshold` tinyint unsigned NOT NULL,
  `icon1` int unsigned NOT NULL,
  `icon2` int unsigned NOT NULL,
  `icon3` int unsigned NOT NULL,
  `icon4` int unsigned NOT NULL,
  `icon5` int unsigned NOT NULL,
  `icon6` int unsigned NOT NULL,
  `icon7` int unsigned NOT NULL,
  `icon8` int unsigned NOT NULL,
  `groupType` tinyint unsigned NOT NULL,
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `raiddifficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `slot` tinyint unsigned NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `leaderGuid` (`leaderGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Groups';

/*Data for the table `groups` */

LOCK TABLES `groups` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild` */

DROP TABLE IF EXISTS `guild`;

CREATE TABLE `guild` (
  `guildid` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(24) NOT NULL DEFAULT '',
  `leaderguid` int unsigned NOT NULL DEFAULT '0',
  `EmblemStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `EmblemColor` tinyint unsigned NOT NULL DEFAULT '0',
  `BorderStyle` tinyint unsigned NOT NULL DEFAULT '0',
  `BorderColor` tinyint unsigned NOT NULL DEFAULT '0',
  `BackgroundColor` tinyint unsigned NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `motd` varchar(128) NOT NULL DEFAULT '',
  `createdate` int unsigned NOT NULL DEFAULT '0',
  `BankMoney` bigint unsigned NOT NULL DEFAULT '0',
  `level` int unsigned DEFAULT '1',
  `experience` bigint unsigned DEFAULT '0',
  PRIMARY KEY (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Guild System';

/*Data for the table `guild` */

LOCK TABLES `guild` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_achievement` */

DROP TABLE IF EXISTS `guild_achievement`;

CREATE TABLE `guild_achievement` (
  `guildId` int unsigned NOT NULL,
  `achievement` smallint unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  `guids` text NOT NULL,
  PRIMARY KEY (`guildId`,`achievement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `guild_achievement` */

LOCK TABLES `guild_achievement` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_achievement_progress` */

DROP TABLE IF EXISTS `guild_achievement_progress`;

CREATE TABLE `guild_achievement_progress` (
  `guildId` int unsigned NOT NULL,
  `criteria` smallint unsigned NOT NULL,
  `counter` bigint unsigned NOT NULL,
  `date` int unsigned NOT NULL DEFAULT '0',
  `completedGuid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildId`,`criteria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `guild_achievement_progress` */

LOCK TABLES `guild_achievement_progress` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_bank_eventlog` */

DROP TABLE IF EXISTS `guild_bank_eventlog`;

CREATE TABLE `guild_bank_eventlog` (
  `guildid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Guild Identificator',
  `LogGuid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Log record identificator - auxiliary column',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Guild bank TabId',
  `EventType` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Event type',
  `PlayerGuid` int unsigned NOT NULL DEFAULT '0',
  `ItemOrMoney` int unsigned NOT NULL DEFAULT '0',
  `ItemStackCount` smallint unsigned NOT NULL DEFAULT '0',
  `DestTabId` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Destination Tab Id',
  `TimeStamp` int unsigned NOT NULL DEFAULT '0' COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`,`TabId`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_PlayerGuid` (`PlayerGuid`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `guild_bank_eventlog` */

LOCK TABLES `guild_bank_eventlog` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_bank_item` */

DROP TABLE IF EXISTS `guild_bank_item`;

CREATE TABLE `guild_bank_item` (
  `guildid` int unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0',
  `SlotId` tinyint unsigned NOT NULL DEFAULT '0',
  `item_guid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`SlotId`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_item_guid` (`item_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `guild_bank_item` */

LOCK TABLES `guild_bank_item` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_bank_right` */

DROP TABLE IF EXISTS `guild_bank_right`;

CREATE TABLE `guild_bank_right` (
  `guildid` int unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0',
  `rid` tinyint unsigned NOT NULL DEFAULT '0',
  `gbright` tinyint unsigned NOT NULL DEFAULT '0',
  `SlotPerDay` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`TabId`,`rid`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `guild_bank_right` */

LOCK TABLES `guild_bank_right` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_bank_tab` */

DROP TABLE IF EXISTS `guild_bank_tab`;

CREATE TABLE `guild_bank_tab` (
  `guildid` int unsigned NOT NULL DEFAULT '0',
  `TabId` tinyint unsigned NOT NULL DEFAULT '0',
  `TabName` varchar(16) NOT NULL DEFAULT '',
  `TabIcon` varchar(100) NOT NULL DEFAULT '',
  `TabText` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`guildid`,`TabId`),
  KEY `guildid_key` (`guildid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `guild_bank_tab` */

LOCK TABLES `guild_bank_tab` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_challenges` */

DROP TABLE IF EXISTS `guild_challenges`;

CREATE TABLE `guild_challenges` (
  `guild_id` int unsigned NOT NULL,
  `dungeon` smallint unsigned NOT NULL DEFAULT '0',
  `raid` smallint unsigned NOT NULL DEFAULT '0',
  `rated_bg` smallint unsigned NOT NULL DEFAULT '0',
  `scenario` smallint unsigned NOT NULL DEFAULT '0',
  `dungeon_challenge` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `guild_challenges` */

LOCK TABLES `guild_challenges` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_completed_challenges` */

DROP TABLE IF EXISTS `guild_completed_challenges`;

CREATE TABLE `guild_completed_challenges` (
  `map` int unsigned NOT NULL,
  `guildId` int unsigned NOT NULL,
  `attemptId` int unsigned NOT NULL DEFAULT '0',
  `completion_time` int unsigned NOT NULL DEFAULT '0',
  `completion_date` int unsigned NOT NULL DEFAULT '0',
  `medal_earned` tinyint unsigned NOT NULL DEFAULT '0',
  `guild_members` tinyint unsigned NOT NULL DEFAULT '0',
  `member_1_guid` int unsigned NOT NULL DEFAULT '0',
  `member_1_spec` int unsigned NOT NULL DEFAULT '0',
  `member_2_guid` int unsigned NOT NULL DEFAULT '0',
  `member_2_spec` int unsigned NOT NULL DEFAULT '0',
  `member_3_guid` int unsigned NOT NULL DEFAULT '0',
  `member_3_spec` int unsigned NOT NULL DEFAULT '0',
  `member_4_guid` int unsigned NOT NULL DEFAULT '0',
  `member_4_spec` int unsigned NOT NULL DEFAULT '0',
  `member_5_guid` int unsigned NOT NULL DEFAULT '0',
  `member_5_spec` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`map`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `guild_completed_challenges` */

LOCK TABLES `guild_completed_challenges` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_eventlog` */

DROP TABLE IF EXISTS `guild_eventlog`;

CREATE TABLE `guild_eventlog` (
  `guildid` int unsigned NOT NULL COMMENT 'Guild Identificator',
  `LogGuid` int unsigned NOT NULL COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint unsigned NOT NULL COMMENT 'Event type',
  `PlayerGuid1` int unsigned NOT NULL COMMENT 'Player 1',
  `PlayerGuid2` int unsigned NOT NULL COMMENT 'Player 2',
  `NewRank` tinyint unsigned NOT NULL COMMENT 'New rank(in case promotion/demotion)',
  `TimeStamp` int unsigned NOT NULL COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`),
  KEY `Idx_PlayerGuid1` (`PlayerGuid1`),
  KEY `Idx_PlayerGuid2` (`PlayerGuid2`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Guild Eventlog';

/*Data for the table `guild_eventlog` */

LOCK TABLES `guild_eventlog` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_finder_applicant` */

DROP TABLE IF EXISTS `guild_finder_applicant`;

CREATE TABLE `guild_finder_applicant` (
  `guildId` int unsigned DEFAULT NULL,
  `playerGuid` int unsigned DEFAULT NULL,
  `availability` tinyint unsigned DEFAULT '0',
  `classRole` tinyint unsigned DEFAULT '0',
  `interests` tinyint unsigned DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  `submitTime` int unsigned DEFAULT NULL,
  UNIQUE KEY `guildId` (`guildId`,`playerGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `guild_finder_applicant` */

LOCK TABLES `guild_finder_applicant` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_finder_guild_settings` */

DROP TABLE IF EXISTS `guild_finder_guild_settings`;

CREATE TABLE `guild_finder_guild_settings` (
  `guildId` int unsigned NOT NULL,
  `availability` tinyint unsigned NOT NULL DEFAULT '0',
  `classRoles` tinyint unsigned NOT NULL DEFAULT '0',
  `interests` tinyint unsigned NOT NULL DEFAULT '0',
  `level` tinyint unsigned NOT NULL DEFAULT '1',
  `listed` tinyint unsigned NOT NULL DEFAULT '0',
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guildId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `guild_finder_guild_settings` */

LOCK TABLES `guild_finder_guild_settings` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_member` */

DROP TABLE IF EXISTS `guild_member`;

CREATE TABLE `guild_member` (
  `guildid` int unsigned NOT NULL COMMENT 'Guild Identificator',
  `guid` int unsigned NOT NULL,
  `rank` tinyint unsigned NOT NULL,
  `pnote` varchar(31) NOT NULL DEFAULT '',
  `offnote` varchar(31) NOT NULL DEFAULT '',
  `achievement_points` smallint unsigned NOT NULL DEFAULT '0',
  `first_prof_skill` smallint unsigned NOT NULL DEFAULT '0',
  `first_prof_value` smallint unsigned NOT NULL DEFAULT '0',
  `first_prof_rank` smallint unsigned NOT NULL DEFAULT '0',
  `first_prof_recipes` text,
  `second_prof_skill` smallint unsigned NOT NULL DEFAULT '0',
  `second_prof_value` smallint unsigned NOT NULL DEFAULT '0',
  `second_prof_rank` smallint unsigned NOT NULL DEFAULT '0',
  `second_prof_recipes` text,
  UNIQUE KEY `guid_key` (`guid`),
  KEY `guildid_key` (`guildid`),
  KEY `guildid_rank_key` (`guildid`,`rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Guild System';

/*Data for the table `guild_member` */

LOCK TABLES `guild_member` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_member_withdraw` */

DROP TABLE IF EXISTS `guild_member_withdraw`;

CREATE TABLE `guild_member_withdraw` (
  `guid` int unsigned NOT NULL,
  `tab0` int unsigned NOT NULL DEFAULT '0',
  `tab1` int unsigned NOT NULL DEFAULT '0',
  `tab2` int unsigned NOT NULL DEFAULT '0',
  `tab3` int unsigned NOT NULL DEFAULT '0',
  `tab4` int unsigned NOT NULL DEFAULT '0',
  `tab5` int unsigned NOT NULL DEFAULT '0',
  `tab6` int unsigned NOT NULL DEFAULT '0',
  `tab7` int unsigned NOT NULL DEFAULT '0',
  `money` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Guild Member Daily Withdraws';

/*Data for the table `guild_member_withdraw` */

LOCK TABLES `guild_member_withdraw` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_newslog` */

DROP TABLE IF EXISTS `guild_newslog`;

CREATE TABLE `guild_newslog` (
  `guildid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Guild Identificator',
  `LogGuid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Log record identificator - auxiliary column',
  `EventType` tinyint unsigned NOT NULL DEFAULT '0' COMMENT 'Event type',
  `PlayerGuid` int unsigned NOT NULL DEFAULT '0',
  `Flags` int unsigned NOT NULL DEFAULT '0',
  `Value` int unsigned NOT NULL DEFAULT '0',
  `TimeStamp` int unsigned NOT NULL DEFAULT '0' COMMENT 'Event UNIX time',
  PRIMARY KEY (`guildid`,`LogGuid`),
  KEY `guildid_key` (`guildid`),
  KEY `Idx_PlayerGuid` (`PlayerGuid`),
  KEY `Idx_LogGuid` (`LogGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `guild_newslog` */

LOCK TABLES `guild_newslog` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_rank` */

DROP TABLE IF EXISTS `guild_rank`;

CREATE TABLE `guild_rank` (
  `guildid` int unsigned NOT NULL DEFAULT '0',
  `rindex` tinyint unsigned NOT NULL,
  `rid` tinyint unsigned NOT NULL,
  `rname` varchar(20) NOT NULL DEFAULT '',
  `rights` mediumint unsigned NOT NULL DEFAULT '0',
  `BankMoneyPerDay` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guildid`,`rid`),
  KEY `Idx_rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Guild System';

/*Data for the table `guild_rank` */

LOCK TABLES `guild_rank` WRITE;

UNLOCK TABLES;

/*Table structure for table `guild_reputation` */

DROP TABLE IF EXISTS `guild_reputation`;

CREATE TABLE `guild_reputation` (
  `guid` int unsigned NOT NULL,
  `guild` int unsigned NOT NULL,
  `reputation` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `guild_reputation` */

LOCK TABLES `guild_reputation` WRITE;

UNLOCK TABLES;

/*Table structure for table `instance` */

DROP TABLE IF EXISTS `instance`;

CREATE TABLE `instance` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `map` smallint unsigned NOT NULL DEFAULT '0',
  `resettime` int unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `lfg` tinyint unsigned NOT NULL DEFAULT '0',
  `completedEncounters` int unsigned NOT NULL DEFAULT '0',
  `data` tinytext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `map` (`map`),
  KEY `resettime` (`resettime`),
  KEY `difficulty` (`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `instance` */

LOCK TABLES `instance` WRITE;

UNLOCK TABLES;

/*Table structure for table `instance_reset` */

DROP TABLE IF EXISTS `instance_reset`;

CREATE TABLE `instance_reset` (
  `mapid` smallint unsigned NOT NULL DEFAULT '0',
  `difficulty` tinyint unsigned NOT NULL DEFAULT '0',
  `resettime` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mapid`,`difficulty`),
  KEY `difficulty` (`difficulty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `instance_reset` */

LOCK TABLES `instance_reset` WRITE;

insert  into `instance_reset`(`mapid`,`difficulty`,`resettime`) values 
(33,2,1750125600),
(36,2,1750125600),
(249,3,1750212000),
(249,4,1750212000),
(269,2,1750125600),
(409,9,1750212000),
(469,9,1750212000),
(509,3,1750212000),
(531,9,1750212000),
(532,3,1750212000),
(533,3,1750212000),
(533,4,1750212000),
(534,4,1750212000),
(540,2,1750125600),
(542,2,1750125600),
(543,2,1750125600),
(544,4,1750212000),
(545,2,1750125600),
(546,2,1750125600),
(547,2,1750125600),
(548,4,1750212000),
(550,4,1750212000),
(552,2,1750125600),
(553,2,1750125600),
(554,2,1750125600),
(555,2,1750125600),
(556,2,1750125600),
(557,2,1750125600),
(558,2,1750125600),
(560,2,1750125600),
(564,4,1750212000),
(565,4,1750212000),
(568,2,1750125600),
(574,2,1750125600),
(575,2,1750125600),
(576,2,1750125600),
(578,2,1750125600),
(580,4,1750212000),
(585,2,1750125600),
(595,2,1750125600),
(598,2,1750125600),
(599,2,1750125600),
(600,2,1750125600),
(601,2,1750125600),
(602,2,1750125600),
(603,3,1750212000),
(603,4,1750212000),
(604,2,1750125600),
(608,2,1750125600),
(615,3,1750212000),
(615,4,1750212000),
(616,3,1750212000),
(616,4,1750212000),
(619,2,1750125600),
(624,3,1750212000),
(624,4,1750212000),
(631,3,1750212000),
(631,4,1750212000),
(631,5,1750212000),
(631,6,1750212000),
(632,2,1750125600),
(643,2,1750125600),
(644,2,1750125600),
(645,2,1750125600),
(649,3,1750212000),
(649,4,1750212000),
(649,5,1750212000),
(649,6,1750212000),
(650,2,1750125600),
(657,2,1750125600),
(658,2,1750125600),
(668,2,1750125600),
(669,3,1750212000),
(669,4,1750212000),
(669,5,1750212000),
(669,6,1750212000),
(670,2,1750125600),
(671,3,1750212000),
(671,4,1750212000),
(671,5,1750212000),
(671,6,1750212000),
(720,3,1750212000),
(720,4,1750212000),
(720,5,1750212000),
(720,6,1750212000),
(724,3,1750212000),
(724,4,1750212000),
(724,5,1750212000),
(724,6,1750212000),
(725,2,1750125600),
(754,3,1750212000),
(754,4,1750212000),
(754,5,1750212000),
(754,6,1750212000),
(755,2,1750125600),
(757,3,1750212000),
(757,4,1750212000),
(757,5,1750212000),
(757,6,1750212000),
(859,2,1750125600),
(938,2,1750125600),
(939,2,1750125600),
(940,2,1750125600),
(959,2,1750125600),
(960,2,1750125600),
(961,2,1750125600),
(962,2,1750125600),
(967,3,1750212000),
(967,4,1750212000),
(967,5,1750212000),
(967,6,1750212000),
(994,2,1750125600),
(996,3,1750212000),
(996,4,1750212000),
(996,5,1750212000),
(996,6,1750212000),
(1001,2,1750125600),
(1004,2,1750125600),
(1007,2,1750125600),
(1008,3,1750212000),
(1008,4,1750212000),
(1008,5,1750212000),
(1008,6,1750212000),
(1009,3,1750212000),
(1009,4,1750212000),
(1009,5,1750212000),
(1009,6,1750212000),
(1011,2,1750125600),
(1098,3,1750212000),
(1098,4,1750212000),
(1098,5,1750212000),
(1098,6,1750212000),
(1136,3,1750212000),
(1136,4,1750212000),
(1136,5,1750212000),
(1136,6,1750212000);

UNLOCK TABLES;

/*Table structure for table `item_deleted` */

DROP TABLE IF EXISTS `item_deleted`;

CREATE TABLE `item_deleted` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_guid` int NOT NULL,
  `old_item_guid` int NOT NULL,
  `item_entry` int NOT NULL,
  `item_count` int NOT NULL,
  `delete_date` int NOT NULL,
  `delete_type` int NOT NULL,
  `restored` tinyint(1) NOT NULL DEFAULT '0',
  `restore_date` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner_guid_old_item_guid` (`owner_guid`,`old_item_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `item_deleted` */

LOCK TABLES `item_deleted` WRITE;

UNLOCK TABLES;

/*Table structure for table `item_instance` */

DROP TABLE IF EXISTS `item_instance`;

CREATE TABLE `item_instance` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `itemEntry` mediumint unsigned NOT NULL DEFAULT '0',
  `owner_guid` int unsigned NOT NULL DEFAULT '0',
  `creatorGuid` int unsigned NOT NULL DEFAULT '0',
  `giftCreatorGuid` int unsigned NOT NULL DEFAULT '0',
  `count` int unsigned NOT NULL DEFAULT '1',
  `duration` int NOT NULL DEFAULT '0',
  `charges` tinytext,
  `flags` mediumint unsigned NOT NULL DEFAULT '0',
  `enchantments` text NOT NULL,
  `randomPropertyId` smallint NOT NULL DEFAULT '0',
  `reforgeID` int NOT NULL DEFAULT '0',
  `transmogrifyId` int NOT NULL DEFAULT '0',
  `upgradeID` int NOT NULL DEFAULT '0',
  `durability` smallint unsigned NOT NULL DEFAULT '0',
  `playedTime` int unsigned NOT NULL DEFAULT '0',
  `text` text,
  `pet_species` int unsigned NOT NULL,
  `pet_breed` int unsigned NOT NULL,
  `pet_quality` int unsigned NOT NULL,
  `pet_level` int unsigned NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `idx_owner_guid` (`owner_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Item System';

/*Data for the table `item_instance` */

LOCK TABLES `item_instance` WRITE;

insert  into `item_instance`(`guid`,`itemEntry`,`owner_guid`,`creatorGuid`,`giftCreatorGuid`,`count`,`duration`,`charges`,`flags`,`enchantments`,`randomPropertyId`,`reforgeID`,`transmogrifyId`,`upgradeID`,`durability`,`playedTime`,`text`,`pet_species`,`pet_breed`,`pet_quality`,`pet_level`) values 
(2,77509,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,20,0,'',0,0,0,0),
(4,72019,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,55,0,'',0,0,0,0),
(6,72020,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,40,0,'',0,0,0,0),
(8,77272,1,0,0,4,0,'-1 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,0,0,'',0,0,0,0),
(10,6948,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,0,0,'',0,0,0,0),
(12,77526,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,20,0,'',0,0,0,0),
(14,73209,1,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,40,36,'',0,0,0,0),
(16,58233,2,0,0,1,0,'0 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,55,0,'',0,0,0,0),
(18,43,2,0,0,1,0,'0 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,25,0,'',0,0,0,0),
(20,44,2,0,0,1,0,'0 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,40,0,'',0,0,0,0),
(22,6948,2,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,0,0,'',0,0,0,0),
(24,52557,2,0,0,1,0,'0 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,40,0,'',0,0,0,0),
(25,117,2,0,0,1,0,'-1 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,0,38,'',0,0,0,0),
(26,62328,2,0,0,1,0,'0 0 0 0 0 ',0,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,0,57,'',0,0,0,0),
(27,57255,2,0,0,1,0,'0 0 0 0 0 ',1,'0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 ',0,0,0,0,20,93,'',0,0,0,0);

UNLOCK TABLES;

/*Table structure for table `item_loot_items` */

DROP TABLE IF EXISTS `item_loot_items`;

CREATE TABLE `item_loot_items` (
  `container_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'guid of container (item_instance.guid)',
  `item_id` int unsigned NOT NULL DEFAULT '0' COMMENT 'loot item entry (item_instance.itemEntry)',
  `item_count` int NOT NULL DEFAULT '0' COMMENT 'stack size',
  `follow_rules` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'follow loot rules',
  `ffa` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'free-for-all',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  `counted` tinyint(1) NOT NULL DEFAULT '0',
  `under_threshold` tinyint(1) NOT NULL DEFAULT '0',
  `needs_quest` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'quest drop',
  `rnd_prop` int NOT NULL DEFAULT '0' COMMENT 'random enchantment added when originally rolled',
  `rnd_suffix` int NOT NULL DEFAULT '0' COMMENT 'random suffix added when originally rolled'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `item_loot_items` */

LOCK TABLES `item_loot_items` WRITE;

UNLOCK TABLES;

/*Table structure for table `item_loot_money` */

DROP TABLE IF EXISTS `item_loot_money`;

CREATE TABLE `item_loot_money` (
  `container_id` int NOT NULL DEFAULT '0' COMMENT 'guid of container (item_instance.guid)',
  `money` int NOT NULL DEFAULT '0' COMMENT 'money loot (in copper)'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `item_loot_money` */

LOCK TABLES `item_loot_money` WRITE;

UNLOCK TABLES;

/*Table structure for table `item_refund_instance` */

DROP TABLE IF EXISTS `item_refund_instance`;

CREATE TABLE `item_refund_instance` (
  `item_guid` int unsigned NOT NULL COMMENT 'Item GUID',
  `player_guid` int unsigned NOT NULL COMMENT 'Player GUID',
  `paidMoney` int unsigned NOT NULL DEFAULT '0',
  `paidExtendedCost` smallint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_guid`,`player_guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Item Refund System';

/*Data for the table `item_refund_instance` */

LOCK TABLES `item_refund_instance` WRITE;

UNLOCK TABLES;

/*Table structure for table `item_soulbound_trade_data` */

DROP TABLE IF EXISTS `item_soulbound_trade_data`;

CREATE TABLE `item_soulbound_trade_data` (
  `itemGuid` int unsigned NOT NULL COMMENT 'Item GUID',
  `allowedPlayers` text NOT NULL COMMENT 'Space separated GUID list of players who can receive this item in trade',
  PRIMARY KEY (`itemGuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Item Refund System';

/*Data for the table `item_soulbound_trade_data` */

LOCK TABLES `item_soulbound_trade_data` WRITE;

UNLOCK TABLES;

/*Table structure for table `lag_reports` */

DROP TABLE IF EXISTS `lag_reports`;

CREATE TABLE `lag_reports` (
  `reportId` int unsigned NOT NULL AUTO_INCREMENT,
  `guid` int unsigned NOT NULL DEFAULT '0',
  `lagType` tinyint unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `latency` int unsigned NOT NULL DEFAULT '0',
  `createTime` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player System';

/*Data for the table `lag_reports` */

LOCK TABLES `lag_reports` WRITE;

UNLOCK TABLES;

/*Table structure for table `lfg_data` */

DROP TABLE IF EXISTS `lfg_data`;

CREATE TABLE `lfg_data` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `dungeon` int unsigned NOT NULL DEFAULT '0',
  `state` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='LFG Data';

/*Data for the table `lfg_data` */

LOCK TABLES `lfg_data` WRITE;

UNLOCK TABLES;

/*Table structure for table `mail` */

DROP TABLE IF EXISTS `mail`;

CREATE TABLE `mail` (
  `id` int unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `messageType` tinyint unsigned NOT NULL DEFAULT '0',
  `stationery` tinyint NOT NULL DEFAULT '41',
  `mailTemplateId` smallint unsigned NOT NULL DEFAULT '0',
  `sender` int unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `receiver` int unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  `subject` longtext,
  `body` longtext,
  `has_items` tinyint unsigned NOT NULL DEFAULT '0',
  `expire_time` int unsigned NOT NULL DEFAULT '0',
  `deliver_time` int unsigned NOT NULL DEFAULT '0',
  `money` bigint unsigned NOT NULL DEFAULT '0',
  `cod` bigint unsigned NOT NULL DEFAULT '0',
  `checked` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_receiver` (`receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Mail System';

/*Data for the table `mail` */

LOCK TABLES `mail` WRITE;

UNLOCK TABLES;

/*Table structure for table `mail_items` */

DROP TABLE IF EXISTS `mail_items`;

CREATE TABLE `mail_items` (
  `mail_id` int unsigned NOT NULL DEFAULT '0',
  `item_guid` int unsigned NOT NULL DEFAULT '0',
  `receiver` int unsigned NOT NULL DEFAULT '0' COMMENT 'Character Global Unique Identifier',
  PRIMARY KEY (`item_guid`),
  KEY `idx_receiver` (`receiver`),
  KEY `idx_mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

/*Data for the table `mail_items` */

LOCK TABLES `mail_items` WRITE;

UNLOCK TABLES;

/*Table structure for table `pet_aura` */

DROP TABLE IF EXISTS `pet_aura`;

CREATE TABLE `pet_aura` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `slot` tinyint unsigned NOT NULL,
  `caster_guid` bigint unsigned NOT NULL DEFAULT '0',
  `item_guid` bigint unsigned NOT NULL DEFAULT '0',
  `spell` mediumint unsigned NOT NULL DEFAULT '0',
  `effect_mask` int unsigned NOT NULL DEFAULT '0',
  `recalculate_mask` int unsigned DEFAULT '0',
  `stackcount` tinyint unsigned NOT NULL DEFAULT '1',
  `maxduration` int NOT NULL DEFAULT '0',
  `remaintime` int NOT NULL DEFAULT '0',
  `remaincharges` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`caster_guid`,`item_guid`,`spell`,`effect_mask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `pet_aura` */

LOCK TABLES `pet_aura` WRITE;

UNLOCK TABLES;

/*Table structure for table `pet_aura_effect` */

DROP TABLE IF EXISTS `pet_aura_effect`;

CREATE TABLE `pet_aura_effect` (
  `guid` int unsigned NOT NULL,
  `slot` tinyint unsigned NOT NULL,
  `effect` tinyint unsigned NOT NULL,
  `base_amount` int NOT NULL DEFAULT '0',
  `amount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`slot`,`effect`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `pet_aura_effect` */

LOCK TABLES `pet_aura_effect` WRITE;

UNLOCK TABLES;

/*Table structure for table `pet_spell` */

DROP TABLE IF EXISTS `pet_spell`;

CREATE TABLE `pet_spell` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `spell` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `active` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Pet System';

/*Data for the table `pet_spell` */

LOCK TABLES `pet_spell` WRITE;

UNLOCK TABLES;

/*Table structure for table `pet_spell_cooldown` */

DROP TABLE IF EXISTS `pet_spell_cooldown`;

CREATE TABLE `pet_spell_cooldown` (
  `guid` int unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier, Low part',
  `spell` mediumint unsigned NOT NULL DEFAULT '0' COMMENT 'Spell Identifier',
  `time` bigint unsigned NOT NULL DEFAULT '0',
  `category_end` bigint unsigned DEFAULT '0',
  PRIMARY KEY (`guid`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `pet_spell_cooldown` */

LOCK TABLES `pet_spell_cooldown` WRITE;

UNLOCK TABLES;

/*Table structure for table `petition` */

DROP TABLE IF EXISTS `petition`;

CREATE TABLE `petition` (
  `ownerguid` int unsigned NOT NULL,
  `petitionguid` int unsigned DEFAULT '0',
  `name` varchar(24) NOT NULL,
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ownerguid`,`type`),
  UNIQUE KEY `index_ownerguid_petitionguid` (`ownerguid`,`petitionguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Guild System';

/*Data for the table `petition` */

LOCK TABLES `petition` WRITE;

UNLOCK TABLES;

/*Table structure for table `petition_sign` */

DROP TABLE IF EXISTS `petition_sign`;

CREATE TABLE `petition_sign` (
  `ownerguid` int unsigned NOT NULL,
  `petitionguid` int unsigned NOT NULL DEFAULT '0',
  `playerguid` int unsigned NOT NULL DEFAULT '0',
  `player_account` int unsigned NOT NULL DEFAULT '0',
  `type` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petitionguid`,`playerguid`),
  KEY `Idx_playerguid` (`playerguid`),
  KEY `Idx_ownerguid` (`ownerguid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Guild System';

/*Data for the table `petition_sign` */

LOCK TABLES `petition_sign` WRITE;

UNLOCK TABLES;

/*Table structure for table `players_reports_status` */

DROP TABLE IF EXISTS `players_reports_status`;

CREATE TABLE `players_reports_status` (
  `guid` int unsigned NOT NULL DEFAULT '0',
  `creation_time` int unsigned NOT NULL DEFAULT '0',
  `average` float NOT NULL DEFAULT '0',
  `total_reports` bigint unsigned NOT NULL DEFAULT '0',
  `speed_reports` bigint unsigned NOT NULL DEFAULT '0',
  `fly_reports` bigint unsigned NOT NULL DEFAULT '0',
  `jump_reports` bigint unsigned NOT NULL DEFAULT '0',
  `waterwalk_reports` bigint unsigned NOT NULL DEFAULT '0',
  `teleportplane_reports` bigint unsigned NOT NULL DEFAULT '0',
  `climb_reports` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `players_reports_status` */

LOCK TABLES `players_reports_status` WRITE;

UNLOCK TABLES;

/*Table structure for table `pool_quest_save` */

DROP TABLE IF EXISTS `pool_quest_save`;

CREATE TABLE `pool_quest_save` (
  `pool_id` int unsigned NOT NULL DEFAULT '0',
  `quest_id` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pool_id`,`quest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `pool_quest_save` */

LOCK TABLES `pool_quest_save` WRITE;

insert  into `pool_quest_save`(`pool_id`,`quest_id`) values 
(334,30476),
(349,14104),
(350,13904),
(351,13914),
(352,11379),
(353,11665),
(354,13422),
(356,11372),
(357,11387),
(358,25159),
(359,25154),
(360,29364),
(361,26235),
(362,29332),
(363,26192),
(364,29355),
(365,29313),
(366,26543),
(367,29348),
(368,29361),
(369,26414),
(370,29347),
(371,29323),
(372,28063),
(372,28130),
(373,27949),
(373,28046),
(374,27975),
(374,27978),
(375,27944),
(375,27972),
(376,28687),
(376,28721),
(377,28678),
(377,28683),
(378,28698),
(378,28700),
(379,28690),
(379,28692),
(380,12726),
(381,12762),
(382,12741),
(383,12760),
(500,13675),
(501,13762),
(502,13770),
(503,13775),
(504,13780),
(505,13784),
(506,13669),
(507,13616),
(508,13742),
(509,13748),
(510,13757),
(511,13753),
(512,13101),
(513,13115),
(514,13834),
(515,12963),
(516,24587),
(523,14080),
(524,14076),
(525,14140),
(526,14145),
(527,14108),
(528,26420),
(529,29332),
(530,29358),
(531,29355),
(532,29314),
(533,29320),
(534,29354),
(535,29350),
(536,29321),
(537,30700),
(537,30701),
(537,30763),
(538,31525),
(539,32000),
(540,26226),
(541,26192),
(542,26572),
(543,25160),
(544,25157),
(600,31701),
(601,30150),
(602,30157),
(603,31720),
(607,31024),
(607,31267),
(607,31268),
(607,31269),
(607,31270),
(607,31271),
(607,31272),
(608,31808),
(5662,13673),
(5663,13762),
(5664,13769),
(5665,13774),
(5666,13779),
(5667,13783),
(5668,13669),
(5669,13600),
(5670,13741),
(5671,13746),
(5672,13759),
(5673,13752),
(5674,13101),
(5675,13112),
(5676,13834),
(5677,12962),
(5678,24584),
(12001,31523),
(12002,31706),
(12003,31271),
(30136,32215),
(30136,32216),
(30136,32217),
(30136,32227),
(30137,32538),
(30137,32540),
(30137,32542),
(30137,32733),
(30138,32274),
(30138,32299),
(30138,32605),
(30139,32535),
(30139,32547),
(30139,32606),
(30140,32218),
(30140,32226),
(30140,32495),
(30140,32517),
(30141,32529),
(30141,32531),
(30141,32532),
(30141,32533),
(30142,32562),
(30143,32577),
(30145,32485),
(30145,32628),
(30145,32632),
(30145,32633),
(30145,32635),
(30145,32639),
(30146,32264),
(30146,32266),
(30146,32268),
(30146,32288),
(30146,32303),
(30146,32305),
(30147,32571),
(30147,32575),
(30148,32285),
(30148,32287),
(30149,32550),
(30149,32551),
(30149,32554),
(30150,32283),
(30150,32297),
(30150,32298),
(30151,32556),
(30151,32557),
(30151,32558),
(30152,32206),
(30152,32232),
(30152,32233),
(30153,32209),
(30154,32586),
(30155,32676),
(30156,32608),
(30184,40313);

UNLOCK TABLES;

/*Table structure for table `rated_pvp_info` */

DROP TABLE IF EXISTS `rated_pvp_info`;

CREATE TABLE `rated_pvp_info` (
  `guid` int unsigned NOT NULL,
  `slot` tinyint unsigned NOT NULL,
  `season` smallint unsigned NOT NULL,
  `rank` smallint unsigned DEFAULT '0',
  `rating` smallint unsigned DEFAULT '0',
  `matchmaker_rating` smallint unsigned DEFAULT '0',
  `week_best` smallint unsigned DEFAULT '0',
  `week_games` smallint unsigned DEFAULT '0',
  `week_wins` smallint unsigned DEFAULT '0',
  `season_best` smallint unsigned DEFAULT '0',
  `season_games` smallint unsigned DEFAULT '0',
  `season_wins` smallint unsigned DEFAULT '0',
  `last_week_best` smallint unsigned DEFAULT '0',
  `bonus_reward` tinyint(1) NOT NULL DEFAULT '0',
  `win_streak` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`slot`,`season`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `rated_pvp_info` */

LOCK TABLES `rated_pvp_info` WRITE;

UNLOCK TABLES;

/*Table structure for table `reserved_name` */

DROP TABLE IF EXISTS `reserved_name`;

CREATE TABLE `reserved_name` (
  `name` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Player Reserved Names';

/*Data for the table `reserved_name` */

LOCK TABLES `reserved_name` WRITE;

UNLOCK TABLES;

/*Table structure for table `ticket_bug` */

DROP TABLE IF EXISTS `ticket_bug`;

CREATE TABLE `ticket_bug` (
  `ticketId` int unsigned NOT NULL,
  `playerGuid` bigint unsigned NOT NULL,
  `bugNote` text NOT NULL,
  `ticketCreateTime` int unsigned NOT NULL DEFAULT '0',
  `mapId` smallint unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `closedBy` bigint NOT NULL DEFAULT '0',
  `assignedTo` bigint unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text NOT NULL,
  PRIMARY KEY (`ticketId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `ticket_bug` */

LOCK TABLES `ticket_bug` WRITE;

UNLOCK TABLES;

/*Table structure for table `warden_action` */

DROP TABLE IF EXISTS `warden_action`;

CREATE TABLE `warden_action` (
  `wardenId` smallint unsigned NOT NULL,
  `action` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`wardenId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `warden_action` */

LOCK TABLES `warden_action` WRITE;

UNLOCK TABLES;

/*Table structure for table `worldstates` */

DROP TABLE IF EXISTS `worldstates`;

CREATE TABLE `worldstates` (
  `entry` int unsigned NOT NULL DEFAULT '0',
  `value` int unsigned NOT NULL DEFAULT '0',
  `comment` tinytext,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Variable Saves';

/*Data for the table `worldstates` */

LOCK TABLES `worldstates` WRITE;

insert  into `worldstates`(`entry`,`value`,`comment`) values 
(1368,1,NULL),
(3781,8818177,NULL),
(3801,0,NULL),
(3802,1,NULL),
(5332,600000,NULL),
(5334,1,NULL),
(5344,0,NULL),
(5384,0,NULL),
(5385,1,NULL),
(5387,1,NULL),
(5546,0,NULL),
(5547,0,NULL),
(7523,1,NULL),
(12562,1,NULL),
(20001,1750503600,'NextArenaPointDistributionTime'),
(20002,1750667994,'NextWeeklyQuestResetTime'),
(20003,1750132800,'NextBGRandomDailyResetTime'),
(20004,0,'cleaning_flags'),
(20006,1750132800,NULL),
(20007,1751320800,NULL),
(20008,174,NULL),
(20009,15,NULL),
(20050,7,NULL);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
