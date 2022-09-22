update `creature_template` set `npcflag`= 3 where `entry`= 59058;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=73066 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=31 AND `ConditionTarget`=0 AND `ConditionValue1`=3 AND `ConditionValue2`=38855 AND `ConditionValue3`=0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=38855 AND `source_type`=0 AND `id`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(38855,0,1,0,9,0,100,0,0,100,12000,15000,11,73097,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Volcanic Breath on Close');

-- Fixxul Lonelyheart
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=66281;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(66281,0,0,0,0,0,100,0,0,0,3400,4700,11,12471,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(66281,0,1,0,0,0,100,1,1000,1000,1000,1000,11,131488,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Summon Imp');

update `creature_template` set `npcflag`= 0, `VehicleId`= 0 where `entry`= 59037;

DELETE FROM `gossip_menu_option` WHERE `menu_id` in (13250,13281,13510,13509);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`) VALUES
(13250, 0, 0, 'He traído los objetos para la ceremonia.', 55031, 1, 1),
(13250, 1, 0, 'Vengo de la Alianza. Queremos ser sus aliados, no sus enemigos.', 58051, 1, 1),
(13510, 0, 0, 'Mis amigos y yo venimos en son de paz.', 58050, 1, 1),
(13281, 0, 1, 'Deja que eche un vistazo a tus mercancías.', 67573, 3, 128),
(13281, 1, 0, '¿Qué estás haciendo?', 58049, 1, 1),
(13509, 0, 0, 'Danos una oportunidad para demostrar nuestra amistad. No les deseamos ningún mal.', 58048, 1, 1);

DELETE FROM `gossip_menu` WHERE `entry` in (13250,13281,13510,13509);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(13250, 19305), -- 54960
(13250, 19280), -- 54960
(13250, 18684), -- 54960
(13281, 18777), -- 56693
(13510, 19255), -- 56690
(13509, 19924); -- 59058


update `creature_template` set `gossip_menu_id`= 13250, `AIName`= 'SmartAI', `ScriptName`= '' where `entry`= 54960;
update `creature_template` set `gossip_menu_id`= 13510, `AIName`= 'SmartAI', `ScriptName`= '' where `entry`= 56690;
update `creature_template` set `gossip_menu_id`= 13281, `AIName`= 'SmartAI', `ScriptName`= '' where `entry`= 56693;
update `creature_template` set `gossip_menu_id`= 13509, `AIName`= 'SmartAI', `ScriptName`= '' where `entry`= 59058;

DELETE FROM `smart_scripts` WHERE `entryorguid`=54960 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(54960, 0, 0, 1, 62, 0, 100, 0, 13250, 1, 0, 0, 33, 54960, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(54960, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(54960, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `smart_scripts` WHERE `entryorguid`=56690 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56690, 0, 0, 1, 62, 0, 100, 0, 13510, 0, 0, 0, 33, 56690, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(56690, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(56690, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `smart_scripts` WHERE `entryorguid`=56693 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56693, 0, 0, 1, 62, 0, 100, 0, 13281, 1, 0, 0, 33, 56693, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(56693, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(56693, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `smart_scripts` WHERE `entryorguid`=59058 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(59058, 0, 0, 1, 62, 0, 100, 0, 13509, 0, 0, 0, 33, 59058, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(59058, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(59058, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `creature_text` WHERE `Entry`=56693;
DELETE FROM `creature_text` WHERE `Entry`=59058;
DELETE FROM `creature_text` WHERE `Entry`=56690;
DELETE FROM `creature_text` WHERE `Entry`=54960;
INSERT INTO `creature_text` (`Entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `comment`) VALUES 
(56693, 0, 0, 'Ah, you must be the outsider. Sadly, I am making weapons for war. Once, not long ago, I made instruments for prayer and celebration. It is this war that makes everyone stand on edge.', 12, 0, 100, 0, 0, 0, 58057, 'От-Теммдо to Player'),
(59058, 0, 0, 'You brought back the instruments just in time, $n. The Elder is ready to perform the waterspeaking ceremony.', 12, 0, 100, 0, 0, 0, 58104, 'Хранитель жемчужин Фуцзинь to Player'),
(59058, 1, 0, 'No harm? Pah! Many thousand years ago, the Pearlfin Tribe stood on the throne of all Pandaria. Now, this village is all that is left of our people, all because we trusted a tribe of outsiders... the hozen.', 12, 0, 100, 0, 0, 0, 58055, 'Хранитель жемчужин Фуцзинь to Player'),
(56690, 0, 0, 'Action speaks louder than intent, stranger. My warriors intend to seek retribution, but only practice will make it so. Now go away. We are busy.', 12, 0, 100, 0, 0, 0, 58063, 'Инструктор Острый Гребень to Player'),
(56690, 1, 0, 'STRIKE!', 14, 0, 100, 36, 0, 0, 55609, 'Инструктор Острый Гребень'),
(54960, 0, 0, 'Stranger, have you ever seen a stone fall into a calm lake? Every action creates a ripple, even accepting a pledge of friendship. I shall think upon your request.', 12, 0, 100, 0, 0, 0, 58066, 'Старейшина Лушань to Player'),
(54960, 1, 0, 'Today, our friendship is cemented with the Alliance! Today, we go forth as brothers and sisters. To our new future!', 12, 0, 100, 0, 0, 0, 58231, 'Старейшина Лушань to Player');

update `creature_template` set `AIName`= 'SmartAI' where `entry`= 55283;
DELETE FROM `smart_scripts` WHERE `entryorguid`=55283 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(55283, 0, 0, 0, 19, 0, 100, 0, 29727, 0, 0, 0, 208, 29727, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'hack fix');

DELETE FROM `spell_script_names` WHERE `spell_id` = 69041;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (69041, 'spell_gen_rocket_barrage');

delete from `creature_text` where `entry` = '49869';
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(49869, 0, 0, 'I need a heal!', '', 0, 12, 0, 100, 0, 0, 0, 49898, 'Infanterist'),
(49869, 0, 1, 'HELP!', '', 0, 12, 0, 100, 0, 0, 0, 49897, 'Infanterist'),
(49869, 0, 2, 'Make yourself useful and heal me!', '', 0, 12, 0, 100, 0, 0, 0, 49896, 'Infanterist'),
(49869, 0, 3, 'I could use a heal, brother!', '', 0, 12, 0, 100, 0, 0, 0, 49895, 'Infanterist');

/*Text for Creature(Blackrock Invader) Entry 42937*/
delete from `creature_text` where `entry` = '42937';
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(42937, 0, 0, 'Orc KILL human!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(42937, 0, 1, 'Blackrock take forest!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(42937, 0, 2, 'The grapes were VERY TASTY!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(42937, 0, 3, 'Eat you!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(42937, 0, 4, 'Beg for life!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text');

/*Text for Creature(Blackrock Spy) Entry 49874*/
delete from `creature_text` where `entry` = '49874';
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(49874, 0, 0, 'Orc KILL human!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(49874, 0, 1, 'Blackrock take forest!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(49874, 0, 2, 'The grapes were VERY TASTY!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text');

/*Text for Creature(Scarlet Warrior) Entry 1535*/
delete from `creature_text` where `entry` = '1535';
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `text_female`, `TextRange`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `comment`) VALUES
(1535, 0, 0, 'The light condemns all who harbor evil. Now you will die!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(1535, 0, 1, 'You carry the taint of the scourge. Prepare to enter the twisting nether.', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(1535, 0, 2, 'The Scarlet Crusade shall smite the wicked and drive evil from these lands!', '', 0, 12, 0, 50, 0, 0, 0, 0, 'on Aggro Text'),
(1535, 1, 0, '%s attempts to run away in fear!', '', 0, 16, 0, 100, 0, 0, 0, 0, 'combat Flee');

update `creature` SET `position_x` = -132.0905, `position_y` = -1564.7851, `position_z` = 72.8406 WHERE `id` = 66301;

UPDATE `creature_template` SET `ScriptName` = 'npc_prince_anduin_decision_questgiver' WHERE `entry` = 56434;
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry` = 56434;

UPDATE `creature_template` SET `ScriptName` = '' where `entry` IN (56206, 56209, 56210);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (56206, 56209, 56210);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56206, 0, 0, 1, 62, 0, 100, 0, 13225, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gossip Select - Say Text 0'),
(56206, 0, 1, 5, 61, 0, 100, 0, 0, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Set Faction 14'),
(56206, 0, 2, 3, 2, 0, 100, 0, 1, 10, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'HP 10% - Set Faction 35'),
(56206, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Say Text 1'),
(56206, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 56206, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Kill Credit'),
(56206, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Attack Invoker'),
(56206, 0, 6, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 113504, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - CastSpell'),
(56206, 0, 7, 0, 0, 0, 100, 0, 4000, 4000, 4000, 4000, 11, 109497, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - CastSpell'),
(56206, 0, 8, 0, 11, 0, 100, 1, 0, 0, 0, 0, 42, 0, 5, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spawn - Set Invincibility Hp 5%'),
(56210, 0, 0, 1, 62, 0, 100, 0, 13227, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gossip Select - Say Text 0'),
(56210, 0, 1, 5, 61, 0, 100, 0, 0, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Set Faction 14'),
(56210, 0, 2, 3, 2, 0, 100, 0, 1, 10, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'HP 10% - Set Faction 35'),
(56210, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Say Text 1'),
(56210, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 56210, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Kill Credit'),
(56210, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Attack Invoker'),
(56210, 0, 6, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 105091, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - CastSpell'),
(56210, 0, 7, 0, 0, 0, 100, 0, 4000, 4000, 4000, 4000, 11, 104909, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - CastSpell'),
(56210, 0, 8, 0, 11, 0, 100, 1, 0, 0, 0, 0, 42, 0, 5, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spawn - Set Invincibility Hp 5%'),
(56209, 0, 0, 1, 62, 0, 100, 0, 13226, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gossip Select - Say Text 0'),
(56209, 0, 1, 5, 61, 0, 100, 0, 0, 0, 0, 0, 2, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Set Faction 14'),
(56209, 0, 2, 3, 2, 0, 100, 0, 1, 10, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'HP 10% - Set Faction 35'),
(56209, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Say Text 1'),
(56209, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 56209, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Kill Credit'),
(56209, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 49, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Attack Invoker'),
(56209, 0, 6, 0, 0, 0, 100, 0, 10000, 10000, 10000, 10000, 11, 17207, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - CastSpell'),
(56209, 0, 7, 0, 0, 0, 100, 0, 4000, 4000, 4000, 4000, 11, 106763, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'IC - CastSpell'),
(56209, 0, 8, 0, 11, 0, 100, 1, 0, 0, 0, 0, 42, 0, 5, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spawn - Set Invincibility Hp 5%');

DELETE FROM `conditions` WHERE `SourceGroup`  IN (13225, 13226, 13227);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 13225, 0, 0, 0, 9, 0, 29920, 0, 0, 0, 0, '', 'Show gossip option if Player has Quest 29920 taken'),
(15, 13226, 0, 0, 0, 9, 0, 29920, 0, 0, 0, 0, '', 'Show gossip option if Player has Quest 29920 taken'),
(15, 13227, 0, 0, 0, 9, 0, 29920, 0, 0, 0, 0, '', 'Show gossip option if Player has Quest 29920 taken');

DELETE FROM `conditions` WHERE `SourceEntry`=56464;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, 56464, 0, 0, 9, 0, 29929, 0, 0, 0, 0, '', 'SAI if have Quest 29929');

DELETE FROM `smart_scripts` WHERE `entryorguid`=56464;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(56464, 0, 0, 1, 64, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On GossipHello - Talk'),
(56464, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 33, 56464, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On Talk - Kcredit'),
(56464, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 9, 0, 0, 0, 0, 0, 0, 15, 211771, 5, 0, 0, 0, 0, 0, 'On Kc - Act GOB'),
(56464, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On Act GOB - Despawn');

DELETE FROM `creature_text` WHERE `Entry`=56464;
INSERT INTO `creature_text` (`Entry`, `GroupID`, `ID`, `Text`, `text_female`, `TextRange`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `comment`) VALUES 
(56464, 0, 3, 'Woah... get away from me, crazy... spider-thing!', '', 0, 12, 0, 100, 0, 0, 0, 55141, ''),
(56464, 0, 2, 'Oh, I was just resting... I rest sometimes... under rocks...', '', 0, 12, 0, 100, 0, 0, 0, 55186, ''),
(56464, 0, 1, 'Much obliged, stranger.', '', 0, 12, 0, 100, 0, 0, 0, 55181, ''),
(56464, 0, 0, 'Ahh, get these things away from me!', '', 0, 12, 0, 100, 0, 0, 0, 55144, ''),
(56464, 0, 4, 'Oof, that\'s better... How\'s my hair?', '', 0, 12, 0, 100, 0, 0, 0, 55182, '');

UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 58363;

update `gameobject_template` set `AIName`= 'SmartGameObjectAI' where `entry` in (209885,209888,209889,209890);

DELETE FROM `smart_scripts` WHERE `entryorguid` in (209885,209888,209889,209890) AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(209885, 1, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 56457, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(209888, 1, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 56458, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(209889, 1, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 56459, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, ''),
(209890, 1, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 56460, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

UPDATE `creature_template` SET `gossip_menu_id` = 13109, `npcflag` = 1, `AIName` = 'SmartAI' WHERE `entry` = 55267;

DELETE FROM `npc_text` WHERE `ID`=18422;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `BroadcastTextID0`, `BroadcastTextID1`, `BroadcastTextID2`, `BroadcastTextID3`, `BroadcastTextID4`, `BroadcastTextID5`, `BroadcastTextID6`, `BroadcastTextID7`, `VerifiedBuild`) VALUES 
(18422, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 53677, 0, 0, 0, 0, 0, 0, 0, 27366);

DELETE FROM `gossip_menu` WHERE `Entry`=13109;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (13109, 18422);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=13109;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES 
(13109, 0, 0, 'It\'s safe now.  You can come down.', NULL, 53675, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);

DELETE FROM `conditions` WHERE `SourceEntry`=55267;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(14, 55267, 55267, 0, 0, 9, 0, 30150, 0, 0, 0, 0, '', 'Gossip if have Quest 30150');

DELETE FROM `smart_scripts` WHERE `entryorguid`=55267;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(55267, 0, 0, 0, 62, 0, 100, 0, 13109, 0, 0, 0, 85, 103181, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On SelectGossip - Cast Spell'),
(55267, 0, 1, 0, 62, 0, 100, 0, 13109, 0, 0, 0, 11, 77980, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On SelectGossip - Cast Spell');

DELETE FROM `conditions` WHERE `SourceEntry` = 110171;

DELETE FROM `creature_questender` WHERE `quest` = 31771;
INSERT INTO `creature_questender` (id, quest) VALUES (66665, 31771);

UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `npcflag` = 3, `AIName` = 'SmartAI' WHERE `entry` = 55368;

DELETE FROM `creature_template` WHERE `entry` IN (55380);
INSERT INTO `creature_template`(`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `difficulty_entry_4`, `difficulty_entry_5`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `npcflag`, `npcflag2`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `VignetteID`, `TrackingQuestID`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(55380, 0, 0, 0, 0, 0, 0, 0, 43669, 43256, 0, 0, 'Estatua de jade sospechosa', NULL, 'Inspect', 0, 90, 90, 4, 0, 35, 35, 1, 0, 1, 1.14286, 1, 0, 0, 0, 0, 0, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'SmartAI', 0, 3, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '', 18414);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (55381, 55380);
INSERT INTO `smart_scripts`(`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(55381, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 55381, 0, 0, 0, 0, 0, 17, 0, 100, 0, 0, 0, 0, 0, '[Kill]OnSpeak'),
(55381, 0, 1, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 55381, 0, 0, 0, 0, 0, 17, 0, 100, 0, 0, 0, 0, 0, '[Kill]OnSpeak'),
(55380, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 55380, 0, 0, 0, 0, 0, 17, 0, 100, 0, 0, 0, 0, 0, '[Kill]OnSpeak');

DELETE FROM `creature` WHERE `guid` IN (582664);
INSERT INTO `creature`(`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES 
(582664, 55380, 870, 0, 0, 1, 67108865, 0, 0, 1514.21, -1275.23, 246.188, 3.33544, 300, 0, 0, 0, 393941, 0, 0, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `npcflag` = 1, `AIName` = 'SmartAI' WHERE `entry` = 55378;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (61694);
INSERT INTO `smart_scripts`(`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(61694, 0, 0, 0, 64, 0, 100, 0, 0, 0, 0, 0, 33, 61694, 0, 0, 0, 0, 0, 17, 0, 100, 0, 0, 0, 0, 0, '[Kill]OnSpeak');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 61694;

UPDATE `creature_template` SET `ScriptName` = 'npc_wild_townlong_yak_61635' WHERE `entry` = 61635;
UPDATE `creature_template_addon` SET `auras` = '' WHERE `entry` = 61635;

update `creature_template` set `ScriptName`= 'npc_brawlers_guild_bizmo' where `entry`= 68323;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_brawlgar_arena_grunt' where `entry`= 67267;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_brawlgar_arena_grunt' where `entry`= 68408;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_boss_bazzelflange' where `entry`= 67260;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_bruce' where `entry`= 67262;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_vian_the_volatile' where `entry`= 67579;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_volatile_flame' where `entry`= 68379;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_fire_line' where `entry`= 67773;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_goredome' where `entry`= 68257;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_dungeon_master_vishas' where `entry`= 67572;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_dippy' where `entry`= 68255;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_kirrawk' where `entry`= 67269;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_twister' where `entry`= 67270;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_fran' where `entry`= 67525;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_riddoh' where `entry`= 67524;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_goblin_land_mine' where `entry`= 67539;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_king_kulaka' where `entry`= 68254;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_blat' where `entry`= 67594;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_sanoriak' where `entry`= 67268;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_ixx' where `entry`= 68253;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_mazhareen' where `entry`= 68251;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_crush' where `entry`= 67540;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_leona_earthwind' where `entry`= 68377;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_dominika_the_illusionist' where `entry`= 67485;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_dominika_illusion' where `entry`= 67489;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_deeken' where `entry`= 67451;
update `creature_template` set `ScriptName`= 'npc_brawlers_shock_field' where `entry`= 67459;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_millie_watt' where `entry`= 67591;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_fjoll' where `entry`= 67596;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_proboskus' where `entry`= 68252;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_lepregnomes' where `entry`= 67515;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_lepregnomes' where `entry`= 67514;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_lepregnomes' where `entry`= 67513;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_lepregnomes' where `entry`= 67511;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_lepregnomes' where `entry`= 67516;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_yikkan_izu' where `entry`= 68256;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_izus_raven' where `entry`= 68268;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_akama' where `entry`= 67588;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_smash_hoofstomp' where `entry`= 68305;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_good_luck_goblin' where `entry`= 68306;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_unguloxx' where `entry`= 68250;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_gg_ingeenering' where `entry`= 67488;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_gg_ingeenering' where `entry`= 67487;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_dark_summoner' where `entry`= 67678;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_tormented_ghost' where `entry`= 67664;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_battletron' where `entry`= 67424;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_unstable_mine' where `entry`= 67422;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_meatball' where `entry`= 67573;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_mecha_bruce' where `entry`= 71081;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_grandpa_grumplefloot' where `entry`= 70678;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_blingtron_3000' where `entry`= 70740;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_gnomish_tesla_coil' where `entry`= 70743;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_blingtron_2000' where `entry`= 70802;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_card_traider' where `entry`= 70752;
update `creature_template` set `ScriptName`= 'npc_brawlers_guild_card_traider' where `entry`= 70751;


DELETE FROM `spell_script_names` WHERE `spell_id` in (132633,133607,134527,132668,133219,134777,133119,133290,124860,134789,133162,133154,133212,133015,133018,132629,132666,134534,133344,135379,135376,133465,142795,140969,141059,141059,141335,141065);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES 
(132633, 'spell_brawlers_guild_join_to_arena'),
(133607, 'spell_brawlers_guild_fire_line'),
(134527, 'spell_brawlers_guild_lumbering_charge'),
(132668, 'spell_brawlers_guild_twister_aura'),
(133219, 'spell_brawlers_guild_goblin_land_mines'),
(134777, 'spell_brawlers_guild_devastating_thrust'),
(133119, 'spell_brawlers_guild_illusionist'),
(133290, 'spell_brawlers_guild_illusionist'),
(124860, 'spell_brawlers_guild_rain_dance'),
(134789, 'spell_brawlers_guild_fallen_kin'),
(133162, 'spell_brawlers_guild_emergency_teleport'),
(133154, 'spell_brawlers_guild_energy_shielding'),
(133212, 'spell_brawlers_guild_goblin_rocket_barrage'),
(133015, 'spell_brawlers_guild_conjure_unstable_mines'),
(133018, 'spell_brawlers_guild_protected_by_unstable_mines'),
(132629, 'spell_brawlers_guild_ring_of_valor_teleport_in'),
(132666, 'spell_brawlers_guild_flamewall'),
(134534, 'spell_brawlers_guild_rageful_spirit'),
(133344, 'spell_brawlers_guild_dark_barrage'),
(135379, 'spell_brawlers_guild_angry_enthusiast_selector'),
(135376, 'spell_brawlers_guild_bottled'),
(133465, 'spell_brawlers_guild_summon_ghost'),
(142795, 'spell_brawlers_guild_better_stronger_faster'),
(140969, 'spell_brawlers_guild_luckydo_nt_launcher'),
(141059, 'spell_brawlers_guild_overcharged'),
(141059, 'spell_brawlers_guild_overcharged_aura'),
(141335, 'spell_brawlers_guild_chain_lightning_visual'),
(141065, 'spell_brawlers_guild_overcharging_tesla_coil');


-- Alianza
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   35, `faction_H`=   35, `npcflag`=    0, `unit_flags`= 33554688, `unit_flags2`= 4196354 where `entry`= 66305;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`= 2259, `faction_H`= 2259, `npcflag`=    0, `unit_flags`=    33536, `unit_flags2`= 4196352 where `entry`= 68323;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    0, `unit_flags`=        0, `unit_flags2`=    2048 where `entry`= 68405;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    0, `unit_flags`=        0, `unit_flags2`=    2048 where `entry`= 68406;
update `creature_template` set `gossip_menu_id`= 15284, `faction_A`=  123, `faction_H`=  123, `npcflag`=    0, `unit_flags`=      768, `unit_flags2`=    2048 where `entry`= 68408;
update `creature_template` set `gossip_menu_id`= 15314, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=  131, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 68526;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    0, `unit_flags`=      768, `unit_flags2`=    2048 where `entry`= 68535;
update `creature_template` set `gossip_menu_id`= 15319, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    1, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 68537;
update `creature_template` set `gossip_menu_id`= 15317, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    1, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 68539;
update `creature_template` set `gossip_menu_id`= 15318, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    1, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 68540;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   35, `faction_H`=   35, `npcflag`=    0, `unit_flags`= 33554432, `unit_flags2`=    2048 where `entry`= 68541;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    0, `unit_flags`=        0, `unit_flags2`=    2048 where `entry`= 68764;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   12, `faction_H`=   12, `npcflag`=    1, `unit_flags`=    33536, `unit_flags2`=    2048 where `entry`= 68768;
update `creature_template` set `gossip_menu_id`= 20839, `faction_A`=   12, `faction_H`=   12, `npcflag`= 4224, `unit_flags`=        0, `unit_flags2`=    2048 where `entry`= 68792;
update `creature_template` set `gossip_menu_id`= 15352, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    1, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 68796;
update `creature_template` set `gossip_menu_id`= 15353, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    1, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 68797;
update `creature_template` set `gossip_menu_id`= 15354, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    1, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 68798;
update `creature_template` set `gossip_menu_id`= 15355, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    1, `unit_flags`=    33536, `unit_flags2`=    2048 where `entry`= 68799;
update `creature_template` set `gossip_menu_id`= 15356, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    1, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 68801;
update `creature_template` set `gossip_menu_id`= 15358, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    1, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 68803;
update `creature_template` set `gossip_menu_id`= 20844, `faction_A`= 2618, `faction_H`= 2618, `npcflag`=    0, `unit_flags`=        0, `unit_flags2`=    2048 where `entry`= 68963;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    0, `unit_flags`=        0, `unit_flags2`=    2048 where `entry`= 68992;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    0, `unit_flags`=        0, `unit_flags2`=    2048 where `entry`= 68994;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`= 1078, `faction_H`= 1078, `npcflag`=    0, `unit_flags`=        0, `unit_flags2`=    2048 where `entry`= 70354;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   35, `faction_H`=   35, `npcflag`=  640, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 70719;
update `creature_template` set `gossip_menu_id`= 15625, `faction_A`=   35, `faction_H`=   35, `npcflag`=    1, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 70720;
update `creature_template` set `gossip_menu_id`= 15623, `faction_A`=   35, `faction_H`=   35, `npcflag`=    1, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 70721;
update `creature_template` set `gossip_menu_id`= 15624, `faction_A`=   35, `faction_H`=   35, `npcflag`=    1, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 70722;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   35, `faction_H`=   35, `npcflag`=  640, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 70723;
update `creature_template` set `gossip_menu_id`= 15682, `faction_A`=   84, `faction_H`=   84, `npcflag`=  131, `unit_flags`=    32768, `unit_flags2`=    2048 where `entry`= 70752;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   84, `faction_H`=   84, `npcflag`=    0, `unit_flags`=        0, `unit_flags2`=    2048 where `entry`= 73642;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   35, `faction_H`=   35, `npcflag`=    0, `unit_flags`=        0, `unit_flags2`=    2048 where `entry`= 73645;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   35, `faction_H`=   35, `npcflag`=    0, `unit_flags`=        0, `unit_flags2`=    2048 where `entry`= 73646;
update `creature_template` set `gossip_menu_id`= 20840, `faction_A`=   80, `faction_H`=   80, `npcflag`= 4224, `unit_flags`=        0, `unit_flags2`=    2048 where `entry`= 68363;




delete from `gossip_menu` where `entry` in (15284,15314,15317,15318,15319,15352,15353,15354,15355,15356,15358,15623,15624,15625,15682,20839,20840,20844);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES 
(15284, 21717),(15284, 22450),(15314, 21983),(15317, 21974),(15318, 21979),(15319, 21982),(15352, 22028),(15353, 22029),(15354, 22030),(15355, 22031),(15356, 22032),(15358, 22106),(15623, 22459),(15624, 22460),(15625, 22461),(15682, 22527),
(20839, 30874),(20844, 31312),(20844, 31314),(20840,30873);

delete from `gossip_menu_option` where `menu_id` in (15284,15314,15682,20839,20840);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `OptionBroadcastTextID`, `BoxBroadcastTextID`) VALUES 
(15284, 0, 0, 'Yes, put me on the list of participants!', 1, 1, 0, 0, 0, 0, '', 68839, 0),
(15314, 0, 1, 'Let me browse your wares.', 3, 128, 0, 0, 0, 0, '', 67573, 0),
(15682, 0, 0, 'I\'d like to purchase a challenge card.', 1, 1, 0, 0, 0, 0, '', 73714, 0),
(20839, 0, 1, 'Let me browse your wares.', 3, 128, 0, 0, 0, 0, '', 67573, 0),
(20840, 0, 1, 'Let me browse your wares.', 3, 128, 0, 0, 0, 0, '', 67573, 0);

update `creature` set `npcflag`= 1 where `guid`= 552184;

-- Horda
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=     35, `faction_H`=     35, `npcflag`=   0, `unit_flags`= 33554688, `unit_flags2`= 4196354 where `entry`= 66305;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 67260;
update `creature_template` set `gossip_menu_id`= 15284, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=      768, `unit_flags2`=       0 where `entry`= 67267;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 68403;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 68404;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 68765;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`= 128, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 68794;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 68807;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 68808;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 68810;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 68811;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 68990;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 68991;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`= 128, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 70713;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`= 128, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 70714;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 70716;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 70718;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 70726;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=     35, `faction_H`=     35, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 70738;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`= 130, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 70751;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 70790;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 71467;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 72254;
update `creature_template` set `gossip_menu_id`=     0, `faction_A`=   1801, `faction_H`=   1801, `npcflag`=   0, `unit_flags`=        0, `unit_flags2`=       0 where `entry`= 73639;


update `creature` set `npcflag`= 1 where `guid`= 552216;


DELETE FROM `npc_vendor` WHERE `entry`=70751;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 143899, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142045, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142044, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142043, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142042, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142041, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142039, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142038, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142037, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142036, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142035, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142033, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142032, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142031, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142030, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142029, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142028, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 142026, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 97566, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 97289, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 97285, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 97283, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 94182, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 94181, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 94178, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 94177, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 94174, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 94167, 0, 0, 0, 1);
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES (70751, 0, 94162, 0, 0, 0, 1);

DELETE FROM `npc_trainer` WHERE `entry`=7232;
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2020, 10, 164, 0, 5);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2021, 500, 164, 50, 10);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2661, 100, 164, 35, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2662, 50, 164, 1, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2664, 500, 164, 90, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2665, 100, 164, 65, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2666, 200, 164, 70, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2668, 300, 164, 105, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2670, 500, 164, 105, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2672, 500, 164, 120, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2674, 1000, 164, 125, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2675, 1000, 164, 145, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2737, 50, 164, 15, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2738, 50, 164, 20, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2739, 50, 164, 25, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2740, 200, 164, 110, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2741, 200, 164, 115, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 2742, 200, 164, 120, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3116, 100, 164, 65, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3117, 1000, 164, 125, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3292, 500, 164, 95, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3293, 250, 164, 35, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3294, 500, 164, 70, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3296, 1000, 164, 130, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3319, 50, 164, 20, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3320, 100, 164, 25, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3323, 100, 164, 40, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3324, 200, 164, 45, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3326, 250, 164, 75, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3328, 500, 164, 110, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3331, 500, 164, 130, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3333, 1000, 164, 135, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3337, 1000, 164, 125, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3491, 600, 164, 105, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3501, 1000, 164, 165, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3502, 1250, 164, 170, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3506, 5000, 164, 155, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3508, 7500, 164, 180, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 3539, 5000, 164, 125, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 6517, 800, 164, 110, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 7223, 1000, 164, 185, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 7408, 300, 164, 65, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 7817, 200, 164, 95, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 8768, 250, 164, 150, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 8880, 100, 164, 30, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9786, 50000, 164, 200, 35);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9916, 2500, 164, 200, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9918, 2500, 164, 200, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9920, 2500, 164, 200, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9921, 2500, 164, 200, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9926, 5000, 164, 205, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9928, 5000, 164, 205, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9931, 5000, 164, 210, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9935, 5000, 164, 215, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9959, 15000, 164, 230, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9961, 15000, 164, 230, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9968, 20000, 164, 235, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9983, 100, 164, 30, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9985, 250, 164, 125, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9986, 500, 164, 130, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9987, 500, 164, 135, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 9993, 10000, 164, 210, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 10001, 15000, 164, 230, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 15972, 7500, 164, 180, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16639, 10000, 164, 250, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16640, 10000, 164, 250, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16641, 10000, 164, 250, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16642, 10000, 164, 250, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16643, 10000, 164, 250, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16644, 10000, 164, 255, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16646, 10000, 164, 265, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16647, 10000, 164, 265, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16649, 10000, 164, 270, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16652, 10000, 164, 280, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16653, 10000, 164, 280, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16657, 10000, 164, 295, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16658, 10000, 164, 295, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16662, 12000, 164, 300, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16663, 12000, 164, 300, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16730, 12000, 164, 300, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16969, 15000, 164, 275, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 16971, 15000, 164, 280, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 19666, 100, 164, 100, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 19667, 250, 164, 150, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 19668, 2500, 164, 200, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 19669, 10000, 164, 275, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29545, 15000, 164, 300, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29547, 15000, 164, 305, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29548, 20000, 164, 315, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29549, 20000, 164, 315, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29550, 25000, 164, 325, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29551, 15000, 164, 300, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29552, 18000, 164, 310, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29553, 20000, 164, 315, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29556, 22000, 164, 320, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29557, 18000, 164, 310, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29558, 20000, 164, 315, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29565, 22000, 164, 320, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29654, 15000, 164, 300, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 29845, 100000, 164, 275, 50);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 32284, 25000, 164, 325, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 34607, 15000, 164, 300, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 51298, 350000, 164, 350, 65);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 52567, 30000, 164, 370, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 52568, 30000, 164, 350, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 52569, 30000, 164, 350, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 52570, 30000, 164, 375, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 52571, 30000, 164, 370, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 52572, 30000, 164, 360, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54550, 30000, 164, 360, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54551, 40000, 164, 395, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54552, 40000, 164, 400, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54553, 40000, 164, 400, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54554, 40000, 164, 395, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54555, 40000, 164, 405, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54556, 40000, 164, 405, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54557, 40000, 164, 390, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54917, 30000, 164, 375, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54918, 30000, 164, 380, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54941, 30000, 164, 385, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54944, 30000, 164, 385, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54945, 35000, 164, 390, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54946, 30000, 164, 395, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54947, 35000, 164, 395, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54948, 30000, 164, 400, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 54949, 30000, 164, 400, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55013, 40000, 164, 390, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55014, 35000, 164, 410, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55015, 40000, 164, 415, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55017, 40000, 164, 410, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55055, 40000, 164, 395, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55056, 40000, 164, 400, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55057, 40000, 164, 405, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55058, 45000, 164, 415, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55174, 50000, 164, 390, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55177, 50000, 164, 395, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55179, 50000, 164, 400, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55181, 50000, 164, 405, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55182, 40000, 164, 410, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55185, 45000, 164, 415, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55200, 35000, 164, 380, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55201, 35000, 164, 380, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55203, 35000, 164, 385, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55204, 35000, 164, 390, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55206, 40000, 164, 405, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55298, 45000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55300, 45000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55301, 45000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55302, 45000, 164, 425, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55303, 45000, 164, 425, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55304, 45000, 164, 425, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55305, 45000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55306, 45000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55307, 45000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55308, 45000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55309, 45000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55310, 45000, 164, 425, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55311, 45000, 164, 425, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55312, 45000, 164, 425, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55369, 180000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55370, 150000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55371, 150000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55372, 120000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55373, 120000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55374, 120000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55375, 120000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55376, 120000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55377, 120000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55628, 45000, 164, 400, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55641, 45000, 164, 400, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55656, 50000, 164, 415, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55834, 30000, 164, 360, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55835, 30000, 164, 370, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 55839, 42000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 56234, 150000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 56280, 40000, 164, 410, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 56357, 42000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 56400, 150000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 56549, 45000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 56550, 45000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 56551, 45000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 56552, 45000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 56553, 45000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 56554, 45000, 164, 425, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 56555, 45000, 164, 425, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 56556, 45000, 164, 425, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 59405, 30000, 164, 350, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 59406, 45000, 164, 430, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 59436, 40000, 164, 395, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 59438, 40000, 164, 400, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 59440, 40000, 164, 405, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 59441, 45000, 164, 415, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 59442, 40000, 164, 410, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 61008, 120000, 164, 425, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 61009, 120000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 61010, 120000, 164, 420, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 63182, 150000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76178, 15000, 164, 425, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76179, 40000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76180, 50000, 164, 450, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76181, 55000, 164, 460, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76182, 60000, 164, 470, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76258, 65000, 164, 480, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76259, 65000, 164, 490, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76260, 65000, 164, 490, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76261, 75000, 164, 500, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76262, 40000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76263, 50000, 164, 450, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76264, 55000, 164, 460, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76265, 60000, 164, 470, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76266, 65000, 164, 480, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76267, 65000, 164, 490, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76269, 75000, 164, 500, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76270, 75000, 164, 500, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76280, 40000, 164, 440, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76281, 50000, 164, 450, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76283, 55000, 164, 460, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76285, 60000, 164, 470, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76286, 65000, 164, 480, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76287, 65000, 164, 480, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76288, 65000, 164, 490, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76289, 75000, 164, 500, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76291, 50000, 164, 450, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76293, 60000, 164, 470, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76433, 50000, 164, 460, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76434, 60000, 164, 470, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76435, 65000, 164, 480, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76436, 65000, 164, 480, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76437, 65000, 164, 480, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76438, 60000, 164, 475, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76441, 65000, 164, 490, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76474, 60000, 164, 470, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 76667, 500000, 164, 425, 75);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 110398, 685714, 164, 500, 80);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122576, 91428, 164, 550, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122577, 91428, 164, 540, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122578, 91428, 164, 550, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122579, 91428, 164, 525, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122580, 91428, 164, 530, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122581, 91428, 164, 500, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122582, 91428, 164, 530, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122583, 91428, 164, 525, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122633, 91428, 164, 500, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122635, 91428, 164, 540, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122636, 91428, 164, 545, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122637, 91428, 164, 545, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122638, 91428, 164, 545, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122639, 91428, 164, 560, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122640, 91428, 164, 565, 0);
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`) VALUES (7232, 122641, 91428, 164, 565, 0);

update `creature_template` set `gossip_menu_id`= 13074 where `entry`= 54697;
update `creature_template` set `gossip_menu_id`= 13104 where `entry`= 54854;
update `creature_template` set `gossip_menu_id`= 13105 where `entry`= 54913;
update `creature_template` set `gossip_menu_id`= 54914 where `entry`= 54914;
update `creature_template` set `gossip_menu_id`= 13101 where `entry`= 54917;
update `creature_template` set `gossip_menu_id`= 13100 where `entry`= 54922;
update `creature_template` set `gossip_menu_id`= 54924 where `entry`= 54924;
update `creature_template` set `gossip_menu_id`= 54944 where `entry`= 54944;
update `creature_template` set `gossip_menu_id`= 54990 where `entry`= 54990;
update `creature_template` set `gossip_menu_id`= 55009 where `entry`= 55009;
update `creature_template` set `gossip_menu_id`= 55201 where `entry`= 55201;
update `creature_template` set `gossip_menu_id`= 13561 where `entry`= 55209;
update `creature_template` set `gossip_menu_id`= 13110 where `entry`= 55234;
update `creature_template` set `gossip_menu_id`= 55283 where `entry`= 55283;
update `creature_template` set `gossip_menu_id`= 55490 where `entry`= 55490;
update `creature_template` set `gossip_menu_id`= 13374 where `entry`= 55809;
update `creature_template` set `gossip_menu_id`= 13208 where `entry`= 56032;
update `creature_template` set `gossip_menu_id`= 13284 where `entry`= 56062;
update `creature_template` set `gossip_menu_id`= 13291 where `entry`= 56065;
update `creature_template` set `gossip_menu_id`= 13229 where `entry`= 56066;
update `creature_template` set `gossip_menu_id`= 56222 where `entry`= 56222;
update `creature_template` set `gossip_menu_id`= 13247 where `entry`= 56315;
update `creature_template` set `gossip_menu_id`= 13563 where `entry`= 56345;
update `creature_template` set `gossip_menu_id`= 13296 where `entry`= 56768;
update `creature_template` set `gossip_menu_id`= 13299 where `entry`= 56774;
update `creature_template` set `gossip_menu_id`= 13298 where `entry`= 56775;
update `creature_template` set `gossip_menu_id`= 13297 where `entry`= 56776;
update `creature_template` set `gossip_menu_id`= 14628 where `entry`= 56777;
update `creature_template` set `gossip_menu_id`= 13782 where `entry`= 56778;
update `creature_template` set `gossip_menu_id`= 13558 where `entry`= 57314;
update `creature_template` set `gossip_menu_id`= 13396 where `entry`= 58225;
update `creature_template` set `gossip_menu_id`= 13397 where `entry`= 58228;
update `creature_template` set `gossip_menu_id`= 13433 where `entry`= 58413;
update `creature_template` set `gossip_menu_id`= 14941 where `entry`= 58414;
update `creature_template` set `gossip_menu_id`= 14482 where `entry`= 58743;
update `creature_template` set `gossip_menu_id`= 14457 where `entry`= 58818;
update `creature_template` set `gossip_menu_id`= 14459 where `entry`= 58962;
update `creature_template` set `gossip_menu_id`= 13185 where `entry`= 59178;
update `creature_template` set `gossip_menu_id`= 13557 where `entry`= 59387;
update `creature_template` set `gossip_menu_id`= 13548 where `entry`= 59391;
update `creature_template` set `gossip_menu_id`= 13550 where `entry`= 59392;
update `creature_template` set `gossip_menu_id`= 13549 where `entry`= 59395;
update `creature_template` set `gossip_menu_id`= 13551 where `entry`= 59397;
update `creature_template` set `gossip_menu_id`= 13553 where `entry`= 59401;
update `creature_template` set `gossip_menu_id`=  6944 where `entry`= 59732;
update `creature_template` set `gossip_menu_id`= 13651 where `entry`= 59908;
update `creature_template` set `gossip_menu_id`= 60013 where `entry`= 60994;
update `creature_template` set `gossip_menu_id`=  6944 where `entry`= 61122;
update `creature_template` set `gossip_menu_id`= 61492 where `entry`= 61492;
update `creature_template` set `gossip_menu_id`= 13808 where `entry`= 61640;
update `creature_template` set `gossip_menu_id`= 14649 where `entry`= 62321;
update `creature_template` set `gossip_menu_id`=  9868 where `entry`= 62322;
update `creature_template` set `gossip_menu_id`=  9868 where `entry`= 62867;
update `creature_template` set `gossip_menu_id`=  8903 where `entry`= 62868;
update `creature_template` set `gossip_menu_id`= 10183 where `entry`= 63013;
update `creature_template` set `gossip_menu_id`= 63217 where `entry`= 63217;
update `creature_template` set `gossip_menu_id`= 63908 where `entry`= 63908;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 63988;
update `creature_template` set `gossip_menu_id`= 15148 where `entry`= 64072;
update `creature_template` set `gossip_menu_id`= 14404 where `entry`= 64073;
update `creature_template` set `gossip_menu_id`= 15952 where `entry`= 64100;
update `creature_template` set `gossip_menu_id`= 15718 where `entry`= 64101;
update `creature_template` set `gossip_menu_id`= 14829 where `entry`= 64102;
update `creature_template` set `gossip_menu_id`= 14830 where `entry`= 64104;
update `creature_template` set `gossip_menu_id`= 15152 where `entry`= 64108;
update `creature_template` set `gossip_menu_id`= 15152 where `entry`= 64110;
update `creature_template` set `gossip_menu_id`= 15977 where `entry`= 64115;
update `creature_template` set `gossip_menu_id`= 15152 where `entry`= 64116;
update `creature_template` set `gossip_menu_id`= 15152 where `entry`= 64123;
update `creature_template` set `gossip_menu_id`= 15153 where `entry`= 64131;
update `creature_template` set `gossip_menu_id`= 14558 where `entry`= 64135;
update `creature_template` set `gossip_menu_id`= 14558 where `entry`= 64136;
update `creature_template` set `gossip_menu_id`= 14558 where `entry`= 64139;
update `creature_template` set `gossip_menu_id`= 14558 where `entry`= 64140;
update `creature_template` set `gossip_menu_id`= 15152 where `entry`= 64141;
update `creature_template` set `gossip_menu_id`= 14804 where `entry`= 64142;
update `creature_template` set `gossip_menu_id`= 14805 where `entry`= 64143;
update `creature_template` set `gossip_menu_id`= 14561 where `entry`= 64144;
update `creature_template` set `gossip_menu_id`= 15152 where `entry`= 64145;
update `creature_template` set `gossip_menu_id`= 15152 where `entry`= 64147;
update `creature_template` set `gossip_menu_id`= 14801 where `entry`= 64148;
update `creature_template` set `gossip_menu_id`= 14680 where `entry`= 64149;
update `creature_template` set `gossip_menu_id`= 14802 where `entry`= 64150;
update `creature_template` set `gossip_menu_id`= 14803 where `entry`= 64152;
update `creature_template` set `gossip_menu_id`= 15152 where `entry`= 64153;
update `creature_template` set `gossip_menu_id`= 15956 where `entry`= 64154;
update `creature_template` set `gossip_menu_id`= 14808 where `entry`= 64155;
update `creature_template` set `gossip_menu_id`= 14810 where `entry`= 64156;
update `creature_template` set `gossip_menu_id`= 14809 where `entry`= 64157;
update `creature_template` set `gossip_menu_id`= 14566 where `entry`= 64159;
update `creature_template` set `gossip_menu_id`= 14558 where `entry`= 64166;
update `creature_template` set `gossip_menu_id`= 14558 where `entry`= 64168;
update `creature_template` set `gossip_menu_id`= 14843 where `entry`= 64169;
update `creature_template` set `gossip_menu_id`= 14818 where `entry`= 64172;
update `creature_template` set `gossip_menu_id`= 14558 where `entry`= 64173;
update `creature_template` set `gossip_menu_id`= 15152 where `entry`= 64174;
update `creature_template` set `gossip_menu_id`= 14442 where `entry`= 64324;
update `creature_template` set `gossip_menu_id`= 14443 where `entry`= 64326;
update `creature_template` set `gossip_menu_id`= 13789 where `entry`= 64365;
update `creature_template` set `gossip_menu_id`= 14827 where `entry`= 64476;
update `creature_template` set `gossip_menu_id`= 14828 where `entry`= 64477;
update `creature_template` set `gossip_menu_id`= 14825 where `entry`= 64478;
update `creature_template` set `gossip_menu_id`= 15152 where `entry`= 64483;
update `creature_template` set `gossip_menu_id`= 64493 where `entry`= 64493;
update `creature_template` set `gossip_menu_id`= 64494 where `entry`= 64494;
update `creature_template` set `gossip_menu_id`= 14571 where `entry`= 64561;
update `creature_template` set `gossip_menu_id`= 14565 where `entry`= 64566;
update `creature_template` set `gossip_menu_id`= 21043 where `entry`= 64573;
update `creature_template` set `gossip_menu_id`= 14570 where `entry`= 64575;
update `creature_template` set `gossip_menu_id`= 14586 where `entry`= 64694;
update `creature_template` set `gossip_menu_id`= 55001 where `entry`= 64974;
update `creature_template` set `gossip_menu_id`= 55001 where `entry`= 64978;
update `creature_template` set `gossip_menu_id`= 14624 where `entry`= 65092;
update `creature_template` set `gossip_menu_id`= 14625 where `entry`= 65098;
update `creature_template` set `gossip_menu_id`= 14823 where `entry`= 65670;
update `creature_template` set `gossip_menu_id`= 14819 where `entry`= 65716;
update `creature_template` set `gossip_menu_id`= 65910 where `entry`= 65910;
update `creature_template` set `gossip_menu_id`= 14974 where `entry`= 66217;
update `creature_template` set `gossip_menu_id`= 14979 where `entry`= 66220;
update `creature_template` set `gossip_menu_id`= 14972 where `entry`= 66222;
update `creature_template` set `gossip_menu_id`= 14963 where `entry`= 66223;
update `creature_template` set `gossip_menu_id`= 14970 where `entry`= 66225;
update `creature_template` set `gossip_menu_id`= 15094 where `entry`= 66230;
update `creature_template` set `gossip_menu_id`= 15039 where `entry`= 66231;
update `creature_template` set `gossip_menu_id`= 14976 where `entry`= 66232;
update `creature_template` set `gossip_menu_id`= 14978 where `entry`= 66233;
update `creature_template` set `gossip_menu_id`= 14977 where `entry`= 66234;
update `creature_template` set `gossip_menu_id`= 14969 where `entry`= 66236;
update `creature_template` set `gossip_menu_id`= 14964 where `entry`= 66238;
update `creature_template` set `gossip_menu_id`= 15038 where `entry`= 66239;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 66241;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 66243;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 66244;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 66245;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 66246;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 66247;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 66248;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 66249;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 66250;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 66251;
update `creature_template` set `gossip_menu_id`= 14980 where `entry`= 66265;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 66266;
update `creature_template` set `gossip_menu_id`= 14635 where `entry`= 66306;
update `creature_template` set `gossip_menu_id`= 14635 where `entry`= 66346;
update `creature_template` set `gossip_menu_id`= 14635 where `entry`= 66347;
update `creature_template` set `gossip_menu_id`= 66564 where `entry`= 66564;
update `creature_template` set `gossip_menu_id`= 66567 where `entry`= 66567;
update `creature_template` set `gossip_menu_id`= 15153 where `entry`= 66731;
update `creature_template` set `gossip_menu_id`= 15098 where `entry`= 66979;
update `creature_template` set `gossip_menu_id`= 15099 where `entry`= 66980;
update `creature_template` set `gossip_menu_id`= 15100 where `entry`= 66981;
update `creature_template` set `gossip_menu_id`= 21043 where `entry`= 67014;
update `creature_template` set `gossip_menu_id`= 67067 where `entry`= 67067;
update `creature_template` set `gossip_menu_id`= 15153 where `entry`= 67133;
update `creature_template` set `gossip_menu_id`= 15153 where `entry`= 67134;
update `creature_template` set `gossip_menu_id`= 15328 where `entry`= 68464;
update `creature_template` set `gossip_menu_id`= 15329 where `entry`= 68465;


delete from `gossip_menu` where `entry` in (
13074,13104,13105,54914,13101,13100,54924,54944,54990,55009,55201,13561,13110,55283,55490,
13374,13208,13284,13291,13229,56222,13247,13563,13296,13299,13298,13297,14628,13782,13558,13396,
13397,13433,14941,14482,14457,14459,13185,13557,13548,13550,13549,13551,13553,13651,61492,13808,
14649,10183,63217,63908,15148,14404,15952,15718,14829,14830,15152,15152,15977,15152,
15152,15153,15152,14804,14805,14561,15152,15152,14801,14680,14802,14803,15152,15956,14808,14810,
14809,14818,15152,14442,14443,14827,14828,14825,15152,64493,64494,14571,21043,14570,14586,55001,
55001,14624,14625,14823,65910,14974,14979,14972,14963,14970,15094,15039,14976,14978,14977,14969,
14964,15038,14980,66564,66567,15098,15099,15100,21043,67067,15328,15329);
INSERT INTO `gossip_menu` (`entry`, `Text_Id`) VALUES 
(10183, 14125),(13074, 18360),(13100, 18397),(13101, 18398),(13104, 18408),(13104, 18409),(13105, 18411),(13110, 18523),(13185, 18585),(13208, 18614),(13229, 18648),(13247, 18663),(13284, 18787),(13291, 18794),(13296, 20183),(13297, 18804),
(13298, 18805),(13299, 18806),(13374, 20209),(13396, 19025),(13397, 19108),(13433, 19098),(13548, 19334),(13549, 19335),(13550, 19336),(13551, 19337),(13553, 19341),(13557, 19338),(13558, 19345),(13561, 19354),(13561, 19355),(13563, 19362),
(13563, 19364),(13563, 19365),(13651, 19580),(13782, 19863),(13808, 19912),(14404, 20330),(14442, 20375),(14443, 20376),(14457, 20398),(14459, 20400),(14482, 20425),(14561, 20583),(14624, 20685),(14625, 20686),(14628, 20689),(14649, 19889),
(14680, 11714),(14801, 20946),(14802, 20947),(14803, 20948),(14804, 20949),(14805, 20951),(14808, 20957),(14809, 20959),(14810, 20960),(14818, 20970),(14825, 20985),(14827, 20987),(14828, 20988),(14829, 20989),(14830, 20990),(14941, 21121),
(14963, 21156),(14969, 21163),(14970, 21164),(14976, 21171),(14977, 21173),(14978, 21174),(14979, 21175),(15094, 21170),(15098, 21499),(15099, 21500),(15100, 21501),(15148, 23007),(15152,   933),(15153,  2593),(15718, 22576),(15952, 22968),
(15956, 22974),(15977, 23008),(21043,  7933),(21043, 31799),(63908,     1);


ALTER TABLE `gossip_menu_option` Modify COLUMN `menu_id` int(10);
ALTER TABLE `gossip_menu` Modify COLUMN `entry` int(10);

delete from `gossip_menu_option` where `menu_id` in (
10183,13105,13110,13291,13374,13374,13396,13549,13550,13550,13550,13551,13553,13651,13782,13808,14404,14561,14624,14625,14628,14628,14649,14680,14680,14941,14963,15094,15098,15099,15100,15152,
15152,15152,15152,15152,15152,15152,15152,15152,15152,15152,15718,15952,21043,21043,21043,54914,54924,54944,54990,55009,55201,55283,55490,56222,61492,63908,64493,64494,65910,66564,66567,67067);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`) VALUES 
(10183, 0, 1, 'I want to browse your goods.', 3370, 3, 128),
(13105, 0, 0, 'What is this place?', 136659, 1, 1),
(13110, 0, 0, 'What happened out here?', 54167, 1, 1),
(13291, 0, 3, 'Tell me about Inscription.', 47149, 1, 1),
(13374, 1, 5, 'Make this inn your home.', 2822, 8, 65536),
(13374, 2, 1, 'I would like to buy from you.', 14967, 1, 1),
(13396, 1, 0, 'Wait, I\'ve changed my mind about my egg.', 57017, 1, 1),
(13549, 0, 0, 'I\'ve got a new jade shipment for you.', 58444, 1, 1),
(13550, 0, 0, 'I need a ride to the top of the statue.', 58416, 1, 1),
(13550, 1, 0, 'I\'ve got a jade delivery for you.', 58443, 1, 1),
(13550, 2, 0, 'Take me to the Temple of the Jade Serpent.', 61342, 1, 1),
(13551, 0, 0, 'Did someone say they needed jade?', 58442, 1, 1),
(13553, 0, 0, 'I\'ve got your jade right here.', 58441, 1, 1),
(13651, 2, 1, 'I would like to buy from you.', 14967, 1, 1),
(13782, 0, 1, 'I would like to buy from you.', 14967, 1, 1),
(13808, 0, 1, 'I would like to buy from you.', 14967, 1, 1),
(14404, 0, 0, 'Can you play me a song?', 64617, 1, 1),
(14561, 0, 0, 'I have another question.', 98552, 1, 1),
(14624, 0, 3, 'Train me in Mining.', 47116, 5, 16),
(14625, 0, 3, 'Train me in Jewelcrafting.', 47114, 5, 16),
(14628, 0, 3, 'Train me in Alchemy.', 47109, 5, 16),
(14628, 1, 1, 'Let me browse your goods.', 8097, 3, 128),
(14649, 8, 25, 'Queue for Greenstone Village.', 64701, 1, 1),
(14680, 0, 5, 'Make this inn your home.', 2822, 8, 65536),
(14680, 2, 0, 'What can I find here in the city?', 66598, 1, 1),
(14941, 0, 1, 'I want to browse your goods.', 3370, 3, 128),
(14963, 1, 1, 'What goods do you have available?', 68285, 1, 1),
(15094, 1, 1, 'I\'m looking for a lost companion.', 56613, 1, 1),
(15098, 0, 3, 'Train me in Mining.', 47116, 5, 16),
(15099, 0, 3, 'Train me in Herbalism.', 47112, 5, 16),
(15100, 0, 3, 'Train me in Skinning.', 47117, 5, 16),
(15152, 1, 0, 'Bank', 78584, 1, 1),
(15152, 2, 0, 'Flight Master', 45379, 1, 1),
(15152, 3, 0, 'Flying Trainer', 66644, 1, 1),
(15152, 4, 0, 'Inn', 44629, 1, 1),
(15152, 5, 0, 'Pet Battle Trainer', 66645, 1, 1),
(15152, 6, 0, 'Profession Trainer', 45382, 1, 1),
(15152, 7, 0, 'Quartermasters', 66700, 1, 1),
(15152, 8, 0, 'Transmogrification and Void Storage', 72967, 1, 1),
(15152, 9, 0, 'Stable Master', 45383, 1, 1),
(15152, 10, 0, 'Vendor', 44612, 1, 1),
(15152, 11, 0, 'Other', 66646, 1, 1),
(15718, 0, 1, 'I would like to buy from you.', 14967, 1, 1),
(15952, 0, 1, 'Examine his goods.', 76560, 1, 1),
(21043, 0, 34, 'I want to transmogrify my gear.', 130510, 20, 268435456),
(21043, 1, 1, 'I would like to buy from you.', 14967, 3, 128),
(21043, 2, 0, 'I want to participate in the Trial of Style!', 130512, 1, 1),
(54914, 0, 0, 'I found it!', 0, 1, 1),
(54924, 0, 0, 'Let\'s get started!', 0, 1, 1),
(54944, 0, 0, 'Let\'s get started!', 0, 1, 1),
(54990, 0, 0, 'You are free now!', 0, 1, 1),
(55009, 0, 0, 'We found it!', 0, 1, 1),
(55201, 0, 0, 'You saved now!', 0, 1, 1),
(55283, 0, 0, 'Tell me everything!', 0, 1, 1),
(55490, 0, 0, 'You saved now!', 0, 1, 1),
(56222, 0, 0, 'I can beat you!', 0, 1, 1),
(61492, 0, 0, 'You saved now!', 0, 1, 1),
(63908, 1, 0, 'Bien ! je suis prêt !', 0, 1, 3),
(64493, 0, 0, 'You saved!', 0, 1, 1),
(64494, 0, 0, 'You saved!', 0, 1, 1),
(65910, 0, 0, 'Iam from Allience', 0, 1, 1),
(66564, 0, 0, 'You saved now!', 0, 1, 1),
(66567, 0, 0, 'You saved now!', 0, 1, 1),
(67067, 0, 0, 'Lets Go!', 0, 1, 1);

/* Thunderfoot Fields */

UPDATE `quest_template` SET `PrevQuestID` = 29907 WHERE `ID` = 29877; -- A Poor Grasp of the Basics
UPDATE `quest_template` SET `PrevQuestID` = 29909 WHERE `ID` = 30086; -- The Search for the Hidden Master
UPDATE `quest_template` SET `PrevQuestID` = 29909 WHERE `ID` = 29910; -- Rampaging Rodents
UPDATE `quest_template` SET `PrevQuestID` = 29912 WHERE `ID` = 29913; -- The Meat They'll Eat
UPDATE `quest_template` SET `PrevQuestID` = 29912 WHERE `ID` = 29914; -- Back to the Sty
UPDATE `quest_template` SET `PrevQuestID` = 29915 WHERE `ID` = 29916; -- Piercing Talons AND Slavering Jaws
UPDATE `quest_template` SET `PrevQuestID` = 29915 WHERE `ID` = 29917; -- Lupello
UPDATE `quest_template` SET `PrevQuestID` = 29917 WHERE `ID` = 29918; -- A Lesson in Bravery
UPDATE `quest_template` SET `NextQuestID` = 29913 WHERE `ID` = 29912; -- The Fabulous Miss Fanny
UPDATE `quest_template` SET `NextQuestID` = 29916 WHERE `ID` = 29915; -- A Neighbor's Duty
UPDATE `quest_template` SET `NextQuestID` = 29918 WHERE `ID` = 29916; -- Piercing Talons AND Slavering Jaws
UPDATE `quest_template` SET `NextQuestID` = 29918 WHERE `ID` = 29917; -- Lupello

/* Mudmug's Place */

UPDATE `quest_template` SET `PrevQuestID` = 29918 WHERE `ID` = 29919; -- Great Minds Drink Alike
UPDATE `quest_template` SET `PrevQuestID` = 29919 WHERE `ID` = 29944; -- Leaders Among Breeders
UPDATE `quest_template` SET `PrevQuestID` = 29919 WHERE `ID` = 29945; -- Yellow AND Red Make Orange
UPDATE `quest_template` SET `PrevQuestID` = 29944 WHERE `ID` = 29948; -- Thieves to the Core
UPDATE `quest_template` SET `PrevQuestID` = 29949 WHERE `ID` = 29951; -- Muddy Water
UPDATE `quest_template` SET `PrevQuestID` = 29950 WHERE `ID` = 29952; -- Broken Dreams
UPDATE `quest_template` SET `PrevQuestID` = 30059 WHERE `ID` = 30058; -- Mothallus!
UPDATE `quest_template` SET `NextQuestID` = 29919 WHERE `ID` = 29918; -- A Lesson in Bravery
UPDATE `quest_template` SET `NextQuestID` = 29944 WHERE `ID` = 29919; -- Great Minds Drink Alike
UPDATE `quest_template` SET `NextQuestID` = 30046 WHERE `ID` = 29951; -- Muddy Water
UPDATE `quest_template` SET `NextQuestID` = 30046 WHERE `ID` = 29952; -- Broken Dreams
UPDATE `quest_template` SET `NextQuestID` = 29949 WHERE `ID` = 29947; -- Crouching Carrot Hidden Turnip
UPDATE `quest_template` SET `NextQuestID` = 29949 WHERE `ID` = 29948; -- Thieves to the Core

/* Chen's Masterpiece */

UPDATE `quest_template` SET `PrevQuestID` = 30029 WHERE `ID` = 30028; -- Grain Recovery *
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30048; -- Li Li AND the Grain 
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30049; -- Doesnt Hold Water
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30050; -- Gardener Fran AND the Watering Can
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30052; -- Weed War
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30053; -- Hop Hunting
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30054; -- Enough is Ookin' Enough
UPDATE `quest_template` SET `PrevQuestID` = 30046 WHERE `ID` = 30056; -- The Farmer's Daughter
UPDATE `quest_template` SET `PrevQuestID` = 30048 WHERE `ID` = 30029; -- Wee Little Shenanigans
UPDATE `quest_template` SET `PrevQuestID` = 30048 WHERE `ID` = 30030; -- Out of Sprite
UPDATE `quest_template` SET `PrevQuestID` = 30048 WHERE `ID` = 30031; -- Taste Test
UPDATE `quest_template` SET `PrevQuestID` = 29952 WHERE `ID` = 30046; -- Chen's Resolution
UPDATE `quest_template` SET `ExclusiveGroup` = -30054 WHERE `ID` = 30050; -- Gardener Fran AND the Watering Can
UPDATE `quest_template` SET `ExclusiveGroup` = -30054 WHERE `ID` = 30052; -- Weed War
UPDATE `quest_template` SET `ExclusiveGroup` = -30054 WHERE `ID` = 30053; -- Hop Hunting
UPDATE `quest_template` SET `ExclusiveGroup` = -30054 WHERE `ID` = 30054; -- Enough is Ookin' Enough
UPDATE `quest_template` SET `PrevQuestID` = -30054 WHERE `ID` = 30055; -- Stormstouts Hop
UPDATE `quest_template` SET `ExclusiveGroup` = -30031 WHERE `ID` = 30029; -- Wee Little Shenanigans
UPDATE `quest_template` SET `ExclusiveGroup` = -30031 WHERE `ID` = 30030; -- Out of Sprite
UPDATE `quest_template` SET `ExclusiveGroup` = -30031 WHERE `ID` = 30031; -- Taste Test
UPDATE `quest_template` SET `PrevQuestID` = -30031 WHERE `ID` = 30032;
UPDATE `quest_template` SET `NextQuestID` = 30073 WHERE `ID` = 30055; -- Stormstouts Hops

/* Stormstout Brewery */

UPDATE `quest_template` SET `PrevQuestID` = 29909 WHERE `ID` = 30087; -- Flag - Kung Fu Intro
UPDATE `quest_template` SET `PrevQuestID` = 30074 WHERE `ID` = 30075; -- Clear the Way
UPDATE `quest_template` SET `PrevQuestID` = 30074 WHERE `ID` = 30076; -- The Fanciest Water
UPDATE `quest_template` SET `PrevQuestID` = 30074 WHERE `ID` = 30077; -- Barrels, Man
UPDATE `quest_template` SET `PrevQuestID` = 30078 WHERE `ID` = 30117; -- Stoneplow Thirsts
UPDATE `quest_template` SET `NextQuestID` = 30078 WHERE `ID` = 30076; -- The Fanciest Water
UPDATE `quest_template` SET `NextQuestID` = 30078 WHERE `ID` = 30077; -- Barrels, Man
UPDATE `quest_template` SET `NextQuestID` = 29872 WHERE `ID` = 30086; -- The Search for the Hidden Master
UPDATE `quest_template` SET `NextQuestID` = 29872 WHERE `ID` = 30087; -- Flag - Kung Fu Intro

/* The Hidden Master */

	-- Clever Ashyo
UPDATE `quest_template` SET `PrevQuestID` = 30086 WHERE `ID` = 29871; -- Clever Ashyo

	-- Lin Tenderpaw
UPDATE `quest_template` SET `PrevQuestID` = 30086 WHERE `ID` = 29872; -- Lin Tenderpaw
UPDATE `quest_template` SET `PrevQuestID` = 29984 WHERE `ID` = 29985; -- They Will Be Mist
UPDATE `quest_template` SET `PrevQuestID` = 29984 WHERE `ID` = 29986; -- Fog Wards
UPDATE `quest_template` SET `PrevQuestID` = 29984 WHERE `ID` = 29992; -- Tenderpaw By Name, Tender Paw By Reputation
UPDATE `quest_template` SET `PrevQuestID` = 29989 WHERE `ID` = 29990; -- Training AND Discipline
UPDATE `quest_template` SET `NextQuestID` = 29987 WHERE `ID` = 29992; -- Tenderpaw By Name, Tender Paw By Reputation
UPDATE `quest_template` SET `NextQuestID` = 29990 WHERE `ID` = 29989; -- Unyielding Fists: Trial of Stone

	-- Saving Stoneplow
UPDATE `quest_template` SET `PrevQuestID` = 30376 WHERE `ID` = 30622; -- The Swarm Begins

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=30622 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=30360 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) values 
(19, 0, 30622, 0, 0, 8, 0, 30360, 0, 0, 0, 0, '', 'if player are aliance');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=30622 AND `SourceId`=0 AND `ElseGroup`=1 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=30241 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) values 
(19, 0, 30622, 0, 1, 8, 0, 30241, 0, 0, 0, 0, '', 'if player are horde');

UPDATE `quest_template` SET `PrevQuestID` = 30376 WHERE `ID` = 30623; -- The Mantidote
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=30623 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=30360 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) values 
(19, 0, 30623, 0, 0, 8, 0, 30360, 0, 0, 0, 0, '', 'if player are aliance');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=30623 AND `SourceId`=0 AND `ElseGroup`=1 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=30241 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) values 
(19, 0, 30623, 0, 1, 8, 0, 30241, 0, 0, 0, 0, '', 'if player are horde');

UPDATE `quest_template` SET `PrevQuestID` = 30376 WHERE `ID` = 30624; -- It Does You No Good In The Keg (Alianza)
UPDATE `quest_template` SET `PrevQuestID` = 30376 WHERE `ID` = 30653; -- It Does You No Good In The Keg (Horda)

UPDATE `quest_template` SET `PrevQuestID` = 30623 WHERE `ID` = 30625; -- Students No More
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=30625 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=30624 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) values 
(19, 0, 30625, 0, 0, 8, 0, 30624, 0, 0, 0, 0, '', 'if player are aliance');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=30625 AND `SourceId`=0 AND `ElseGroup`=1 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=30653 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) values 
(19, 0, 30625, 0, 1, 8, 0, 30653, 0, 0, 0, 0, '', 'if player are horde');

UPDATE `quest_template` SET `PrevQuestID` = 30626 WHERE `ID` = 30627; -- The Savior of Stoneplow
UPDATE `quest_template` SET `NextQuestID` = 30624 WHERE `ID` = 30360; -- Warn Stoneplow (Alianza)
UPDATE `quest_template` SET `NextQuestID` = 30653 WHERE `ID` = 30241; -- Warn Stoneplow (Horda)
UPDATE `quest_template` SET `NextQuestID` = 30627 WHERE `ID` = 30626; -- Retreat!

/* Nesingwary's Safari */

UPDATE `quest_template` SET `PrevQuestID` = 30181 WHERE `ID` = 30184; -- Mushan Mastery: Darkhide
UPDATE `quest_template` SET `PrevQuestID` = 30184 WHERE `ID` = 30185; -- Tortoise Mastery
UPDATE `quest_template` SET `NextQuestID` = 30184 WHERE `ID` = 30181; -- Mushan Mastery
UPDATE `quest_template` SET `NextQuestID` = 30185 WHERE `ID` = 30182; -- Fox Mastery

/* Halfhill Market */

UPDATE `quest_template` SET `PrevQuestID` = 31302 WHERE `ID` = 31311; -- Way of the Grill
UPDATE `quest_template` SET `PrevQuestID` = 31302 WHERE `ID` = 31470; -- Way of the Wok
UPDATE `quest_template` SET `PrevQuestID` = 31302 WHERE `ID` = 31472; -- Way of the Pot
UPDATE `quest_template` SET `PrevQuestID` = 31302 WHERE `ID` = 31475; -- Way of the Steamer
UPDATE `quest_template` SET `PrevQuestID` = 31302 WHERE `ID` = 31478; -- Way of the Oven
UPDATE `quest_template` SET `PrevQuestID` = 31302 WHERE `ID` = 31479; -- Way of the Brew
UPDATE `quest_template` SET `PrevQuestID` = 31311 WHERE `ID` = 31467; -- Strong as Tiger
UPDATE `quest_template` SET `PrevQuestID` = 31472 WHERE `ID` = 31474; -- The Soup of Contemplation
UPDATE `quest_template` SET `PrevQuestID` = 31470 WHERE `ID` = 31471; -- Agile as Tiger
UPDATE `quest_template` SET `PrevQuestID` = 31475 WHERE `ID` = 31476; -- The Spirit of Cooking
UPDATE `quest_template` SET `PrevQuestID` = 31478 WHERE `ID` = 31477; -- Endurance
UPDATE `quest_template` SET `PrevQuestID` = 31479 WHERE `ID` = 31480; -- Have a Drink
UPDATE `quest_template` SET `ExclusiveGroup` = -31480 WHERE `ID` = 31467; -- Strong as Tiger
UPDATE `quest_template` SET `ExclusiveGroup` = -31480 WHERE `ID` = 31471; -- Agile as Tiger
UPDATE `quest_template` SET `ExclusiveGroup` = -31480 WHERE `ID` = 31474; -- The Soup of Contemplation
UPDATE `quest_template` SET `ExclusiveGroup` = -31480 WHERE `ID` = 31476; -- The Spirit of Cooking
UPDATE `quest_template` SET `ExclusiveGroup` = -31480 WHERE `ID` = 31477; -- Endurance
UPDATE `quest_template` SET `ExclusiveGroup` = -31480 WHERE `ID` = 31480; -- Have a Drink
UPDATE `quest_template` SET `PrevQuestID` = -31480 WHERE `ID` = 31536; -- Preserving Freshness
UPDATE `quest_template` SET `PrevQuestID` = 30252 WHERE `ID` = 30535; -- Learn and Grow Seeds
UPDATE `quest_template` SET `PrevQuestID` = 30522, `NextQuestID` = 30527 WHERE `ID` = 30525; -- Haohan's Vote III: Pure Poison
UPDATE `quest_template` SET `PrevQuestID` = 30525, `NextQuestID` = 30528 WHERE `ID` = 30527; -- Haohan's Vote IV: Melons for Felons
UPDATE `quest_template` SET `PrevQuestID` = 30527, `NextQuestID` = 30529 WHERE `ID` = 30528; -- Haohan's Vote V: Chief Yip-Yip
UPDATE `quest_template` SET `NextQuestID` = 30525 WHERE `ID` = 30522; -- Haohan's Vote II: The Real Culprits
UPDATE `quest_template` SET `PrevQuestID` = 31945 WHERE `ID` = 30258; -- Mung'Mungs Vote I: A Hozen's Problem
UPDATE `quest_template` SET `NextQuestID` = 31946 WHERE `ID` = 30259; -- Mung'Mungs Vote II: Rotten to the Core
UPDATE `quest_template` SET `PrevQuestID` = 30259 WHERE `ID` = 31946; -- Mung'Mungs Vote III: The Great Carrot Caper
UPDATE `quest_template` SET `NextQuestID` = 32198 WHERE `ID` = 32189; -- A Shabby New Face
UPDATE `quest_template` SET `PrevQuestID` = 32189 WHERE `ID` = 32198; -- One Magical, Flying Kingdom's Trash...
UPDATE `quest_template` SET `NextQuestID` = 31947 WHERE `ID` = 30518; -- Farmer Fung's Vote II: On the Loose
UPDATE `quest_template` SET `PrevQuestID` = 30518 WHERE `ID` = 31947; -- Farmer Fung's Vote III: Crazy For Cabbage
UPDATE `quest_template` SET `NextQuestID` = 31949 WHERE `ID` = 31948; -- Nana's Vote II: The Sacred Springs
UPDATE `quest_template` SET `PrevQuestID` = 31948 WHERE `ID` = 31949; -- Nana's Vote III: Witchberry Julep
UPDATE `quest_template` SET `PrevQuestID` = 30528 WHERE `ID` = 30529; -- Growing the Farm III: The Mossy Boulder
UPDATE `quest_template` SET `PrevQuestID` = 30257 WHERE `ID` = 30332; -- Fatty Goatsteak
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 9000 WHERE `ID` = 30260; -- Growing the Farm I: The Weeds (Honored)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 14600 WHERE `ID` = 30258; -- Mung'Mungs Vote I: A Hozen's Problem (Honored +5600)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 21000 WHERE `ID` = 30523; -- Growing the Farm II: The Broken Wagon (Revered)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 25251 WHERE `ID` = 30517; -- Farmer Fung's Vote I: Yak Attack (Revered +4251)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 29499 WHERE `ID` = 30519; -- Nana's Vote I: Nana's Secret Recipe (Revered +8499)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 33600 WHERE `ID` = 30526; -- Lost and Lonely (Revered +12600)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 37800 WHERE `ID` = 30521; -- Haohans Vote I: Bungalow Break-In (Revered +16800)
UPDATE `quest_template` SET `RequiredMinRepFaction` = 1272, `RequiredMinRepValue` = 42000 WHERE `ID` = 30529; -- Growing the Farm III: The Mossy Boulder (Exalted)

UPDATE `creature_template` SET `ScriptName` = 'npc_wayward_ancestor' WHERE `entry` = 55290;

DELETE FROM `spell_script_names` WHERE `spell_id`=122531;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (122531, 'spell_wakening_122531');

update `creature_template` set `faction_A`= 14, `faction_H`= 14 where `entry`= 58439;

UPDATE `gameobject_template` SET `data0` = 1867 WHERE `entry` IN (209349, 221542, 215405);
UPDATE `gameobject_template` SET `data0` = 1972 WHERE `entry` IN (209351, 215407);
UPDATE `gameobject_template` SET `data0` = 1868 WHERE `entry` IN (221543, 209353, 215408);
UPDATE `gameobject_template` SET `data0` = 1971 WHERE `entry` IN (209354, 221545);
UPDATE `gameobject_template` SET `data0` = 1973 WHERE `entry` IN (221547, 209355);
UPDATE `gameobject_template` SET `data0` = 1972 WHERE `entry` IN (214510, 215412);
UPDATE `gameobject_template` SET `data0` = 1970 WHERE `entry` IN (221544, 209350, 215406);

UPDATE `creature_template` SET `npcflag` = 2 WHERE `entry` = 68526;

UPDATE `gameobject_template` SET `data0` = 1966 WHERE `entry` IN (221540, 209330);
UPDATE `gameobject_template` SET `data0` = 1966 WHERE `entry` IN (221541, 209313);
UPDATE `gameobject_template` SET `data0` = 1967 WHERE `entry` IN (209328, 221539);
UPDATE `gameobject_template` SET `data0` = 1967 WHERE `entry` IN (209312);
UPDATE `gameobject_template` SET `data0` = 1968 WHERE `entry` IN (209329);
UPDATE `gameobject_template` SET `data0` = 2026 WHERE `entry` IN (209311, 221538, 215413);

DELETE FROM `smart_scripts` WHERE `entryorguid`=54960 AND `source_type`=0 AND `id`=3;
DELETE FROM `smart_scripts` WHERE `entryorguid`=54960 AND `source_type`=0 AND `id`=4;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(54960, 0, 3, 4, 62, 0, 100, 0, 13250, 0, 0, 0, 33, 56398, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(54960, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 54894, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, '');

UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 58439;

UPDATE `creature_template` SET `ScriptName` = 'npc_day_off_li_li' WHERE `entry` = 56549;

DELETE FROM `spell_script_names` WHERE `spell_id`=106276;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (106276, 'spell_summon_li_li');

UPDATE `creature_template` SET `ScriptName` = 'npc_gardener_fran' WHERE `entry` = 62377;

update `creature_template` set `gossip_menu_id`= 54763 where `entry`= 54763;
update `creature_template` set `gossip_menu_id`= 55135 where `entry`= 55135;
update `creature_template` set `gossip_menu_id`= 13110 where `entry`= 55274;
update `creature_template` set `gossip_menu_id`= 13137 where `entry`= 55368;
update `creature_template` set `gossip_menu_id`= 13128 where `entry`= 55381;
update `creature_template` set `gossip_menu_id`= 13129 where `entry`= 55401;
update `creature_template` set `gossip_menu_id`= 13182 where `entry`= 55688;
update `creature_template` set `gossip_menu_id`= 56192 where `entry`= 56192;
update `creature_template` set `gossip_menu_id`=  7675 where `entry`= 56348;
update `creature_template` set `gossip_menu_id`= 13250 where `entry`= 56398;
update `creature_template` set `gossip_menu_id`= 13267 where `entry`= 56490;
update `creature_template` set `gossip_menu_id`= 13750 where `entry`= 56549;
update `creature_template` set `gossip_menu_id`= 13323 where `entry`= 56786;
update `creature_template` set `gossip_menu_id`= 57204 where `entry`= 57204;
update `creature_template` set `gossip_menu_id`= 14674 where `entry`= 57619;
update `creature_template` set `gossip_menu_id`= 14462 where `entry`= 58470;
update `creature_template` set `gossip_menu_id`= 13486 where `entry`= 58647;
update `creature_template` set `gossip_menu_id`= 13595 where `entry`= 58707;
update `creature_template` set `gossip_menu_id`= 13610 where `entry`= 58710;
update `creature_template` set `gossip_menu_id`= 14456 where `entry`= 59338;
update `creature_template` set `gossip_menu_id`= 14429 where `entry`= 59418;
update `creature_template` set `gossip_menu_id`= 13581 where `entry`= 59572;
update `creature_template` set `gossip_menu_id`= 59581 where `entry`= 59581;
update `creature_template` set `gossip_menu_id`= 59582 where `entry`= 59582;
update `creature_template` set `gossip_menu_id`= 59583 where `entry`= 59583;
update `creature_template` set `gossip_menu_id`= 59585 where `entry`= 59585;
update `creature_template` set `gossip_menu_id`= 59619 where `entry`= 59619;
update `creature_template` set `gossip_menu_id`= 13037 where `entry`= 59642;
update `creature_template` set `gossip_menu_id`= 60530 where `entry`= 60530;
update `creature_template` set `gossip_menu_id`= 60532 where `entry`= 60532;
update `creature_template` set `gossip_menu_id`= 60533 where `entry`= 60533;
update `creature_template` set `gossip_menu_id`= 60534 where `entry`= 60534;
update `creature_template` set `gossip_menu_id`= 60535 where `entry`= 60535;
update `creature_template` set `gossip_menu_id`= 60536 where `entry`= 60536;
update `creature_template` set `gossip_menu_id`= 60537 where `entry`= 60537;
update `creature_template` set `gossip_menu_id`= 60538 where `entry`= 60538;
update `creature_template` set `gossip_menu_id`= 60539 where `entry`= 60539;
update `creature_template` set `gossip_menu_id`= 60540 where `entry`= 60540;
update `creature_template` set `gossip_menu_id`= 60541 where `entry`= 60541;
update `creature_template` set `gossip_menu_id`= 60542 where `entry`= 60542;
update `creature_template` set `gossip_menu_id`= 60543 where `entry`= 60543;
update `creature_template` set `gossip_menu_id`= 60544 where `entry`= 60544;
update `creature_template` set `gossip_menu_id`= 60545 where `entry`= 60545;
update `creature_template` set `gossip_menu_id`= 60546 where `entry`= 60546;
update `creature_template` set `gossip_menu_id`= 14328 where `entry`= 60674;
update `creature_template` set `gossip_menu_id`= 13739 where `entry`= 60864;
update `creature_template` set `gossip_menu_id`= 13734 where `entry`= 60951;
update `creature_template` set `gossip_menu_id`= 19100 where `entry`= 60968;
update `creature_template` set `gossip_menu_id`= 60978 where `entry`= 60978;
update `creature_template` set `gossip_menu_id`= 60979 where `entry`= 60979;
update `creature_template` set `gossip_menu_id`= 60980 where `entry`= 60980;
update `creature_template` set `gossip_menu_id`= 60996 where `entry`= 60996;
update `creature_template` set `gossip_menu_id`= 60997 where `entry`= 60997;
update `creature_template` set `gossip_menu_id`= 61004 where `entry`= 61004;
update `creature_template` set `gossip_menu_id`= 61006 where `entry`= 61006;
update `creature_template` set `gossip_menu_id`= 61007 where `entry`= 61007;
update `creature_template` set `gossip_menu_id`= 61012 where `entry`= 61012;
update `creature_template` set `gossip_menu_id`= 61013 where `entry`= 61013;
update `creature_template` set `gossip_menu_id`= 15074 where `entry`= 61342;
update `creature_template` set `gossip_menu_id`= 15073 where `entry`= 61343;
update `creature_template` set `gossip_menu_id`= 13821 where `entry`= 61371;
update `creature_template` set `gossip_menu_id`= 61417 where `entry`= 61417;
update `creature_template` set `gossip_menu_id`= 61417 where `entry`= 61554;
update `creature_template` set `gossip_menu_id`= 61566 where `entry`= 61566;
update `creature_template` set `gossip_menu_id`= 13887 where `entry`= 61620;
update `creature_template` set `gossip_menu_id`= 13753 where `entry`= 61624;
update `creature_template` set `gossip_menu_id`= 13813 where `entry`= 61716;
update `creature_template` set `gossip_menu_id`= 13816 where `entry`= 61724;
update `creature_template` set `gossip_menu_id`= 62107 where `entry`= 62107;
update `creature_template` set `gossip_menu_id`= 14271 where `entry`= 62232;
update `creature_template` set `gossip_menu_id`= 13846 where `entry`= 62274;
update `creature_template` set `gossip_menu_id`= 62303 where `entry`= 62303;
update `creature_template` set `gossip_menu_id`= 13848 where `entry`= 62354;
update `creature_template` set `gossip_menu_id`= 13882 where `entry`= 62380;
update `creature_template` set `gossip_menu_id`= 62550 where `entry`= 62550;
update `creature_template` set `gossip_menu_id`= 62666 where `entry`= 62666;
update `creature_template` set `gossip_menu_id`= 62667 where `entry`= 62667;
update `creature_template` set `gossip_menu_id`= 62735 where `entry`= 62735;
update `creature_template` set `gossip_menu_id`= 62774 where `entry`= 62774;
update `creature_template` set `gossip_menu_id`= 62845 where `entry`= 62845;
update `creature_template` set `gossip_menu_id`= 13917 where `entry`= 62913;
update `creature_template` set `gossip_menu_id`= 62978 where `entry`= 62978;
update `creature_template` set `gossip_menu_id`= 13755 where `entry`= 62989;
update `creature_template` set `gossip_menu_id`= 66420 where `entry`= 63014;
update `creature_template` set `gossip_menu_id`= 66420 where `entry`= 63061;
update `creature_template` set `gossip_menu_id`= 66420 where `entry`= 63067;
update `creature_template` set `gossip_menu_id`= 66420 where `entry`= 63070;
update `creature_template` set `gossip_menu_id`= 66420 where `entry`= 63073;
update `creature_template` set `gossip_menu_id`= 66420 where `entry`= 63075;
update `creature_template` set `gossip_menu_id`= 66420 where `entry`= 63077;
update `creature_template` set `gossip_menu_id`= 66420 where `entry`= 63080;
update `creature_template` set `gossip_menu_id`= 66420 where `entry`= 63083;
update `creature_template` set `gossip_menu_id`= 63128 where `entry`= 63128;
update `creature_template` set `gossip_menu_id`= 14478 where `entry`= 63266;
update `creature_template` set `gossip_menu_id`= 63616 where `entry`= 63616;
update `creature_template` set `gossip_menu_id`= 63618 where `entry`= 63618;
update `creature_template` set `gossip_menu_id`= 66420 where `entry`= 63626;
update `creature_template` set `gossip_menu_id`= 14335 where `entry`= 63946;
update `creature_template` set `gossip_menu_id`= 64133 where `entry`= 64133;
update `creature_template` set `gossip_menu_id`= 64240 where `entry`= 64240;
update `creature_template` set `gossip_menu_id`= 64241 where `entry`= 64241;
update `creature_template` set `gossip_menu_id`= 14488 where `entry`= 64432;
update `creature_template` set `gossip_menu_id`= 64459 where `entry`= 64459;
update `creature_template` set `gossip_menu_id`= 64459 where `entry`= 64460;
update `creature_template` set `gossip_menu_id`= 64459 where `entry`= 64461;
update `creature_template` set `gossip_menu_id`= 64473 where `entry`= 64473;
update `creature_template` set `gossip_menu_id`= 14527 where `entry`= 64517;
update `creature_template` set `gossip_menu_id`= 66420 where `entry`= 64572;
update `creature_template` set `gossip_menu_id`= 64822 where `entry`= 64822;
update `creature_template` set `gossip_menu_id`= 14598 where `entry`= 64827;
update `creature_template` set `gossip_menu_id`= 64848 where `entry`= 64848;
update `creature_template` set `gossip_menu_id`= 14640 where `entry`= 65172;
update `creature_template` set `gossip_menu_id`=    83 where `entry`= 65183;
update `creature_template` set `gossip_menu_id`= 10181 where `entry`= 65515;
update `creature_template` set `gossip_menu_id`= 13220 where `entry`= 65558;
update `creature_template` set `gossip_menu_id`= 14949 where `entry`= 65648;
update `creature_template` set `gossip_menu_id`= 14946 where `entry`= 66126;
update `creature_template` set `gossip_menu_id`= 14812 where `entry`= 66135;
update `creature_template` set `gossip_menu_id`= 14984 where `entry`= 66352;
update `creature_template` set `gossip_menu_id`= 14987 where `entry`= 66372;
update `creature_template` set `gossip_menu_id`= 15011 where `entry`= 66466;
update `creature_template` set `gossip_menu_id`= 15015 where `entry`= 66478;
update `creature_template` set `gossip_menu_id`= 15019 where `entry`= 66520;
update `creature_template` set `gossip_menu_id`= 15020 where `entry`= 66522;
update `creature_template` set `gossip_menu_id`= 15024 where `entry`= 66552;
update `creature_template` set `gossip_menu_id`= 15023 where `entry`= 66553;
update `creature_template` set `gossip_menu_id`= 15025 where `entry`= 66557;
update `creature_template` set `gossip_menu_id`= 15028 where `entry`= 66635;
update `creature_template` set `gossip_menu_id`= 15029 where `entry`= 66636;
update `creature_template` set `gossip_menu_id`= 15035 where `entry`= 66675;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 66717;
update `creature_template` set `gossip_menu_id`= 15047 where `entry`= 66734;
update `creature_template` set `gossip_menu_id`= 15068 where `entry`= 66824;
update `creature_template` set `gossip_menu_id`= 15183 where `entry`= 67414;
update `creature_template` set `gossip_menu_id`= 15245 where `entry`= 68057;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 68986;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 68993;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 69252;
update `creature_template` set `gossip_menu_id`= 15535 where `entry`= 70100;
update `creature_template` set `gossip_menu_id`=  9821 where `entry`= 70184;
update `creature_template` set `gossip_menu_id`= 15607 where `entry`= 70438;
update `creature_template` set `gossip_menu_id`= 15681 where `entry`= 71032;
update `creature_template` set `gossip_menu_id`= 15691 where `entry`= 71358;
update `creature_template` set `gossip_menu_id`= 10181 where `entry`= 71621;
update `creature_template` set `gossip_menu_id`= 71967 where `entry`= 71967;
update `creature_template` set `gossip_menu_id`= 15992 where `entry`= 72302;
update `creature_template` set `gossip_menu_id`= 15803 where `entry`= 72311;
update `creature_template` set `gossip_menu_id`= 16077 where `entry`= 72559;
update `creature_template` set `gossip_menu_id`= 72560 where `entry`= 72560;
update `creature_template` set `gossip_menu_id`= 15886 where `entry`= 72695;
update `creature_template` set `gossip_menu_id`= 14014 where `entry`= 72939;
update `creature_template` set `gossip_menu_id`= 64998 where `entry`= 73147;
update `creature_template` set `gossip_menu_id`= 15875 where `entry`= 73305;
update `creature_template` set `gossip_menu_id`= 15882 where `entry`= 73353;
update `creature_template` set `gossip_menu_id`= 15939 where `entry`= 73594;
update `creature_template` set `gossip_menu_id`= 100001 where `entry`= 73781;


delete from `gossip_menu` where `Entry` in (
13037,13110,13128,13129,13137,13220,13250,13250,13250,13250,13323,13323,13581,13595,13734,13734,13739,13739,13739,13739,13750,13753,13755,13813,13821,13846,13848,13882,13887,13917,14014,14271,
14271,14271,14328,14429,14488,14527,14598,14640,14674,14812,14946,14949,14984,14987,15011,15015,15019,15020,15023,15024,15025,15028,15029,15035,15047,15068,15803,15875,15882,15886,15939,15992,
16077,19100,59581,59582,59583,59585,62107);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13037, 18310);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13110, 18523);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13128, 18466);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13129, 18470);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13137, 18478);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13220, 18630);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13250, 18684);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13250, 19280);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13250, 19305);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13250, 19306);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13323, 18868);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13323, 18869);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13581, 19400);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13595, 19460);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13734, 19743);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13734, 19809);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13739, 19763);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13739, 19764);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13739, 19806);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13739, 19808);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13750, 19777);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13753, 19786);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13755, 19798);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13813, 19934);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13821, 19950);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13846, 20006);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13848, 20011);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13882, 20067);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13887, 20074);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (13917, 20094);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14014,  5006);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14271, 20118);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14271, 20138);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14271, 20139);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14328, 20232);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14429, 20360);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14488, 20484);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14527, 20537);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14598, 20651);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14640, 20702);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14674, 20787);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14812, 21136);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14946, 21133);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14949, 20964);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14984, 21183);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (14987, 21185);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15011, 21235);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15015, 21239);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15019, 21247);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15020, 21248);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15023, 21253);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15024, 21254);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15025, 21255);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15028, 21260);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15029, 21261);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15035, 21269);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15047, 21282);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15068, 21298);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15803, 22732);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15875, 22853);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15882, 22871);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15886, 22886);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15939, 22949);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (15992, 23053);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (16077,  2593);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (19100, 27930);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (59581,     1);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (59582,     1);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (59583,     1);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (59585,     1);
INSERT INTO `gossip_menu` (`Entry`, `Text_ID`) VALUES (62107, 62107);



delete from `gossip_menu_option` where `Menu_ID` in (
13128,13128,13137,13250,13250,13581,13595,13739,13739,13750,13753,13848,13882,13887,14271,14271,14640,14674,14674,14946,14949,14984,14987,15011,15011,15019,15020,15020,15023,15024,15025,15025,
15028,15029,15035,15047,15068,15803,15992,16077,16077,16077,16077,16077,16077,16077,16077,16077,16077,16077,16077,16077,16077,16077,16077,19100,59581,59582,59582,59582,59583,59583,59585,62107);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `OptionBroadcastTextID`, `BoxBroadcastTextID`) VALUES 
(13128, 0, 0, 'Can you help us? Our friend is injured.', 0, 0, 0, 0, 0, 0, NULL, 53800, 0),
(13128, 1, 0, 'I am an orc, ma\'am. Would you mind if I asked you a few questions?', 0, 0, 0, 0, 0, 0, '', 54187, 0),
(13137, 0, 0, 'Where is Shin?', 0, 0, 0, 0, 0, 0, '', 53908, 0),
(13250, 0, 0, 'I have brought the items for the ceremony.', 1, 1, 0, 0, 0, 0, NULL, 55031, 0),
(13250, 1, 0, 'I come from the Alliance. We wish to be allies, not enemies.', 0, 0, 0, 0, 0, 0, NULL, 58051, 0),
(13581, 0, 0, 'Let\'s see what you\'ve got.', 1, 1, 0, 0, 0, 0, NULL, 58725, 0),
(13595, 0, 0, 'What gifts do you like?', 0, 0, 0, 0, 0, 0, '', 58603, 0),
(13739, 1, 0, 'I need another Totem of Harmony.', 0, 0, 0, 0, 0, 0, NULL, 60568, 0),
(13739, 2, 0, 'I am ready to begin the ritual.', 0, 0, 0, 0, 0, 0, '', 103586, 0),
(13750, 0, 0, 'Why aren\'t you helping me fight things?', 0, 0, 0, 0, 0, 0, '', 60556, 0),
(13753, 0, 1, 'Let me take a look at your item.', 3, 128, 0, 0, 0, 0, '', 0, 0),
(13848, 0, 0, 'Would you accompany me?', 0, 0, 0, 0, 0, 0, '', 61736, 0),
(13882, 0, 0, 'Shall we meet in the Challenger\'s Ring?', 1, 1, 0, 0, 0, 0, '', 62306, 0),
(13887, 0, 0, 'We\'re ready to defend!', 0, 0, 0, 0, 0, 0, '', 62252, 0),
(14271, 0, 0, 'Grant me your assistance, Prime. [Klaxxi Augmentation]', 0, 0, 0, 0, 0, 0, '', 62562, 0),
(14271, 1, 0, 'Korven, let\'s continue.', 0, 0, 0, 0, 0, 0, '', 67683, 0),
(14640, 0, 1, 'I would like to buy something from you.', 3, 128, 0, 0, 0, 0, '', 2583, 0),
(14674, 0, 5, 'Make this inn your home.', 8, 65536, 0, 0, 0, 0, '', 2822, 0),
(14674, 1, 1, 'What are you selling?', 0, 0, 0, 0, 0, 0, '', 66614, 0),
(14946, 0, 0, 'Think you can take me in a pet battle?  Let\'s fight!', 0, 1, 0, 0, 0, 0, 'Let the battle begin.?', 62660, 70433),
(14949, 0, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'Let the battle begin.?', 62660, 70433),
(14984, 0, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'Start!', 62660, 67336),
(14987, 0, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'Let the battle begin.?', 62660, 70433),
(15011, 0, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'Start!', 62660, 67337),
(15011, 1, 0, 'Let the battle begin.?', 1, 1, 0, 0, 0, 0, 'Start!', 70433, 67337),
(15019, 0, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'Come on!', 62660, 94087),
(15020, 0, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'Start!', 62660, 67336),
(15020, 1, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'Start!', 62660, 67336),
(15023, 0, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'Start!', 62660, 67337),
(15024, 0, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'Come on!', 62660, 94087),
(15025, 0, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'You don\'t stand a chance!', 62660, 67653),
(15025, 1, 0, 'Let the battle begin.?', 1, 1, 0, 0, 0, 0, 'You don\'t stand a chance!', 70433, 67653),
(15028, 0, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'You don\'t stand a chance!', 62660, 67653),
(15029, 0, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'Start!', 62660, 67336),
(15035, 1, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'To Battle!', 62660, 91763),
(15047, 0, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'Let the battle begin.?', 62660, 70433),
(15068, 0, 0, 'You think you can handle me in a pet fight? let us check it out.!', 0, 1, 0, 0, 0, 0, 'Start .!', 62660, 67336),
(15803, 0, 0, 'My troops are yours to command, my King.', 1, 1, 0, 0, 0, 0, 'Do you want to start the encounter?', 75319, 57303),
(15992, 0, 0, 'By your command.', 1, 1, 0, 0, 0, 0, 'Do you want to start the encounter?', 89462, 57303),
(16077, 0, 0, 'Battle Pet Trainer', 1, 1, 0, 0, 0, 0, '', 67342, 0),
(16077, 2, 0, 'Transmogrification', 1, 1, 0, 0, 0, 0, '', 56155, 0),
(16077, 3, 0, 'Void Storage', 1, 1, 0, 0, 0, 0, '', 53080, 0),
(16077, 4, 0, 'Auction House', 1, 1, 0, 0, 0, 0, '', 44627, 0),
(16077, 5, 0, 'Barber', 1, 1, 0, 0, 0, 0, '', 78584, 0),
(16077, 6, 0, 'Парикмахер', 1, 1, 0, 0, 0, 0, '', 45376, 0),
(16077, 7, 0, 'Battlemasters', 1, 1, 0, 0, 0, 0, '', 45377, 0),
(16077, 8, 0, 'Class Trainer', 1, 1, 0, 0, 0, 0, '', 45378, 0),
(16077, 9, 0, 'Flight Master', 1, 1, 0, 0, 0, 0, '', 45379, 0),
(16077, 10, 0, 'Guild Master & Vendor', 1, 1, 0, 0, 0, 0, '', 45380, 0),
(16077, 11, 0, 'Inn', 1, 1, 0, 0, 0, 0, '', 44629, 0),
(16077, 12, 0, 'Officers\' Lounge', 1, 1, 0, 0, 0, 0, '', 9756, 0),
(16077, 13, 0, 'Other Continents', 1, 1, 0, 0, 0, 0, '', 47507, 0),
(16077, 14, 0, 'Profession Trainer', 1, 1, 0, 0, 0, 0, '', 19210, 0),
(16077, 15, 0, 'Stable Master', 1, 1, 0, 0, 0, 0, '', 45383, 0),
(16077, 16, 0, 'Other Continents', 1, 1, 0, 0, 0, 0, '', 5914, 0),
(19100, 0, 0, 'Rehgar and I are ready!', 1, 1, 0, 0, 0, 0, '', 102739, 0),
(59581, 0, 0, 'Hello! I\'m here on behalf of Gina Mudclaw, regarding your debt.', 1, 1, 0, 0, 0, 0, '', 58755, 0),
(59582, 0, 0, 'Hello! I\'m here on behalf of Gina Mudclaw, regarding your debt.', 1, 1, 0, 0, 0, 0, '', 58755, 0),
(59582, 1, 5, 'Make this inn my home', 8, 65536, 0, 0, 0, 0, '', 0, 0),
(59582, 2, 0, 'Trick or Treat!', 1, 1, 0, 0, 0, 0, NULL, 10693, 0),
(59583, 0, 0, 'Hello! I\'m here on behalf of Gina Mudclaw, regarding your debt.', 1, 1, 0, 0, 0, 0, '', 58755, 0),
(59583, 1, 1, 'I want to browse your goods', 3, 128, 0, 0, 0, 0, '', 0, 0),
(59585, 0, 0, 'Hello! I\'m here on behalf of Gina Mudclaw, regarding your debt.', 1, 1, 0, 0, 0, 0, '', 58755, 0),
(62107, 0, 0, 'What can I do to help?', 1, 1, 0, 0, 0, 0, NULL, 58813, 0);

update `creature_template` set `AIName`= 'SmartAI' where `entry` in (59392,57242);
update `creature_template` set `npcflag`= 1 where `entry` in (59392);


DELETE FROM `smart_scripts` WHERE `entryorguid`=57242 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(57242, 0, 0, 1, 62, 0, 100, 0, 13324, 0, 0, 0, 33, 57290, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On gossip select - Give quest credit'),
(57242, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 62, 870, 0, 0, 0, 0, 0, 7, 0, 0, 0, 920.04, -2613.55, 185.12, 4.5, 'Link - tele invoker');

DELETE FROM `smart_scripts` WHERE `entryorguid`=59392 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(59392, 0, 0, 0, 62, 0, 100, 0, 13550, 1, 0, 0, 62, 870, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1001.24, -2388.14, 168.59, 5.7, 'On gossip select - tele invoker');


delete from `gossip_menu_option` where `Menu_ID` in (13324);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `OptionBroadcastTextID`, `BoxBroadcastTextID`) VALUES 
(13324, 0, 0, 'I have a message for the Jade Serpent.', 1, 1, 0, 0, 0, 0, NULL, 56092, 0);

update `creature_template` set `VehicleId`= 0 where `entry` in (56034);

DELETE FROM `creature` WHERE `guid`=582638;
DELETE FROM `creature` WHERE `guid`=582639;
DELETE FROM `creature` WHERE `guid`=582640;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(582638, 63879, 870, 6138, 6401, 1, 65535, 0, -1228.9, 3656.29, -52.6571, 2.87352, 300, 0, 0, 84, 0, 0, 0, 33554432, 0),
(582639, 63880, 870, 6138, 6402, 1, 65535, 0, -1399.63, 3752.09, -43.9473, 5.2788, 300, 0, 0, 84, 0, 0, 0, 33554432, 0),
(582640, 63881, 870, 6138, 6401, 1, 65535, 0, -1383.56, 3984.26, -34.4473, 2.11286, 300, 0, 0, 84, 0, 0, 0, 33554432, 0);

update `creature_template` set `AIName`= 'SmartAI' where `entry` in (63879,63880,63881,63955);

DELETE FROM `smart_scripts` WHERE `entryorguid`=63879 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=63880 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=63881 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=63955 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(63879, 0, 0, 0, 60, 0, 100, 0, 5000, 5000, 5000, 5000, 45, 1, 1, 0, 0, 0, 0, 19, 63955, 80, 0, 0, 0, 0, 0, 'Event Update - Send Data'),
(63880, 0, 0, 0, 60, 0, 100, 0, 5000, 5000, 5000, 5000, 45, 2, 2, 0, 0, 0, 0, 19, 63955, 80, 0, 0, 0, 0, 0, 'Event Update - Send Data'),
(63881, 0, 0, 0, 60, 0, 100, 0, 5000, 5000, 5000, 5000, 45, 3, 3, 0, 0, 0, 0, 19, 63955, 80, 0, 0, 0, 0, 0, 'Event Update - Send Data'),
(63955, 0, 0, 1, 38, 0, 100, 1, 1, 1, 0, 0, 33, 63879, 0, 0, 0, 0, 0, 21, 20, 0, 0, 0, 0, 0, 0, 'Update Data - Kill Credit'),
(63955, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Kill Credit'),
(63955, 0, 2, 3, 38, 0, 100, 1, 2, 2, 0, 0, 33, 63880, 0, 0, 0, 0, 0, 21, 20, 0, 0, 0, 0, 0, 0, 'Update Data - Kill Credit'),
(63955, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Kill Credit'),
(63955, 0, 4, 5, 38, 0, 100, 1, 3, 3, 0, 0, 33, 63881, 0, 0, 0, 0, 0, 21, 20, 0, 0, 0, 0, 0, 0, 'Update Data - Kill Credit'),
(63955, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Kill Credit'),
(63955, 0, 6, 0, 54, 0, 100, 1, 0, 0, 0, 0, 29, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Just Summoned - Follow Invoker');

update `creature_template` set `AIName`= 'SmartAI' where `entry` in (63369);

DELETE FROM `smart_scripts` WHERE `entryorguid`=63369 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(63369, 0, 0, 0, 6, 0, 100, 1, 0, 0, 0, 0, 33, 63995, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'On death - Give credit');


DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=1 AND `SourceEntry`=63369 AND `SourceId`=0 AND `ElseGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, 63369, 0, 0, 29, 0, 63955, 10, 0, 0, 0, '', 'SAI only if near npc');


DELETE FROM `creature` WHERE `guid`=582640;
DELETE FROM `creature` WHERE `guid`=582641;
DELETE FROM `creature` WHERE `guid`=582642;
DELETE FROM `creature` WHERE `guid`=582643;
DELETE FROM `creature` WHERE `guid`=582644;
DELETE FROM `creature` WHERE `guid`=582645;
DELETE FROM `creature` WHERE `guid`=582646;
DELETE FROM `creature` WHERE `guid`=582647;
DELETE FROM `creature` WHERE `guid`=582648;
DELETE FROM `creature` WHERE `guid`=582649;
DELETE FROM `creature` WHERE `guid`=582650;
DELETE FROM `creature` WHERE `guid`=582651;
DELETE FROM `creature` WHERE `guid`=582652;
DELETE FROM `creature` WHERE `guid`=582653;
DELETE FROM `creature` WHERE `guid`=582654;
DELETE FROM `creature` WHERE `guid`=582655;
DELETE FROM `creature` WHERE `guid`=582656;
DELETE FROM `creature` WHERE `guid`=582657;
DELETE FROM `creature` WHERE `guid`=582658;
DELETE FROM `creature` WHERE `guid`=582659;
DELETE FROM `creature` WHERE `guid`=582660;
DELETE FROM `creature` WHERE `guid`=582662;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(582640, 63369, 870, 6138, 6401, 1, 1, 43189, -1306.99, 3522.19, -40.1086, 3.7861, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582641, 63369, 870, 6138, 6401, 1, 1, 43189, -1267.36, 3523.03, -40.2969, -0.405652, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582642, 63369, 870, 6138, 6401, 1, 1, 43189, -1278.89, 3637.45, -60.4141, 0.237405, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582643, 63369, 870, 6138, 6401, 1, 1, 43189, -1279.15, 3579.35, -41.0015, 4.34105, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582644, 63369, 870, 6138, 6401, 1, 1, 43189, -1310.65, 3751.65, -44.5098, 4.9436, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582645, 63369, 870, 6138, 6401, 1, 1, 43189, -1309.38, 3780.79, -44.3036, 3.01213, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582646, 63369, 870, 6138, 6401, 1, 1, 43189, -1353.52, 3613.96, -42.399, 3.72891, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582647, 63369, 870, 6138, 6401, 1, 1, 43189, -1301.4, 3827.67, -44.7134, 1.36416, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582648, 63369, 870, 6138, 6401, 1, 1, 43189, -1429.68, 3991.91, -42.8744, 6.23429, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582649, 63369, 870, 6138, 6401, 1, 1, 43189, -1378.19, 3915.68, -44.0053, 5.24067, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582650, 63369, 870, 6138, 6401, 1, 1, 43189, -1352.46, 3943.14, -47.5802, 4.93136, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582651, 63369, 870, 6138, 6401, 1, 1, 43189, -1411.88, 3856.76, -46.2289, 4.69782, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582652, 63369, 870, 6138, 6401, 1, 1, 43189, -1330.03, 3885.81, -44.1236, 5.27327, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582653, 63369, 870, 6138, 6401, 1, 1, 43189, -1338.8, 3848.94, -44.6057, 2.05317, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582654, 63369, 870, 6138, 6401, 1, 1, 43189, -1255.39, 3830.66, -48.2098, 1.92998, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582655, 63369, 870, 6138, 6401, 1, 1, 43189, -1148.12, 3796.36, -17.5679, 3.63307, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582656, 63369, 870, 6138, 6401, 1, 1, 43189, -1058.78, 3709.39, -18.2616, 2.87584, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582657, 63369, 870, 6138, 6401, 1, 1, 43189, -1434.29, 4059.5, -45.508, 2.42204, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582658, 63369, 870, 6138, 6401, 1, 1, 43189, -1384.26, 4025.29, -44.6041, 2.53766, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582659, 63369, 870, 6138, 6402, 1, 1, 43189, -1367.06, 3775.25, -46.1958, 5.96329, 300, 0, 0, 393941, 393941, 0, 0, 0, 0),
(582660, 63369, 870, 6138, 6402, 1, 1, 43189, -1389.39, 3714.83, -47.0801, 2.40631, 300, 7, 0, 393941, 393941, 1, 0, 0, 0),
(582662, 63369, 870, 6138, 6402, 1, 1, 43189, -1419.42, 3718.12, -49.5766, -2.0943, 300, 0, 0, 393941, 393941, 0, 0, 0, 0);

/*# Datos SQL ###########################################*/
SET @CREATURE  	:= 'Sully';
SET @ENTRY 		:= '64494';
/*SET @MAP   		:= 530;       *//*(Outland)*/
/*SET @ZONE  		:= 6455;      *//*(Sunstrider Isle)*/
/*SET @AREA  		:= 3431;      *//*(Sunstrider Isle)*/
/*#######################################################*/


/* Step 1.1 Table  `creature_template` */
DELETE FROM `creature_template` WHERE `entry` = @ENTRY;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `difficulty_entry_4`, `difficulty_entry_5`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `npcflag`, `npcflag2`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(@ENTRY,'0', '0', '0', '0', '0', '0', '0', '38872', '0', '0', '0', @CREATURE, '', '', '0', '85', '85', '4', '0', '35', '35', '0', '0', '1', '1.14286', '1', '0', '9839', '14339', '0', '42299', '1', '2000', '2000', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '262144', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'SmartAI', '0', '3', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '144', '1', '0', '0', '', '16048');

/* Step 1.3 Table  creature_template_addon */
DELETE FROM creature_template_addon WHERE  `entry` = @ENTRY;
/* Step 2.7 Table  `creature_model_info */
DELETE m1 FROM creature_template AS ct JOIN creature_model_info AS m1 ON ct.modelid1 = m1.modelid OR ct.modelid2 = m1.modelid OR ct.modelid3 = m1.modelid OR ct.modelid4 = m1.modelid WHERE entry = @ENTRY;
INSERT INTO `creature_model_info` (`modelid`,`bounding_radius`,`combat_reach`,`gender`,`modelid_other_gender`) VALUES 
('38872', '0.347', '1.5', '0', '0'); 


/* Step 1.6 Table  `creature_text */
DELETE FROM  `creature_text` WHERE `entry`= @ENTRY;
/* Step 1.6 Table  `smart_scripts` */
DELETE FROM smart_scripts WHERE `entryorguid` = 64494 AND `source_type`= 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
('64494', '0', '0', '0', '60', '0', '100', '0', '20', '30', '1000', '1000', '33', '64494', '0', '0', '0', '0', '0', '17', '0', '5', '0', '0', '0', '0', '0', 'Sully - On Update - Quest Credit \'Emergency Response\''); 


/* Step 1.7 Table  `creature */
DELETE FROM creature WHERE  `id` = @ENTRY;
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`, `currentwaypoint`,`curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`,`unit_flags2`,`dynamicflags`) VALUES 
(NULL, @ENTRY, '870', '5785', '5876', '1', '1', '0', '0', '756.614', '-1873.72', '61.5673', '4.88256', '300', '0', '0', '156000', '0', '0', '0', '0', '0', '0', '0'); 

/* Step 2.8 Table  `creature_addon` */
SET @GUID := (SELECT `guid` FROM `creature` WHERE `position_x` REGEXP '756.614' AND `position_y` REGEXP '-1873.72' AND `position_z` REGEXP '61.5673' AND `phaseMask` = '1' AND `map` = '870');
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
/* Step 3.1 Table  `creature_formations` */
SET @GUID := (SELECT `guid` FROM `creature` WHERE `position_x` REGEXP '756.614' AND `position_y` REGEXP '-1873.72' AND `position_z` REGEXP '61.5673' AND `phaseMask` = '1' AND `map` = '870');


/*### Datos SQL #########################################*/
SET @CREATURE  	:= 'Mishka';
SET @ENTRY 		:= '64493';
/*SET @MAP   		:= 530;       *//*(Outland)*/
/*SET @ZONE  		:= 6455;      *//*(Sunstrider Isle)*/
/*SET @AREA  		:= 3431;      *//*(Sunstrider Isle)*/
/*#######################################################*/


/* Step 1.1 Table  `creature_template` */
DELETE FROM `creature_template` WHERE `entry` = @ENTRY;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `difficulty_entry_4`, `difficulty_entry_5`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `npcflag`, `npcflag2`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(@ENTRY, '0', '0', '0', '0', '0', '0', '0', '38870', '0', '0', '0', @CREATURE, '', '', '0', '85', '85', '4', '0', '35', '35', '0', '0', '1', '1.14286', '1', '0', '9839', '14339', '0', '42299', '1', '2000', '2000', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '262144', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'SmartAI', '0', '3', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '144','0', '0', '0', '', '16048');

/* Step 1.3 Table  creature_template_addon */
DELETE FROM creature_template_addon WHERE  `entry` = @ENTRY;
/* Step 2.7 Table  `creature_model_info */
DELETE m1 FROM creature_template AS ct JOIN creature_model_info AS m1 ON ct.modelid1 = m1.modelid OR ct.modelid2 = m1.modelid OR ct.modelid3 = m1.modelid OR ct.modelid4 = m1.modelid WHERE entry = @ENTRY;
INSERT INTO `creature_model_info` (`modelid`,`bounding_radius`,`combat_reach`,`gender`,`modelid_other_gender`) VALUES 
('38870', '1', '1.5', '1', '0'); 


/* Step 1.6 Table  `creature_text */
DELETE FROM  `creature_text` WHERE `entry`= @ENTRY;
/* Step 1.6 Table  `smart_scripts` */
DELETE FROM smart_scripts WHERE `entryorguid` = 64493 AND `source_type`= 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
('64493', '0', '0', '0', '60', '0', '100', '0', '20', '30', '1000', '1000', '33', '64493', '0', '0', '0', '0', '0', '17', '0', '5', '0', '0', '0', '0', '0', 'Mishka - On Update - Quest Credit \'Emergency Response\''); 


/* Step 1.7 Table  `creature */
DELETE FROM creature WHERE  `id` = @ENTRY;
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`, `currentwaypoint`,`curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`,`unit_flags2`,`dynamicflags`) VALUES 
(NULL, @ENTRY, '870', '5785', '5876', '1', '1', '0', '0', '760.465', '-1874.6', '62.079', '4.10501', '300', '0', '0', '156000', '0', '0', '0', '0', '0', '0', '0'); 

/* Step 2.8 Table  `creature_addon` */
SET @GUID := (SELECT `guid` FROM `creature` WHERE `position_x` REGEXP '760.465' AND `position_y` REGEXP '-1874.6' AND `position_z` REGEXP '62.079' AND `phaseMask` = '1' AND `map` = '870');
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
/* Step 3.1 Table  `creature_formations` */
SET @GUID := (SELECT `guid` FROM `creature` WHERE `position_x` REGEXP '760.465' AND `position_y` REGEXP '-1874.6' AND `position_z` REGEXP '62.079' AND `phaseMask` = '1' AND `map` = '870');

/*### Datos SQL ###########################################*/
SET @CREATURE  	:= 'Admiral Taylor';
SET @ENTRY 		:= '64491';
/*SET @MAP   		:= 530;       *//*(Outland)*/
/*SET @ZONE  		:= 6455;      *//*(Sunstrider Isle)*/
/*SET @AREA  		:= 3431;      *//*(Sunstrider Isle)*/
/*#######################################################*/


/* Step 1.1 Table  `creature_template` */
DELETE FROM `creature_template` WHERE `entry` = @ENTRY;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `difficulty_entry_4`, `difficulty_entry_5`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `npcflag`, `npcflag2`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`,  `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES 
(@ENTRY, '0', '0', '0', '0', '0', '0', '0', '39036', '0', '0', '0', @CREATURE, '', '', '0', '85', '85', '4', '0', '35', '35', '0', '0', '1', '1.14286', '1', '0', '9839', '14339', '0', '42299', '1', '2000', '2000', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '7', '262144', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'SmartAI', '0', '3', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '144', '1', '0', '0', '', '16048');

/* Step 1.3 Table  creature_template_addon */
DELETE FROM creature_template_addon WHERE  `entry` = @ENTRY;
/* Step 2.7 Table  `creature_model_info */
DELETE m1 FROM creature_template AS ct JOIN creature_model_info AS m1 ON ct.modelid1 = m1.modelid OR ct.modelid2 = m1.modelid OR ct.modelid3 = m1.modelid OR ct.modelid4 = m1.modelid WHERE entry = @ENTRY;
INSERT INTO `creature_model_info` (`modelid`,`bounding_radius`,`combat_reach`,`gender`,`modelid_other_gender`) VALUES 
('39036', '0.306', '1.5', '0', '0'); 


/* Step 1.6 Table  `creature_text */
DELETE FROM  `creature_text` WHERE `entry`= @ENTRY;
/* Step 1.6 Table  `smart_scripts` */
DELETE FROM smart_scripts WHERE `entryorguid` = 64491 AND `source_type`= 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
('64491', '0', '0', '0', '60', '0', '100', '0', '60', '60', '1000', '1000', '33', '64491', '0', '0', '0', '0', '0', '17', '0', '5', '0', '0', '0', '0', '0', 'Admiral Taylor - Within 20-30 Range - Quest Credit \'Emergency Response\''); 


/* Step 1.7 Table  `creature */
DELETE FROM creature WHERE  `id` = @ENTRY;
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`, `currentwaypoint`,`curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`,`unit_flags2`,`dynamicflags`) VALUES 
(NULL, @ENTRY, '870', '5785', '5876', '1', '1', '0', '0', '762.159', '-1881.31', '61.2975', '3.79085', '300', '0', '0', '156000', '0', '0', '0', '0', '0', '0', '0'); 

/* Step 2.8 Table  `creature_addon` */
SET @GUID := (SELECT `guid` FROM `creature` WHERE `position_x` REGEXP '762.159' AND `position_y` REGEXP '-1881.31' AND `position_z` REGEXP '61.2975' AND `phaseMask` = '1' AND `map` = '870');
DELETE FROM `creature_addon` WHERE `guid` = @GUID;
/* Step 3.1 Table  `creature_formations` */
SET @GUID := (SELECT `guid` FROM `creature` WHERE `position_x` REGEXP '762.159' AND `position_y` REGEXP '-1881.31' AND `position_z` REGEXP '61.2975' AND `phaseMask` = '1' AND `map` = '870');
DELETE FROM  `creature_formations` WHERE `leaderGUID` = @GUID;

-- ------------------------------------------------------------------------------------------------
-- Fix for quest "Gardener Fran and the Watering Can" (ID: 30050)
-- ------------------------------------------------------------------------------------------------

SET @NPC_ENTRY := 57284;

-- creature_template
DELETE FROM `creature_template` WHERE `entry`=@NPC_ENTRY;
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `difficulty_entry_4`, `difficulty_entry_5`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `npcflag`, `npcflag2`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES ('57284',  '0', '0', '0', '0', '0', '0', '0', '16925', '0', '0', '0', 'Watering Can Credit', '', '', '0', '1', '1', '4', '0', '35', '35', '0', '0', '1', '1.14286', '0', '1.14286', '1', '0', '1', '2', '0', '1', '1', '2000', '2000', '1', '0', '0', '0', '0', '0', '1', '2', '1', '10', '1074790400', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', 'npc_watering_can_credit', '16048');
-- creature (spanws)
DELETE FROM `creature` WHERE `id`=@NPC_ENTRY;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES 
('13231767', '57284', '870', '5805', '5992', '1', '1', '0', '0', '269.76', '681.798', '160.497', '2.44044', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231768', '57284', '870', '5805', '5992', '1', '1', '0', '0', '274.584', '687.061', '160.511', '2.4208', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231771', '57284', '870', '5805', '5992', '1', '1', '0', '0', '280.656', '692.359', '160.655', '2.52683', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231772', '57284', '870', '5805', '5992', '1', '1', '0', '0', '289.282', '691.696', '160.585', '2.52683', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231774', '57284', '870', '5805', '5992', '1', '1', '0', '0', '284.487', '686.264', '160.821', '2.63286', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231777', '57284', '870', '5805', '5992', '1', '1', '0', '0', '279.144', '680.442', '160.695', '2.63852', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231778', '57284', '870', '5805', '5992', '1', '1', '0', '0', '275.072', '676.863', '160.516', '2.58747', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231779', '57284', '870', '5805', '5992', '1', '1', '0', '0', '280.48', '671.054', '160.5', '2.46965', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231780', '57284', '870', '5805', '5992', '1', '1', '0', '0', '284.905', '675.277', '160.518', '2.45002', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231781', '57284', '870', '5805', '5992', '1', '1', '0', '0', '289.048', '680.812', '160.574', '2.42646', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231782', '57284', '870', '5805', '5992', '1', '1', '0', '0', '294.428', '686.821', '160.503', '2.5207', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231783', '57284', '870', '5805', '5992', '1', '1', '0', '0', '301.434', '687.632', '160.502', '2.8977', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231784', '57284', '870', '5805', '5992', '1', '1', '0', '0', '306.075', '680.885', '160.501', '3.49068', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231785', '57284', '870', '5805', '5992', '1', '1', '0', '0', '305.6', '672.896', '160.499', '3.58774', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231786', '57284', '870', '5805', '5992', '1', '1', '0', '0', '305.68', '665.963', '160.498', '3.05366', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231787', '57284', '870', '5805', '5992', '1', '1', '0', '0', '297.452', '666.394', '160.5', '2.95549', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231788', '57284', '870', '5805', '5992', '1', '1', '0', '0', '298.808', '672.838', '160.5', '3.10079', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231789', '57284', '870', '5805', '5992', '1', '1', '0', '0', '299.713', '679.815', '160.5', '2.82983', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231791', '57284', '870', '5805', '5992', '1', '1', '0', '0', '293.781', '676.159', '160.5', '2.81412', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231792', '57284', '870', '5805', '5992', '1', '1', '0', '0', '290.968', '668.199', '160.5', '2.60992', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231797', '57284', '870', '5805', '5992', '1', '1', '0', '0', '323.441', '678.494', '160.51', '0.238009', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231798', '57284', '870', '5805', '5992', '1', '1', '0', '0', '326.86', '679.33', '160.499', '0.198739', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231799', '57284', '870', '5805', '5992', '1', '1', '0', '0', '330.517', '679.812', '160.545', '0.253716', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231800', '57284', '870', '5805', '5992', '1', '1', '0', '0', '329.92', '682.656', '160.514', '3.34426', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231801', '57284', '870', '5805', '5992', '1', '1', '0', '0', '326.533', '682.301', '160.504', '3.32855', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231802', '57284', '870', '5805', '5992', '1', '1', '0', '0', '322.993', '681.349', '160.5', '3.37568', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231803', '57284', '870', '5805', '5992', '1', '1', '0', '0', '322.783', '684.231', '160.534', '0.198739', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231804', '57284', '870', '5805', '5992', '1', '1', '0', '0', '326.285', '685.068', '160.568', '0.183031', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231805', '57284', '870', '5805', '5992', '1', '1', '0', '0', '329.522', '685.531', '160.586', '0.183031', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231806', '57284', '870', '5805', '5992', '1', '1', '0', '0', '328.284', '688.205', '160.728', '3.40316', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231807', '57284', '870', '5805', '5992', '1', '1', '0', '0', '324.928', '687.786', '160.728', '3.40316', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231808', '57284', '870', '5805', '5992', '1', '1', '0', '0', '321.486', '686.911', '160.655', '3.39531', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231809', '57284', '870', '5805', '5992', '1', '1', '0', '0', '337.931', '686.759', '160.492', '6.03818', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231810', '57284', '870', '5805', '5992', '1', '1', '0', '0', '338.01', '684.165', '160.495', '0.615006', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231811', '57284', '870', '5805', '5992', '1', '1', '0', '0', '340.294', '681.706', '160.504', '0.834917', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231812', '57284', '870', '5805', '5992', '1', '1', '0', '0', '338.386', '681.576', '160.499', '0.650347', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231813', '57284', '870', '5805', '5992', '1', '1', '0', '0', '339.682', '680.322', '160.522', '0.964507', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231814', '57284', '870', '5805', '5992', '1', '1', '0', '0', '341.105', '680.195', '160.553', '0.937018', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231815', '57284', '870', '5805', '5992', '1', '1', '0', '0', '342.917', '680.205', '160.551', '0.925237', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231816', '57284', '870', '5805', '5992', '1', '1', '0', '0', '344.059', '680.522', '160.571', '2.29968', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231817', '57284', '870', '5805', '5992', '1', '1', '0', '0', '343.354', '681.772', '160.5', '2.16617', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231818', '57284', '870', '5805', '5992', '1', '1', '0', '0', '341.969', '681.402', '160.533', '2.09941', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231819', '57284', '870', '5805', '5992', '1', '1', '0', '0', '340.825', '682.58', '160.5', '2.21329', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231820', '57284', '870', '5805', '5992', '1', '1', '0', '0', '342.413', '683.439', '160.499', '2.31539', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231821', '57284', '870', '5805', '5992', '1', '1', '0', '0', '341.163', '685.092', '160.488', '2.18973', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231822', '57284', '870', '5805', '5992', '1', '1', '0', '0', '339.828', '684.141', '160.493', '2.18973', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231823', '57284', '870', '5805', '5992', '1', '1', '0', '0', '339.06', '685.506', '160.491', '2.11904', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231824', '57284', '870', '5805', '5992', '1', '1', '0', '0', '339.156', '687.549', '160.481', '2.02479', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231825', '57284', '870', '5805', '5992', '1', '1', '0', '0', '340.496', '686.25', '160.481', '5.54338', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231826', '57284', '870', '5805', '5992', '1', '1', '0', '0', '344.992', '684.577', '160.497', '0.654275', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231827', '57284', '870', '5805', '5992', '1', '1', '0', '0', '346.035', '683.293', '160.504', '0.273357', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231828', '57284', '870', '5805', '5992', '1', '1', '0', '0', '345.086', '681.98', '160.536', '4.45167', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231830', '57284', '870', '5805', '5992', '1', '1', '0', '0', '346.077', '685.535', '160.495', '2.45676', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231831', '57284', '870', '5805', '5992', '1', '1', '0', '0', '344.734', '687.17', '160.488', '2.69238', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231832', '57284', '870', '5805', '5992', '1', '1', '0', '0', '342.629', '687.954', '160.463', '2.928', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231833', '57284', '870', '5805', '5992', '1', '1', '0', '0', '340.037', '688.866', '160.453', '3.37175', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231838', '57284', '870', '5805', '5992', '1', '1', '0', '0', '353.746', '697.634', '162.071', '1.11765', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231839', '57284', '870', '5805', '5992', '1', '1', '0', '0', '361.064', '698.595', '161.462', '0.52468', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231840', '57284', '870', '5805', '5992', '1', '1', '0', '0', '360.917', '694.304', '161.646', '5.39021', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231841', '57284', '870', '5805', '5992', '1', '1', '0', '0', '360.2', '689.017', '162.216', '0.457883', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231842', '57284', '870', '5805', '5992', '1', '1', '0', '0', '366.714', '683.237', '161.628', '0.929112', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231843', '57284', '870', '5805', '5992', '1', '1', '0', '0', '370.329', '692.333', '161.817', '1.39642', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231844', '57284', '870', '5805', '5992', '1', '1', '0', '0', '366.982', '700.236', '161.804', '3.9529', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231845', '57284', '870', '5805', '5992', '1', '1', '0', '0', '372.733', '697.424', '162.136', '4.30241', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231846', '57284', '870', '5805', '5992', '1', '1', '0', '0', '370.959', '708.022', '162.139', '1.9737', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231847', '57284', '870', '5805', '5992', '1', '1', '0', '0', '376.654', '709.916', '161.883', '0.552126', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231848', '57284', '870', '5805', '5992', '1', '1', '0', '0', '364.577', '715.931', '162.135', '2.99079', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231849', '57284', '870', '5805', '5992', '1', '1', '0', '0', '371.446', '719.425', '161.529', '0.0573252', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231850', '57284', '870', '5805', '5992', '1', '1', '0', '0', '374.059', '722.933', '162.108', '5.84572', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231851', '57284', '870', '5805', '5992', '1', '1', '0', '0', '364.657', '730.524', '160.765', '1.72238', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231852', '57284', '870', '5805', '5992', '1', '1', '0', '0', '369.21', '732.471', '160.891', '2.02868', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231853', '57284', '870', '5805', '5992', '1', '1', '0', '0', '374.363', '733.824', '160.677', '1.97763', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231854', '57284', '870', '5805', '5992', '1', '1', '0', '0', '373.269', '738.674', '160.611', '2.07973', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231856', '57284', '870', '5805', '5992', '1', '1', '0', '0', '368.336', '736.507', '160.499', '3.57984', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231857', '57284', '870', '5805', '5992', '1', '1', '0', '0', '363.361', '734.581', '160.594', '3.53665', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231858', '57284', '870', '5805', '5992', '1', '1', '0', '0', '362.532', '738.82', '160.846', '0.505214', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231860', '57284', '870', '5805', '5992', '1', '1', '0', '0', '367.269', '740.866', '160.651', '0.465944', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231861', '57284', '870', '5805', '5992', '1', '1', '0', '0', '372.213', '742.249', '160.627', '0.336354', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231863', '57284', '870', '5805', '5992', '1', '1', '0', '0', '369.623', '745.751', '160.807', '3.36872', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231865', '57284', '870', '5805', '5992', '1', '1', '0', '0', '364.765', '744.401', '161.026', '3.53088', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231866', '57284', '870', '5805', '5992', '1', '1', '0', '0', '360.005', '742.394', '160.621', '3.60942', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231868', '57284', '870', '5805', '5992', '1', '1', '0', '0', '347.385', '757.927', '162.318', '3.09498', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231869', '57284', '870', '5805', '5992', '1', '1', '0', '0', '343.654', '763.815', '162.398', '2.83187', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231870', '57284', '870', '5805', '5992', '1', '1', '0', '0', '357.345', '765.824', '162.268', '5.97739', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231871', '57284', '870', '5805', '5992', '1', '1', '0', '0', '354.93', '771.838', '161.923', '2.05826', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231872', '57284', '870', '5805', '5992', '1', '1', '0', '0', '351.335', '772.215', '161.712', '3.01644', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231873', '57284', '870', '5805', '5992', '1', '1', '0', '0', '353.148', '776.304', '161.699', '3.0243', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231874', '57284', '870', '5805', '5992', '1', '1', '0', '0', '348.241', '778.981', '162.831', '3.22457', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231875', '57284', '870', '5805', '5992', '1', '1', '0', '0', '348.044', '784.82', '162.504', '2.49808', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231876', '57284', '870', '5805', '5992', '1', '1', '0', '0', '346.461', '791.082', '161.701', '2.78082', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231877', '57284', '870', '5805', '5992', '1', '1', '0', '0', '343.198', '786.766', '162.655', '1.85405', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231878', '57284', '870', '5805', '5992', '1', '1', '0', '0', '340.355', '793.048', '163.058', '1.67734', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231879', '57284', '870', '5805', '5992', '1', '1', '0', '0', '334.069', '794.742', '162.194', '1.95615', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231880', '57284', '870', '5805', '5992', '1', '1', '0', '0', '337.24', '798.975', '162.208', '2.03469', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231881', '57284', '870', '5805', '5992', '1', '1', '0', '0', '333.411', '798.844', '161.61', '4.47309', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231882', '57284', '870', '5805', '5992', '1', '1', '0', '0', '328.253', '795.832', '161.649', '4.06861', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231883', '57284', '870', '5805', '5992', '1', '1', '0', '0', '327.6', '800.861', '162.06', '2.27005', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231884', '57284', '870', '5805', '5992', '1', '1', '0', '0', '321.522', '800.852', '162.594', '2.16009', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231885', '57284', '870', '5805', '5992', '1', '1', '0', '0', '326.131', '805.776', '163.074', '5.78863', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231886', '57284', '870', '5805', '5992', '1', '1', '0', '0', '329.937', '810.666', '162.498', '5.54909', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231887', '57284', '870', '5805', '6096', '1', '1', '0', '0', '333.649', '804.477', '162.959', '5.29384', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231888', '57284', '870', '5805', '5992', '1', '1', '0', '0', '338.449', '765.489', '162.275', '3.82907', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231889', '57284', '870', '5805', '5992', '1', '1', '0', '0', '340.04', '770.329', '162.369', '4.53201', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231890', '57284', '870', '5805', '5992', '1', '1', '0', '0', '335.073', '773.935', '162.509', '3.31464', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231891', '57284', '870', '5805', '5992', '1', '1', '0', '0', '328.734', '773.425', '163.05', '1.64959', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231892', '57284', '870', '5805', '5992', '1', '1', '0', '0', '321.966', '775.735', '162.155', '2.09334', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231893', '57284', '870', '5805', '5992', '1', '1', '0', '0', '325.974', '778.318', '161.587', '1.29224', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231894', '57284', '870', '5805', '5992', '1', '1', '0', '0', '322.092', '782.271', '162.442', '3.22432', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231895', '57284', '870', '5805', '5992', '1', '1', '0', '0', '316.167', '775.658', '162.434', '2.36823', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231896', '57284', '870', '5805', '5992', '1', '1', '0', '0', '318.199', '785.749', '161.706', '1.87343', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231897', '57284', '870', '5805', '5992', '1', '1', '0', '0', '314.459', '783.847', '161.925', '2.8434', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231898', '57284', '870', '5805', '5992', '1', '1', '0', '0', '315.162', '789.178', '162.834', '3.30286', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231899', '57284', '870', '5805', '5992', '1', '1', '0', '0', '311.103', '777.452', '162.491', '4.42989', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231900', '57284', '870', '5805', '5992', '1', '1', '0', '0', '305.638', '775.156', '162.173', '4.47309', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231901', '57284', '870', '5805', '5992', '1', '1', '0', '0', '303.026', '771.273', '161.595', '4.68122', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231902', '57284', '870', '5805', '5992', '1', '1', '0', '0', '298.641', '790.095', '160.441', '2.39178', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231904', '57284', '870', '5805', '5992', '1', '1', '0', '0', '301.668', '797.37', '160.163', '3.0135', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231905', '57284', '870', '5805', '5992', '1', '1', '0', '0', '297.78', '799.364', '159.628', '2.75825', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231907', '57284', '870', '5805', '5992', '1', '1', '0', '0', '296.07', '801.556', '159.223', '3.66931', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231908', '57284', '870', '5805', '5992', '1', '1', '0', '0', '293.482', '801.491', '159.222', '4.43902', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231915', '57284', '870', '5805', '5992', '1', '1', '0', '0', '288.547', '796.709', '160.153', '4.12485', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231916', '57284', '870', '5805', '5992', '1', '1', '0', '0', '294.361', '793.144', '160.279', '5.88414', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231917', '57284', '870', '5805', '5992', '1', '1', '0', '0', '285.134', '790.27', '160.095', '4.117', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231918', '57284', '870', '5805', '5992', '1', '1', '0', '0', '290.863', '787.869', '159.223', '5.21263', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231919', '57284', '870', '5805', '5992', '1', '1', '0', '0', '291.116', '784.988', '159.546', '4.83564', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231920', '57284', '870', '5805', '5992', '1', '1', '0', '0', '294.939', '783.732', '159.727', '5.99017', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231921', '57284', '870', '5805', '5992', '1', '1', '0', '0', '288.959', '777.851', '159.629', '3.86567', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231922', '57284', '870', '5805', '5992', '1', '1', '0', '0', '283.999', '781.715', '160.135', '6.11976', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231923', '57284', '870', '5805', '5992', '1', '1', '0', '0', '277.885', '786.536', '159.637', '2.66401', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231924', '57284', '870', '5805', '5992', '1', '1', '0', '0', '273.615', '780.508', '159.936', '4.15626', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231925', '57284', '870', '5805', '5992', '1', '1', '0', '0', '278.095', '776.792', '160.278', '5.59354', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231926', '57284', '870', '5805', '5992', '1', '1', '0', '0', '285.761', '772.935', '160.158', '5.76633', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231927', '57284', '870', '5805', '5992', '1', '1', '0', '0', '278.971', '766.256', '160.34', '3.95206', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231928', '57284', '870', '5805', '5992', '1', '1', '0', '0', '273.981', '770.406', '160.28', '2.3145', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231929', '57284', '870', '5805', '5992', '1', '1', '0', '0', '268.303', '775.816', '160.154', '2.35377', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231930', '57284', '870', '5805', '5992', '1', '1', '0', '0', '263.706', '769.873', '159.629', '4.19946', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231931', '57284', '870', '5805', '5992', '1', '1', '0', '0', '268.931', '765.662', '159.996', '5.64851', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231932', '57284', '870', '5805', '5992', '1', '1', '0', '0', '273.732', '762.411', '160.117', '5.18514', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231933', '57284', '870', '5805', '5992', '1', '1', '0', '0', '243.542', '794.581', '161.75', '3.01351', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231934', '57284', '870', '5805', '5992', '1', '1', '0', '0', '243.134', '799.078', '160.281', '6.15903', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231935', '57284', '870', '5805', '5992', '1', '1', '0', '0', '243.713', '810.712', '162.762', '1.38773', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231936', '57284', '870', '5805', '5992', '1', '1', '0', '0', '247.687', '816.378', '160.777', '0.559136', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231937', '57284', '870', '5805', '5992', '1', '1', '0', '0', '254.928', '823.359', '162.593', '0.555209', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231938', '57284', '870', '5805', '5992', '1', '1', '0', '0', '254.561', '811.817', '159.819', '4.73353', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231939', '57284', '870', '5805', '5992', '1', '1', '0', '0', '253.679', '807.339', '161.549', '4.83563', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231941', '57284', '870', '5805', '5992', '1', '1', '0', '0', '250.542', '802.627', '160.443', '4.89061', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231944', '57284', '870', '5805', '5992', '1', '1', '0', '0', '259.754', '732.182', '161.155', '4.21513', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231945', '57284', '870', '5805', '5992', '1', '1', '0', '0', '269.61', '728.576', '160.5', '0.197806', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231947', '57284', '870', '5805', '5992', '1', '1', '0', '0', '268.002', '744.481', '160.508', '1.60367', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231948', '57284', '870', '5805', '5992', '1', '1', '0', '0', '257.518', '743.784', '160.516', '5.7113', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231949', '57284', '870', '5805', '5992', '1', '1', '0', '0', '250.845', '723.219', '160.727', '3.62215', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231951', '57284', '870', '5805', '5992', '1', '1', '0', '0', '246.956', '717.326', '160.505', '3.60644', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231952', '57284', '870', '5805', '5992', '1', '1', '0', '0', '248.114', '713.142', '160.623', '3.41402', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231953', '57284', '870', '5805', '5992', '1', '1', '0', '0', '243.726', '720.544', '160.501', '0.519824', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231954', '57284', '870', '5805', '5992', '1', '1', '0', '0', '254.375', '715.711', '160.72', '5.80163', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231955', '57284', '870', '5805', '5992', '1', '1', '0', '0', '235.329', '725.034', '160.526', '1.33271', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231956', '57284', '870', '5805', '5992', '1', '1', '0', '0', '239.153', '725.997', '160.499', '0.786862', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231957', '57284', '870', '5805', '5992', '1', '1', '0', '0', '242.072', '728.148', '160.499', '1.80003', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231958', '57284', '870', '5805', '5992', '1', '1', '0', '0', '236.322', '729.641', '160.499', '2.06706', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231959', '57284', '870', '5805', '5992', '1', '1', '0', '0', '238.132', '735.653', '160.499', '1.56441', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231960', '57284', '870', '5805', '5992', '1', '1', '0', '0', '240.476', '737.872', '160.501', '1.48979', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231961', '57284', '870', '5805', '5992', '1', '1', '0', '0', '240.609', '741.317', '160.618', '2.00816', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231962', '57284', '870', '5805', '5992', '1', '1', '0', '0', '236.927', '740.551', '160.499', '1.79217', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231963', '57284', '870', '5805', '5992', '1', '1', '0', '0', '235.786', '743.949', '160.499', '1.08924', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231964', '57284', '870', '5805', '5992', '1', '1', '0', '0', '239.654', '745.521', '160.633', '1.20312', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231965', '57284', '870', '5805', '5992', '1', '1', '0', '0', '240.483', '749.881', '160.795', '1.66651', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231966', '57284', '870', '5805', '5992', '1', '1', '0', '0', '236.038', '750.038', '160.5', '2.44798', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231967', '57284', '870', '5805', '5992', '1', '1', '0', '0', '230.795', '748.171', '160.5', '2.26734', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231968', '57284', '870', '5805', '5992', '1', '1', '0', '0', '226.384', '751.362', '160.5', '1.66258', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231969', '57284', '870', '5805', '5992', '1', '1', '0', '0', '231.029', '754.754', '160.5', '0.511973', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231970', '57284', '870', '5805', '5992', '1', '1', '0', '0', '237.822', '755.329', '160.663', '0.244937', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231971', '57284', '870', '5805', '5992', '1', '1', '0', '0', '236.438', '760.315', '160.631', '1.7529', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231972', '57284', '870', '5805', '5992', '1', '1', '0', '0', '235.068', '763.69', '160.685', '2.5383', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231973', '57284', '870', '5805', '5992', '1', '1', '0', '0', '233.994', '767.669', '160.916', '2.57757', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231974', '57284', '870', '5805', '5992', '1', '1', '0', '0', '230.394', '769.592', '160.513', '2.9899', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231975', '57284', '870', '5805', '5992', '1', '1', '0', '0', '227.318', '773.131', '160.502', '3.1195', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231976', '57284', '870', '5805', '5992', '1', '1', '0', '0', '224.753', '769.673', '160.5', '4.64316', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231977', '57284', '870', '5805', '5992', '1', '1', '0', '0', '229.237', '765.226', '160.5', '5.09476', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231978', '57284', '870', '5805', '5992', '1', '1', '0', '0', '226.471', '761.464', '160.5', '4.50179', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231979', '57284', '870', '5805', '5992', '1', '1', '0', '0', '223.902', '758.609', '160.5', '3.91274', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231980', '57284', '870', '5805', '5992', '1', '1', '0', '0', '217.341', '760.254', '160.592', '3.3237', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231981', '57284', '870', '5805', '5992', '1', '1', '0', '0', '225.176', '764.673', '160.499', '5.37359', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231982', '57284', '870', '5805', '5992', '1', '1', '0', '0', '233.318', '757.154', '160.499', '5.15369', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231983', '57284', '870', '5805', '5992', '1', '1', '0', '0', '322.963', '667.563', '160.526', '5.76236', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231984', '57284', '870', '5805', '5992', '1', '1', '0', '0', '323.26', '663.374', '160.56', '5.62098', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231985', '57284', '870', '5805', '5992', '1', '1', '0', '0', '327.226', '661.25', '160.448', '6.02153', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231986', '57284', '870', '5805', '5992', '1', '1', '0', '0', '345.202', '664.608', '160.299', '0.288122', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231987', '57284', '870', '5805', '5992', '1', '1', '0', '0', '350.845', '668.199', '160.504', '0.877171', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231988', '57284', '870', '5805', '5992', '1', '1', '0', '0', '350.564', '672.242', '160.517', '0.480545', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231989', '57284', '870', '5805', '5992', '1', '1', '0', '0', '353.005', '675.5', '160.547', '0.205656', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231990', '57284', '870', '5805', '5992', '1', '1', '0', '0', '356.235', '673.15', '160.499', '4.99266', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231991', '57284', '870', '5805', '5992', '1', '1', '0', '0', '355.917', '668.493', '160.499', '4.46253', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231992', '57284', '870', '5805', '5992', '1', '1', '0', '0', '272.964', '800.87', '155.233', '1.31308', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231993', '57284', '870', '5805', '5992', '1', '1', '0', '0', '269.923', '808.216', '155.217', '1.25418', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231994', '57284', '870', '5805', '5992', '1', '1', '0', '0', '275.203', '805.485', '155.257', '5.27542', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231995', '57284', '870', '5805', '5992', '1', '1', '0', '0', '280.243', '803.838', '155.316', '1.04211', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231996', '57284', '870', '5805', '5992', '1', '1', '0', '0', '282.26', '809.247', '155.218', '2.18879', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231997', '57284', '870', '5805', '5992', '1', '1', '0', '0', '276.938', '811.526', '155.31', '2.95848', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231998', '57284', '870', '5805', '5992', '1', '1', '0', '0', '271.927', '813.202', '155.292', '2.66789', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13231999', '57284', '870', '5805', '5992', '1', '1', '0', '0', '274.385', '819.456', '155.227', '1.16777', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232000', '57284', '870', '5805', '5992', '1', '1', '0', '0', '279.753', '816.9', '155.217', '5.90766', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232001', '57284', '870', '5805', '5992', '1', '1', '0', '0', '285.267', '814.382', '155.217', '5.8998', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232002', '57284', '870', '5805', '5992', '1', '1', '0', '0', '287.251', '820.635', '155.217', '1.2149', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232003', '57284', '870', '5805', '5992', '1', '1', '0', '0', '281.452', '821.709', '155.217', '2.98205', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232004', '57284', '870', '5805', '5992', '1', '1', '0', '0', '275.393', '823.819', '155.217', '2.80926', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232005', '57284', '870', '5805', '5992', '1', '1', '0', '0', '273.103', '830.589', '155.225', '6.0137', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232006', '57284', '870', '5805', '5992', '1', '1', '0', '0', '277.65', '829.11', '155.216', '5.97443', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232007', '57284', '870', '5805', '5992', '1', '1', '0', '0', '283.89', '827.412', '155.216', '6.00978', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232008', '57284', '870', '5805', '5992', '1', '1', '0', '0', '289.75', '825.467', '155.216', '6.07653', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232009', '57284', '870', '5805', '5992', '1', '1', '0', '0', '294.406', '824.485', '155.32', '6.10402', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232010', '57284', '870', '5805', '5992', '1', '1', '0', '0', '294.797', '830.354', '155.216', '2.87604', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232012', '57284', '870', '5805', '5992', '1', '1', '0', '0', '290.484', '830.889', '155.216', '3.00956', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232013', '57284', '870', '5805', '5992', '1', '1', '0', '0', '284.638', '832.716', '155.216', '2.85248', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232014', '57284', '870', '5805', '5992', '1', '1', '0', '0', '278.959', '834.703', '155.216', '2.86426', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232016', '57284', '870', '5805', '5992', '1', '1', '0', '0', '273.773', '836.078', '155.217', '2.86033', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232017', '57284', '870', '5805', '5992', '1', '1', '0', '0', '275.374', '841.765', '155.217', '5.87626', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232018', '57284', '870', '5805', '5992', '1', '1', '0', '0', '280.945', '839.855', '155.217', '6.00193', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232020', '57284', '870', '5805', '5992', '1', '1', '0', '0', '286.137', '838.085', '155.217', '5.93517', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232021', '57284', '870', '5805', '5992', '1', '1', '0', '0', '292.245', '836.6', '155.217', '6.06083', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232022', '57284', '870', '5805', '5992', '1', '1', '0', '0', '287.742', '844.079', '155.216', '2.83285', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232023', '57284', '870', '5805', '5992', '1', '1', '0', '0', '282.526', '846.025', '155.216', '2.85248', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232024', '57284', '870', '5805', '5992', '1', '1', '0', '0', '277.02', '847.487', '155.3', '2.83677', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232025', '57284', '870', '5805', '5992', '1', '1', '0', '0', '279.273', '853.427', '155.218', '5.93125', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232027', '57284', '870', '5805', '5992', '1', '1', '0', '0', '284.829', '851.463', '155.216', '5.89591', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0'),
('13232028', '57284', '870', '5805', '5992', '1', '1', '0', '0', '290.093', '849.332', '155.296', '5.95874', '300', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0');

-- Fix for quest "Gardener Fran and the Watering Can" (ID: 30050)
-- Fix for loss ItemScript name

DELETE FROM  `item_script_names` WHERE `ScriptName`='item_frans_watering_can';
INSERT INTO `item_script_names` (`Id`, `ScriptName`) VALUES ('77281', 'item_frans_watering_can');

DELETE FROM `creature_text` WHERE `Entry`=56549;
INSERT INTO `creature_text` (`Entry`, `GroupID`, `ID`, `text`, `text_female`, `textrange`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextID`, `comment`) VALUES 
(56549, 0, 0, 'Check out all the cool silk!', '', 0, 12, 0, 100, 0, 0, 0, 55565, ''),
(56549, 1, 0, 'Look at this!', '', 0, 12, 0, 100, 0, 0, 0, 61630, ''),
(56549, 2, 0, 'Hey! Look at the waterfall!', '', 0, 12, 0, 100, 0, 0, 0, 0,'');

update `creature_template` set `npcflag`= 2 where `entry` in (64672);

DELETE FROM `creature` WHERE `guid`=582663;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES 
(582663, 64672, 870, 6138, 6441, 1, 1, 0, 0, -654.458, 3140.33, 146.404, 4.62734, 60, 0, 0, 0, 393941, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_questender` WHERE `id`=64672 AND `quest`=31439;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (64672, 31439);

DELETE FROM `creature_queststarter` WHERE `id`=64672 AND `quest`=31441;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (64672, 31441);

DELETE FROM `creature_questender` WHERE `id`=59188;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (59188, 30271);

update `creature_template` set `VehicleId`= 0, `npcflag`= 0 where `entry` in (63796);

DELETE FROM `creature` WHERE `guid`=517838;
DELETE FROM `creature` WHERE `guid` = 506584;
UPDATE `creature_template` SET `npcflag` = 80 WHERE `entry` = 56065;

DELETE FROM `item_template` WHERE `entry` IN (6948);
INSERT INTO `item_template`(`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `Flags3`, `Unk430_1`, `Unk430_2`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_unk1_1`, `stat_unk2_1`, `stat_type2`, `stat_value2`, `stat_unk1_2`, `stat_unk2_2`, `stat_type3`, `stat_value3`, `stat_unk1_3`, `stat_unk2_3`, `stat_type4`, `stat_value4`, `stat_unk1_4`, `stat_unk2_4`, `stat_type5`, `stat_value5`, `stat_unk1_5`, `stat_unk2_5`, `stat_type6`, `stat_value6`, `stat_unk1_6`, `stat_unk2_6`, `stat_type7`, `stat_value7`, `stat_unk1_7`, `stat_unk2_7`, `stat_type8`, `stat_value8`, `stat_unk1_8`, `stat_unk2_8`, `stat_type9`, `stat_value9`, `stat_unk1_9`, `stat_unk2_9`, `stat_type10`, `stat_value10`, `stat_unk1_10`, `stat_unk2_10`, `ScalingStatDistribution`, `ScalingStatValue`, `DamageType`, `delay`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `StatScalingFactor`, `CurrencySubstitutionId`, `CurrencySubstitutionCount`, `RequiredDisenchantSkill`, `flagsCustom`, `VerifiedBuild`) VALUES 
(6948, 15, 0, -1, 'Hearthstone', 6418, 1, 64, 40960, 0, 0.988, 1, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8690, 0, 0, 1800000, 1176, 1800000, 0, 0, 0, 1800000, 0, 1800000, 0, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18414);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=13468 AND `SourceEntry`=0 AND `SourceId`=0 AND `ElseGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15, 13468, 0, 0, 0, 9, 0, 30269, 0, 0, 0, 0, 0, '', '');

DELETE FROM `gossip_menu_option` WHERE `Menu_ID`=13468;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `OptionBroadcastTextID`, `BoxBroadcastTextID`) VALUES 
(13468, 0, 0, 'I\'m ready, Koro.', 1, 1, 0, 0, 0, 0, NULL, 57913, 0);

DELETE FROM `waypoints` WHERE `entry`=58547;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 1, -1443.15, 866.02, 17.88, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 2, -1388.03, 891.19, 18.75, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 3, -1313.56, 893.25, 15.51, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 4, -1251.91, 894.61, 17.09, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 5, -1230.98, 941.83, 17.16, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 6, -1222.31, 973.51, 18.75, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 7, -1197.82, 982.56, 20.29, '');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (58547, 8, -1163.64, 1044.76, 21.9, '');

DELETE FROM `smart_scripts` WHERE `entryorguid`=58547 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(58547, 0, 0, 0, 62, 0, 100, 0, 13468, 0, 0, 0, 12, 58547, 5, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On gossip select - Say text 0'),
(58547, 0, 1, 2, 54, 0, 100, 0, 0, 0, 0, 0, 1, 0, 6500, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On gossip select - Say text 0'),
(58547, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - Close gossip'),
(58547, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Set flag'),
(58547, 0, 4, 0, 52, 0, 100, 0, 0, 58547, 0, 0, 53, 1, 58547, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 'After emote - Start WP'),
(58547, 0, 5, 6, 40, 0, 100, 0, 7, 58547, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On WP - Say text 1'),
(58547, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 33, 58946, 0, 0, 0, 0, 0, 18, 25, 0, 0, 0, 0, 0, 0, 'Link - Give credit'),
(58547, 0, 7, 0, 40, 0, 100, 0, 8, 58547, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On wp reach - despawn');


update `creature_template` set `npcflag`= 3, `AIName`= 'SmartAI' where `entry` in (58547);

DELETE FROM `smart_scripts` WHERE `entryorguid`=62764 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=6276400 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(62764, 0, 0, 1, 73, 0, 100, 1, 0, 0, 0, 0, 89, 20, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'On spellclick - Random move'),
(62764, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 3, 4, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 4, 5, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 5, 6, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 11, 122823, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Link - cast Flitterling Dust'),
(62764, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 6000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Despawn');

DELETE FROM `spell_script_names` WHERE `spell_id`=123709;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (123709, 'spell_potion_of_mazus_breath');

DELETE FROM `spell_script_names` WHERE `spell_id`=114072;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (114072, 'spell_fresh_pine_scent');

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=62276;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (62276, 118952, 3, 0);

DELETE FROM `smart_scripts` WHERE `entryorguid`=62276;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(62276, 0, 0, 1, 73, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spell Click - Set Flag'),
(62276, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Link - Despawn');

UPDATE `creature_template` SET `npcflag` = 16777216, `unit_flags` = 537166336, `unit_flags2` = 2049, `AIName` = 'SmartAI' WHERE `entry` = 62276;

DELETE FROM `spell_loot_template` WHERE `Entry`=84193;
INSERT INTO `spell_loot_template` (`Entry`, `Item`, `ChanceOrQuestChance`, `LootMode`, `GroupId`, `mincountOrRef`, `MaxCount`) VALUES 
(84193, 62559, 2, 1, 1, 1, 1),
(84193, 62558, 2, 1, 1, 1, 1),
(84193, 62562, 2, 1, 1, 1, 1),
(84193, 62557, 2, 1, 1, 1, 1),
(84193, 62561, 2, 1, 1, 1, 1),
(84193, 62560, 2, 1, 1, 1, 1),
(84193, 62554, 2, 1, 1, 1, 1),
(84193, 62552, 2, 1, 1, 1, 1),
(84193, 62553, 2, 1, 1, 1, 1),
(84193, 62563, 2, 1, 1, 1, 1),
(84193, 62555, 2, 1, 1, 1, 1),
(84193, 62556, 2, 1, 1, 1, 1),
(84193, 62567, 2, 1, 1, 1, 1),
(84193, 62573, 2, 1, 1, 1, 1),
(84193, 62572, 2, 1, 1, 1, 1),
(84193, 62574, 2, 1, 1, 1, 1),
(84193, 62575, 2, 1, 1, 1, 1),
(84193, 62576, 2, 1, 1, 1, 1),
(84193, 62571, 2, 1, 1, 1, 1),
(84193, 62570, 2, 1, 1, 1, 1),
(84193, 62566, 2, 1, 1, 1, 1),
(84193, 62565, 2, 1, 1, 1, 1),
(84193, 62247, 2, 1, 1, 1, 1),
(84193, 62568, 2, 1, 1, 1, 1),
(84193, 62569, 2, 1, 1, 1, 1),
(84193, 62564, 2, 1, 1, 1, 1),
(84193, 62588, 2, 1, 1, 1, 1),
(84193, 62580, 2, 1, 1, 1, 1),
(84193, 62581, 2, 1, 1, 1, 1),
(84193, 62579, 2, 1, 1, 1, 1),
(84193, 62591, 2, 1, 1, 1, 1),
(84193, 62246, 2, 1, 1, 1, 1),
(84193, 62577, 2, 1, 1, 1, 1),
(84193, 62582, 2, 1, 1, 1, 1),
(84193, 62578, 2, 1, 1, 1, 1),
(84193, 62590, 2, 1, 1, 1, 1),
(84193, 62583, 2, 1, 1, 1, 1),
(84193, 62589, 2, 1, 1, 1, 1),
(84193, 62587, 2, 1, 1, 1, 1),
(84193, 62584, 2, 1, 1, 1, 1),
(84193, 62585, 2, 1, 1, 1, 1),
(84193, 62586, 2, 1, 1, 1, 1),
(84193, 60839, 1.5, 1, 1, 1, 1),
(84193, 62598, 1.5, 1, 1, 1, 1),
(84193, 62600, 1, 1, 1, 1, 1),
(84193, 62599, 1, 1, 1, 1, 1),
(84193, 62601, 1, 1, 1, 1, 1),
(84193, 62602, 1, 1, 1, 1, 1),
(84193, 60841, 1, 1, 1, 1, 1),
(84193, 62604, 1, 1, 1, 1, 1),
(84193, 62603, 1, 1, 1, 1, 1),
(84193, 62605, 1, 1, 1, 1, 1),
(84193, 60842, 1, 1, 1, 1, 1),
(84193, 60843, 1, 1, 1, 1, 1),
(84193, 62606, 1, 1, 1, 1, 1),
(84193, 60845, 1, 1, 1, 1, 1),
(84193, 60840, 0.5, 1, 1, 1, 1),
(84193, 60844, 0.5, 1, 1, 1, 1);

DELETE FROM `creature_text` WHERE `entry`in (49869,50039,49874,42937);
INSERT INTO `creature_text`(`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUE
(49869, 0, 0, 'HELP!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry - Call for heal prase'),
(49869, 0, 1, 'I need a heal!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry - Call for heal prase'),
(49869, 0, 2, 'I could use a heal, brother!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry - Call for heal prase'),
(49869, 0, 3, 'Make yourself useful and heal me, Paxton!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry - Call for heal prase'),
(49869, 1, 0, 'Come, monsters! We will crush you!', 14, 0, 100, 0, 0, 0, 'Stormwind Infantry - Yell'),
(49869, 1, 1, 'I\'ll kill a hundred more of your battle worgs!', 14, 0, 100, 0, 0, 0, 'Stormwind Infantry - Yell'),
(49869, 1, 2, 'Look alive, men! There are orcs and worgs about!', 14, 0, 100, 0, 0, 0, 'Stormwind Infantry - Yell'),
(49869, 1, 3, 'Your filthy dogs won\'t be enough!', 14, 0, 100, 0, 0, 0, 'Stormwind Infantry - Yell'),
(49869, 1, 4, 'Your worgs are no match for the might of Stormwind!', 14, 0, 100, 0, 0, 0, 'Stormwind Infantry - Yell'),
(49874, 0, 0, 'Orc KILL human!', 12, 0, 50, 0, 0, 0, 'on Aggro Text'),
(49874, 0, 1, 'Blackrock take forest!', 12, 0, 50, 0, 0, 0, 'on Aggro Text'),
(49874, 0, 2, 'The grapes were VERY TASTY!', 12, 0, 50, 0, 0, 0, 'on Aggro Text'),
(50039, 0, 0, 'Time to join your friends, kissin\' the dirt!', 12, 0, 50, 0, 0, 0, 'on Aggro Text'),
(50039, 0, 1, 'We\'re gonna burn this place to the ground!', 12, 0, 50, 0, 0, 0, 'on Aggro Text'),
(42937, 0, 0, 'Las uvas eran MUY SABROSAS!', 12, 0, 100, 71, 0, 0, 'Blackrock Invader to Player'),
(42937, 3, 0, 'Suplica por tu vida!', 12, 0, 100, 71, 0, 0, 'Blackrock Invader to Player'),
(42937, 2, 0, 'Orco MATAR $r!', 12, 0, 100, 0, 0, 0, 'Blackrock Invader to Player'),
(42937, 1, 0, 'Roca Negra tomar bosque!', 12, 0, 100, 71, 0, 0,'Blackrock Invader to Player');

DELETE FROM `creature` WHERE `guid`=582665;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES 
(582665, 61065, 870, 0, 0, 1, 4294967295, 0, 0, 1947.15, 139.804, 475.927, 4.99325, 300, 0, 0, 0, 1181823, 0, 0, 0, 0, 0, 0, 0);

update `creature_template` set `unit_class`= 1 where `entry`= 200000;

update `creature_template` set `npcflag`= npcflag|2 where `entry`in (70100,70552,73318,73335,58507,62540,63359,67414,68084,68538,69741,73136);


DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142026;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142028;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142029;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142030;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142031;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142032;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142033;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142035;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142036;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142037;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142038;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142039;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142041;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142042;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142043;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142044;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=142045;
DELETE FROM `npc_vendor` WHERE `entry`=70751 AND `item`=143899;

