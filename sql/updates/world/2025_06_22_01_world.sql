-- achievement_reward_locale
DROP TABLE IF EXISTS `achievement_reward_locale`;
CREATE TABLE IF NOT EXISTS `achievement_reward_locale` (
  `ID` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
  `Locale` VARCHAR(4) NOT NULL,
  `Subject` TEXT,
  `Text` TEXT,
  PRIMARY KEY (`ID`, `Locale`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8;

-- locales_achievement_reward
INSERT INTO `achievement_reward_locale` (`ID`, `Locale`, `Subject`, `Text`)
  (SELECT `entry`, "koKR", `subject_loc1`, `text_loc1` FROM `locales_achievement_reward` WHERE LENGTH(subject_loc1) > 0 OR LENGTH(text_loc1) > 0);

INSERT INTO `achievement_reward_locale` (`ID`, `locale`, `Subject`, `Text`)
  (SELECT `entry`, "frFR", `subject_loc2`, `text_loc2` FROM `locales_achievement_reward` WHERE LENGTH(subject_loc2) > 0 OR LENGTH(text_loc2) > 0);

INSERT INTO `achievement_reward_locale` (`ID`, `locale`, `Subject`, `Text`)
  (SELECT `entry`, "deDE", `subject_loc3`, `text_loc3` FROM `locales_achievement_reward` WHERE LENGTH(subject_loc3) > 0 OR LENGTH(text_loc3) > 0);

INSERT INTO `achievement_reward_locale` (`ID`, `locale`, `Subject`, `Text`)
  (SELECT `entry`, "zhCN", `subject_loc4`, `text_loc4` FROM `locales_achievement_reward` WHERE LENGTH(subject_loc4) > 0 OR LENGTH(text_loc4) > 0);

INSERT INTO `achievement_reward_locale` (`ID`, `locale`, `Subject`, `Text`)
  (SELECT `entry`, "zhTW", `subject_loc5`, `text_loc5` FROM `locales_achievement_reward` WHERE LENGTH(subject_loc5) > 0 OR LENGTH(text_loc5) > 0);

INSERT INTO `achievement_reward_locale` (`ID`, `locale`, `Subject`, `Text`)
  (SELECT `entry`, "esES", `subject_loc6`, `text_loc6` FROM `locales_achievement_reward` WHERE LENGTH(subject_loc6) > 0 OR LENGTH(text_loc6) > 0);

INSERT INTO `achievement_reward_locale` (`ID`, `locale`, `Subject`, `Text`)
  (SELECT `entry`, "esMX", `subject_loc7`, `text_loc7` FROM `locales_achievement_reward` WHERE LENGTH(subject_loc7) > 0 OR LENGTH(text_loc7) > 0);

INSERT INTO `achievement_reward_locale` (`ID`, `locale`, `Subject`, `Text`)
  (SELECT `entry`, "ruRU", `subject_loc8`, `text_loc8` FROM `locales_achievement_reward` WHERE LENGTH(subject_loc8) > 0 OR LENGTH(text_loc8) > 0);
  
  DROP TABLE IF EXISTS `locales_achievement_reward`;

-- achievement_reward_locale
DELETE FROM `achievement_reward_locale` WHERE `ID` IN (13, 45, 614, 876, 1250, 1956, 2096, 2143, 3478, 3656, 4478, 4602, 4603, 4784, 4785) AND `locale` = 'deDE';
INSERT INTO `achievement_reward_locale` (`ID`, `Locale`, `Subject`, `Text`) VALUES
(13, 'deDE', 'Stufe 80', 'Herzlichen Glückwunsch zu Eurem Erreichen der 80. Abenteuersaison! Ihr habt Euch zweifelsohne der Sache verschrieben, Azeroth von den Übeln zu befreien, die uns geplagt haben.$B$BUnd obwohl die bisherige Reise keine Kleinigkeit war, steht der wahre Kampf noch bevor.$B$BKämpft weiter!$B$BRhonin'),
(45, 'deDE', 'Ihr seid rumgekommen!', 'Nun seht Euch mal an!$B$BUnd ich dachte, ich hätte hier an diesem eisigen Ort schon einiges gesehen! Diesem Zwerg scheint es offensichtlich, dass das Feuer eines Forschers in Euren Augen brennt.$B$BTragt diesen Wappenrock mit Stolz, dann wissen Eure Freunde, wen sie nach dem Weg fragen müssen, wenn die Zeit gekommen ist!$B$BMacht weiter so!$B$BBrann Bronzebart'),
(614, 'deDE', 'Für die Allianz!', 'Krieg wütet in unseren Ländern. Nur die tapfersten aller Helden wagen es, der Horde dort einen Schlag zu versetzen, wo es wehtut. Ihr gehört zu eben diesen Helden.$B$BDer Schlag, den Ihr der Führung der Horde versetzt habt, bereitet den Weg für unseren letzten Angriff. Die Horde wird sich vor der Macht der Allianz verbeugen.$B$BEure Taten bleiben nicht ungewürdigt. Reitet mit Stolz!$B$B--Euer König'),
(876, 'deDE', 'Brutaler Kämpfer', 'Ihr habt ein ganz schönes Händchen dafür Euch in diese Arena zu werfen. Nehmt dies. Tragt es mit Stolz. Jetzt geht wieder rein und zeigt ihnen, wie es gemacht wird! $B$BOnkel Sal'),
(1250, 'deDE', 'Stinkers neues Zuhause', 'Ich habe gehört, wie gut Ihr Euch um unsere pelzigen Freunde kümmert. Ich hoffe, es macht Euch nichts aus, aber ich muss Stinker ein neues Zuhause verschaffen. Er weigert sich einfach, friedlich mit den Anderen zu spielen.$B$BBitte stellt sicher, dass er zweimal täglich gefüttert wird. Und, ähm... er hat eine Schwäche für schwarze Katzen.$B$B--Breanni'),
(1956, 'deDE', 'Höheres Studium', 'Herzlichen Glückwunsch zu Eurem Abschluss in den Schulen der arkanen Magie. In Anerkennung Eurer Hingabe lege ich diesen speziellen Buchband bei, der die Serie vervollständigt.$B$BIch denke, dass Ihr diesen Folianten sehr unterhaltsam finden werdet. Doch das dürft Ihr selbst entscheiden.$B$BHochachtungsvoll,$B$BRhonin'),
(2096, 'deDE', 'Der Münzmeister', 'Grüße und Glückwünsche dazu, dass Ihr das gesamte Set der Dalaranmünzen gesammelt habt! Als Belohnung Eurer harten Arbeit habe ich diesem Schreiben ein frisch geprägtes Titansiegel von Dalaran beigelegt. Dies ist eine besondere Münze, die wir nur den leidenschaftlichsten aller Sammler verleihen.$B$BIch hoffe, Ihr findet Freude an dieser speziellen Belohnung. Ihr habt Sie Euch verdient!$B$BHochachtungsvoll,$B$BJepetto Spaßbrumm'),
(2143, 'deDE', 'Vorreiter der Kavallerie', 'Ich konnte nicht umhin, zu sehen wie gut Ihr mit Tieren umgeht. Bei allem was hier vorgeht, laufen meine Geschäfte besser denn je.$B$BIch nehme nicht an, dass es Euch etwas ausmacht, für mich auf diesen Albinodrachen aufzupassen? Ich habe einfach nicht genug Zeit, mich um all diese Tiere zu kümmern.$B$BViele Grüße.$B$BMei'),
(3478, 'deDE', 'Der vergessene Puter', 'Könnt Ihr begreifen, wie es dieser fette Truthahn lebendig durch den November geschafft hat?!$B$BAlle seine Freunde sind auf den reich gedeckten Tischen serviert worden. Mit Moosbeerenchutney und Gewürzbrotfüllung und... OOOH... jetzt bekomme ich Hunger. Egal! Er ist jetzt ganz allein. Deswegen habe ich überlegt, ob Ihr Euch vielleicht um Ihn kümmern würdet. In meinem Laden ist einfach nicht mehr genug Platz für ihn!$B$BHaltet ihn nur bitte von Kochstellen fern. Er bekommt in ihrer Nähe immer so einen merkwürdigen Blick...$B$B--Breanni'),
(3656, 'deDE', 'Der vergessene Puter', 'Könnt Ihr begreifen, wie es dieser fette Truthahn lebendig durch den November geschafft hat?!$B$BAlle seine Freunde sind auf den reich gedeckten Tischen serviert worden. Mit Moosbeerenchutney und Gewürzbrotfüllung und... OOOH... jetzt bekomme ich Hunger. Egal! Er ist jetzt ganz allein. Deswegen habe ich überlegt, ob Ihr Euch vielleicht um Ihn kümmern würdet. In meinem Laden ist einfach nicht mehr genug Platz für ihn!$B$BHaltet ihn nur bitte von Kochstellen fern. Er bekommt in ihrer Nähe immer so einen merkwürdigen Blick...$B$B--Breanni'),
(4478, 'deDE', 'Streuner', 'Werter Meister der Geduld, wir möchten Eure Beharrlichkeit belohnen, mit der Ihr immer wieder Dungeons mit Leuten betretet, die Ihr wahrscheinlich noch nie zuvor getroffen habt. Hoffentlich habt Ihr ein paar Jungspunden zeigen können, wie der Hase läuft.$B$BLange Rede, kurzer Sinn. Wir haben zufällig gehört, dass Ihr mit Zufallsgruppen herumstreunt. Und wie der Zufall so will ist hier also ein kleiner Streuner, den wir Euch zufallen lassen, um mit Euch zu streunen, während Ihr zufälligen Zufällen zufallt, oder so.$B$BKnuddels.$B$BEure Freunde beim Entwickler-Team von WoW'),
(4602, 'deDE', 'Ruhm des Schlachtzüglers von Eiskrone', '$N,$B$BAls der Einfluss des Lichkönigs schwand, haben sich einige seiner mächtigeren Schergen aus seinem Griff befreit.$B$BDieser von meinen Männern gefangen genommene Frostwyrmdrache ist ein Paradebeispiel dafür. Sie hat einen eigenen Willen und noch mehr.$B$BEiner meiner Männer verlor einen Arm als er sie einritt, aber sie kann jetzt recht gut mit Reitern umgehen - vorausgesetzt Ihr seid geschickt und habt einen starken Willen.$B$BBitte nehmt diese prächtige Bestie als Geschenk der Ritter der Schwarzen Klinge an. Es war mir eine Ehre, an Eurer Seite in der größten aller Schlachten zu kämpfen.$B$BHochachtungsvoll,$BDarion Mograine.'),
(4603, 'deDE', 'Ruhm des Schlachtzüglers von Eiskrone', '$N,$B$BAls der Einfluss des Lichkönigs schwand, haben sich einige seiner mächtigeren Schergen aus seinem Griff befreit.$B$BDieser von meinen Männern gefangen genommene Frostwyrmdrache ist ein Paradebeispiel dafür. Sie hat einen eigenen Willen und noch mehr.$B$BEiner meiner Männer verlor einen Arm als er sie einritt, aber sie kann jetzt recht gut mit Reitern umgehen - vorausgesetzt Ihr seid geschickt und habt einen starken Willen.$B$BBitte nehmt diese prächtige Bestie als Geschenk der Ritter der Schwarzen Klinge an. Es war mir eine Ehre, an Eurer Seite in der größten aller Schlachten zu kämpfen.$B$BHochachtungsvoll,$BDarion Mograine.'),
(4784, 'deDE', 'Emblemrüstmeister in Dalaran\'s Silbernen Enklave', 'Eure Erfolge in Nordend sind nicht unbemerkt geblieben, Freund.$B$BDie verdienten Embleme können benutzt werden, um Gegenstände bei den verschiedenen Emblemrüstmeistern zu kaufen.$B$BIhr findet uns in der Silbernen Enklave, wo jede Emblemart einen eigenen Rüstmeister hat.$B$BWir freuen uns auf Eure Ankunft!'),
(4785, 'deDE', 'Emblemrüstmeister in Dalaran\'s Sonnenhäschers Zuflucht', 'Eure Erfolge in Nordend sind nicht unbemerkt geblieben, Freund.$B$BDie verdienten Embleme können benutzt werden, um Gegenstände bei den verschiedenen Emblemrüstmeistern zu kaufen.$B$BIhr findet uns in Sonnenhäschers Zuflucht, wo jede Emblemart einen eigenen Rüstmeister hat.$B$BWir freuen uns auf Eure Ankunft!');

-- trinity_string
UPDATE `trinity_string` SET `content_loc3`='|Hplayer:$n|h[$n]|h hat den Erfolg $a errungen!' WHERE `entry`=810;