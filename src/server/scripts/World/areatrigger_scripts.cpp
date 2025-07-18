/*
 * This file is part of the DestinyCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* ScriptData
SDName: Areatrigger_Scripts
SD%Complete: 100
SDComment: Scripts for areatriggers
SDCategory: Areatrigger
EndScriptData */

/* ContentData
at_coilfang_waterfall           4591
at_legion_teleporter            4560 Teleporter TO Invasion Point: Cataclysm
at_stormwright_shelf            q12741
at_last_rites                   q12019
at_sholazar_waygate             q12548
at_nats_landing                 q11209
at_bring_your_orphan_to         q910 q910 q1800 q1479 q1687 q1558 q10951 q10952
at_brewfest
at_area_52_entrance
EndContentData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "Player.h"

/*######
## at_coilfang_waterfall
######*/

enum CoilfangGOs
{
    GO_COILFANG_WATERFALL   = 184212
};

class AreaTrigger_at_coilfang_waterfall : public AreaTriggerScript
{
    public:

        AreaTrigger_at_coilfang_waterfall()
            : AreaTriggerScript("at_coilfang_waterfall")
        {
        }

        bool OnTrigger(Player* player, AreaTriggerEntry const* /*areaTrigger*/, bool /*entered*/) override
        {
            if (GameObject* go = GetClosestGameObjectWithEntry(player, GO_COILFANG_WATERFALL, 35.0f))
                if (go->getLootState() == GO_READY)
                    go->UseDoorOrButton();

            return false;
        }
};

/*#####
## at_legion_teleporter
#####*/

enum LegionTeleporter
{
    SPELL_TELE_A_TO         = 37387,
    QUEST_GAINING_ACCESS_A  = 10589,

    SPELL_TELE_H_TO         = 37389,
    QUEST_GAINING_ACCESS_H  = 10604
};

class AreaTrigger_at_legion_teleporter : public AreaTriggerScript
{
    public:

        AreaTrigger_at_legion_teleporter()
            : AreaTriggerScript("at_legion_teleporter")
        {
        }

        bool OnTrigger(Player* player, AreaTriggerEntry const* /*areaTrigger*/, bool /*entered*/) override
        {
            if (player->IsAlive() && !player->IsInCombat())
            {
                if (player->GetTeam() == ALLIANCE && player->GetQuestRewardStatus(QUEST_GAINING_ACCESS_A))
                {
                    player->CastSpell(player, SPELL_TELE_A_TO, false);
                    return true;
                }

                if (player->GetTeam() == HORDE && player->GetQuestRewardStatus(QUEST_GAINING_ACCESS_H))
                {
                    player->CastSpell(player, SPELL_TELE_H_TO, false);
                    return true;
                }

                return false;
            }
            return false;
        }
};

/*######
## at_stormwright_shelf
######*/

enum StormwrightShelf
{
    QUEST_STRENGTH_OF_THE_TEMPEST               = 12741,

    SPELL_CREATE_TRUE_POWER_OF_THE_TEMPEST      = 53067
};

class AreaTrigger_at_stormwright_shelf : public AreaTriggerScript
{
    public:

        AreaTrigger_at_stormwright_shelf()
            : AreaTriggerScript("at_stormwright_shelf")
        {
        }

        bool OnTrigger(Player* player, AreaTriggerEntry const* /*areaTrigger*/, bool /*entered*/) override
        {
            if (!player->isDead() && player->GetQuestStatus(QUEST_STRENGTH_OF_THE_TEMPEST) == QUEST_STATUS_INCOMPLETE)
                player->CastSpell(player, SPELL_CREATE_TRUE_POWER_OF_THE_TEMPEST, false);

            return true;
        }
};

/*######
## at_scent_larkorwi
######*/

enum ScentLarkorwi
{
    QUEST_SCENT_OF_LARKORWI                     = 4291,
    NPC_LARKORWI_MATE                           = 9683
};

class AreaTrigger_at_scent_larkorwi : public AreaTriggerScript
{
    public:

        AreaTrigger_at_scent_larkorwi()
            : AreaTriggerScript("at_scent_larkorwi")
        {
        }

        bool OnTrigger(Player* player, AreaTriggerEntry const* /*areaTrigger*/, bool /*entered*/) override
        {
            if (!player->isDead() && player->GetQuestStatus(QUEST_SCENT_OF_LARKORWI) == QUEST_STATUS_INCOMPLETE)
            {
                if (!player->FindNearestCreature(NPC_LARKORWI_MATE, 15))
                    player->SummonCreature(NPC_LARKORWI_MATE, player->GetPositionX()+5, player->GetPositionY(), player->GetPositionZ(), 3.3f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 100000);
            }

            return false;
        }
};

/*#####
## at_last_rites
#####*/

enum AtLastRites
{
    QUEST_LAST_RITES                          = 12019,
    QUEST_BREAKING_THROUGH                    = 11898,
};

class AreaTrigger_at_last_rites : public AreaTriggerScript
{
    public:

        AreaTrigger_at_last_rites()
            : AreaTriggerScript("at_last_rites")
        {
        }

        bool OnTrigger(Player* player, AreaTriggerEntry const* areaTrigger, bool /*entered*/) override
        {
            if (!(player->GetQuestStatus(QUEST_LAST_RITES) == QUEST_STATUS_INCOMPLETE ||
                player->GetQuestStatus(QUEST_LAST_RITES) == QUEST_STATUS_COMPLETE ||
                player->GetQuestStatus(QUEST_BREAKING_THROUGH) == QUEST_STATUS_INCOMPLETE ||
                player->GetQuestStatus(QUEST_BREAKING_THROUGH) == QUEST_STATUS_COMPLETE))
                return false;

            WorldLocation pPosition;

            switch (areaTrigger->ID)
            {
                case 5332:
                case 5338:
                    pPosition = WorldLocation(571, 3733.68f, 3563.25f, 290.812f, 3.665192f);
                    break;
                case 5334:
                    pPosition = WorldLocation(571, 3802.38f, 3585.95f, 49.5765f, 0.0f);
                    break;
                case 5340:
                    if (player->GetQuestStatus(QUEST_LAST_RITES) == QUEST_STATUS_INCOMPLETE ||
                        player->GetQuestStatus(QUEST_LAST_RITES) == QUEST_STATUS_COMPLETE)
                        pPosition = WorldLocation(571, 3687.91f, 3577.28f, 473.342f);
                    else
                        pPosition = WorldLocation(571, 3739.38f, 3567.09f, 341.58f);
                    break;
                default:
                    return false;
            }

            player->TeleportTo(pPosition);

            return false;
        }
};

/*######
## at_sholazar_waygate
######*/

enum Waygate
{
    SPELL_SHOLAZAR_TO_UNGORO_TELEPORT           = 52056,
    SPELL_UNGORO_TO_SHOLAZAR_TELEPORT           = 52057,

    AT_SHOLAZAR                                 = 5046,
    AT_UNGORO                                   = 5047,

    QUEST_THE_MAKERS_OVERLOOK                   = 12613,
    QUEST_THE_MAKERS_PERCH                      = 12559,
    QUEST_MEETING_A_GREAT_ONE                   = 13956,
};

class AreaTrigger_at_sholazar_waygate : public AreaTriggerScript
{
    public:

        AreaTrigger_at_sholazar_waygate() : AreaTriggerScript("at_sholazar_waygate") { }

        bool OnTrigger(Player* player, AreaTriggerEntry const* areaTrigger, bool /*entered*/) override
        {
            if (!player->isDead() && (player->GetQuestStatus(QUEST_MEETING_A_GREAT_ONE) != QUEST_STATUS_NONE ||
                (player->GetQuestStatus(QUEST_THE_MAKERS_OVERLOOK) == QUEST_STATUS_REWARDED && player->GetQuestStatus(QUEST_THE_MAKERS_PERCH) == QUEST_STATUS_REWARDED)))
            {
                switch (areaTrigger->ID)
                {
                    case AT_SHOLAZAR:
                        player->CastSpell(player, SPELL_SHOLAZAR_TO_UNGORO_TELEPORT, false);
                        break;

                    case AT_UNGORO:
                        player->CastSpell(player, SPELL_UNGORO_TO_SHOLAZAR_TELEPORT, false);
                        break;
                }
            }

            return false;
        }
};

/*######
## at_nats_landing
######*/

enum NatsLanding
{
    QUEST_NATS_BARGAIN = 11209,
    SPELL_FISH_PASTE   = 42644,
    NPC_LURKING_SHARK  = 23928
};

class AreaTrigger_at_nats_landing : public AreaTriggerScript
{
    public:
        AreaTrigger_at_nats_landing() : AreaTriggerScript("at_nats_landing") { }

        bool OnTrigger(Player* player, AreaTriggerEntry const* /*areaTrigger*/, bool /*entered*/) override
        {
            if (!player->IsAlive() || !player->HasAura(SPELL_FISH_PASTE))
                return false;

            if (player->GetQuestStatus(QUEST_NATS_BARGAIN) == QUEST_STATUS_INCOMPLETE)
            {
                if (!player->FindNearestCreature(NPC_LURKING_SHARK, 20.0f))
                {
                    if (Creature* shark = player->SummonCreature(NPC_LURKING_SHARK, -4246.243f, -3922.356f, -7.488f, 5.0f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 100000))
                        shark->AI()->AttackStart(player);

                    return false;
                }
            }
            return true;
        }
};

/*######
## at_brewfest
######*/

enum Brewfest
{
    NPC_TAPPER_SWINDLEKEG       = 24711,
    NPC_IPFELKOFER_IRONKEG      = 24710,

    AT_BREWFEST_DUROTAR         = 4829,
    AT_BREWFEST_DUN_MOROGH      = 4820,

    SAY_WELCOME                 = 4,

    AREATRIGGER_TALK_COOLDOWN   = 5, // in seconds
};

class AreaTrigger_at_brewfest : public AreaTriggerScript
{
    public:
        AreaTrigger_at_brewfest() : AreaTriggerScript("at_brewfest")
        {
            // Initialize for cooldown
            _triggerTimes[AT_BREWFEST_DUROTAR] = _triggerTimes[AT_BREWFEST_DUN_MOROGH] = 0;
        }

        bool OnTrigger(Player* player, AreaTriggerEntry const* areaTrigger, bool /*entered*/) override
        {
            uint32 triggerId = areaTrigger->ID;
            // Second trigger happened too early after first, skip for now
            if (sWorld->GetGameTime() - _triggerTimes[triggerId] < AREATRIGGER_TALK_COOLDOWN)
                return false;

            switch (triggerId)
            {
                case AT_BREWFEST_DUROTAR:
                    if (Creature* tapper = player->FindNearestCreature(NPC_TAPPER_SWINDLEKEG, 20.0f))
                        tapper->AI()->Talk(SAY_WELCOME, player);
                    break;
                case AT_BREWFEST_DUN_MOROGH:
                    if (Creature* ipfelkofer = player->FindNearestCreature(NPC_IPFELKOFER_IRONKEG, 20.0f))
                        ipfelkofer->AI()->Talk(SAY_WELCOME, player);
                    break;
                default:
                    break;
            }

            _triggerTimes[triggerId] = sWorld->GetGameTime();
            return false;
        }

    private:
        std::map<uint32, time_t> _triggerTimes;
};

/*######
## at_area_52_entrance
######*/

enum Area52Entrance
{
    SPELL_A52_NEURALYZER  = 34400,
    NPC_SPOTLIGHT         = 19913,
    SUMMON_COOLDOWN       = 5,

    AT_AREA_52_SOUTH      = 4472,
    AT_AREA_52_NORTH      = 4466,
    AT_AREA_52_WEST       = 4471,
    AT_AREA_52_EAST       = 4422,
};

class AreaTrigger_at_area_52_entrance : public AreaTriggerScript
{
    public:
        AreaTrigger_at_area_52_entrance() : AreaTriggerScript("at_area_52_entrance")
        {
            _triggerTimes[AT_AREA_52_SOUTH] = _triggerTimes[AT_AREA_52_NORTH] = _triggerTimes[AT_AREA_52_WEST] = _triggerTimes[AT_AREA_52_EAST] = 0;
        }

        bool OnTrigger(Player* player, AreaTriggerEntry const* areaTrigger, bool /*entered*/) override
        {
            float x = 0.0f, y = 0.0f, z = 0.0f;

            if (!player->IsAlive())
                return false;

            uint32 triggerId = areaTrigger->ID;
            if (sWorld->GetGameTime() - _triggerTimes[areaTrigger->ID] < SUMMON_COOLDOWN)
                return false;

            switch (triggerId)
            {
                case AT_AREA_52_EAST:
                    x = 3044.176f;
                    y = 3610.692f;
                    z = 143.61f;
                    break;
                case AT_AREA_52_NORTH:
                    x = 3114.87f;
                    y = 3687.619f;
                    z = 143.62f;
                    break;
                case AT_AREA_52_WEST:
                    x = 3017.79f;
                    y = 3746.806f;
                    z = 144.27f;
                    break;
                case AT_AREA_52_SOUTH:
                    x = 2950.63f;
                    y = 3719.905f;
                    z = 143.33f;
                    break;
            }

            player->SummonCreature(NPC_SPOTLIGHT, x, y, z, 0.0f, TEMPSUMMON_TIMED_DESPAWN, 5000);
            player->AddAura(SPELL_A52_NEURALYZER, player);
            _triggerTimes[areaTrigger->ID] = sWorld->GetGameTime();
            return false;
        }

    private:
        std::map<uint32, time_t> _triggerTimes;
};

/*######
 ## at_frostgrips_hollow
 ######*/

enum FrostgripsHollow
{
    QUEST_THE_LONESOME_WATCHER      = 12877,

    NPC_STORMFORGED_MONITOR         = 29862,
    NPC_STORMFORGED_ERADICTOR       = 29861,

    TYPE_WAYPOINT                   = 0,
    DATA_START                      = 0
};

Position const stormforgedMonitorPosition = {6963.95f, 45.65f, 818.71f, 4.948f};
Position const stormforgedEradictorPosition = {6983.18f, 7.15f, 806.33f, 2.228f};

class AreaTrigger_at_frostgrips_hollow : public AreaTriggerScript
{
public:
    AreaTrigger_at_frostgrips_hollow() : AreaTriggerScript("at_frostgrips_hollow")
    {
        stormforgedMonitorGUID = 0;
        stormforgedEradictorGUID = 0;
    }

    bool OnTrigger(Player* player, AreaTriggerEntry const* /*areaTrigger*/, bool /*entered*/) override
    {
        if (player->GetQuestStatus(QUEST_THE_LONESOME_WATCHER) != QUEST_STATUS_INCOMPLETE)
            return false;

        Creature* stormforgedMonitor = Creature::GetCreature(*player, stormforgedMonitorGUID);
        if (stormforgedMonitor)
            return false;

        Creature* stormforgedEradictor = Creature::GetCreature(*player, stormforgedEradictorGUID);
        if (stormforgedEradictor)
            return false;

        stormforgedMonitor = player->SummonCreature(NPC_STORMFORGED_MONITOR, stormforgedMonitorPosition, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
        if (stormforgedMonitor)
        {
            stormforgedMonitorGUID = stormforgedMonitor->GetGUID();
            stormforgedMonitor->SetWalk(false);
            /// The npc would search an alternative way to get to the last waypoint without this unit state.
            stormforgedMonitor->AddUnitState(UNIT_STATE_IGNORE_PATHFINDING);
            stormforgedMonitor->GetMotionMaster()->MovePath(NPC_STORMFORGED_MONITOR * 100, false);
        }

        stormforgedEradictor = player->SummonCreature(NPC_STORMFORGED_ERADICTOR, stormforgedEradictorPosition, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 60000);
        if (stormforgedEradictor)
        {
            stormforgedEradictorGUID = stormforgedEradictor->GetGUID();
            stormforgedEradictor->GetMotionMaster()->MovePath(NPC_STORMFORGED_ERADICTOR * 100, false);
        }

        return true;
    }

private:
    uint64 stormforgedMonitorGUID;
    uint64 stormforgedEradictorGUID;
};

enum QuesLiveBait
{
    SPELL_CRAYFISH_CATCH         = 99424,
    SPELL_GRIMNURS_BAIT          = 99435,
    SPELL_CANCEL_CRAYFISH_CATCH  = 99466,

    NPC_COOK_GHILM               = 1355,
    NPC_LIVE_BAIT_CREDIT         = 53551,

    SAY_QUEST_COMPLETE           = 0
};

class AreaTrigger_at_cook_ghilm : public AreaTriggerScript
{
    public:
        AreaTrigger_at_cook_ghilm() : AreaTriggerScript("at_cook_ghilm") { }

        bool OnTrigger(Player* player, const AreaTriggerEntry* /*areaTrigger*/, bool /*entered*/) override
        {
            if (player->HasAura(SPELL_CRAYFISH_CATCH))
            {
                if (Creature* cookGhilm = player->FindNearestCreature(NPC_COOK_GHILM, 10.0f))
                {
                    cookGhilm->AI()->Talk(SAY_QUEST_COMPLETE, player);
                    player->CastSpell(player, SPELL_CANCEL_CRAYFISH_CATCH, true);
                    player->KilledMonsterCredit(NPC_LIVE_BAIT_CREDIT);
                    return true;
                }
            }
            return false;
        }
};

class AreaTrigger_at_helms_bed_lake : public AreaTriggerScript
{
    public:
        AreaTrigger_at_helms_bed_lake() : AreaTriggerScript("at_helms_bed_lake") { }

        bool OnTrigger(Player* player, const AreaTriggerEntry* /*areaTrigger*/, bool /*entered*/) override
        {
            if (player->HasAura(SPELL_GRIMNURS_BAIT))
            {
                player->CastSpell(player, SPELL_CANCEL_CRAYFISH_CATCH, true);
                player->CastSpell(player, SPELL_CRAYFISH_CATCH, true);
                return true;
            }
            return false;
        }
};

void AddSC_areatrigger_scripts()
{
    new AreaTrigger_at_coilfang_waterfall();
    new AreaTrigger_at_legion_teleporter();
    new AreaTrigger_at_stormwright_shelf();
    new AreaTrigger_at_scent_larkorwi();
    new AreaTrigger_at_last_rites();
    new AreaTrigger_at_sholazar_waygate();
    new AreaTrigger_at_nats_landing();
    new AreaTrigger_at_brewfest();
    new AreaTrigger_at_area_52_entrance();
    new AreaTrigger_at_frostgrips_hollow();
    new AreaTrigger_at_cook_ghilm();
    new AreaTrigger_at_helms_bed_lake();
}
