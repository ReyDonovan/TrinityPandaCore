#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"
#include "SpellMgr.h"
#include "Player.h"
#include "Creature.h"
#include "CreatureTextMgr.h"
#include "Vehicle.h"

struct npc_sister_goldskimmer : public ScriptedAI
{
    npc_sister_goldskimmer(Creature* creature) : ScriptedAI(creature) { }

    void MoveInLineOfSight(Unit* who) override
    {
        if (who->GetTypeId() == TYPEID_PLAYER && me->IsFriendlyTo(who) && me->isInFrontInMap(who, 7) && !who->HasAura(74973))
        {
            Talk(0, who);
            me->CastSpell(who, 74973, true);
        }
    }
};

enum Friends
{
    NPC_IZZY        = 34890,
    NPC_ACE         = 34892,
    NPC_GOBER       = 34954,

    SPELL_SUMMON_IZZY               = 66600, // q.14071 sum.34959 orig.34890
    SPELL_SUMMON_ACE                = 66597, // q.14071 sum.34957 orig.34892
    SPELL_SUMMON_GOBER              = 66645, // q.14071 sum.34958 orig.34954

    //by 46598 they sit to veh
};

struct npc_roling_friends : public ScriptedAI
{
    npc_roling_friends(Creature* creature) : ScriptedAI(creature) { }

    void MoveInLineOfSight(Unit* who)
    {
        if (!me->IsWithinDistInMap(who, 10.0f))
            return;

        if (who->GetTypeId() == TYPEID_UNIT && who->ToCreature()->IsVehicle())
        {
            InvisibilityType type = INVISIBILITY_GENERAL;
            uint32 spellID = 0;
            switch(me->GetEntry())
            {
                case NPC_IZZY:  type = INVISIBILITY_UNK9; spellID = SPELL_SUMMON_IZZY;    break;
                case NPC_ACE:   type = INVISIBILITY_UNK7; spellID = SPELL_SUMMON_ACE;     break;
                case NPC_GOBER: type = INVISIBILITY_UNK8; spellID = SPELL_SUMMON_GOBER;   break;
                default:
                    return;
            }

            if (Unit* passanger = who->GetVehicleKit()->GetPassenger(0))
            {
                if (Player* player = passanger->ToPlayer())
                {
                    //remove visibility for plr.
                    player->m_invisibilityDetect.DelFlag(type);
                    player->m_invisibilityDetect.AddValue(type, -1);
                    //summon
                    player->CastSpell(player, spellID, true);
                }
            }
            //remove visibility for vehicle
            who->m_invisibilityDetect.DelFlag(type);
            who->m_invisibilityDetect.AddValue(type, -1);
        }
    }
};

enum FriendsGuard
{
    NPC_IZZY_GUARD        = 34959,  //Seat 3
    NPC_ACE_GUARD         = 34957,  //Seat 1
    NPC_GOBER_GUARD       = 34958,  //Seat 2

    EVENT_EMOTE           = 1,

    TEXT_KILL             = 0,
    TEXT_AGGRO            = 1,

};

int EmoteData [6] = { 273, 274, 11, 5, 25, 1 };
int GoberGuardEmote [6] = { 463, 20, 15, 1, 11, 440 };

struct npc_roling_friends_guard : public ScriptedAI
{
    npc_roling_friends_guard(Creature* creature) : ScriptedAI(creature) {}

    EventMap events;

    void Reset() { events.Reset(); }

    void OnCharmed(bool apply)
    {
        //AI should work all time. in original mode id't disabled
    }

    void EnterCombat(Unit* /*victim*/)
    {
        sCreatureTextMgr->SendChat(me, TEXT_AGGRO);
    }

    void DamageTaken(Unit* /*attacker*/, uint32& damage)
    {
        // God mode.
        damage = 0;
    }

    void EnterEvadeMode()
    {
        //should send when our group kill someone. so do it on evade.
        if(me->IsInCombat() && me->IsAlive())
            sCreatureTextMgr->SendChat(me, TEXT_KILL);
        ScriptedAI::EnterEvadeMode();
    }

    void IsSummonedBy(Unit* summoner)
    {
        me->SetReactState(REACT_AGGRESSIVE);

        Player* player = summoner->ToPlayer();
        if(!player || !player->m_movementInfo.transport.guid)
            return;

        player->KilledMonsterCredit(me->GetEntry(), 0);
        if (Unit* veh = player->GetVehicleBase())
        {
            uint8 seatID = 0;
            switch(me->GetEntry())
            {
                case NPC_IZZY_GUARD:  seatID = 3; break;
                case NPC_ACE_GUARD:   seatID = 1; break;
                case NPC_GOBER_GUARD: seatID = 2; break;
                default:
                    return;
            }

            if(veh->GetVehicleKit()->HasEmptySeat(seatID))
            {
                events.ScheduleEvent(EVENT_EMOTE, urand(1000, 5000));
                me->EnterVehicle(veh, seatID);
            }
            else
                me->ToCreature()->DespawnOrUnsummon();
        }
    }

    uint32 GenerateEmote()
    {
        switch(me->GetEntry())
        {
            case NPC_IZZY_GUARD:
            case NPC_ACE_GUARD:
                return EmoteData[urand(0,5)];
            case NPC_GOBER_GUARD:
                return GoberGuardEmote[urand(0,5)];
            default:
                return 0;
        }
        return 0;
    }

    void UpdateAI(uint32 diff)
    {
         events.Update(diff);

        while (uint32 eventId = events.ExecuteEvent())
        {
            switch (eventId)
            {
                // emotes only when in vehicle.
                case EVENT_EMOTE:
                    me->HandleEmoteCommand(GenerateEmote());
                    events.ScheduleEvent(EVENT_EMOTE, urand(4000, 8000));
                    break;
            }
        }

        if (!UpdateVictim())
            return;
        DoMeleeAttackIfReady();
    }

};

void AddSC_kezan()
{
    new creature_script<npc_sister_goldskimmer>("npc_sister_goldskimmer");
    new creature_script<npc_roling_friends>("npc_roling_friends");
    new creature_script<npc_roling_friends_guard>("npc_roling_friends_guard");
}
