-- DB update 2019_10_20_00 -> 2019_10_21_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2019_10_20_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2019_10_20_00 2019_10_21_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1570629525711769801'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1570629525711769801');

-- Summoned Drostan: Prepared ranged weapon
DELETE FROM `creature_template_addon` WHERE `entry` = 28857;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(28857,0,0,0,2,0,0,NULL);

-- SAI for Drostan and summoned Drostan
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (28328,28857);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (28328,28857) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` BETWEEN 2885700 AND 2885707 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28328,0,0,0,19,0,100,0,12592,0,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Drostan - On Quest ''The Great Hunter''s Challenge'' Accepted - Say Line 1'),

(28857,0,0,1,54,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - Just Summoned - Set Unit Flags ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(28857,0,1,0,61,0,100,0,0,0,0,0,0,67,1,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - Linked - Create Timed Event ID 1'),
(28857,0,2,3,59,0,100,0,1,0,0,0,0,11,52573,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Timed Event ID 1 - Cast ''Drostan On Spawn'''),
(28857,0,3,0,61,0,100,0,0,0,0,0,0,67,2,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - Linked - Create Timed Event ID 2'),
(28857,0,4,0,59,0,100,0,2,0,0,0,0,66,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Drostan - On Timed Event ID 2 - Face Summoner'),
(28857,0,5,0,54,0,100,0,0,0,0,0,0,80,2885700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - Just Summoned - Run Actionlist'),
(28857,0,6,0,54,0,100,0,0,0,0,0,0,80,2885701,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - Just Summoned - Run Actionlist'),
(28857,0,7,0,54,0,100,0,0,0,0,0,0,80,2885702,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - Just Summoned - Run Actionlist'),
(28857,0,8,0,54,0,100,0,0,0,0,0,0,80,2885703,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - Just Summoned - Run Actionlist'),
(28857,0,9,0,54,0,100,0,0,0,0,0,0,80,2885704,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - Just Summoned - Run Actionlist'),
(28857,0,10,0,54,0,100,0,0,0,0,0,0,80,2885705,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - Just Summoned - Run Actionlist'),
(28857,0,11,0,54,0,100,0,0,0,0,0,0,80,2885706,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - Just Summoned - Run Actionlist'),
(28857,0,12,0,54,0,100,0,0,0,0,0,0,80,2885707,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - Just Summoned - Run Actionlist'),

(2885700,9,0,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Drostan - On Script - Say Line 0'),
(2885700,9,1,0,0,0,100,0,3000,3000,0,0,0,122,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Flee For 2 Seconds'),
(2885700,9,2,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Despawn'),

(2885701,9,0,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Drostan - On Script - Say Line 1'),
(2885701,9,1,0,0,0,100,0,3000,3000,0,0,0,122,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Flee For 2 Seconds'),
(2885701,9,2,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Despawn'),

(2885702,9,0,0,0,0,100,0,3000,3000,0,0,0,1,2,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Drostan - On Script - Say Line 2'),
(2885702,9,1,0,0,0,100,0,3000,3000,0,0,0,122,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Flee For 2 Seconds'),
(2885702,9,2,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Despawn'),

(2885703,9,0,0,0,0,100,0,3000,3000,0,0,0,1,3,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Drostan - On Script - Say Line 3'),
(2885703,9,1,0,0,0,100,0,2000,2000,0,0,0,40,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Sheath Weapon'),
(2885703,9,2,0,0,0,100,0,1000,1000,0,0,0,75,55474,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Add Aura ''Cosmetic - Sleep Zzz'''),
(2885703,9,3,0,0,0,100,0,0,0,0,0,0,90,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Set Standstate Sleep'),
(2885703,9,4,0,0,0,100,0,3000,3000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Despawn'),

(2885704,9,0,0,0,0,100,0,3000,3000,0,0,0,1,4,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Drostan - On Script - Say Line 4'),
(2885704,9,1,0,0,0,100,0,3000,3000,0,0,0,1,5,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Drostan - On Script - Say Line 5'),
(2885704,9,2,0,0,0,100,0,3000,3000,0,0,0,122,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Flee For 2 Seconds'),
(2885704,9,3,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Despawn'),

(2885705,9,0,0,0,0,100,0,3000,3000,0,0,0,1,6,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Drostan - On Script - Say Line 6'),
(2885705,9,1,0,0,0,100,0,3000,3000,0,0,0,122,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Flee For 2 Seconds'),
(2885705,9,2,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Despawn'),

(2885706,9,0,0,0,0,100,0,3000,3000,0,0,0,1,7,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Drostan - On Script - Say Line 7'),
(2885706,9,1,0,0,0,100,0,3000,3000,0,0,0,122,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Flee For 2 Seconds'),
(2885706,9,2,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Despawn'),

(2885707,9,0,0,0,0,100,0,3000,3000,0,0,0,1,8,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Drostan - On Script - Say Line 8'),
(2885707,9,1,0,0,0,100,0,3000,3000,0,0,0,122,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Flee For 2 Seconds'),
(2885707,9,2,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drostan - On Script - Despawn');

-- Additional SAI for game animals
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (28001,28011,28129,28297,28379) AND `id` = 1 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (28002,28009,28378,28380) AND `id` = 2 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28001,0,1,0,6,0,100,0,0,0,0,0,0,86,52556,2,7,0,0,0,1,0,0,0,0,0,0,0,0,'Dreadsaber - On Death - Cross Cast ''Summon Drostan'''),
(28002,0,2,0,6,0,100,0,0,0,0,0,0,86,52556,2,7,0,0,0,1,0,0,0,0,0,0,0,0,'Mangal Crocolisk - On Death - Cross Cast ''Summon Drostan'''),
(28009,0,2,0,6,0,100,0,0,0,0,0,0,86,52556,2,7,0,0,0,1,0,0,0,0,0,0,0,0,'Shardtooth Rhino - On Death - Cross Cast ''Summon Drostan'''),
(28011,0,1,0,6,0,100,0,0,0,0,0,0,86,52556,2,7,0,0,0,1,0,0,0,0,0,0,0,0,'Emperor Cobra - On Death - Cross Cast ''Summon Drostan'''),
(28129,0,1,0,6,0,100,0,0,0,0,0,0,86,52556,2,7,0,0,0,1,0,0,0,0,0,0,0,0,'Longneck Grazer - On Death - Cross Cast ''Summon Drostan'''),
(28297,0,1,0,6,0,100,0,0,0,0,0,0,86,52556,2,7,0,0,0,1,0,0,0,0,0,0,0,0,'Shango - On Death - Cross Cast ''Summon Drostan'''),
(28378,0,2,0,6,0,100,0,0,0,0,0,0,86,52556,2,7,0,0,0,1,0,0,0,0,0,0,0,0,'Primordial Drake - On Death - Cross Cast ''Summon Drostan'''),
(28379,0,1,0,6,0,100,0,0,0,0,0,0,86,52556,2,7,0,0,0,1,0,0,0,0,0,0,0,0,'Shattertusk Mammoth - On Death - Cross Cast ''Summon Drostan'''),
(28380,0,2,0,6,0,100,0,0,0,0,0,0,86,52556,2,7,0,0,0,1,0,0,0,0,0,0,0,0,'Shattertusk Bull - On Death - Cross Cast ''Summon Drostan''');

-- Conditions concerning quest progress
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (28857,28001,28002,28009,28011,28129,28297,28378,28379,28380) AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(22,6,28857,0,0,48,0,12592,0,6,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 6'),
(22,7,28857,0,0,48,0,12592,0,11,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 11'),
(22,8,28857,0,0,48,0,12592,0,21,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 21'),
(22,9,28857,0,0,48,0,12592,0,28,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 28'),
(22,10,28857,0,0,48,0,12592,0,35,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 35'),
(22,11,28857,0,0,48,0,12592,0,41,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 41'),
(22,12,28857,0,0,48,0,12592,0,49,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 49'),
(22,13,28857,0,0,48,0,12592,0,56,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 56'),

(22,2,28001,0,0,48,0,12592,0,6,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 6 AND'),
(22,2,28001,0,0,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28001,0,1,48,0,12592,0,11,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 11 AND'),
(22,2,28001,0,1,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28001,0,2,48,0,12592,0,21,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 21 AND'),
(22,2,28001,0,2,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28001,0,3,48,0,12592,0,28,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 28 AND'),
(22,2,28001,0,3,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28001,0,4,48,0,12592,0,35,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 35 AND'),
(22,2,28001,0,4,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28001,0,5,48,0,12592,0,41,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 41 AND'),
(22,2,28001,0,5,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28001,0,6,48,0,12592,0,49,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 49 AND'),
(22,2,28001,0,6,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28001,0,7,48,0,12592,0,56,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 56 AND'),
(22,2,28001,0,7,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),

(22,3,28002,0,0,48,0,12592,0,6,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 6 AND'),
(22,3,28002,0,0,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28002,0,1,48,0,12592,0,11,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 11 AND'),
(22,3,28002,0,1,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28002,0,2,48,0,12592,0,21,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 21 AND'),
(22,3,28002,0,2,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28002,0,3,48,0,12592,0,28,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 28 AND'),
(22,3,28002,0,3,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28002,0,4,48,0,12592,0,35,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 35 AND'),
(22,3,28002,0,4,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28002,0,5,48,0,12592,0,41,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 41 AND'),
(22,3,28002,0,5,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28002,0,6,48,0,12592,0,49,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 49 AND'),
(22,3,28002,0,6,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28002,0,7,48,0,12592,0,56,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 56 AND'),
(22,3,28002,0,7,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),

(22,3,28009,0,0,48,0,12592,0,6,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 6 AND'),
(22,3,28009,0,0,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28009,0,1,48,0,12592,0,11,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 11 AND'),
(22,3,28009,0,1,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28009,0,2,48,0,12592,0,21,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 21 AND'),
(22,3,28009,0,2,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28009,0,3,48,0,12592,0,28,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 28 AND'),
(22,3,28009,0,3,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28009,0,4,48,0,12592,0,35,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 35 AND'),
(22,3,28009,0,4,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28009,0,5,48,0,12592,0,41,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 41 AND'),
(22,3,28009,0,5,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28009,0,6,48,0,12592,0,49,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 49 AND'),
(22,3,28009,0,6,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28009,0,7,48,0,12592,0,56,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 56 AND'),
(22,3,28009,0,7,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),

(22,2,28011,0,0,48,0,12592,0,6,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 6 AND'),
(22,2,28011,0,0,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28011,0,1,48,0,12592,0,11,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 11 AND'),
(22,2,28011,0,1,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28011,0,2,48,0,12592,0,21,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 21 AND'),
(22,2,28011,0,2,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28011,0,3,48,0,12592,0,28,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 28 AND'),
(22,2,28011,0,3,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28011,0,4,48,0,12592,0,35,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 35 AND'),
(22,2,28011,0,4,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28011,0,5,48,0,12592,0,41,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 41 AND'),
(22,2,28011,0,5,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28011,0,6,48,0,12592,0,49,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 49 AND'),
(22,2,28011,0,6,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28011,0,7,48,0,12592,0,56,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 56 AND'),
(22,2,28011,0,7,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),

(22,2,28129,0,0,48,0,12592,0,6,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 6 AND'),
(22,2,28129,0,0,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28129,0,1,48,0,12592,0,11,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 11 AND'),
(22,2,28129,0,1,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28129,0,2,48,0,12592,0,21,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 21 AND'),
(22,2,28129,0,2,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28129,0,3,48,0,12592,0,28,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 28 AND'),
(22,2,28129,0,3,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28129,0,4,48,0,12592,0,35,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 35 AND'),
(22,2,28129,0,4,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28129,0,5,48,0,12592,0,41,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 41 AND'),
(22,2,28129,0,5,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28129,0,6,48,0,12592,0,49,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 49 AND'),
(22,2,28129,0,6,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28129,0,7,48,0,12592,0,56,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 56 AND'),
(22,2,28129,0,7,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),

(22,2,28297,0,0,48,0,12592,0,6,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 6 AND'),
(22,2,28297,0,0,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28297,0,1,48,0,12592,0,11,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 11 AND'),
(22,2,28297,0,1,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28297,0,2,48,0,12592,0,21,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 21 AND'),
(22,2,28297,0,2,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28297,0,3,48,0,12592,0,28,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 28 AND'),
(22,2,28297,0,3,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28297,0,4,48,0,12592,0,35,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 35 AND'),
(22,2,28297,0,4,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28297,0,5,48,0,12592,0,41,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 41 AND'),
(22,2,28297,0,5,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28297,0,6,48,0,12592,0,49,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 49 AND'),
(22,2,28297,0,6,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28297,0,7,48,0,12592,0,56,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 56 AND'),
(22,2,28297,0,7,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),

(22,3,28378,0,0,48,0,12592,0,6,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 6 AND'),
(22,3,28378,0,0,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28378,0,1,48,0,12592,0,11,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 11 AND'),
(22,3,28378,0,1,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28378,0,2,48,0,12592,0,21,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 21 AND'),
(22,3,28378,0,2,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28378,0,3,48,0,12592,0,28,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 28 AND'),
(22,3,28378,0,3,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28378,0,4,48,0,12592,0,35,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 35 AND'),
(22,3,28378,0,4,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28378,0,5,48,0,12592,0,41,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 41 AND'),
(22,3,28378,0,5,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28378,0,6,48,0,12592,0,49,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 49 AND'),
(22,3,28378,0,6,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28378,0,7,48,0,12592,0,56,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 56 AND'),
(22,3,28378,0,7,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),

(22,2,28379,0,0,48,0,12592,0,6,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 6 AND'),
(22,2,28379,0,0,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28379,0,1,48,0,12592,0,11,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 11 AND'),
(22,2,28379,0,1,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28379,0,2,48,0,12592,0,21,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 21 AND'),
(22,2,28379,0,2,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28379,0,3,48,0,12592,0,28,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 28 AND'),
(22,2,28379,0,3,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28379,0,4,48,0,12592,0,35,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 35 AND'),
(22,2,28379,0,4,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28379,0,5,48,0,12592,0,41,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 41 AND'),
(22,2,28379,0,5,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28379,0,6,48,0,12592,0,49,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 49 AND'),
(22,2,28379,0,6,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,2,28379,0,7,48,0,12592,0,56,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 56 AND'),
(22,2,28379,0,7,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),

(22,3,28380,0,0,48,0,12592,0,6,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 6 AND'),
(22,3,28380,0,0,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28380,0,1,48,0,12592,0,11,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 11 AND'),
(22,3,28380,0,1,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28380,0,2,48,0,12592,0,21,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 21 AND'),
(22,3,28380,0,2,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28380,0,3,48,0,12592,0,28,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 28 AND'),
(22,3,28380,0,3,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28380,0,4,48,0,12592,0,35,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 35 AND'),
(22,3,28380,0,4,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28380,0,5,48,0,12592,0,41,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 41 AND'),
(22,3,28380,0,5,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28380,0,6,48,0,12592,0,49,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 49 AND'),
(22,3,28380,0,6,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR'),
(22,3,28380,0,7,48,0,12592,0,56,0,0,0,'','Run SAI only if objective count of quest The Great Hunter''s Challenge is 56 AND'),
(22,3,28380,0,7,29,0,28857,30,0,1,0,0,'','Run SAI only if NPC Drostan is NOT within 30 yards OR');

-- Drostan and summoned Drostan additional creature texts
DELETE FROM `creature_text` WHERE `CreatureID` = 28328 AND `GroupID` = 1;
DELETE FROM `creature_text` WHERE `CreatureID` = 28857;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(28328,1,0,'Remember, $n, this is no sprint. The true test of a hunter tests his endurance over the course of a long expedition.',12,0,100,0,0,0,29924,0,'Drostan'),
(28857,0,0,'Yer gonna have to shoot faster than that! I''ve already got 11 kills!',12,0,100,5,0,0,28983,0,'Drostan'),
(28857,0,1,'That''s number 10! How many''ve you got?',12,0,100,5,0,0,28984,0,'Drostan'),
(28857,0,2,'Number 9! I could do this with my eyes closed!',12,0,100,5,0,0,28985,0,'Drostan'),
(28857,0,3,'11! It''s gonna take a bigger effort than that to beat ol'' Drostan!',12,0,100,5,0,0,28986,0,'Drostan'),
(28857,1,0,'I''m up to 15. Top that!',12,0,100,5,0,0,29080,0,'Drostan'),
(28857,1,1,'That''s my 16th and I''m still going easy on ya!',12,0,100,5,0,0,29081,0,'Drostan'),
(28857,1,2,'You''re going to have to pick it up, or this isn''t going to be much of a competition.',12,0,100,5,0,0,29082,0,'Drostan'),
(28857,1,3,'Ha! 16! How many''ve you got? 10, maybe 11 if you''re lucky?',12,0,100,5,0,0,29083,0,'Drostan'),
(28857,2,0,'That''s my 25th kill. How far behind are you now?',12,0,100,5,0,0,29084,0,'Drostan'),
(28857,2,1,'26th! Are you going to start killing, or what?',12,0,100,5,0,0,29091,0,'Drostan'),
(28857,2,2,'My mother could hunt faster than you, $n.',12,0,100,5,0,0,29092,0,'Drostan'),
(28857,2,3,'Kill number 26 and I''m still just warming up.',12,0,100,5,0,0,29093,0,'Drostan'),
(28857,3,0,'Well, now that I''ve got a nice lead, I think I''ll enjoy a little nap.',12,0,100,5,0,0,29096,0,'Drostan'),
(28857,4,0,'Well, that was a relaxing nap. How''s the game hunting going over there?',12,0,100,5,0,0,29097,0,'Drostan'),
(28857,5,0,'I''ve got a nice lead, yet. Think I''ll do some fishin''.',12,0,100,5,0,0,29101,0,'Drostan'),
(28857,6,0,'Well, now we''ve got a competition on our hands.',12,0,100,5,0,0,29112,0,'Drostan'),
(28857,6,1,'Just got number 41! How''s that for skill?',12,0,100,5,0,0,29116,0,'Drostan'),
(28857,6,2,'41! Two-thirds of the way there. Better step it up!',12,0,100,5,0,0,29117,0,'Drostan'),
(28857,6,3,'Hey! I was just lining up a shot on that one. Kill stealer!',12,0,100,5,0,0,29118,0,'Drostan'),
(28857,7,0,'Argh, just now getting number 48. This is getting tough.',12,0,100,5,0,0,29119,0,'Drostan'),
(28857,7,1,'Someone''s been killing all the game out from under me. Hard-won number 48, here.',12,0,100,5,0,0,29120,0,'Drostan'),
(28857,7,2,'Number 48. Startin'' to slow down a bit, now.',12,0,100,5,0,0,29121,0,'Drostan'),
(28857,7,3,'Gotta go elsewhere to find some more game. Was hoping to be beyond 48 by now.',12,0,100,5,0,0,29122,0,'Drostan'),
(28857,8,0,'Ha, 54! In the home stretch now!',12,0,100,5,0,0,29123,0,'Drostan'),
(28857,8,1,'Number 54! No way I''m gonna let you beat me!',12,0,100,5,0,0,29124,0,'Drostan'),
(28857,8,2,'54! Surely an insurmountable lead!',12,0,100,5,0,0,29125,0,'Drostan'),
(28857,8,3,'That was 54! Soon you''ll be congratulating me!',12,0,100,5,0,0,29126,0,'Drostan');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
