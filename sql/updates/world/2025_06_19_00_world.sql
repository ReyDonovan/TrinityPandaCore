DELETE FROM `trinity_string` WHERE `entry` IN (1204, 1205);
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES
(1204, 'You have entered areatrigger %u.'),
(1205, 'You have left areatrigger %u.');

-- Change implicit target from Kulan's Spear to Lightning Ritual Bunny
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=136789 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=31 AND `ConditionTarget`=0 AND `ConditionValue1`=3 AND `ConditionValue2`=69367 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (13, 1, 136789, 0, 0, 31, 0, 3, 69369, 0, 0, 0, 0, '', 'Shan`ze Thundercaller - Call of Thunder');