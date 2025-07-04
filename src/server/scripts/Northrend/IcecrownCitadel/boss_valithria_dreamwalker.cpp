/*
 * Copyright (C) 2011-2016 Project SkyFire <http://www.projectskyfire.org/>
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2016 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2006-2014 ScriptDev2 <https://github.com/scriptdev2/scriptdev2/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 3 of the License, or (at your
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

#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellAuraEffects.h"
#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "icecrown_citadel.h"

enum Texts
{
    // The Lich King
    SAY_LICH_KING_INTRO         = 0,

    // Valithria Dreamwalker
    SAY_VALITHRIA_ENTER_COMBAT  = 0,
    SAY_VALITHRIA_DREAM_PORTAL  = 1,
    SAY_VALITHRIA_75_PERCENT    = 2,
    SAY_VALITHRIA_25_PERCENT    = 3,
    SAY_VALITHRIA_SUCCESS       = 7,
};

enum Spells
{
    // Valithria Dreamwalker
    SPELL_COPY_DAMAGE                   = 71948,
    SPELL_DREAM_PORTAL_VISUAL_PRE       = 71304,
    SPELL_NIGHTMARE_PORTAL_VISUAL_PRE   = 71986,
    SPELL_NIGHTMARE_CLOUD               = 71970,
    SPELL_NIGHTMARE_CLOUD_VISUAL        = 71939,
    SPELL_PRE_SUMMON_DREAM_PORTAL       = 72224,
    SPELL_PRE_SUMMON_NIGHTMARE_PORTAL   = 72480,
    SPELL_SUMMON_DREAM_PORTAL           = 71305,
    SPELL_SUMMON_NIGHTMARE_PORTAL       = 71987,
    SPELL_DREAMWALKERS_RAGE             = 71189,
    SPELL_DREAM_SLIP                    = 71196,
    SPELL_ACHIEVEMENT_CHECK             = 72706,
    SPELL_CLEAR_ALL                     = 71721,
    SPELL_AWARD_REPUTATION_BOSS_KILL    = 73843,
    SPELL_CORRUPTION_VALITHRIA          = 70904,

    // The Lich King
    SPELL_TIMER_GLUTTONOUS_ABOMINATION  = 70915,
    SPELL_TIMER_SUPPRESSER              = 70912,
    SPELL_TIMER_BLISTERING_ZOMBIE       = 70914,
    SPELL_TIMER_RISEN_ARCHMAGE          = 70916,
    SPELL_TIMER_BLAZING_SKELETON        = 70913,
    SPELL_SUMMON_SUPPRESSER             = 70936,
    SPELL_RECENTLY_SPAWNED              = 72954,
    SPELL_SPAWN_CHEST                   = 71207,

    // Risen Archmage
    SPELL_CORRUPTION                    = 70602,
    SPELL_FROSTBOLT_VOLLEY              = 70759,
    SPELL_MANA_VOID                     = 71179,
    SPELL_COLUMN_OF_FROST               = 70704,
    SPELL_COLUMN_OF_FROST_DAMAGE        = 70702,

    // Mana Void
    SPELL_MANA_VOID_AURA                = 71085,

    // Blazing Skeleton
    SPELL_FIREBALL                      = 70754,
    SPELL_LEY_WASTE                     = 69325,

    // Suppresser
    SPELL_SUPPRESSION                   = 70588,

    // Blistering Zombie
    SPELL_ACID_BURST                    = 70744,
    SPELL_CORROSION                     = 70749,

    // Gluttonous Abomination
    SPELL_GUT_SPRAY                     = 70633,
    SPELL_ROT_WORM_SPAWNER              = 70675,
    SPELL_WORM_SUMMON                   = 70676,  // temp (problem with Trigger spell (70676) Rot Worm Spawner.)

    // Rot Worm
    SPELL_ROT_WORM_SPAWN                = 70668,
    SPELL_ROT_WORM_AURA                 = 72962,

    // Dream Cloud
    SPELL_EMERALD_VIGOR                 = 70873,

    // Nightmare Cloud
    SPELL_TWISTED_NIGHTMARE             = 71941,
};

#define SUMMON_PORTAL RAID_MODE<uint32>(SPELL_PRE_SUMMON_DREAM_PORTAL, SPELL_PRE_SUMMON_DREAM_PORTAL, \
                                        SPELL_PRE_SUMMON_NIGHTMARE_PORTAL, SPELL_PRE_SUMMON_NIGHTMARE_PORTAL)

#define EMERALD_VIGOR RAID_MODE<uint32>(SPELL_EMERALD_VIGOR, SPELL_EMERALD_VIGOR, \
                                        SPELL_TWISTED_NIGHTMARE, SPELL_TWISTED_NIGHTMARE)

enum Events
{
    // Valithria Dreamwalker
    EVENT_INTRO_TALK                        = 1,
    EVENT_DREAM_PORTAL                      = 3,
    EVENT_DREAM_SLIP                        = 4,

    // The Lich King
    EVENT_GLUTTONOUS_ABOMINATION_SUMMONER   = 5,
    EVENT_SUPPRESSER_SUMMONER               = 6,
    EVENT_BLISTERING_ZOMBIE_SUMMONER        = 7,
    EVENT_RISEN_ARCHMAGE_SUMMONER           = 8,
    EVENT_BLAZING_SKELETON_SUMMONER         = 9,

    // Risen Archmage
    EVENT_FROSTBOLT_VOLLEY                  = 10,
    EVENT_MANA_VOID                         = 11,
    EVENT_COLUMN_OF_FROST                   = 12,

    // Blazing Skeleton
    EVENT_FIREBALL                          = 13,
    EVENT_LEY_WASTE                         = 14,

    // Suppresser
    EVENT_SUPPRESSION                       = 15,

    // Gluttonous Abomination
    EVENT_GUT_SPRAY                         = 16,

    // Dream Cloud
    // Nightmare Cloud
    EVENT_CHECK_PLAYER                      = 17,
    EVENT_EXPLODE                           = 18,
};

enum Actions
{
    ACTION_ENTER_COMBAT = 1,
    MISSED_PORTALS      = 2,
    ACTION_DEATH        = 3,
    ACTION_START_ENCOUNTER = 4,
    ACTION_EVADE        = 5,
};

Position const ValithriaSpawnPos = {4210.813f, 2484.443f, 364.9558f, 0.01745329f};

class RisenArchmageCheck
{
    public:
        // Look for all permanently spawned Risen Archmages that are not yet in combat
        bool operator()(Creature* creature)
        {
            return creature->IsAlive() && creature->GetEntry() == NPC_RISEN_ARCHMAGE &&
                creature->GetDBTableGUIDLow() && !creature->IsInCombat();
        }
};

struct ManaVoidSelector
{
    public:
        explicit ManaVoidSelector(WorldObject const* source) : _source(source) { }

        bool operator()(Unit* unit) const
        {
            return unit->GetPowerType() == POWER_MANA && _source->GetDistance(unit) > 15.0f;
        }

    private:
        WorldObject const* _source;
};

class DelayedCastEvent : public BasicEvent
{
    public:
        DelayedCastEvent(Creature* trigger, uint32 spellId, uint64 originalCaster, uint32 despawnTime) : _trigger(trigger), _originalCaster(originalCaster), _spellId(spellId), _despawnTime(despawnTime) { }

        bool Execute(uint64 /*time*/, uint32 /*diff*/)
        {
            _trigger->CastSpell(_trigger, _spellId, false, nullptr, nullptr, _originalCaster);
            if (_despawnTime)
                _trigger->DespawnOrUnsummon(_despawnTime);

            return true;
        }

    private:
        Creature* _trigger;
        uint64 _originalCaster;
        uint32 _spellId;
        uint32 _despawnTime;
};

class AuraRemoveEvent : public BasicEvent
{
    public:
        AuraRemoveEvent(Creature* trigger, uint32 spellId) : _trigger(trigger), _spellId(spellId) { }

        bool Execute(uint64 /*time*/, uint32 /*diff*/)
        {
            _trigger->RemoveAurasDueToSpell(_spellId);
            return true;
        }

    private:
        Creature* _trigger;
        uint32 _spellId;
};

class ValithriaDespawner : public BasicEvent
{
    public:
        explicit ValithriaDespawner(Creature* creature) : _creature(creature) { }

        bool Execute(uint64 /*currTime*/, uint32 /*diff*/)
        {
            _creature->AI()->DoAction(ACTION_EVADE);
            Trinity::CreatureWorker<ValithriaDespawner> worker(_creature, *this);
            _creature->VisitNearbyGridObject(333.0f, worker);
            return true;
        }

        void operator()(Creature* creature) const
        {
            switch (creature->GetEntry())
            {
                case NPC_VALITHRIA_DREAMWALKER:
                    if (InstanceScript* instance = creature->GetInstanceScript())
                    {
                        instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, creature);

                        if (instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == NOT_STARTED)
                        {
                            if (!creature->IsAlive())
                                creature->Respawn();

                            creature->RemoveAllAuras();
                        }
                     }
                     break;
                case NPC_BLAZING_SKELETON:
                case NPC_SUPPRESSER:
                case NPC_BLISTERING_ZOMBIE:
                case NPC_GLUTTONOUS_ABOMINATION:
                case NPC_MANA_VOID:
                case NPC_COLUMN_OF_FROST:
                case NPC_ROT_WORM:
                    creature->DespawnOrUnsummon();
                    return;
                case NPC_RISEN_ARCHMAGE:
                    if (!creature->GetDBTableGUIDLow())
                    {
                        creature->DespawnOrUnsummon();
                        return;
                    }
                    creature->Relocate(creature->GetHomePosition());
                    creature->Respawn(true);
                    break;
                default:
                    return;
            }

            uint32 corpseDelay = creature->GetCorpseDelay();
            uint32 respawnDelay = creature->GetRespawnDelay();
            creature->SetCorpseDelay(1);
            creature->SetRespawnDelay(10);

            if (CreatureData const* data = creature->GetCreatureData())
                creature->SetPosition(data->posX, data->posY, data->posZ, data->orientation);

            creature->DespawnOrUnsummon();
            creature->SetCorpseDelay(corpseDelay);
            creature->SetRespawnDelay(respawnDelay);
        }

    private:
        Creature* _creature;
};

class boss_valithria_dreamwalker : public CreatureScript
{
    public:
        boss_valithria_dreamwalker() : CreatureScript("boss_valithria_dreamwalker") { }

        struct boss_valithria_dreamwalkerAI : public ScriptedAI
        {
            boss_valithria_dreamwalkerAI(Creature* creature) : ScriptedAI(creature),
                _instance(creature->GetInstanceScript()), _portalCount(RAID_MODE<uint32>(3, 8, 3, 8)) { }

            void InitializeAI() override
            {
                if (CreatureData const* data = sObjectMgr->GetCreatureData(me->GetDBTableGUIDLow()))
                    if (data->curhealth)
                        _spawnHealth = data->curhealth;

                if (!me->isDead())
                    Reset();
            }

            void Reset() override
            {
                _events.Reset();
                me->SetHealth(_spawnHealth);
                me->SetReactState(REACT_PASSIVE);
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                me->LoadCreaturesAddon(true);
                // Immune to percent heals
                me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_OBS_MOD_HEALTH, true);
                me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_HEAL_PCT, true);
                me->ApplySpellImmune(0, IMMUNITY_ID, 61607, true);
                // Glyph of Dispel Magic - not a percent heal by effect, its cast with custom basepoints
                me->ApplySpellImmune(0, IMMUNITY_ID, 56131, true);
                // Light's Beacon (trigger of Beacon of Light)
                me->ApplySpellImmune(0, IMMUNITY_ID, 53653, true);

                _instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);

                _missedPortals = 0;
                _under25PercentTalkDone = false;
                _over75PercentTalkDone = false;
                _justDied = false;
                _done = false;

                me->GetMap()->SetWorldState(WORLDSTATE_PORTAL_JOKEY, 1);
            }

            void AttackStart(Unit* /*victim*/) override { }

            void DoAction(int32 action) override
            {
                if (action == ACTION_ENTER_COMBAT)
                {
                    DoCast(me, SPELL_COPY_DAMAGE);
                    _instance->SendEncounterUnit(ENCOUNTER_FRAME_ENGAGE, me);
                    _events.ScheduleEvent(EVENT_INTRO_TALK, 15000);
                    _events.ScheduleEvent(EVENT_DREAM_PORTAL, urand(45000, 48000));
                }
                else if (action == ACTION_START_ENCOUNTER)
                {
                    me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

                    if (Creature* lichKing = ObjectAccessor::GetCreature(*me, _instance->GetData64(DATA_VALITHRIA_LICH_KING)))
                        lichKing->AI()->DoZoneInCombat();

                    if (Creature* trigger = ObjectAccessor::GetCreature(*me, _instance->GetData64(DATA_VALITHRIA_TRIGGER)))
                        trigger->AI()->DoZoneInCombat();

                    std::list<Creature*> archmages;
                    RisenArchmageCheck check;
                    Trinity::CreatureListSearcher<RisenArchmageCheck> searcher(me, archmages, check);
                    me->VisitNearbyGridObject(100.0f, searcher);
                    for (std::list<Creature*>::iterator itr = archmages.begin(); itr != archmages.end(); ++itr)
                        (*itr)->AI()->DoZoneInCombat((*itr), 150.0f);
                }
            }

            void HealReceived(Unit* healer, uint32& heal)
            {
                if (!me->HasLootRecipient())
                    me->SetLootRecipient(healer);

                me->LowerPlayerDamageReq(heal);

                int32 reductionPercent = me->GetTotalAuraModifier(SPELL_AURA_MOD_HEALING_PCT);

                if (reductionPercent < 0)
                {
                    // One 10% reduction is handled by core
                    int32 originalHeal = (int32)10/9 * heal;
                    int32 healValueReduced = AddPct(originalHeal, reductionPercent);

                    if (healValueReduced <= 0)
                        heal = 0;
                    else
                        heal = healValueReduced;
                }

                // Encounter complete
                if (me->HealthAbovePctHealed(100, heal) && !_done)
                {
                    _done = true;
                    Talk(SAY_VALITHRIA_SUCCESS);

                    if (Creature* trigger = ObjectAccessor::GetCreature(*me, _instance->GetData64(DATA_VALITHRIA_TRIGGER)))
                        me->Kill(trigger);

                    _instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);

                    me->RemoveAurasDueToSpell(SPELL_CORRUPTION_VALITHRIA);
                    DoCast(me, SPELL_ACHIEVEMENT_CHECK);
                    DoCastAOE(SPELL_DREAMWALKERS_RAGE);

                    // Prevent Rot Worms spawn
                    std::list<Creature*> abominations;
                    GetCreatureListWithEntryInGrid(abominations, me, NPC_GLUTTONOUS_ABOMINATION, 200.0f);
                    for (auto&& abomination : abominations)
                        abomination->AI()->DoAction(0);

                    _events.ScheduleEvent(EVENT_DREAM_SLIP, 3500);

                    if (Creature* lichKing = ObjectAccessor::GetCreature(*me, _instance->GetData64(DATA_VALITHRIA_LICH_KING)))
                        lichKing->AI()->EnterEvadeMode();
                }
                else if (!_over75PercentTalkDone && me->HealthAbovePctHealed(75, heal))
                {
                    _over75PercentTalkDone = true;
                    Talk(SAY_VALITHRIA_75_PERCENT);
                }
                else if (_instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == NOT_STARTED)
                    DoAction(ACTION_START_ENCOUNTER);
            }

            void DamageTaken(Unit* /*attacker*/, uint32& damage) override
            {
                if (me->HealthBelowPctDamaged(25, damage))
                {
                    if (!_under25PercentTalkDone)
                    {
                        _under25PercentTalkDone = true;
                        Talk(SAY_VALITHRIA_25_PERCENT);
                    }

                    if (damage >= me->GetHealth())
                    {
                        damage = 0;
                        if (!_justDied)
                        {
                            _justDied = true;

                            _instance->SendEncounterUnit(ENCOUNTER_FRAME_DISENGAGE, me);

                            if (Creature* trigger = ObjectAccessor::GetCreature(*me, _instance->GetData64(DATA_VALITHRIA_TRIGGER)))
                                trigger->AI()->DoAction(ACTION_DEATH);
                        }
                    }
                }
            }

            void SpellHit(Unit* /*caster*/, SpellInfo const* spell) override
            {
                if (spell->Id == SPELL_DREAM_SLIP)
                {
                    DoCast(me, SPELL_CLEAR_ALL);
                    DoCast(me, SPELL_AWARD_REPUTATION_BOSS_KILL);
                    // This display id was found in sniff instead of the one on aura
                    me->SetDisplayId(11686);
                    me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                    me->DespawnOrUnsummon(4000);

                    if (Creature* lichKing = ObjectAccessor::GetCreature(*me, _instance->GetData64(DATA_VALITHRIA_LICH_KING)))
                        lichKing->CastSpell(lichKing, SPELL_SPAWN_CHEST, false);
                }
            }

            void JustSummoned(Creature* summon) override
            {
                if (summon->GetEntry() == NPC_DREAM_PORTAL_PRE_EFFECT)
                {
                    summon->m_Events.AddEvent(new DelayedCastEvent(summon, SPELL_SUMMON_DREAM_PORTAL, me->GetGUID(), 6000), summon->m_Events.CalculateTime(15000));
                    summon->m_Events.AddEvent(new AuraRemoveEvent(summon, SPELL_DREAM_PORTAL_VISUAL_PRE), summon->m_Events.CalculateTime(15000));
                }
                else if (summon->GetEntry() == NPC_NIGHTMARE_PORTAL_PRE_EFFECT)
                {
                    summon->m_Events.AddEvent(new DelayedCastEvent(summon, SPELL_SUMMON_NIGHTMARE_PORTAL, me->GetGUID(), 6000), summon->m_Events.CalculateTime(15000));
                    summon->m_Events.AddEvent(new AuraRemoveEvent(summon, SPELL_NIGHTMARE_PORTAL_VISUAL_PRE), summon->m_Events.CalculateTime(15000));
                }
            }

            void SummonedCreatureDespawn(Creature* summon) override
            {
                if (summon->GetEntry() == NPC_DREAM_PORTAL || summon->GetEntry() == NPC_NIGHTMARE_PORTAL)
                {
                    if (summon->AI()->GetData(MISSED_PORTALS))
                    {
                        ++_missedPortals;
                        me->GetMap()->SetWorldState(WORLDSTATE_PORTAL_JOKEY, 0);
                    }
                }
            }

            void UpdateAI(uint32 diff) override
            {
                // Does not enter combat
                if (_instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) != IN_PROGRESS &&
                    _instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) != DONE)
                    return;

                _events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = _events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_INTRO_TALK:
                            Talk(SAY_VALITHRIA_ENTER_COMBAT);
                            break;
                        case EVENT_DREAM_PORTAL:
                            if (!IsHeroic())
                                Talk(SAY_VALITHRIA_DREAM_PORTAL);

                            for (uint32 i = 0; i < _portalCount; ++i)
                                DoCast(me, SUMMON_PORTAL);

                            _events.ScheduleEvent(EVENT_DREAM_PORTAL, urand(45000, 48000));
                            break;
                        case EVENT_DREAM_SLIP:
                            DoCast(me, SPELL_DREAM_SLIP);
                            break;
                        default:
                            break;
                    }
                }
            }

            uint32 GetData(uint32 type) const override
            {
                if (type == MISSED_PORTALS)
                    return _missedPortals;

                return 0;
            }

            private:
                EventMap _events;
                InstanceScript* _instance;
                uint32 _spawnHealth;
                uint32 const _portalCount;
                uint32 _missedPortals;
                bool _under25PercentTalkDone;
                bool _over75PercentTalkDone;
                bool _justDied;
                bool _done;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetIcecrownCitadelAI<boss_valithria_dreamwalkerAI>(creature);
        }
};

class npc_green_dragon_combat_trigger : public CreatureScript
{
    public:
        npc_green_dragon_combat_trigger() : CreatureScript("npc_green_dragon_combat_trigger") { }

        struct npc_green_dragon_combat_triggerAI : public BossAI
        {
            npc_green_dragon_combat_triggerAI(Creature* creature) : BossAI(creature, DATA_VALITHRIA_DREAMWALKER), _evadeCheck(false) { }

            void Reset() override
            {
                _Reset();
                _isEvading = false;
                me->SetReactState(REACT_PASSIVE);
                me->SetVisible(false);
            }

            void EnterCombat(Unit* who) override
            {
                if (!instance->CheckRequiredBosses(DATA_VALITHRIA_DREAMWALKER, who->ToPlayer()))
                {
                    EnterEvadeMode();
                    instance->DoCastSpellOnPlayers(LIGHT_S_HAMMER_TELEPORT);
                    return;
                }

                me->setActive(true);
                DoZoneInCombat();
                instance->SetBossState(DATA_VALITHRIA_DREAMWALKER, IN_PROGRESS);
                if (Creature* valithria = ObjectAccessor::GetCreature(*me, instance->GetData64(DATA_VALITHRIA_DREAMWALKER)))
                    valithria->AI()->DoAction(ACTION_ENTER_COMBAT);
            }

            void AttackStart(Unit* victim) override
            {
                if (victim->GetTypeId() == TYPEID_PLAYER)
                    BossAI::AttackStart(victim);
            }

            bool CanAIAttack(Unit const* target) const override
            {
                return target->GetTypeId() == TYPEID_PLAYER;
            }

            void EnterEvadeMode() override
            {
                // Stop spawning creatures etc
                if (Creature* lichKing = ObjectAccessor::GetCreature(*me, instance->GetData64(DATA_VALITHRIA_LICH_KING)))
                    lichKing->AI()->EnterEvadeMode();

                me->m_Events.AddEvent(new ValithriaDespawner(me), me->m_Events.CalculateTime(5000));
                _isEvading = true;
            }

            void DoAction(int32 action) override
            {
                if (action == ACTION_DEATH)
                    EnterEvadeMode();
                else if (action == ACTION_EVADE)
                    BossAI::EnterEvadeMode();
            }

            void UpdateAI(uint32 const /*diff*/)
            {
                if (!me->IsInCombat() || _isEvading)
                    return;

                std::list<HostileReference*> const& threatList = me->getThreatManager().getThreatList();
                if (threatList.empty())
                {
                    EnterEvadeMode();
                    return;
                }

                // Check evade every second tick
                _evadeCheck ^= true;
                if (!_evadeCheck)
                    return;

                // Check if there is any player on threatlist, if not - evade
                for (std::list<HostileReference*>::const_iterator itr = threatList.begin(); itr != threatList.end(); ++itr)
                    if (Unit* target = (*itr)->getTarget())
                        if (target->GetTypeId() == TYPEID_PLAYER)
                            if (target->GetInstanceId() == me->GetInstanceId())
                                // Found any player in same instance, return
                                return;

                EnterEvadeMode();
            }

            private:
                bool _evadeCheck;
                bool _isEvading;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetIcecrownCitadelAI<npc_green_dragon_combat_triggerAI>(creature);
        }
};

class npc_the_lich_king_controller : public CreatureScript
{
    public:
        npc_the_lich_king_controller() : CreatureScript("npc_the_lich_king_controller") { }

        struct npc_the_lich_king_controllerAI : public ScriptedAI
        {
            npc_the_lich_king_controllerAI(Creature* creature) : ScriptedAI(creature), _instance(creature->GetInstanceScript()) { }

            void Reset() override
            {
                _events.Reset();
                _events.ScheduleEvent(EVENT_GLUTTONOUS_ABOMINATION_SUMMONER, urand(5000, 10000));
                _events.ScheduleEvent(EVENT_SUPPRESSER_SUMMONER, urand(10000, 15000));
                _events.ScheduleEvent(EVENT_BLISTERING_ZOMBIE_SUMMONER, urand(10000, 15000));
                _events.ScheduleEvent(EVENT_RISEN_ARCHMAGE_SUMMONER, urand(20000, 25000));
                _events.ScheduleEvent(EVENT_BLAZING_SKELETON_SUMMONER, urand(25000, 30000));
                me->SetReactState(REACT_PASSIVE);
            }

            void JustReachedHome() override
            {
                me->setActive(false);
            }

            void EnterCombat(Unit* who) override
            {
                if (_instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == DONE)
                {
                    EnterEvadeMode();
                    return;
                }

                Talk(SAY_LICH_KING_INTRO);
                me->setActive(true);
            }

            void JustSummoned(Creature* summon) override
            {
                // must not be in dream phase
                summon->SetPhaseMask((summon->GetPhaseMask() & ~0x10), true);
                if (summon->GetEntry() != NPC_SUPPRESSER)
                {
                    if (_instance)
                        if (Creature* valithria = ObjectAccessor::GetCreature(*me, _instance->GetData64(DATA_VALITHRIA_DREAMWALKER)))
                            if (me->AI())
                                me->AI()->AttackStart(valithria);

                    DoZoneInCombat(summon, 150.0f);
                }
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                if (_instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == DONE)
                {
                    // Allow to finish casting Spawn Chest
                    if (!me->HasUnitState(UNIT_STATE_CASTING))
                        EnterEvadeMode();
                    return;
                }

                _events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = _events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_GLUTTONOUS_ABOMINATION_SUMMONER:
                            DoCast(me, SPELL_TIMER_GLUTTONOUS_ABOMINATION);
                            break;
                        case EVENT_SUPPRESSER_SUMMONER:
                            DoCast(me, SPELL_TIMER_SUPPRESSER);
                            break;
                        case EVENT_BLISTERING_ZOMBIE_SUMMONER:
                            DoCast(me, SPELL_TIMER_BLISTERING_ZOMBIE);
                            break;
                        case EVENT_RISEN_ARCHMAGE_SUMMONER:
                            DoCast(me, SPELL_TIMER_RISEN_ARCHMAGE);
                            break;
                        case EVENT_BLAZING_SKELETON_SUMMONER:
                            DoCast(me, SPELL_TIMER_BLAZING_SKELETON);
                            break;
                        default:
                            break;
                    }
                }
            }

            private:
                EventMap _events;
                InstanceScript* _instance;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetIcecrownCitadelAI<npc_the_lich_king_controllerAI>(creature);
        }
};

class npc_risen_archmage : public CreatureScript
{
    public:
        npc_risen_archmage() : CreatureScript("npc_risen_archmage") { }

        struct npc_risen_archmageAI : public ScriptedAI
        {
            npc_risen_archmageAI(Creature* creature) : ScriptedAI(creature), _instance(creature->GetInstanceScript()) { }

            void InitializeAI() override
            {
                if (me->GetDBTableGUIDLow() && !me->IsAlive())
                    if (_instance)
                        if (_instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) != DONE)
                            me->Respawn(true);

                Reset();
            }

            bool CanAIAttack(Unit const* target) const override
            {
                return !me->GetDBTableGUIDLow() || target->GetEntry() != NPC_VALITHRIA_DREAMWALKER;
            }

            void Reset() override
            {
                // DB spawned creatures do not attack on LoS
                if (me->GetDBTableGUIDLow())
                    me->SetReactState(REACT_DEFENSIVE);

                _events.Reset();
                _events.ScheduleEvent(EVENT_FROSTBOLT_VOLLEY, urand(5000, 15000));
                _events.ScheduleEvent(EVENT_MANA_VOID, urand(20000, 25000));
                _events.ScheduleEvent(EVENT_COLUMN_OF_FROST, urand(10000, 20000));
            }

            void EnterCombat(Unit* /*who*/) override
            {
                me->FinishSpell(CURRENT_CHANNELED_SPELL, false);
                if (_instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) == NOT_STARTED)
                     if (Creature* valithria = ObjectAccessor::GetCreature(*me, _instance->GetData64(DATA_VALITHRIA_DREAMWALKER)))
                        valithria->AI()->DoAction(ACTION_START_ENCOUNTER);
            }

            void JustSummoned(Creature* summon) override
            {
                if (summon->GetEntry() == NPC_COLUMN_OF_FROST)
                    summon->m_Events.AddEvent(new DelayedCastEvent(summon, SPELL_COLUMN_OF_FROST_DAMAGE, 0, 8000), summon->m_Events.CalculateTime(2000));
                else if (summon->GetEntry() == NPC_MANA_VOID)
                {
                    summon->CastSpell(summon, SPELL_MANA_VOID_AURA, true);
                    summon->DespawnOrUnsummon(30000);
                }
            }

            void UpdateAI(uint32 diff) override
            {
                if (!me->IsInCombat())
                    if (me->GetDBTableGUIDLow())
                        if (!me->GetCurrentSpell(CURRENT_CHANNELED_SPELL))
                            DoCast(me, SPELL_CORRUPTION);

                if (!UpdateVictim())
                    return;

                _events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = _events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_FROSTBOLT_VOLLEY:
                            DoCast(me, SPELL_FROSTBOLT_VOLLEY);
                            _events.ScheduleEvent(EVENT_FROSTBOLT_VOLLEY, urand(8000, 15000));
                            break;
                        case EVENT_MANA_VOID:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, ManaVoidSelector(me)))
                                DoCast(target, SPELL_MANA_VOID);

                            _events.ScheduleEvent(EVENT_MANA_VOID, urand(20000, 25000));
                            break;
                        case EVENT_COLUMN_OF_FROST:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, -10.0f, true))
                                DoCast(target, SPELL_COLUMN_OF_FROST);

                            _events.ScheduleEvent(EVENT_COLUMN_OF_FROST, urand(15000, 25000));
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                EventMap _events;
                InstanceScript* _instance;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetIcecrownCitadelAI<npc_risen_archmageAI>(creature);
        }
};

class npc_blazing_skeleton : public CreatureScript
{
    public:
        npc_blazing_skeleton() : CreatureScript("npc_blazing_skeleton") { }

        struct npc_blazing_skeletonAI : public ScriptedAI
        {
            npc_blazing_skeletonAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset() override
            {
                _events.Reset();
                _events.ScheduleEvent(EVENT_FIREBALL, urand(2000, 4000));
                _events.ScheduleEvent(EVENT_LEY_WASTE, urand(15000, 20000));
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                _events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = _events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_FIREBALL:
                            if (!me->IsWithinMeleeRange(me->GetVictim()))
                                DoCastVictim(SPELL_FIREBALL);

                            _events.ScheduleEvent(EVENT_FIREBALL, urand(2000, 4000));
                            break;
                        case EVENT_LEY_WASTE:
                            SetImmune(true);
                            me->m_Events.Schedule(12000, [this]() { SetImmune(false); });
                            DoCast(me, SPELL_LEY_WASTE);
                            _events.ScheduleEvent(EVENT_LEY_WASTE, urand(15000, 20000));
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

        private:
            EventMap _events;

            void SetImmune(bool immune)
            {
                me->ApplySpellImmune(0, IMMUNITY_STATE, SPELL_AURA_MOD_STUN, immune);
                me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, immune);
            }
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetIcecrownCitadelAI<npc_blazing_skeletonAI>(creature);
        }
};

class npc_suppresser : public CreatureScript
{
    public:
        npc_suppresser() : CreatureScript("npc_suppresser") { }

        struct npc_suppresserAI : public ScriptedAI
        {
            npc_suppresserAI(Creature* creature) : ScriptedAI(creature), _instance(creature->GetInstanceScript()) { }

            void Reset() override
            {
                _events.Reset();
                _events.ScheduleEvent(EVENT_SUPPRESSION, urand(10000, 15000));
                me->SetReactState(REACT_PASSIVE);
            }

            void IsSummonedBy(Unit* /*summoner*/)
            {
                me->m_Events.Schedule(2000, [this]()
                {
                    if (Creature* valithria = ObjectAccessor::GetCreature(*me, _instance->GetData64(DATA_VALITHRIA_DREAMWALKER)))
                        AttackStart(valithria);
                });
            }

            void AttackStart(Unit* victim) override
            {
                if (victim && victim->GetEntry() == NPC_VALITHRIA_DREAMWALKER)
                {
                    if (me->Attack(victim, true))
                        me->GetMotionMaster()->MoveChase(victim, 25.0f);
                }
                else
                    ScriptedAI::AttackStart(victim);
            }

            void MovementInform(uint32 type, uint32 pointId) override
            {
                if (type == CHASE_MOTION_TYPE && pointId == GUID_LOPART(_instance->GetData64(DATA_VALITHRIA_DREAMWALKER)))
                    _events.RescheduleEvent(EVENT_SUPPRESSION, 1);
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                _events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                // This code will never be reached while channeling
                while (uint32 eventId = _events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_SUPPRESSION:
                            DoCastAOE(SPELL_SUPPRESSION);
                            _events.ScheduleEvent(EVENT_SUPPRESSION, 5000);
                            break;
                        default:
                            break;
                    }
                }

                // This creature has REACT_PASSIVE so it does not always have victim here
                if (Unit* victim = me->GetVictim())
                    if (victim->GetEntry() != NPC_VALITHRIA_DREAMWALKER)
                        DoMeleeAttackIfReady();
            }

            private:
                EventMap _events;
                InstanceScript* const _instance;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetIcecrownCitadelAI<npc_suppresserAI>(creature);
        }
};

class npc_blistering_zombie : public CreatureScript
{
    public:
        npc_blistering_zombie() : CreatureScript("npc_blistering_zombie") { }

        struct npc_blistering_zombieAI : public ScriptedAI
        {
            npc_blistering_zombieAI(Creature* creature) : ScriptedAI(creature), _instance(creature->GetInstanceScript()) { }

            void Reset() override
            {
                DoCast(me, SPELL_CORROSION);
            }

            void DamageTaken(Unit* attacker, uint32& damage) override
            {
                if (damage >= me->GetHealth())
                {
                    damage = me->GetHealth() - 1;
                    if (!_exploding)
                    {
                        _exploding = true;
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_CHARM, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISORIENTED, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_DISTRACT, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FEAR, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_GRIP, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_ROOT, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_SILENCE, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_SLEEP, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_STUN, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_FREEZE, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_KNOCKOUT, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_POLYMORPH, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_BANISH, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_SHACKLE, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_TURN, true);
                        me->ApplySpellImmune(0, IMMUNITY_MECHANIC, MECHANIC_HORROR, true);
                        me->RemoveAllAurasOnDeath();
                        me->GetMotionMaster()->Clear();
                        me->GetMotionMaster()->MoveIdle();
                        me->CastSpell(me, SPELL_ACID_BURST, false, 0, 0, _instance->GetData64(DATA_VALITHRIA_LICH_KING));
                        //me->m_Events.Schedule(1000, [this]() { me->SetVisible(false); });
                        me->DespawnOrUnsummon(1750);
                    }
                }
            }

            SpellMissInfo SpellHitResult(Unit* attacker, SpellInfo const* spell, Spell const* /*spellInstance*/) override
            {
                return _exploding ? SPELL_MISS_EVADE : SPELL_MISS_NONE;
            }

            void UpdateAI(uint32 /*diff*/) override
            {
                if (_exploding || !UpdateVictim())
                    return;

                DoMeleeAttackIfReady();
            }

        private:
            InstanceScript* _instance;
            bool _exploding = false;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetIcecrownCitadelAI<npc_blistering_zombieAI>(creature);
        }
};

class npc_gluttonous_abomination : public CreatureScript
{
    public:
        npc_gluttonous_abomination() : CreatureScript("npc_gluttonous_abomination") { }

        struct npc_gluttonous_abominationAI : public ScriptedAI
        {
            npc_gluttonous_abominationAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset() override
            {
                _events.Reset();
                _events.ScheduleEvent(EVENT_GUT_SPRAY, urand(10000, 13000));
            }

            void JustDied(Unit* /*killer*/) override
            {
                if (_spawnForbidden)
                    return;

                me->m_Events.Schedule(4000, [this]()
                {
                    if (!_spawnForbidden)
                        DoCast(me, SPELL_ROT_WORM_SPAWNER, true);
                });
            }

            void DoAction(int32 action) override
            {
                _spawnForbidden = true;
                me->RemoveAurasDueToSpell(SPELL_ROT_WORM_SPAWNER);
            }

            SpellMissInfo SpellHitResult(Unit* attacker, SpellInfo const* spell, Spell const* /*spellInstance*/) override
            {
                // Can't do it in ::SpellHit as it is called after ::JustDied
                if (spell && spell->Id == SPELL_DREAMWALKERS_RAGE)
                {
                    _spawnForbidden = true;
                    me->RemoveAurasDueToSpell(SPELL_ROT_WORM_SPAWNER);
                }
                return SPELL_MISS_NONE;
            }

            void UpdateAI(uint32 diff) override
            {
                if (!UpdateVictim())
                    return;

                _events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = _events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_GUT_SPRAY:
                            DoCast(me, SPELL_GUT_SPRAY);
                            _events.ScheduleEvent(EVENT_GUT_SPRAY, urand(10000, 13000));
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                EventMap _events;
                bool _spawnForbidden = false;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetIcecrownCitadelAI<npc_gluttonous_abominationAI>(creature);
        }
};

class npc_rot_worm : public CreatureScript
{
    public:
        npc_rot_worm() : CreatureScript("npc_rot_worm") { }

        struct npc_rot_wormAI : public ScriptedAI
        {
            npc_rot_wormAI(Creature* creature) : ScriptedAI(creature), _instance(creature->GetInstanceScript()) { }

            void IsSummonedBy(Unit* /*summoner*/)
            {
                DoCast(me, SPELL_ROT_WORM_AURA, true);
                DoCast(me, SPELL_ROT_WORM_SPAWN, true);

                me->m_Events.Schedule(5000, [this]()
                {
                    if (!me->IsInCombat())
                        DoZoneInCombat(nullptr, 100.0f);
                });
            }

            void UpdateAI(uint32 /*diff*/) override
            {
                if (!UpdateVictim())
                    return;

                if (_instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) != IN_PROGRESS)
                    me->DespawnOrUnsummon();

                DoMeleeAttackIfReady();
            }

            private:
                InstanceScript* _instance;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetIcecrownCitadelAI<npc_rot_wormAI>(creature);
        }
};

class npc_dream_portal : public CreatureScript
{
    public:
        npc_dream_portal() : CreatureScript("npc_dream_portal") { }

        struct npc_dream_portalAI : public CreatureAI
        {
            npc_dream_portalAI(Creature* creature) : CreatureAI(creature), _used(false) { }

            void OnSpellClick(Unit* /*clicker*/, bool& result)
            {
                if (!result)
                    return;

                _used = true;
                me->DespawnOrUnsummon();
            }

            uint32 GetData(uint32 type) const override
            {
                return (type == MISSED_PORTALS && _used) ? 0 : 1;
            }

            void UpdateAI(uint32  /*diff*/) override
            {
                UpdateVictim();
            }

            private:
                bool _used;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetIcecrownCitadelAI<npc_dream_portalAI>(creature);
        }
};

class npc_dream_cloud : public CreatureScript
{
    public:
        npc_dream_cloud() : CreatureScript("npc_dream_cloud") { }

        struct npc_dream_cloudAI : public ScriptedAI
        {
            npc_dream_cloudAI(Creature* creature) : ScriptedAI(creature), _instance(creature->GetInstanceScript()) { }

            void Reset() override
            {
                _events.Reset();
                _events.ScheduleEvent(EVENT_CHECK_PLAYER, 1000);
                me->SetCorpseDelay(0);  // remove corpse immediately
                me->LoadCreaturesAddon(true);
            }

            void UpdateAI(uint32 diff) override
            {
                // trigger
                if (_instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) != IN_PROGRESS)
                    return;

                _events.Update(diff);

                while (uint32 eventId = _events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_CHECK_PLAYER:
                        {
                            Player* player = nullptr;
                            Trinity::AnyPlayerInObjectRangeCheck check(me, 5.0f);
                            Trinity::PlayerSearcher<Trinity::AnyPlayerInObjectRangeCheck> searcher(me, player, check);
                            me->VisitNearbyWorldObject(7.5f, searcher);
                            _events.ScheduleEvent(player ? EVENT_EXPLODE : EVENT_CHECK_PLAYER, 1000);
                            break;
                        }
                        case EVENT_EXPLODE:
                            me->GetMotionMaster()->MoveIdle();

                            // Must use originalCaster the same for all clouds to allow stacking
                            me->CastSpell(me, EMERALD_VIGOR, false, nullptr, nullptr, _instance->GetData64(DATA_VALITHRIA_LICH_KING));

                            me->DespawnOrUnsummon(100);
                            break;
                        default:
                            break;
                    }
                }
            }

            private:
                EventMap _events;
                InstanceScript* _instance;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return GetIcecrownCitadelAI<npc_dream_cloudAI>(creature);
        }
};

class spell_dreamwalker_mana_void : public SpellScriptLoader
{
    public:
        spell_dreamwalker_mana_void() : SpellScriptLoader("spell_dreamwalker_mana_void") { }

        class spell_dreamwalker_mana_void_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_dreamwalker_mana_void_AuraScript);

            void PeriodicTick(AuraEffect const* aurEff)
            {
                // First 3 ticks have amplitude 1 second, remaining tick every 500ms
                if (aurEff->GetTickNumber() <= 5)
                    if (!(aurEff->GetTickNumber() & 1))
                        PreventDefaultAction();
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_dreamwalker_mana_void_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_dreamwalker_mana_void_AuraScript();
        }
};

class spell_dreamwalker_decay_periodic_timer : public SpellScriptLoader
{
    public:
        spell_dreamwalker_decay_periodic_timer() : SpellScriptLoader("spell_dreamwalker_decay_periodic_timer") { }

        class spell_dreamwalker_decay_periodic_timer_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_dreamwalker_decay_periodic_timer_AuraScript);

            bool Load() override
            {
                switch (GetId())
                {
                    case SPELL_TIMER_GLUTTONOUS_ABOMINATION:
                    case SPELL_TIMER_SUPPRESSER:
                    case SPELL_TIMER_BLAZING_SKELETON:
                        _decayRate = 4250;
                        return true;
                    case SPELL_TIMER_BLISTERING_ZOMBIE:
                    case SPELL_TIMER_RISEN_ARCHMAGE:
                        _decayRate = 1000;
                        return true;
                    default:
                        return false;
                }

                return false;
            }

            void DecayPeriodicTimer(AuraEffect* aurEff)
            {
                int32 completeTimer = aurEff->GetAmplitude();
                int32 tickAmount = aurEff->GetTickNumber();
                int32 newTimer = completeTimer - (tickAmount * _decayRate);

                if (newTimer <= 5000)
                    newTimer = urand(5000, 15000);

                aurEff->SetPeriodicTimer(newTimer);
            }

            void Register() override
            {
                OnEffectUpdatePeriodic += AuraEffectUpdatePeriodicFn(spell_dreamwalker_decay_periodic_timer_AuraScript::DecayPeriodicTimer, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }

            int32 _decayRate;
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_dreamwalker_decay_periodic_timer_AuraScript();
        }
};

class spell_dreamwalker_summoner : public SpellScriptLoader
{
    public:
        spell_dreamwalker_summoner() : SpellScriptLoader("spell_dreamwalker_summoner") { }

        class spell_dreamwalker_summoner_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_dreamwalker_summoner_SpellScript);

            bool Load() override
            {
                if (!GetCaster()->GetInstanceScript())
                    return false;

                return true;
            }

            void FilterTargets(std::list<WorldObject*>& targets)
            {
                targets.remove_if (Trinity::UnitAuraCheck(true, SPELL_RECENTLY_SPAWNED));
                if (targets.empty())
                    return;

                WorldObject* target = Trinity::Containers::SelectRandomContainerElement(targets);
                targets.clear();
                targets.push_back(target);
            }

            void HandleForceCast(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                if (!GetHitUnit())
                    return;

                GetHitUnit()->CastSpell(GetCaster(), GetSpellInfo()->Effects[effIndex].TriggerSpell, true, nullptr, nullptr, GetCaster()->GetInstanceScript()->GetData64(DATA_VALITHRIA_LICH_KING));
            }

            void Register() override
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_dreamwalker_summoner_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
                OnEffectHitTarget += SpellEffectFn(spell_dreamwalker_summoner_SpellScript::HandleForceCast, EFFECT_0, SPELL_EFFECT_FORCE_CAST);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_dreamwalker_summoner_SpellScript();
        }
};

class spell_dreamwalker_summon_suppresser : public SpellScriptLoader
{
    public:
        spell_dreamwalker_summon_suppresser() : SpellScriptLoader("spell_dreamwalker_summon_suppresser") { }

        class spell_dreamwalker_summon_suppresser_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_dreamwalker_summon_suppresser_AuraScript);

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                PreventDefaultAction();
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                std::list<Creature*> summoners;
                GetCreatureListWithEntryInGrid(summoners, caster, NPC_WORLD_TRIGGER, 100.0f);
                Trinity::Containers::RandomResizeList(summoners, 2);
                if (summoners.empty())
                    return;

                uint8 spawnCountFront = urand(0, 4);
                uint8 spawnCountBack = 4 - spawnCountFront;

                for (uint32 i = 0; i < spawnCountFront; ++i)
                    caster->CastSpell(summoners.front(), SPELL_SUMMON_SUPPRESSER, true);

                for (uint32 i = 0; i < spawnCountBack; ++i)
                    caster->CastSpell(summoners.back(), SPELL_SUMMON_SUPPRESSER, true);
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_dreamwalker_summon_suppresser_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_dreamwalker_summon_suppresser_AuraScript();
        }
};

class spell_dreamwalker_summon_suppresser_effect : public SpellScriptLoader
{
    public:
        spell_dreamwalker_summon_suppresser_effect() : SpellScriptLoader("spell_dreamwalker_summon_suppresser_effect") { }

        class spell_dreamwalker_summon_suppresser_effect_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_dreamwalker_summon_suppresser_effect_SpellScript);

            bool Load() override
            {
                if (!GetCaster()->GetInstanceScript())
                    return false;
                return true;
            }

            void HandleForceCast(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                if (!GetHitUnit())
                    return;

                GetHitUnit()->CastSpell(GetCaster(), GetSpellInfo()->Effects[effIndex].TriggerSpell, true, nullptr, nullptr, GetCaster()->GetInstanceScript()->GetData64(DATA_VALITHRIA_LICH_KING));
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_dreamwalker_summon_suppresser_effect_SpellScript::HandleForceCast, EFFECT_0, SPELL_EFFECT_FORCE_CAST);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_dreamwalker_summon_suppresser_effect_SpellScript();
        }
};

class spell_dreamwalker_summon_dream_portal : public SpellScriptLoader
{
    public:
        spell_dreamwalker_summon_dream_portal() : SpellScriptLoader("spell_dreamwalker_summon_dream_portal") { }

        class spell_dreamwalker_summon_dream_portal_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_dreamwalker_summon_dream_portal_SpellScript);

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                if (!GetHitUnit())
                    return;

                GetHitUnit()->CastSpell(GetHitUnit(), 71301, true);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_dreamwalker_summon_dream_portal_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_dreamwalker_summon_dream_portal_SpellScript();
        }
};

class spell_dreamwalker_summon_nightmare_portal : public SpellScriptLoader
{
    public:
        spell_dreamwalker_summon_nightmare_portal() : SpellScriptLoader("spell_dreamwalker_summon_nightmare_portal") { }

        class spell_dreamwalker_summon_nightmare_portal_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_dreamwalker_summon_nightmare_portal_SpellScript);

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                if (!GetHitUnit())
                    return;

                GetHitUnit()->CastSpell(GetHitUnit(), 71977, true);
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_dreamwalker_summon_nightmare_portal_SpellScript::HandleScript, EFFECT_0, SPELL_EFFECT_SCRIPT_EFFECT);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_dreamwalker_summon_nightmare_portal_SpellScript();
        }
};


// Custom OnDestinationTargetSelect for 71301 and 71977
class spell_dreamwalker_summon_portal_effect : public SpellScriptLoader
{
    public:
        spell_dreamwalker_summon_portal_effect() : SpellScriptLoader("spell_dreamwalker_summon_portal_effect") { }

        class spell_dreamwalker_summon_portal_effect_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_dreamwalker_summon_portal_effect_SpellScript);

            void TargetSelect(SpellDestination& dest)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                Position srcPos;
                caster->GetPosition(&srcPos);

                float new_dist = 0.0f, minDistance = 20.0f, maxDistance = 30.0f;
                if (minDistance > 0.0f && maxDistance > minDistance)
                    new_dist = minDistance + (float)rand_norm() * static_cast<float>(maxDistance - minDistance);
                else
                    new_dist = (float)rand_norm() * static_cast<float>(maxDistance);

                caster->GetRandomPoint(srcPos, new_dist, dest._position);
            }

            void Register() override
            {
                OnDestinationTargetSelect += SpellDestinationTargetSelectFn(spell_dreamwalker_summon_portal_effect_SpellScript::TargetSelect, EFFECT_0, TARGET_DEST_DEST_RANDOM);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_dreamwalker_summon_portal_effect_SpellScript();
        }
};

class spell_dreamwalker_nightmare_cloud : public SpellScriptLoader
{
    public:
        spell_dreamwalker_nightmare_cloud() : SpellScriptLoader("spell_dreamwalker_nightmare_cloud") { }

        class spell_dreamwalker_nightmare_cloud_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_dreamwalker_nightmare_cloud_AuraScript);

            bool Load() override
            {
                _instance = GetOwner()->GetInstanceScript();
                return _instance != nullptr;
            }

            void PeriodicTick(AuraEffect const* /*aurEff*/)
            {
                if (_instance->GetBossState(DATA_VALITHRIA_DREAMWALKER) != IN_PROGRESS)
                    PreventDefaultAction();
            }

            void Register() override
            {
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_dreamwalker_nightmare_cloud_AuraScript::PeriodicTick, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
            }

            InstanceScript* _instance;
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_dreamwalker_nightmare_cloud_AuraScript();
        }
};

class spell_dreamwalker_twisted_nightmares : public SpellScriptLoader
{
    public:
        spell_dreamwalker_twisted_nightmares() : SpellScriptLoader("spell_dreamwalker_twisted_nightmares") { }

        class spell_dreamwalker_twisted_nightmares_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_dreamwalker_twisted_nightmares_SpellScript);

            void HandleScript(SpellEffIndex effIndex)
            {
                PreventHitDefaultEffect(effIndex);
                // impossible with TARGET_UNIT_CASTER
                //if (!GetHitUnit())
                //    return;

                if (InstanceScript* instance = GetHitUnit()->GetInstanceScript())
                    GetHitUnit()->CastSpell((Unit*)nullptr, GetSpellInfo()->Effects[effIndex].TriggerSpell, true, nullptr, nullptr, instance->GetData64(DATA_VALITHRIA_LICH_KING));
            }

            void Register() override
            {
                OnEffectHitTarget += SpellEffectFn(spell_dreamwalker_twisted_nightmares_SpellScript::HandleScript, EFFECT_2, SPELL_EFFECT_FORCE_CAST);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_dreamwalker_twisted_nightmares_SpellScript();
        }
};

void AddSC_boss_valithria_dreamwalker()
{
    new boss_valithria_dreamwalker();
    new npc_green_dragon_combat_trigger();
    new npc_the_lich_king_controller();
    new npc_risen_archmage();
    new npc_blazing_skeleton();
    new npc_suppresser();
    new npc_blistering_zombie();
    new npc_gluttonous_abomination();
    new npc_rot_worm();
    new npc_dream_portal();
    new npc_dream_cloud();
    new spell_dreamwalker_mana_void();
    new spell_dreamwalker_decay_periodic_timer();
    new spell_dreamwalker_summoner();
    new spell_dreamwalker_summon_suppresser();
    new spell_dreamwalker_summon_suppresser_effect();
    new spell_dreamwalker_summon_dream_portal();
    new spell_dreamwalker_summon_nightmare_portal();
    new spell_dreamwalker_summon_portal_effect();
    new spell_dreamwalker_nightmare_cloud();
    new spell_dreamwalker_twisted_nightmares();
}
