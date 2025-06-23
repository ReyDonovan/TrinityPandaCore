DELETE FROM `trinity_string` WHERE `entry` IN (1157, 1158, 1159, 1160, 1161, 1162, 1163, 1164, 1165, 1166,
                                               1167, 1168, 1169, 1170, 1171, 1172, 1173, 1174, 1175, 1176,
                                               15005, 15006, 15007);
INSERT INTO `trinity_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `content_loc9`, `content_loc10`, `content_loc11`, `content_female`, `content_female_loc1`, `content_female_loc2`, `content_female_loc3`, `content_female_loc4`, `content_female_loc5`, `content_female_loc6`, `content_female_loc7`, `content_female_loc8`, `content_female_loc9`, `content_female_loc10`, `content_female_loc11`) VALUES
(1157, "All config are reloaded from configuration file.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1158, "==========================================================", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1159, "|--------------------------------------------------------|", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1160, "|            | Alliance |  Horde   | Neutral  |  Total   |", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1161, "|         Alliance/Horde/Neutral/Total", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1162, "| %-10s | %8u | %8u | %8u | %8u |", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1163, "%-10s = %6u / %6u / %6u / %6u", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1164, "Count", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1165, "Item Ratio", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1166, "|            | Alliance |   Horde  | Neutral  |  Amount  |", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1167, "|          Alliance/Horde/Neutral/Amount", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1168, "Gray", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1169, "White", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1170, "Green", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1171, "Blue", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1172, "Purple", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1173, "Orange", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1174, "Yellow", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1175, "Amount of %s items is set to %u.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1176, "Items ratio for %s is set to %u.", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15005, "|cff1eff00Your current balance is:", NULL, NULL, "|cff1eff00Aktuelles Guthaben ist:", NULL, NULL, NULL, NULL, "|cff1eff00Ваш текущий баланс:", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15006, "Thank you for your purchase. Your new balance is:", NULL, NULL, "Danke für deinen Einkauf, deine neues Guthaben beträgt:", NULL, NULL, NULL, NULL, "Спасибо за покупку. Ваш остаток на балансе:", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15007, "You can't afford this!", NULL, NULL, "Das kannst du dir nicht leisten!", NULL, NULL, NULL, NULL, "Вы не можете себе этого позволить!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE `trinity_string` SET `content_loc3`='|cff3DAEFF[Shop]|cffFFD800 Dein Guthaben beträgt: |cffFF0000' WHERE `entry`=15005;
UPDATE `trinity_string` SET `content_loc3`='|cff3DAEFF[Shop]|cffFFD800 Vielen Dank für deinen Einkauf. Dein neues Guthaben beträgt: |cffFF0000' WHERE `entry`=15006;
UPDATE `trinity_string` SET `content_loc3`='|cff3DAEFF[Shop]|cffFFD800 Dein Guthaben ist zu niedrig.  |cffFF0000' WHERE `entry`=15007;