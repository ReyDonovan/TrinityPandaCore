delete from `creature_template_addon` where `entry` = 33150;
update `creature_template_addon` set `emote`= 0 where `entry`= 64249;
update `creature_template` set `flags_extra`= 0 where `entry`= 37921;

update `creature` set `spawndist`= 7 where `guid` in (581232,581235,581224);

update `quest_template` set `SpecialFlags`= 1 where `id`= 31539;

delete from `creature_queststarter` where `quest` in (40312,32592,40313,40325,40326,40327,40328,40329);
delete from `creature_questender` where `quest` in (40312,32592,40313,40325,40326,40327,40328,40329);
 
delete from `npc_spellclick_spells` where `npc_entry` in (35417,35436,35433,36357,36358,35429,35433,35431,35431);


delete from `achievement_criteria_data` where `criteria_id` in (
100,102,140,166,176,177,221,222,223,224,225,416,417,418,420,525,526,527,528,529,530,531,532,534,538,539,540,541,542,544,547,551,
552,594,595,596,598,599,601,602,603,604,605,606,607,1826,3680,3805,
3806,3807,3808,3809,3810,3811,3812,3813,4439,4501,4502,5621,5622,5623,5624,5625,
5626,5627,5628,5629,5630,5631,5746,5820,5887,6432,6440,6441,6445,6758,7365,7415,
7416,7418,7419,7608,7609,7860,9120,9120,9718,9721,10289,10289,10303,10310,10314,10314,
10408,10417,10438,10444,10453,10454,10455,10718,10784,10785,10786,10787,10788,10789,10790,10791,
10792,10793,10794,10795,10796,10797,10798,10799,10802,10803,10804,10805,10806,10807,10808,10809,
10810,10811,10812,10813,10814,10815,10816,10817,10818,10819,10878,10879,11418,11419,11498,11500,
11559,11560,11561,11882,11959,12064,12065,12199,12200,12201,12202,12204,12205,12206,12207,12209,
12210,12211,12212,12213,12214,12215,12216,12217,12218,12219,12220,12221,12222,12223,12224,12225,
12226,12227,12238,12302,12303,12304,12305,12306,12307,12308,12309,12310,12311,12312,12313,12314,
12315,12316,12317,12318,12319,12321,12322,12323,12324,12439,12519,12547,12743,12751,12999,13000,
13001,13002,13003,13004,13005,13006,13007,13095,13112,13139,13140,13141,13142,13143,13144,13145,
13146,13147,13148,13149,13150,13151,13152,13153,13154,13155,13156,13157,13158,13159,13160,13161,
13162,13188,13194,13199,13205,13207,13208,13209,13210,13211,13212,13213,13214,13215,13216,13217,
13218,13219,13220,13221,13222,13223,13224,13225,13226,13227,13228,13229,13230,13328,14280,14385,
14398,14400,14407,14408,14409,14410,14411,14412,14414,14773,14774,14775,14776,14777,14778,14779,
14780,14781,14782,14783,14784,14785,14786,14787,14788,14789,14790,14791,14792,15443,15444,15445,
15656,15657,15658,15661,15662,15663,15664,15665,15666,15668,15672,15956,15957,16023,16024,17847,
17848,18333,18453);


delete from `pool_quest` where `entry` in (40313,40325,40326,40327);
delete from `spell_area` where `quest_start` in (40328,40329);

delete from `spell_linked_spell` where `spell_effect` in (203754,200002,200003) or `spell_trigger` in (203754,200002,200003);

delete from `waypoints` where `entry`= 64249;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (64249, 1, 532.575, -1668.05, 203.688, NULL);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (64249, 2, 709.89, -1785.65, 203.688, NULL);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (64249, 3, 776.472, -1776.76, 158.677, NULL);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (64249, 4, 908.051, -1804.16, 158.677, NULL);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (64249, 5, 931.47, -1868.49, 158.677, NULL);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (64249, 6, 903.01, -1954.38, 158.677, NULL);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (64249, 7, 768.653, -1934.81, 168.677, NULL);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (64249, 8, 598.673, -1726.35, 212.529, NULL);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (64249, 9, 533.371, -1670.25, 202.78, NULL);



delete from `spell_script_names` where `ScriptName` in (
'spell_afd_royale_in_map',
'spell_afd_royale_leaving_game',
'spell_afd_royale_drop',
'spell_afd_royale_out_of_ring_damage_aura',
'spell_afd_royale_buff_trigger',
'spell_afd_royale_portal_trigger',
'spell_warl_soul_shards_visual_test',
'spell_warl_demonic_fury_visual_controller',
'spell_pal_glyph_of_bladed_judgement',
'spell_ataldazar_soulrend_selector',
'spell_ataldazar_echoes_of_shadra_selector',
'spell_ataldazar_fiery_enchant_selector',
'spell_ataldazar_pursuit');

DELETE FROM `db_script_string` WHERE `entry`=2000000138;



UPDATE `creature_template` SET `unit_class` = '1' WHERE `entry` = '68045';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180130';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180101';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '186922';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181473';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181209';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182011';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180302';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180302';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180425';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180002';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181465';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182012';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180004';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180208';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181190';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '187095';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180025';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180001';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180015';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181256';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181254';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180000';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180411';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182008';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181179';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181214';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181024';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181470';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180429';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182215';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181274';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181474';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181325';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181466';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181225';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181241';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181189';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181137';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181149';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180808';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181276';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181340';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182028';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182044';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181151';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182148';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181191';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181207';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180306';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182405';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180313';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180442';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180426';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180426';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '187034';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182065';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180426';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181630';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182141';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182041';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '186709';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181311';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181327';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182440';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180412';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181040';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181044';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181028';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181136';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181216';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181220';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181305';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182618';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181273';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182010';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181022';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181006';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181178';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181182';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181210';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '187841';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181198';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '187042';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181312';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180303';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181472';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181219';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '187287';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181203';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180405';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180421';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180430';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180017';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180011';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181164';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180304';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '185524';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '187339';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '185518';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181334';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181218';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180220';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180423';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180427';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181163';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182394';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180310';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180301';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182361';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182331';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182490';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181140';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181181';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181217';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181245';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181468';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '188138';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181437';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180022';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181014';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181038';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181437';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180404';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180420';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182444';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180409';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182014';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181322';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '187389';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182038';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '187840';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181172';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181188';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181184';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181002';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180416';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180432';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '188757';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '185525';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182040';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182400';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181016';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '185433';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181148';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181212';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180407';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '188134';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181221';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180005';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180009';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182139';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181215';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181471';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182495';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '185711';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180012';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180008';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180016';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180024';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181150';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180021';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '188006';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181187';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180439';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180434';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182001';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '184817';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181001';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181008';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182045';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180419';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181467';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181242';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181004';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180431';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '187805';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181147';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181211';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180438';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181253';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181206';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181032';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181272';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181252';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182033';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181519';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '186706';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180006';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180018';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182406';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '185483';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180003';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180007';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180010';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180014';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180019';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180023';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180102';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180103';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180107';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180109';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180799';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180854';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180305';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180307';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180308';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180309';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180311';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180312';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180401';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180402';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180403';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180406';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180408';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180415';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180417';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180424';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180428';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180433';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180435';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180437';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180440';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180441';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180443';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180445';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180446';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181010';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181012';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181020';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181026';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181030';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181034';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181036';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181138';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181146';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181170';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181171';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181173';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181174';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181180';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181183';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181185';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181186';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181192';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181201';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181204';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181205';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181208';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181213';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181226';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181249';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181251';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181255';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181302';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181303';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181304';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181307';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181319';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181320';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181321';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181323';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181324';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181326';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181435';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181439';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181464';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181469';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181554';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181631';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182015';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182016';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182017';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182036';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182047';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182066';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182085';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182130';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182210';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182267';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182357';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182493';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '183377';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '185430';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '185519';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '185520';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '185521';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '185523';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '185537';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '156197';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '186083';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '187842';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '188507';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '188661';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '180444';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '187785';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '181202';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '182067';
UPDATE `creature_template` SET `faction_A` = '35' , `faction_H` = '35' WHERE `entry` = '186197';

UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66361';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '61793';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63067';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '64593';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '65066';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66364';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66443';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66482';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '65559';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '64505';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66489';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66493';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66453';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66416';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66497';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66135';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '65744';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66487';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66455';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66414';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66486';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '57670';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66490';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '65742';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '56134';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66494';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63014';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '65008';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '65051';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '59652';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63596';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '57638';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '64876';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63479';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '62159';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '62098';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66488';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '67185';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '61126';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66439';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '57669';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '32930';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66496';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66445';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66485';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66126';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '65651';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66495';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66481';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '37921';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '65558';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66454';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '67186';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66966';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66444';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '56434';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '56784';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '57692';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '60741';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '61127';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '61463';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '61528';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66492';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '61757';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '61792';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '61796';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66438';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63061';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63070';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63073';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63075';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63077';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63080';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63083';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63086';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63310';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63478';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '63626';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '64330';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '64506';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '64543';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '64875';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '65048';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '65648';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66136';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66363';
UPDATE `creature_template` SET `exp` = '0' WHERE `entry` = '66417';

UPDATE creature_template SET `ScriptName` = 'npc_brawlers_guild_boss_bazzelflange' WHERE `entry` = 67260;
UPDATE creature_template SET `ScriptName` = 'npc_twilight_faction_champions' WHERE `entry` = 46946;
UPDATE creature_template SET `ScriptName` = 'npc_twilight_faction_champions' WHERE `entry` = 46945;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_corrupted_darkhatched_slayer' WHERE `entry` = 67832;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_darkhatched_oracle' WHERE `entry` = 67256;
UPDATE creature_template SET `ScriptName` = 'npc_shang_xi_air_balloon' WHERE `entry` = 55649;
UPDATE creature_template SET `ScriptName` = 'npc_master_shang_xi_thousand_staff' WHERE `entry` = 55672;
UPDATE creature_template SET `ScriptName` = 'npc_master_shang_xi_thousand_staff_escort' WHERE `entry` = 56688;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_king_varian_wrynn' WHERE `entry` = 69026;
UPDATE creature_template SET `ScriptName` = 'npc_brawlers_guild_grandpa_grumplefloot' WHERE `entry` = 70678;
UPDATE creature_template SET `ScriptName` = 'npc_warlock_guardian' WHERE `entry` = 55659;
UPDATE creature_template SET `ScriptName` = 'npc_pandaren_firework_launcher' WHERE `entry` = 65934;
UPDATE creature_template SET `ScriptName` = 'npc_brawlers_guild_brawlgar_arena_grunt' WHERE `entry` = 67267;
UPDATE creature_template SET `ScriptName` = 'npc_brawlers_guild_brawlgar_arena_grunt' WHERE `entry` = 68408;
UPDATE creature_template SET `ScriptName` = 'npc_deadmines_prototype_reaper' WHERE `entry` = 49208;
UPDATE creature_template SET `ScriptName` = 'npc_brawlers_shock_field' WHERE `entry` = 67459;
UPDATE creature_template SET `ScriptName` = 'npc_brawlers_guild_good_luck_goblin' WHERE `entry` = 68306;
UPDATE creature_template SET `ScriptName` = 'npc_brawlers_guild_mecha_bruce' WHERE `entry` = 71081;
UPDATE creature_template SET `ScriptName` = 'npc_brawlers_guild_blingtron_3000' WHERE `entry` = 70740;
UPDATE creature_template SET `ScriptName` = 'npc_brawlers_guild_gnomish_tesla_coil' WHERE `entry` = 70743;
UPDATE creature_template SET `ScriptName` = 'npc_brawlers_guild_card_traider' WHERE `entry` = 70751;
UPDATE creature_template SET `ScriptName` = 'npc_brawlers_guild_blingtron_2000' WHERE `entry` = 70802;
UPDATE creature_template SET `ScriptName` = 'npc_master_shang_xi_after_zhao_escort' WHERE `entry` = 56159;
UPDATE creature_template SET `ScriptName` = 'npc_master_shang_xi_after_zhao' WHERE `entry` = 55586;
UPDATE creature_template SET `ScriptName` = 'npc_rocket_launcher' WHERE `entry` = 64507;
UPDATE creature_template SET `ScriptName` = 'boss_zhao_ren' WHERE `entry` = 55786;
UPDATE creature_template SET `ScriptName` = 'npc_aysa_in_wind_temple' WHERE `entry` = 64506;
UPDATE creature_template SET `ScriptName` = 'npc_frightened_wind' WHERE `entry` = 55665;
UPDATE creature_template SET `ScriptName` = 'npc_aysa_wind_temple_escort' WHERE `entry` = 55744;
UPDATE creature_template SET `ScriptName` = 'boss_vordraka' WHERE `entry` = 56009;
UPDATE creature_template SET `ScriptName` = 'npc_twilight_emberscar_devourer' WHERE `entry` = 46949;
UPDATE creature_template SET `ScriptName` = 'npc_twilight_lord_tulvan' WHERE `entry` = 46948;
UPDATE creature_template SET `ScriptName` = 'npc_twilight_calders_creation' WHERE `entry` = 46947;
UPDATE creature_template SET `ScriptName` = 'npc_twilight_hurp_derp' WHERE `entry` = 46944;
UPDATE creature_template SET `ScriptName` = 'npc_gurgthock_twilands' WHERE `entry` = 46935;
UPDATE creature_template SET `ScriptName` = 'npc_twilight_firebeads_patrol' WHERE `entry` = 46849;
UPDATE creature_template SET `ScriptName` = 'npc_firelands_majordomo_stagheim_event' WHERE `entry` = 54015;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_adolescent_mushan' WHERE `entry` = 56239;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_unbarreled_pandaren' WHERE `entry` = 57681;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_springtail_gnasher' WHERE `entry` = 57413;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_grainhunter_hawk' WHERE `entry` = 57215;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_grainhunter_hawk' WHERE `entry` = 57216;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_hornbill_strider' WHERE `entry` = 56753;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_frenzyhop' WHERE `entry` = 56514;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_snagtooth_hooligan' WHERE `entry` = 56462;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_lupello' WHERE `entry` = 56357;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_wyrmhorn_turtle' WHERE `entry` = 56256;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_krungko_fingerlicker' WHERE `entry` = 64389;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_manifestation_of_fear' WHERE `entry` = 59874;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_ik_thik_wing_commander' WHERE `entry` = 56723;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_barrel_of_fireworks' WHERE `entry` = 59284;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_darkhide' WHERE `entry` = 58435;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_ikthik_vanguard' WHERE `entry` = 58368;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_wildscale_herbalist' WHERE `entry` = 58216;
UPDATE creature_template SET `ScriptName` = 'npc_vfw_mothfighter' WHERE `entry` = 57648;
UPDATE creature_template SET `ScriptName` = 'npc_dread_waster_dread_lurker' WHERE `entry` = 62751;
UPDATE creature_template SET `ScriptName` = 'npc_dread_waster_nagging_dreadling' WHERE `entry` = 65996;
UPDATE `creature_template` SET `ScriptName` = 'boss_li_fei' WHERE  `entry` = 54135;
UPDATE `creature_template` SET `ScriptName` = 'boss_jaomin_ro' WHERE `entry` = '54611' ;
UPDATE `creature_template` SET `ScriptName`= "npc_yenniku" WHERE `entry` =2530;
UPDATE `creature_template` SET `ScriptName`='npc_darrowshire_spirit' WHERE `entry`=11064;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_darkhatched_flesh_hunter' WHERE `entry` = 67259;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_corrupted_dark_hatched_egg' WHERE `entry` = 67798;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_stalactite' WHERE `entry` = 67755;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_broodmaster_noshi' WHERE `entry` = 67264;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_darkhatched_skinflayer' WHERE `entry` = 67258;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_darkhatched_skulker' WHERE `entry` = 67257;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_darkhatched_shaman' WHERE `entry` = 67255;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_mogu_rune' WHERE `entry` = 67686;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_grizzle_gearslip' WHERE `entry` = 67782;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_voljin' WHERE `entry` = 67414;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_goblin_cannon' WHERE `entry` = 67694;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_broken_mogu_tablet' WHERE `entry` = 67862;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_broken_mogu_tablet' WHERE `entry` = 67863;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_rakgor_bloodrazor' WHERE `entry` = 67266;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_spring_saurok_slayer' WHERE `entry` = 67706;
UPDATE creature_template SET `ScriptName` = 'npc_dagger_in_dark_darkhatched_lizard_lord' WHERE `entry` = 67263;
UPDATE creature_template SET `ScriptName` = 'npc_warden_of_the_sunwell' WHERE `entry` = 37523;
UPDATE creature_template SET `ScriptName` = 'npc_burning_steppes_chiseled_golem' WHERE `entry` = 48037;
UPDATE creature_template SET `ScriptName` = 'npc_burning_steppes_war_reaver' WHERE `entry` = 7039;
UPDATE creature_template SET `ScriptName` = 'npc_stranglethorn_emerine' WHERE `entry` = 43885;
UPDATE creature_template SET `ScriptName` = 'npc_drowning_soldier_and_warrior' WHERE `entry` = 39663;
UPDATE creature_template SET `ScriptName` = 'npc_drowning_soldier_and_warrior' WHERE `entry` = 41672;
UPDATE creature_template SET `ScriptName` = 'npc_stranglethorn_priestess_hurala' WHERE `entry` = 44017;
UPDATE creature_template SET `ScriptName` = 'npc_stranglethorn_priestess_hurala' WHERE `entry` = 42812;
UPDATE creature_template SET `ScriptName` = 'npc_tushui_monk' WHERE `entry` = 55019;
UPDATE creature_template SET `ScriptName` = 'npc_achiev_prisoned_sha' WHERE `entry` = 56766;
UPDATE creature_template SET `ScriptName` = 'npc_achiev_prisoned_sha' WHERE `entry` = 58201;


replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `difficulty_entry_4`, `difficulty_entry_5`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `npcflag`, `npcflag2`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `VignetteID`, `TrackingQuestID`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('170001','0','0','0','0','0','0','0','19646','0','0','0','Royal Ring',NULL,NULL,'0','80','80','2','0','35','35','1','0','1','1.14286','1','0','0','0','0','0','1','2000','0','1','0','0','0','0','0','0','0','0','0','0','7','138936390','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','0',
'npc_afd_royale_ring','18414');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `difficulty_entry_4`, `difficulty_entry_5`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `npcflag`, `npcflag2`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `VignetteID`, `TrackingQuestID`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('611590','0','0','0','0','0','0','0','41962','0','0','0','Greenstone Terror',NULL,NULL,'0','90','90','4','0','16','16','1','0','1','1.14286','1','0','9092','13316','0','34737','1','2000','2000','1','0','0','0','55','0','0','0','0','0','0','1','66049','0','61159','0','61159','0','0','0','0','0','0','119394','0','0','0','0','0','0','0','0','0','3600','3700','','0','3','1','1','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','0',
'npc_greenstone_terror','18414');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `difficulty_entry_4`, `difficulty_entry_5`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `npcflag`, `npcflag2`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `VignetteID`, `TrackingQuestID`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('170000','0','0','0','0','0','0','0','19646','0','0','0','Royal Controller',NULL,NULL,'0','80','80','2','0','35','35','1','0','1','1.14286','1','0','0','0','0','0','1','2000','0','1','0','0','0','0','0','0','0','0','0','0','7','138936390','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','0',
'npc_afd_royale_controller','18414');
UPDATE creature_template SET ScriptName='npc_aged_dying_ancient_kodo' WHERE entry IN (4700, 4701, 4702, 11627);
UPDATE `creature_template` SET `ScriptName`='npc_princess_stillpine' WHERE `entry`=17682;
UPDATE creature_template SET `ScriptName` = 'npc_greenstone_cursed_brew' WHERE `entry` = 61174;
UPDATE creature_template SET `ScriptName` = 'npc_afd_royale_ring' WHERE `entry` = 170001;
UPDATE creature_template SET `ScriptName` = 'npc_maelstorm_aggra' WHERE `entry` = 45006;
UPDATE creature_template SET `ScriptName` = 'npc_afd_royale_controller' WHERE `entry` = 170000;
UPDATE creature_template SET `ScriptName` = 'npc_zandalari_beastcaller_passenger' WHERE `entry` = 69397;
UPDATE creature_template SET `ScriptName` = 'npc_siege_of_orgrimmar_theramore_prisoners' WHERE `entry` = 72498;
UPDATE creature_template SET `ScriptName` = 'npc_thok_monstrous_gastropod' WHERE `entry` = 73164;
UPDATE creature_template SET `ScriptName` = 'npc_golden_lotus_trigger' WHERE `entry` = 71711;
UPDATE creature_template SET `ScriptName` = 'npc_golden_lotus_trigger' WHERE `entry` = 71686;
UPDATE creature_template SET `ScriptName` = 'npc_golden_lotus_trigger' WHERE `entry` = 71684;
UPDATE creature_template SET `ScriptName` = 'npc_tears_of_the_vale' WHERE `entry` = 73638;
UPDATE creature_template SET `ScriptName` = 'npc_willy_wilder' WHERE `entry` = 70126;
UPDATE creature_template SET `ScriptName` = 'npc_watershed_patrol' WHERE `entry` = 3193;
UPDATE creature_template SET `ScriptName` = 'npc_watershed_patrol' WHERE `entry` = 39325;
UPDATE creature_template SET `ScriptName` = 'npc_watershed_patrol' WHERE `entry` = 39324;
UPDATE creature_template SET `ScriptName` = 'npc_watershed_patrol' WHERE `entry` = 39326;
UPDATE `creature_template` SET `ScriptName`='npc_zarjira' WHERE `entry`='38306';
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_water_spirit_dailo' WHERE  `entry` = 55556;
UPDATE creature_template SET `ScriptName` = 'npc_fire_of_the_seas' WHERE `entry` = 38542;
UPDATE creature_template SET `ScriptName` = 'npc_voljin_ancient_enemy' WHERE `entry` = 38225;
UPDATE creature_template SET `ScriptName` = 'npc_azshara_awol_grunt' WHERE `entry` = 42646;
UPDATE creature_template SET `ScriptName` = 'npc_sun_moon_colossus' WHERE `entry` = 46042;
UPDATE creature_template SET `ScriptName` = 'npc_sun_moon_colossus' WHERE `entry` = 46041;
UPDATE creature_template SET `ScriptName` = 'npc_hyjal_aronus_ride' WHERE `entry` = 39128;
UPDATE creature_template SET `ScriptName` = 'npc_hyjal_aronus' WHERE `entry` = 39140;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_muckmaw_crocolisk' WHERE `entry` = 67922;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_krasari_stalker' WHERE `entry` = 68348;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_commander_scargash' WHERE `entry` = 68474;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_spirit_bomb' WHERE `entry` = 68296;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_wakened_mogu' WHERE `entry` = 68102;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_swamp_gas' WHERE `entry` = 68816;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_bogrot' WHERE `entry` = 67974;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_riverblade_marauder' WHERE `entry` = 68775;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_faction_leader' WHERE `entry` = 67569;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_faction_leader' WHERE `entry` = 68240;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_faction_leader' WHERE `entry` = 68057;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_faction_leader' WHERE `entry` = 68599;
UPDATE creature_template SET `ScriptName` = 'npc_little_patience_faction_leader' WHERE `entry` = 67883;
UPDATE creature_template SET `ScriptName` = 'npc_min_dimwind' WHERE `entry` = 54855;
UPDATE `creature_template` SET `ScriptName` = 'npcs_rutgar_and_frankal' WHERE `entry` IN (15170, 15171);
UPDATE creature_template SET `ScriptName` = 'npc_attacker_dimwind' WHERE `entry` = 54785;
UPDATE creature_template SET `ScriptName` = 'npc_huojin_trainee' WHERE `entry` = 54586;
UPDATE creature_template SET `ScriptName` = 'npc_huojin_trainee' WHERE `entry` = 65470;
UPDATE `creature_template` SET `ScriptName`='npc_OOX17' WHERE `entry`=7784;
UPDATE `creature_template` SET `ScriptName`='npc_wounded_blood_elf' WHERE `entry`=16993;
UPDATE `creature_template` SET `ScriptName` = 'npc_fel_guard_hound' WHERE `entry`=21847;
UPDATE creature_template SET ScriptName='npc_maghar_captive' WHERE entry=18210;
UPDATE `creature_template` SET `ScriptName` = 'npc_corki' WHERE `entry` IN (18445,20812,18369);
UPDATE creature_template SET `ScriptName` = 'npc_aysa_lake_escort' WHERE `entry` = 56661;
UPDATE creature_template SET `ScriptName` = 'npc_ji_forest_escort' WHERE `entry` = 59988;
UPDATE creature_template SET `ScriptName` = 'npc_korga' WHERE `entry` = 60042;
UPDATE creature_template SET `ScriptName` = 'npc_mandori_escort' WHERE `entry` = 65038;
UPDATE `creature_template` SET `ScriptName` = 'npc_merchant_lorvo' WHERE `entry` = 54943;
UPDATE creature_template SET `ScriptName` = 'npc_feralas_mountain_giant' WHERE `entry` = 40026;
UPDATE creature_template SET `ScriptName` = 'npc_barrent_wounded_defender' WHERE `entry` = 38805;
UPDATE creature_template SET `ScriptName` = 'npc_marion_wormswing' WHERE `entry` = 41112;
UPDATE `creature_template` SET `ScriptName` = 'npcs_ashyen_and_keleth' WHERE `entry` IN (17900, 17901);
UPDATE `creature_template` SET `ScriptName`='npc_keristrasza' WHERE `entry`=26206;
UPDATE `creature_template` SET `ScriptName`='npc_injured_rainspeaker_oracle' WHERE `entry`=28217;
UPDATE `creature_template` SET `VehicleId`= 1071, `ScriptName`= 'npc_deepholm_wyvern' WHERE `entry`= 45004;
UPDATE `creature_template` SET `VehicleId`= 1073, `ScriptName`= 'npc_deepholm_wyvern' WHERE `entry`= 45024;
UPDATE `creature_template` SET `ScriptName`='npc_fiend_elemental' WHERE `entry` IN (30044,30042,30043,30045);
UPDATE `creature_template` SET `ScriptName`='npc_elemental_lord' WHERE `entry` IN (30024,30025,30019,30026);
UPDATE creature_template SET `ScriptName` = 'npc_queldelar_weapon' WHERE `entry` = 37158;
UPDATE creature_template SET `ScriptName` = 'npc_deepholm_wyvern_ride' WHERE `entry` = 45024;
UPDATE `creature_template` SET `ScriptName`='npc_stinkbeard' WHERE `entry`=30017;
UPDATE `creature_template` SET `ScriptName`='npc_yggdras' WHERE `entry`=30014;
UPDATE `creature_template` SET `ScriptName` = 'npc_korrak_bloodrager' WHERE `entry`=30023;
UPDATE creature_template SET ScriptName='npc_gurgthock' WHERE entry=30007;
UPDATE `creature_template` SET `ScriptName`='npc_hyldsmeet_protodrake' WHERE `entry`=29625;
UPDATE `creature_template` SET `ScriptName` = 'npc_orinoko_tuskbreaker' WHERE `entry`=30020;
UPDATE creature_template SET `ScriptName` = 'npc_shu_water_spirit' WHERE `entry` = 55212;
UPDATE creature_template SET `ScriptName` = 'npc_veb_shado_pan_trainee' WHERE `entry` = 58992;
UPDATE creature_template SET `ScriptName` = 'npc_lin_silentstrike' WHERE `entry` = 60899;
UPDATE creature_template SET `ScriptName` = 'npc_longying_ranger' WHERE `entry` = 60730;
UPDATE creature_template SET `ScriptName` = 'npc_jade_forest_instant_message_camera_bunny' WHERE `entry` = 56412;
UPDATE creature_template SET `ScriptName` = 'npc_jade_forest_playful_colored_serpent' WHERE `entry` = 56856;
UPDATE creature_template SET `ScriptName` = 'npc_jade_forest_playful_colored_serpent' WHERE `entry` = 56858;
UPDATE creature_template SET `ScriptName` = 'npc_jade_forest_playful_colored_serpent' WHERE `entry` = 56859;
UPDATE creature_template SET `ScriptName` = 'npc_jade_forest_playful_colored_serpent' WHERE `entry` = 56860;
UPDATE creature_template SET `ScriptName` = 'npc_jade_forest_alliance_barricade' WHERE `entry` = 66554;
UPDATE creature_template SET `ScriptName` = 'npc_jade_forest_alliance_barricade' WHERE `entry` = 66555;
UPDATE creature_template SET `ScriptName` = 'npc_jade_forest_alliance_barricade' WHERE `entry` = 66556;
UPDATE creature_template SET `ScriptName` = 'npc_prince_anduin_decision_helpers' WHERE `entry` = 56486;
UPDATE creature_template SET `ScriptName` = 'npc_prince_anduin_decision_helpers' WHERE `entry` = 56487;
UPDATE creature_template SET `ScriptName` = 'npc_prince_anduin_decision_helpers' WHERE `entry` = 56488;
UPDATE creature_template SET `ScriptName` = 'npc_prince_anduin_decision_helpers' WHERE `entry` = 54620;
UPDATE creature_template SET `ScriptName` = 'npc_big_bao' WHERE `entry` = 58508;
UPDATE creature_template SET `ScriptName` = 'npc_jf_wild_prowler' WHERE `entry` = 56653;
UPDATE creature_template SET `ScriptName` = 'npc_jf_wild_stalker' WHERE `entry` = 56683;
UPDATE creature_template SET `ScriptName` = 'npc_prince_anduin_decision' WHERE `entry` = 56485;
REPLACE INTO `creature_queststarter` (`id`, `quest`) VALUES ('56432', '29901'); 
UPDATE creature_template SET `ScriptName` = 'npc_prince_anduin_decision_questgiver' WHERE `entry` = 56432;
UPDATE creature_template SET `ScriptName` = 'npc_lorewalker_cho_peering_into_past' WHERE `entry` = 63307;
UPDATE creature_template SET `ScriptName` = 'npc_lorewalker_cho_stones_could_speak' WHERE `entry` = 63217;
UPDATE creature_template SET `ScriptName` = 'npc_pandriarch_goldendraft' WHERE `entry` = 56210;
UPDATE creature_template SET `ScriptName` = 'npc_pandriarch_bramblestaff' WHERE `entry` = 56209;
UPDATE creature_template SET `ScriptName` = 'npc_pandriarch_windfur' WHERE `entry` = 56206;
UPDATE creature_template SET `ScriptName` = 'npc_broketooth_leaper' WHERE `entry` = 60742;
UPDATE creature_template SET `ScriptName` = 'npc_broketooth_leaper' WHERE `entry` = 60744;
UPDATE creature_template SET `ScriptName` = 'npc_silverback_piker' WHERE `entry` = 60746;
UPDATE creature_template SET `ScriptName` = 'npc_kunlai_old_poof_poof' WHERE `entry` = 60015;
UPDATE creature_template SET `ScriptName` = 'npc_kun_lai_grandpa_grumplefloot' WHERE `entry` = 71082;
UPDATE creature_template SET `ScriptName` = 'npc_despondent_warden_of_zhu' WHERE `entry` = 57457;
UPDATE creature_template SET `ScriptName` = 'npc_ooking_shaman' WHERE `entry` = 60752;
UPDATE `creature_template` SET `ScriptName`='npc_ruul_snowhoof' WHERE `entry`=12818;
UPDATE creature_template SET `ScriptName` = 'npc_tushui_trainee' WHERE `entry` = 54587;
UPDATE creature_template SET `ScriptName` = 'npc_pandriarch_bramblestaff' WHERE `entry` = 56209;
UPDATE creature_template SET ScriptName = 'npc_wild_imp' WHERE entry = 55659;
UPDATE creature_template SET ScriptName = 'npc_warlock_guardian ' WHERE entry = 58965;
UPDATE creature_template SET ScriptName = 'npc_greenstone_terror' WHERE entry = 611590;
UPDATE creature_template SET ScriptName = 'npc_greenstone_village_terror ' WHERE entry = 61159;


UPDATE `gameobject_template` SET questItem1='73210', ScriptName='go_wandering_weapon_rack' WHERE entry='210005';
DELETE FROM `areatrigger_scripts`  WHERE `ScriptName` LIKE 'AreaTrigger_at_rescue_soldiers';
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(7087, 'AreaTrigger_at_rescue_soldiers');
UPDATE `creature_template` SET `ScriptName`='npc_jojo_ironbrow' WHERE (`entry`='55940');
UPDATE `creature_template` SET `InhabitType` = '4', `VehicleId` = '1800', `ScriptName` = 'npc_wind_vehicle' WHERE `creature_template`.`entry` = 55685;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_shang_xi_choose_faction' WHERE `entry` = 56013;
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(125084, 'spell_monk_charging_ox_wave'),
(117197, 'spell_warl_soul_shards_visual_test'),
(122736, 'spell_warl_demonic_fury_visual_controller'),
(116860, 'spell_warl_ember_test'),
(138197, 'spell_dk_t15_blood_4p_bonus'),
(26013, 'spell_gen_deserter'),
(95247, 'spell_grab_air_balloon'),
(114280, 'spell_dru_glyph_of_the_predator'),
(111898, 'spell_warl_glyph_of_felguard'),
(6962, 'spell_warl_glyph_of_felguard_loading'),
(56241, 'spell_warl_glyph_of_verdant_spheres'),
(128648, 'spell_defending_cart_arua'),
(114889, 'spell_sha_stone_bulwark_totem_passive'),
(114877, 'spell_scarlet_halls_archery_target_vehicle_override'),
(113399, 'spell_scarlet_halls_archery_target_vehicle_override_eff'),
(113436, 'spell_scarlet_halls_heroic_defense'),
(93844, 'spell_shadowfang_unholy_empowerment'),
(122169, 'spell_ook_ook_barrel_ride'),
(135414, 'spell_little_patience_inspired_night_elf'),
(133461, 'spell_little_patience_inspired_jinyu'),
(133928, 'spell_little_patience_inspired_gnome'),
(133494, 'spell_little_patience_terrified'),
(135260, 'spell_little_patience_faction_construction_progress'),
(134567, 'spell_little_patience_faction_construction_progress'),
(134086, 'spell_little_patience_faction_construction_progress'),
(133849, 'spell_little_patience_faction_construction_progress'),
(133311, 'spell_little_patience_faction_construction_progress'),
(133852, 'spell_little_patience_construction_bar_movement'),
(134116, 'spell_little_patience_inspired_dwarf'),
(122503, 'spell_unsok_burning_amber_triggering'),
(142191, 'spell_amber_globule_detonation'),
(119985, 'spell_sha_of_fear_dread_spray_fear'),
(139158, 'spell_waterspout_aura'),
(145096, 'spell_garrosh_touch_of_yshaarj_player_launcher'),
(136929, 'spell_thok_summon_ice_tomb'),
(149502, 'spell_juggernaut_ricochet_remove'),
(143210, 'spell_he_instant_poison'),
(133798, 'spell_drain_life_damage'),
(100115, 'spell_afd_royale_in_map'),
(100116, 'spell_afd_royale_leaving_game'),
(100117, 'spell_afd_royale_drop'),
(100125, 'spell_afd_royale_portal_trigger'),
(100119, 'spell_afd_royale_buff_trigger'),
(100118, 'spell_afd_royale_out_of_ring_damage_aura'),
(85372, 'spell_rescue_survivor_quest'),
(26013, 'spell_timeless_isle_crane_wings'),
(19263, 'spell_hunt_glyph_of_deterrence'),
(148467, 'spell_hunt_glyph_of_deterrence'),
(113862, 'spell_mage_greater_invisibility_damage_reduction'),
(125084, 'spell_monk_charging_ox_wave_visual'),
(20271, 'spell_pal_sword_of_light_damage_bonus_holy'),
(24275, 'spell_pal_sword_of_light_damage_bonus_holy'),
(203782, 'spell_pal_glyph_of_bladed_judgement'),
(144385, 'spell_timeless_isle_crane_wings');

replace into `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `difficulty_entry_4`, `difficulty_entry_5`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_unk`, `faction_A`, `faction_H`, `npcflag`, `npcflag2`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `VignetteID`, `TrackingQuestID`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) values('190010','0','0','0','0','0','0','0','19646','0','0','0','Warpweaver','Transmogrifier',NULL,'0','80','80','2','0','35','35','1','0','1','1.14286','1','0','0','0','0','0','1','2000','0','1','0','0','0','0','0','0','0','0','0','0','7','138936390','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','3','1','1','1','1','1','0','0','0','0','0','0','0','0','1','0','0','0','0','npc_transmogrifier','18414');
UPDATE `gameobject_template` SET `ScriptName`='go_captain_tyralius_prison' WHERE `entry`=184588;
UPDATE `gameobject_template` SET `ScriptName`='go_alchemy_bottle_white' WHERE `entry`=211669;
UPDATE `gameobject_template` SET `ScriptName` = 'go_corkis_prison' WHERE `entry` IN (182349,182350,182521);
UPDATE `gameobject_template` SET `ScriptName`='go_princess_stillpines_cage' WHERE `entry`=181928;

UPDATE `creature_template` SET `ScriptName` = 'npc_ring_champions' WHERE `entry` IN (33738,33746,33747,33743,33740,33748,33744,33745,33749,33739);
UPDATE creature_template SET ScriptName = 'npc_capacitor_totem' WHERE entry = 61245;
DELETE FROM spell_script_names WHERE ScriptName = 'spell_warl_haunt';
INSERT INTO spell_script_names VALUES (48181, 'spell_warl_haunt');
UPDATE `creature_template` SET `flags_extra` = 0, `AIName` = '', `ScriptName` = 'npc_ring_valiants' WHERE `entry` IN (33384,33306,33285,33382,33383,33558,33564,33561,33562,33559);
UPDATE `gameobject_template` SET `ScriptName`='go_fel_crystalforge' WHERE `entry`=185919;
UPDATE `gameobject_template` SET `ScriptName`='go_bashir_crystalforge' WHERE `entry`=185921;
UPDATE `gameobject_template` SET `ScriptName`='go_drywood_cage' WHERE `entry`=211511;
UPDATE `gameobject_template` SET `ScriptName`='go_containment_override' WHERE `entry`=213457;


REPLACE INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(8750, 'AreaTrigger_at_msv_engine_of_nalaksha');
REPLACE INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(9353, 'AreaTrigger_at_soo_forward_korkron_skullsplitter');
REPLACE INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(9352, 'AreaTrigger_at_soo_forward_korkron_barracks');
REPLACE INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(9278, 'AreaTrigger_at_soo_forward_korkron_cage_prisoners');
REPLACE INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(1282, 'sat_proving_grounds_berserking');







-- Fixes
UPDATE `creature_template` SET `unit_flags` = 32768 WHERE `entry` = 1934;

-- Fix Quest Breaking the Bonds 25514
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 202955;

DELETE FROM `smart_scripts` WHERE (`source_type` = 1 AND `entryorguid` = 202955);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(202955, 1, 0, 1, 64, 0, 100, 0, 0, 0, 0, 0, 33, 40545, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Give credit to player'),
(202955, 1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 12, 40551, 4, 500, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'summon creature');

-- Fix Multi Profession Trainer
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (12180, 12185, 12186, 12188, 12189, 12190, 12191, 12192, 12193, 12195, 12196, 12197, 12198, 12199);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12180, 11, 0, 'Tell me about gathering professions.', NULL, 0, 1, 1, 12185, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12180, 12, 0, 'Tell me about production professions.', NULL, 0, 1, 1, 12186, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12185, 14, 0, 'Tell me about production professions.', NULL, 0, 1, 1, 12186, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12185, 13, 0, 'Tell me about Skinning.', NULL, 0, 1, 1, 12190, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12185, 12, 0, 'Tell me about Mining.', NULL, 0, 1, 1, 12189, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12185, 11, 0, 'Tell me about Herbalism.', NULL, 0, 1, 1, 12188, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12186, 19, 0, 'Tell me about gathering professions.', NULL, 0, 1, 1, 12185, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12186, 17, 0, 'Tell me about Leatherworking.', NULL, 0, 1, 1, 12198, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12186, 18, 0, 'Tell me about Tailoring.', NULL, 0, 1, 1, 12199, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12186, 16, 0, 'Tell me about Jewelcrafting.', NULL, 0, 1, 1, 12197, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12186, 15, 0, 'Tell me about Inscription.', NULL, 0, 1, 1, 12196, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12186, 14, 0, 'Tell me about Engineering.', NULL, 0, 1, 1, 12195, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12186, 13, 0, 'Tell me about Enchanting.', NULL, 0, 1, 1, 12193, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12186, 11, 0, 'Tell me about Alchemy.', NULL, 0, 1, 1, 12191, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12186, 12, 0, 'Tell me about Blacksmithing.', NULL, 0, 1, 1, 12192, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12188, 14, 0, 'Tell me about gathering professions.', NULL, 0, 1, 1, 12185, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12188, 15, 0, 'Tell me about production professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12188, 13, 0, 'Tell me about Inscription.', NULL, 0, 1, 1, 12196, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12188, 11, 3, 'Train me in Herbalism.', NULL, 0, 5, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12188, 12, 0, 'Tell me about Alchemy.', NULL, 0, 1, 1, 12191, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12189, 15, 0, 'Tell me about gathering professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12189, 16, 0, 'Tell me about production professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12189, 14, 0, 'Tell me about Jewelcrafting.', NULL, 0, 1, 1, 12197, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12189, 11, 3, 'Train me in Mining.', NULL, 0, 5, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12189, 12, 0, 'Tell me about Blacksmithing.', NULL, 0, 1, 1, 12192, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12189, 13, 0, 'Tell me about Engineering.', NULL, 0, 1, 1, 12195, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12190, 11, 3, 'Train me in Skinning.', NULL, 0, 5, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12190, 14, 0, 'Tell me about production professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12190, 13, 0, 'Tell me about gathering professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12190, 12, 0, 'Tell me about Leatherworking.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12191, 12, 0, 'Tell me about Herbalism.', NULL, 0, 1, 1, 12188, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12191, 14, 0, 'Tell me about gathering professions.', NULL, 0, 1, 1, 12185, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12191, 13, 0, 'Tell me about Inscription.', NULL, 0, 1, 1, 12196, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12191, 15, 0, 'Tell me about production professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12191, 11, 3, 'Train me in Alchemy.', NULL, 0, 5, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12192, 11, 3, 'Train me in Blacksmithing.', NULL, 0, 5, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12192, 14, 0, 'Tell me about production professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12192, 13, 0, 'Tell me about gathering professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12192, 12, 0, 'Tell me about Mining.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12193, 14, 0, 'Tell me about production professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12193, 13, 0, 'Tell me about gathering professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12193, 12, 0, 'Tell me about Tailoring.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12193, 11, 3, 'Train me in Enchanting.', NULL, 0, 5, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12195, 14, 0, 'Tell me about production professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12195, 12, 0, 'Tell me about Mining.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12195, 13, 0, 'Tell me about gathering professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12195, 11, 3, 'Train me in Engineering.', NULL, 0, 5, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12196, 12, 0, 'Tell me about Herbalism.', NULL, 0, 1, 1, 12188, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12196, 14, 0, 'Tell me about production professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12196, 13, 0, 'Tell me about gathering professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12196, 11, 3, 'Train me in Inscription.', NULL, 0, 5, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12197, 14, 0, 'Tell me about production professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12197, 12, 0, 'Tell me about Mining.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12197, 13, 0, 'Tell me about gathering professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12197, 11, 3, 'Train me in Jewelcrafting.', NULL, 0, 5, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12198, 14, 0, 'Tell me about production professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12198, 13, 0, 'Tell me about gathering professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12198, 12, 0, 'Tell me about Skinning.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12198, 11, 3, 'Train me in Leatherworking.', NULL, 0, 5, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12199, 12, 0, 'Tell me about Enchanting.', NULL, 0, 1, 5, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12199, 11, 3, 'Train me in Tailoring.', NULL, 0, 5, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12199, 13, 0, 'Tell me about gathering professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_text_female`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `box_text_female`, `BoxBroadcastTextID`) VALUES (12199, 14, 0, 'Tell me about production professions.', NULL, 0, 1, 1, 0, 0, 0, 0, NULL, NULL, 0);

