-- Spirit Healer
-- Missing spawn in Northshire
DELETE FROM `creature` WHERE `guid`=13232029;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawntimesecs_max`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`) VALUES (13232029, 6491, 0, 6170, 9, 1, 1, 0, 0, -8946.41, -183.334, 79.9009, 5.85513, 300, 0, 0, 0, 4121, 0, 0, 0, 0, 0, 0, 0);