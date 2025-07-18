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

#ifndef DC_BATTLEGROUNDTP_H
#define DC_BATTLEGROUNDTP_H

#include "Battleground.h"

enum BG_TP_TimerOrScore
{
    BG_TP_MAX_TEAM_SCORE        = 3,
    BG_TP_FLAG_RESPAWN_TIME     = 23000,
    BG_TP_FLAG_DROP_TIME        = 10000,
    BG_TP_SPELL_FORCE_TIME      = 600000,
    BG_TP_SPELL_BRUTAL_TIME     = 900000
};

enum BG_TP_Sound
{
    BG_TP_SOUND_FLAG_CAPTURED_ALLIANCE      = 8173,
    BG_TP_SOUND_FLAG_CAPTURED_HORDE         = 8213,
    BG_TP_SOUND_FLAG_PLACED                 = 8232,
    BG_TP_SOUND_FLAG_RETURNED               = 8192,
    BG_TP_SOUND_HORDE_FLAG_PICKED_UP        = 8212,
    BG_TP_SOUND_ALLIANCE_FLAG_PICKED_UP     = 8174,
    BG_TP_SOUND_FLAGS_RESPAWNED             = 8232
};

enum BG_TP_SpellId
{
    BG_TP_SPELL_HORDE_FLAG                  = 23333,
    BG_TP_SPELL_HORDE_FLAG_DROPPED          = 23334,
    BG_TP_SPELL_HORDE_FLAG_PICKED           = 61266,    // fake spell, does not exist but used as timer start event
    BG_TP_SPELL_ALLIANCE_FLAG               = 23335,
    BG_TP_SPELL_ALLIANCE_FLAG_DROPPED       = 23336,
    BG_TP_SPELL_ALLIANCE_FLAG_PICKED        = 61265,    // fake spell, does not exist but used as timer start event
    BG_TP_SPELL_FOCUSED_ASSAULT             = 46392,
    BG_TP_SPELL_BRUTAL_ASSAULT              = 46393
};

enum BG_TP_WorldStates
{
    BG_TP_FLAG_UNK_ALLIANCE       = 1545,
    BG_TP_FLAG_UNK_HORDE          = 1546,
//    FLAG_UNK                      = 1547,
    BG_TP_FLAG_CAPTURES_ALLIANCE  = 1581,
    BG_TP_FLAG_CAPTURES_HORDE     = 1582,
    BG_TP_FLAG_CAPTURES_MAX       = 1601,
    BG_TP_FLAG_STATE_HORDE        = 2338,
    BG_TP_FLAG_STATE_ALLIANCE     = 2339,
    BG_TP_STATE_TIMER             = 4248,
    BG_TP_STATE_TIMER_ACTIVE      = 4247
};

enum BG_TP_ObjectTypes
{
    BG_TP_OBJECT_DOOR_A_1        = 0,
    BG_TP_OBJECT_DOOR_A_2        = 1,
    BG_TP_OBJECT_DOOR_A_3        = 2,
    BG_TP_OBJECT_DOOR_A_4        = 3,
    BG_TP_OBJECT_DOOR_H_1        = 4,
    BG_TP_OBJECT_DOOR_H_2        = 5,
    BG_TP_OBJECT_DOOR_H_3        = 6,
    BG_TP_OBJECT_DOOR_H_4        = 7,
    BG_TP_OBJECT_A_FLAG          = 8,
    BG_TP_OBJECT_H_FLAG          = 9,
    BG_TP_OBJECT_SPEEDBUFF_1     = 10,
    BG_TP_OBJECT_SPEEDBUFF_2     = 11,
    BG_TP_OBJECT_REGENBUFF_1     = 12,
    BG_TP_OBJECT_REGENBUFF_2     = 13,
    BG_TP_OBJECT_BERSERKBUFF_1   = 14,
    BG_TP_OBJECT_BERSERKBUFF_2   = 15,
    BG_TP_OBJECT_MAX             = 16
};

enum BG_TP_ObjectEntry
{
    BG_OBJECT_DOOR_A_1_TP_ENTRY        = 206655,
    BG_OBJECT_DOOR_A_2_TP_ENTRY        = 206654,
    BG_OBJECT_DOOR_A_3_TP_ENTRY        = 206653,
    BG_OBJECT_DOOR_A_4_TP_ENTRY        = 206653,
    BG_OBJECT_DOOR_H_1_TP_ENTRY        = 208205,
    BG_OBJECT_DOOR_H_2_TP_ENTRY        = 208206,
    BG_OBJECT_DOOR_H_3_TP_ENTRY        = 208206,
    BG_OBJECT_DOOR_H_4_TP_ENTRY        = 208207,
    BG_OBJECT_A_FLAG_TP_ENTRY          = 179830,
    BG_OBJECT_H_FLAG_TP_ENTRY          = 179831,
    BG_OBJECT_A_FLAG_GROUND_TP_ENTRY   = 179785,
    BG_OBJECT_H_FLAG_GROUND_TP_ENTRY   = 179786,
    BG_OBJECT_SPEEDBUFF_ENTRY          = 179871,
    BG_OBJECT_REGENBUFF_ENTRY          = 179904,
    BG_OBJECT_BERSERKERBUFF_ENTRY      = 179905,
};

enum BG_TP_FlagState
{
    BG_TP_FLAG_STATE_ON_BASE        = 0,
    BG_TP_FLAG_STATE_WAIT_RESPAWN   = 1,
    BG_TP_FLAG_STATE_ON_PLAYER      = 2,
    BG_TP_FLAG_STATE_ON_GROUND      = 3
};

enum BG_TP_Graveyards
{
    TP_GRAVEYARD_FLAGROOM_ALLIANCE  = 1726,
    TP_GRAVEYARD_FLAGROOM_HORDE     = 1727,
    TP_GRAVEYARD_START_ALLIANCE     = 1729,
    TP_GRAVEYARD_START_HORDE        = 1728,
    TP_GRAVEYARD_MIDDLE_ALLIANCE    = 1749,
    TP_GRAVEYARD_MIDDLE_HORDE       = 1750
};

enum BG_TP_CreatureTypes
{
    TP_SPIRIT_ALLIANCE    = 0,
    TP_SPIRIT_HORDE       = 1,


    BG_CREATURES_MAX_TP   = 2
};

enum BG_TP_CarrierDebuffs
{
    TP_SPELL_FOCUSED_ASSAULT   = 46392,
    TP_SPELL_BRUTAL_ASSAULT    = 46393
};

enum BG_TP_Objectives
{
    TP_OBJECTIVE_CAPTURE_FLAG   = 290,
    TP_OBJECTIVE_RETURN_FLAG    = 291,
};

struct BattlegroundTPScore : public BattlegroundScore
{
    BattlegroundTPScore() : FlagCaptures(0), FlagReturns(0) { }
    ~BattlegroundTPScore() { }
    uint32 FlagCaptures;
    uint32 FlagReturns;
};

class BattlegroundTP : public Battleground
{
    public:
        /* Construction */
        BattlegroundTP();
        ~BattlegroundTP();

        /* inherited from BattlegroundClass */
        void AddPlayer(Player* player);
        void StartingEventCloseDoors();
        void StartingEventOpenDoors();

        /* BG Flags */
        uint64 GetFlagPickerGUID(int32 team) const
        {
            if (team == TEAM_ALLIANCE || team == TEAM_HORDE)
                return m_FlagKeepers[team];
            return 0;
        }
        void SetAllianceFlagPicker(uint64 guid)     { m_FlagKeepers[TEAM_ALLIANCE] = guid; }
        void SetHordeFlagPicker(uint64 guid)        { m_FlagKeepers[TEAM_HORDE] = guid; }
        bool IsAllianceFlagPickedup() const         { return m_FlagKeepers[TEAM_ALLIANCE] != 0; }
        bool IsHordeFlagPickedup() const            { return m_FlagKeepers[TEAM_HORDE] != 0; }
        void RespawnFlag(uint32 Team, bool captured);
        void RespawnFlagAfterDrop(uint32 Team);
        uint8 GetFlagState(uint32 team)             { return _flagState[GetTeamIndexByTeamId(team)]; }

        /* Battleground Events */
        void EventPlayerDroppedFlag(Player* Source);
        void EventPlayerClickedOnFlag(Player* Source, GameObject* target_obj);
        void EventPlayerCapturedFlag(Player* Source);

        void RemovePlayer(Player* player, uint64 guid, uint32 team);
        void HandleAreaTrigger(Player* Source, uint32 trigger, bool entered);
        void HandleKillPlayer(Player* player, Player* killer);
        bool SetupBattleground();
        void Reset();
        void EndBattleground(uint32 winner);
        WorldSafeLocsEntry const* GetClosestGraveYard(Player* player);

        void UpdateFlagState(Team team, uint32 value);
        void SetLastFlagCapture(uint32 team)                { _lastFlagCaptureTeam = team; }
        void UpdateTeamScore(Team team);
        void UpdatePlayerScore(Player* Source, uint32 type, uint32 value, bool doAddHonor = true);
        void SetDroppedFlagGUID(uint64 guid, int32 team = -1)
        {
            if (team == TEAM_ALLIANCE || team == TEAM_HORDE)
                m_DroppedFlagGUID[team] = guid;
        }

        uint64 GetDroppedFlagGUID(uint32 TeamID)             { return m_DroppedFlagGUID[GetTeamIndexByTeamId(TeamID)];}
        void FillInitialWorldStates(WorldStateBuilder& builder);

        /* Scorekeeping */
        void AddPoint(uint32 TeamID, uint32 Points = 1)     { m_TeamScores[GetTeamIndexByTeamId(TeamID)] += Points; }
        void SetTeamPoint(uint32 TeamID, uint32 Points = 0) { m_TeamScores[GetTeamIndexByTeamId(TeamID)] = Points; }
        void RemovePoint(uint32 TeamID, uint32 Points = 1)  { m_TeamScores[GetTeamIndexByTeamId(TeamID)] -= Points; }

        uint32 GetPrematureWinner();

        uint32 GetRBGLoserReward(uint32 team) const override;

    private:
        uint64 m_FlagKeepers[2];                            // 0 - alliance, 1 - horde
        uint64 m_DroppedFlagGUID[2];
        uint8 _flagState[2];                               // for checking flag state
        int32 _flagsTimer[2];
        int32 _flagsDropTimer[2];
        uint32 _lastFlagCaptureTeam;                       // Winner is based on this if score is equal

        uint32 m_ReputationCapture;
        uint32 m_HonorWinKills;
        uint32 m_HonorEndKills;
        int32 _flagSpellForceTimer;
        bool _bothFlagsKept;
        uint8 _flagDebuffState;                            // 0 - no debuffs, 1 - focused assault, 2 - brutal assault
        uint8 _minutesElapsed;
        bool m_dobuleJeopardy[2];

        void PostUpdateImpl(uint32 diff);
};

#endif
