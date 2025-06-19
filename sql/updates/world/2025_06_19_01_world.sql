-- Fear no Evil
-- Remove spellscript for Fear no Evil quest, as this is handled by the DBC
DELETE FROM `spell_script_names` WHERE `spell_id` = 93072;

-- Injured Stormwind Infantry
-- Set the kill credit to 1 instead of 2 when casting 93072 on Injured Stormwind Soldier
DELETE FROM `smart_scripts` WHERE `entryorguid`=5004700 AND `source_type`=9 AND `id`=0 AND `link`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES (5004700, 9, 0, 0, 0, 0, 100, 0, 500, 500, 0, 0, 33, 50047, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Stormwind Infantry - On Script - Quest Credit');