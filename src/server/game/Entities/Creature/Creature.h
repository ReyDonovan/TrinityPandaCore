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

#ifndef _CREATURE_H
#define _CREATURE_H

#include "Common.h"
#include "Unit.h"
#include "UpdateMask.h"
#include "ItemPrototype.h"
#include "LootMgr.h"
#include "DatabaseEnv.h"
#include "Cell.h"

#include <list>

class CreatureAI;
class CreatureGroup;
class Group;
class Quest;
class Player;
class SpellInfo;
class WorldSession;

enum CreatureFlagsExtra
{
    CREATURE_FLAG_EXTRA_INSTANCE_BIND   = 0x00000001,       // creature kill bind instance with killer and killer's group
    CREATURE_FLAG_EXTRA_CIVILIAN        = 0x00000002,       // not aggro (ignore faction/reputation hostility)
    CREATURE_FLAG_EXTRA_NO_PARRY        = 0x00000004,       // creature can't parry
    CREATURE_FLAG_EXTRA_NO_PARRY_HASTEN = 0x00000008,       // creature can't counter-attack at parry
    CREATURE_FLAG_EXTRA_NO_BLOCK        = 0x00000010,       // creature can't block
    CREATURE_FLAG_EXTRA_NO_CRUSH        = 0x00000020,       // creature can't do crush attacks
    CREATURE_FLAG_EXTRA_NO_XP_AT_KILL   = 0x00000040,       // creature kill not provide XP
    CREATURE_FLAG_EXTRA_TRIGGER         = 0x00000080,       // trigger creature
    CREATURE_FLAG_EXTRA_NO_TAUNT        = 0x00000100,       // creature is immune to taunt auras and effect attack me
    CREATURE_FLAG_EXTRA_WORLDEVENT      = 0x00004000,       // custom flag for world event creatures (left room for merging)
    CREATURE_FLAG_EXTRA_GUARD           = 0x00008000,       // Creature is guard
    CREATURE_FLAG_EXTRA_NO_CRIT         = 0x00020000,       // creature can't do critical strikes
    CREATURE_FLAG_EXTRA_NO_SKILLGAIN    = 0x00040000,       // creature won't increase weapon skills
    CREATURE_FLAG_EXTRA_TAUNT_DIMINISH  = 0x00080000,       // Taunt is a subject to diminishing returns on this creautre
    CREATURE_FLAG_EXTRA_ALL_DIMINISH    = 0x00100000,       // Creature is subject to all diminishing returns as player are
    CREATURE_FLAG_EXTRA_NO_KNOCK_BACK   = 0x00200000,       // use to immune from Thunderstorm
    CREATURE_FLAG_EXTRA_project_NPC    = 0x00800000,       // Creature will always be visible to the player. Only usable on creatures with entries 190000 or higher (on purpose)
    CREATURE_FLAG_EXTRA_DUNGEON_BOSS    = 0x10000000        // creature is a dungeon boss (SET DYNAMICALLY, DO NOT ADD IN DB)
};

#define CREATURE_FLAG_EXTRA_DB_ALLOWED (CREATURE_FLAG_EXTRA_INSTANCE_BIND | CREATURE_FLAG_EXTRA_CIVILIAN | \
    CREATURE_FLAG_EXTRA_NO_PARRY | CREATURE_FLAG_EXTRA_NO_PARRY_HASTEN | CREATURE_FLAG_EXTRA_NO_BLOCK | \
    CREATURE_FLAG_EXTRA_NO_CRUSH | CREATURE_FLAG_EXTRA_NO_XP_AT_KILL | CREATURE_FLAG_EXTRA_TRIGGER | \
    CREATURE_FLAG_EXTRA_NO_TAUNT | CREATURE_FLAG_EXTRA_WORLDEVENT | CREATURE_FLAG_EXTRA_NO_CRIT | \
    CREATURE_FLAG_EXTRA_NO_SKILLGAIN | CREATURE_FLAG_EXTRA_TAUNT_DIMINISH | CREATURE_FLAG_EXTRA_ALL_DIMINISH | \
    CREATURE_FLAG_EXTRA_GUARD | CREATURE_FLAG_EXTRA_NO_KNOCK_BACK | CREATURE_FLAG_EXTRA_project_NPC)

#define MAX_KILL_CREDIT 2
#define CREATURE_REGEN_INTERVAL 2 * IN_MILLISECONDS

#define MAX_CREATURE_QUEST_ITEMS 6

#define MAX_EQUIPMENT_ITEMS 3

// from `creature_template` table
struct CreatureTemplate
{
    uint32  Entry;
    uint32  DifficultyEntry[MAX_TEMPLATE_DIFFICULTY - 1];
    uint32  KillCredit[MAX_KILL_CREDIT];
    uint32  Modelid1;
    uint32  Modelid2;
    uint32  Modelid3;
    uint32  Modelid4;
    std::string  Name;
    std::string FemaleName;
    std::string  SubName;
    std::string  IconName;
    uint32  GossipMenuId;
    int16   minlevel;
    int16   maxlevel;
    int32  expansion;
    uint32  expansionUnknown;                               // either 0 or 3, sent to the client / wdb
    uint32  faction_A;
    uint32  faction_H;
    uint32  npcflag;
    uint32  npcflag2;
    float   speed_walk;
    float   speed_run;
    float   scale;
    uint32  rank;
    float   mindmg;
    float   maxdmg;
    uint32  dmgschool;
    uint32  attackpower;
    float   dmg_multiplier;
    uint32  baseattacktime;
    uint32  rangeattacktime;
    uint32  unit_class;                                     // enum Classes. Note only 4 classes are known for creatures.
    uint32  unit_flags;                                     // enum UnitFlags mask values
    uint32  unit_flags2;                                    // enum UnitFlags2 mask values
    uint32  dynamicflags;
    uint32  family;                                         // enum CreatureFamily values (optional)
    uint32  trainer_type;
    uint32  trainer_class;
    uint32  trainer_race;
    float   minrangedmg;
    float   maxrangedmg;
    uint32  rangedattackpower;
    uint32  type;                                           // enum CreatureType values
    uint32  type_flags;                                     // enum CreatureTypeFlags mask values
    uint32  type_flags2;                                    // unknown enum, only set for 4 creatures (with value 1)
    uint32  lootid;
    uint32  pickpocketLootId;
    uint32  SkinLootId;
    int32   resistance[MAX_SPELL_SCHOOL];
    uint32  spells[CREATURE_MAX_SPELLS];
    uint32  PetSpellDataId;
    uint32  VehicleId;
    uint32  mingold;
    uint32  maxgold;
    std::string AIName;
    uint32  MovementType;
    uint32  InhabitType;
    float   HoverHeight;
    float   ModHealth;
    float   ModMana;
    float   ModManaExtra;                                   // Added in 4.x, this value is usually 2 for a small group of creatures with double mana
    float   ModArmor;
    bool    RacialLeader;
    uint32  questItems[MAX_CREATURE_QUEST_ITEMS];
    uint32  movementId;
    bool    RegenHealth;
    uint32  VignetteID;
    uint32  TrackingQuestID;
    uint32  MechanicImmuneMask;
    uint32  flags_extra;
    uint32  ScriptID;
    uint32  GetRandomValidModelId() const;
    uint32  GetFirstValidModelId() const;

    // helpers
    SkillType GetRequiredLootSkill() const
    {
        if (type_flags & CREATURE_TYPEFLAGS_HERBLOOT)
            return SKILL_HERBALISM;
        else if (type_flags & CREATURE_TYPEFLAGS_MININGLOOT)
            return SKILL_MINING;
        else if (type_flags & CREATURE_TYPEFLAGS_ENGINEERLOOT)
            return SKILL_ENGINEERING;
        else
            return SKILL_SKINNING;                          // normal case
    }

    bool IsExotic() const
    {
        return (type_flags & CREATURE_TYPEFLAGS_EXOTIC) != 0;
    }

    bool IsTameable(bool canTameExotic) const
    {
        if (type != CREATURE_TYPE_BEAST || family == 0 || (type_flags & CREATURE_TYPEFLAGS_TAMEABLE) == 0)
            return false;

        // if can tame exotic then can tame any tameable
        return canTameExotic || !IsExotic();
    }
};

// Benchmarked: Faster than std::map (insert/find)
typedef std::unordered_map<uint32, CreatureTemplate> CreatureTemplateContainer;

// GCC have alternative #pragma pack(N) syntax and old gcc version not support pack(push, N), also any gcc version not support it at some platform
#if defined(__GNUC__)
#pragma pack(1)
#else
#pragma pack(push, 1)
#endif

// Defines base stats for creatures (used to calculate HP/mana/armor).
struct CreatureBaseStats
{
    uint32 BaseHealth[MAX_CREATURE_BASE_HP];
    uint32 BaseMana;
    uint32 BaseArmor;
    uint32 AttackPower;
    uint32 RangedAttackPower;
    float BaseDamage[MAX_CREATURE_BASE_DAMAGE];

    // Helpers

    uint32 GenerateHealth(CreatureTemplate const* info) const
    {
        return uint32(ceil(BaseHealth[info->expansion] * info->ModHealth));
    }

    uint32 GenerateMana(CreatureTemplate const* info) const
    {
        // Mana can be 0.
        if (!BaseMana)
            return 0;

        return uint32(ceil(BaseMana * info->ModMana * info->ModManaExtra));
    }

    uint32 GenerateArmor(CreatureTemplate const* info) const
    {
        return uint32(ceil(BaseArmor * info->ModArmor));
    }

    float GenerateBaseDamage(CreatureTemplate const* info) const
    {
        return BaseDamage[info->expansion];
    }

    static CreatureBaseStats const* GetBaseStats(uint8 level, uint8 unitClass);
};

typedef std::unordered_map<uint16, CreatureBaseStats> CreatureBaseStatsContainer;

struct CreatureLocale
{
    StringVector Name;
    StringVector FemaleName;
    StringVector SubName;
};

struct GossipMenuItemsLocale
{
    StringVector OptionText;
    StringVector BoxText;
};

struct PointOfInterestLocale
{
    StringVector IconName;
};

struct EquipmentInfo
{
    uint32  ItemEntry[MAX_EQUIPMENT_ITEMS];
};

// Benchmarked: Faster than std::map (insert/find)
typedef std::unordered_map<uint8, EquipmentInfo> EquipmentInfoContainerInternal;
typedef std::unordered_map<uint32, EquipmentInfoContainerInternal> EquipmentInfoContainer;

// from `creature` table
struct CreatureData
{
    CreatureData() : dbData(true) { }
    uint32 id;                                              // entry in creature_template
    uint16 mapid;
    uint32 phaseMask;
    uint32 displayid;
    int8 equipmentId;
    float posX;
    float posY;
    float posZ;
    float orientation;
    uint32 spawntimesecs;
    uint32 spawntimesecs_max;
    float spawndist;
    uint32 currentwaypoint;
    uint32 curhealth;
    uint32 curmana;
    uint8 movementType;
    uint16 spawnMask;
    uint32 npcflag;
    uint32 npcflag2;
    uint32 unit_flags;                                      // enum UnitFlags mask values
    uint32 unit_flags2;                                     // enum UnitFlags2 mask values
    uint32 dynamicflags;
    bool dbData;
    uint32 gameEventId = 0;
};

struct CreatureModelInfo
{
    float bounding_radius;
    float combat_reach;
    uint8 gender;
    uint32 modelid_other_gender;
};

// Benchmarked: Faster than std::map (insert/find)
typedef std::unordered_map<uint16, CreatureModelInfo> CreatureModelContainer;

enum InhabitTypeValues
{
    INHABIT_NONE   = 0,
    INHABIT_GROUND = 1,
    INHABIT_WATER  = 2,
    INHABIT_AIR    = 4,
    INHABIT_ROOT   = 8,
    INHABIT_ANYWHERE = INHABIT_GROUND | INHABIT_WATER | INHABIT_AIR | INHABIT_ROOT
};

inline InhabitTypeValues operator|(InhabitTypeValues a, InhabitTypeValues b) { return static_cast<InhabitTypeValues>(static_cast<std::underlying_type<InhabitTypeValues>::type>(a) | static_cast<std::underlying_type<InhabitTypeValues>::type>(b)); }

// Enums used by StringTextData::Type (CreatureEventAI)
enum ChatType
{
    CHAT_TYPE_SAY               = 0,
    CHAT_TYPE_YELL              = 1,
    CHAT_TYPE_TEXT_EMOTE        = 2,
    CHAT_TYPE_BOSS_EMOTE        = 3,
    CHAT_TYPE_WHISPER           = 4,
    CHAT_TYPE_BOSS_WHISPER      = 5,
    CHAT_TYPE_ZONE_YELL         = 6,
    CHAT_TYPE_END               = 255
};

// GCC have alternative #pragma pack() syntax and old gcc version not support pack(pop), also any gcc version not support it at some platform
#if defined(__GNUC__)
#pragma pack()
#else
#pragma pack(pop)
#endif

// `creature_addon` table
struct CreatureAddon
{
    uint32 path_id;
    uint32 mount;
    uint32 bytes1;
    uint32 bytes2;
    uint32 emote;
    std::vector<uint32> auras;
};

typedef std::unordered_map<uint32, CreatureAddon> CreatureAddonContainer;

// Vendors
struct VendorItem
{
    VendorItem(uint32 _item, int32 _maxcount, uint32 _incrtime, uint32 _ExtendedCost, uint8 _Type)
        : item(_item), maxcount(_maxcount), incrtime(_incrtime), ExtendedCost(_ExtendedCost), Type(_Type) { }

    uint32 item;
    uint32 maxcount;                                        // 0 for infinity item amount
    uint32 incrtime;                                        // time for restore items amount if maxcount != 0
    uint32 ExtendedCost;
    uint8  Type;

    //helpers
    bool IsGoldRequired(ItemTemplate const* pProto) const { return pProto->Flags2 & ITEM_FLAGS_EXTRA_EXT_COST_REQUIRES_GOLD || !ExtendedCost; }
};
typedef std::vector<VendorItem*> VendorItemList;

struct VendorItemData
{
    VendorItemList m_items;

    VendorItem* GetItem(uint32 slot) const
    {
        if (slot >= m_items.size())
            return NULL;

        return m_items[slot];
    }
    bool Empty() const { return m_items.empty(); }
    uint32 GetItemCount() const { return m_items.size(); }
    void AddItem(uint32 item, int32 maxcount, uint32 ptime, uint32 ExtendedCost, uint8 type)
    {
        m_items.push_back(new VendorItem(item, maxcount, ptime, ExtendedCost, type));
    }
    bool RemoveItem(uint32 item_id, uint8 type);
    VendorItem const* FindItemCostPair(uint32 item_id, uint32 extendedCost, uint8 type) const;
    void Clear()
    {
        for (VendorItemList::const_iterator itr = m_items.begin(); itr != m_items.end(); ++itr)
            delete (*itr);
        m_items.clear();
    }
};

struct VendorItemCount
{
    explicit VendorItemCount(uint32 _item, uint32 _count)
        : itemId(_item), count(_count), lastIncrementTime(time(NULL)) { }

    uint32 itemId;
    uint32 count;
    time_t lastIncrementTime;
};

typedef std::list<VendorItemCount> VendorItemCounts;

struct TrainerSpell
{
    TrainerSpell() : spell(0), spellCost(0), reqSkill(0), reqSkillValue(0), reqLevel(0)
    {
        for (uint8 i = 0; i < MAX_SPELL_EFFECTS; ++i)
            learnedSpell[i] = 0;
    }

    uint32 spell;
    uint32 spellCost;
    uint32 reqSkill;
    uint32 reqSkillValue;
    uint32 reqLevel;
    uint32 learnedSpell[MAX_SPELL_EFFECTS];

    // helpers
    bool IsCastable() const { return learnedSpell[0] != spell; }
};

typedef std::unordered_map<uint32 /*spellid*/, TrainerSpell> TrainerSpellMap;

struct TrainerSpellData
{
    TrainerSpellData() : trainerType(0) { }
    ~TrainerSpellData() { spellList.clear(); }

    TrainerSpellMap spellList;
    uint32 trainerType;                                     // trainer type based at trainer spells, can be different from creature_template value.
                                                            // req. for correct show non-prof. trainers like weaponmaster, allowed values 0 and 2.
    TrainerSpell const* Find(uint32 spell_id) const;
};

typedef std::map<uint32, time_t> CreatureSpellCooldowns;

// max different by z coordinate for creature aggro reaction
#define CREATURE_Z_ATTACK_RANGE 3

#define MAX_VENDOR_ITEMS 150                                // Limitation in 4.x.x item count in SMSG_LIST_INVENTORY

class Creature : public Unit, public GridObject<Creature>, public MapObject
{
    public:

        explicit Creature(bool isWorldObject = false);
        virtual ~Creature();

        void AddToWorld();
        void RemoveFromWorld();

        void SetObjectScale(float scale);
        void SetDisplayId(uint32 modelId);

        void DisappearAndDie();

        bool Create(uint32 guidlow, Map* map, uint32 phaseMask, uint32 Entry, uint32 vehId, uint32 team, float x, float y, float z, float ang, const CreatureData* data = NULL);
        bool LoadCreaturesAddon(bool reload = false);
        void SelectLevel(const CreatureTemplate* cinfo);
        void LoadEquipment(int8 id = 1, bool force = false);

        uint32 GetDBTableGUIDLow() const { return m_DBTableGuid; }

        void Update(uint32 time);                         // overwrited Unit::Update
        void GetRespawnPosition(float &x, float &y, float &z, float* ori = NULL, float* dist =NULL) const;

        void SetCorpseDelay(uint32 delay) { m_corpseDelay = delay; }
        uint32 GetCorpseDelay() const { return m_corpseDelay; }
        bool IsRacialLeader() const { return GetCreatureTemplate()->RacialLeader; }
        bool IsCivilian() const { return GetCreatureTemplate()->flags_extra & CREATURE_FLAG_EXTRA_CIVILIAN; }
        bool IsTrigger() const { return GetCreatureTemplate()->flags_extra & CREATURE_FLAG_EXTRA_TRIGGER; }
        bool IsGuard() const { return GetCreatureTemplate()->flags_extra & CREATURE_FLAG_EXTRA_GUARD; }
        bool CanWalk() const { return GetInhabitType() & INHABIT_GROUND; }
        bool CanSwim() const { return GetInhabitType() & INHABIT_WATER || IsPet(); }
        bool CanFly()  const { return GetInhabitType() & INHABIT_AIR; }

        // Used to dynamically change allowed path generator and movement flags behavior during scripts.
        // Can be used to allow ground-only creatures to temporarily fly, restrict flying creatures to the ground etc.
        void OverrideInhabitType(InhabitTypeValues inhabitType) { m_inhabitTypeOverride = inhabitType; }
        void ResetInhabitTypeOverride() { m_inhabitTypeOverride = (InhabitTypeValues)0; }
        InhabitTypeValues GetInhabitType() const
        {
            if (IsPet())
                return INHABIT_GROUND | INHABIT_WATER;
            if (m_inhabitTypeOverride)
                return m_inhabitTypeOverride;
            return (InhabitTypeValues)GetCreatureTemplate()->InhabitType;
        }

        void SetReactState(ReactStates st) { m_reactState = st; }
        ReactStates GetReactState() { return m_reactState; }
        bool HasReactState(ReactStates state) const { return (m_reactState == state); }
        void InitializeReactState();

        /// @todo Rename these properly
        bool isCanInteractWithBattleMaster(Player* player, bool msg) const;
        bool isCanTrainingAndResetTalentsOf(Player* player) const;
        bool CanCreatureAttack(Unit const* victim, bool force = true) const;
        bool IsImmunedToSpell(SpellInfo const* spellInfo, uint32 effectMask) const override;
        bool IsImmunedToSpellEffect(SpellInfo const* spellInfo, uint32 index) const; // override Unit::IsImmunedToSpellEffect
        bool isElite() const;
        bool isWorldBoss() const;

        bool IsDungeonBoss() const;

        uint8 getLevelForTarget(WorldObject const* target) const; // overwrite Unit::getLevelForTarget for boss level support

        bool IsInEvadeMode() const { return HasUnitState(UNIT_STATE_EVADE); }

        bool AIM_Initialize(CreatureAI* ai = NULL);
        void Motion_Initialize();

        CreatureAI* AI() const { return reinterpret_cast<CreatureAI*>(i_AI); }

        SpellSchoolMask GetMeleeDamageSchoolMask() const { return m_meleeDamageSchoolMask; }
        void SetMeleeDamageSchool(SpellSchools school) { m_meleeDamageSchoolMask = SpellSchoolMask(1 << school); }

        void _AddCreatureSpellCooldown(uint32 spell_id, time_t end_time);
        void _AddCreatureCategoryCooldown(uint32 category, time_t apply_time);
        void AddCreatureSpellCooldown(uint32 spellid);
        bool HasSpellCooldown(uint32 spell_id) const;
        bool HasCategoryCooldown(uint32 spell_id) const;
        uint32 GetCreatureSpellCooldownDelay(uint32 spellId) const;
        virtual void ProhibitSpellSchool(SpellSchoolMask idSchoolMask, uint32 unTimeMs);

        // For spells with Cone targets
        void PrepareChanneledCast(float facing, uint32 spellId = 0, bool triggered = false);
        void RemoveChanneledCast(uint64 target = 0);
        void FixateOnTarget(uint64 targetGUID, uint32 timer = 0);

        bool HasSpell(uint32 spellID) const;

        bool UpdateEntry(uint32 entry, uint32 team=ALLIANCE, const CreatureData* data=NULL);

        void UpdateMovementFlags(bool force = false);
        void SetFlying(bool enable);

        bool UpdateStats(Stats stat);
        bool UpdateAllStats();
        void UpdateResistances(uint32 school);
        void UpdateArmor();
        void UpdateMaxHealth();
        void UpdateMaxPower(Powers power);
        void UpdateAttackPowerAndDamage(bool ranged = false);
        void UpdateDamagePhysical(WeaponAttackType attType);

        int8 GetOriginalEquipmentId() const { return m_originalEquipmentId; }
        uint8 GetCurrentEquipmentId() { return m_equipmentId; }
        void SetCurrentEquipmentId(uint8 id) { m_equipmentId = id; }

        float GetSpellDamageMod(int32 Rank) const;

        void SetGossip(bool enabled, uint32 menuId = 0)
        {
            ApplyModFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP, enabled);
            m_overrideGossipMenuID = menuId;
        }
        uint32 GetGossipMenuId() const { return m_overrideGossipMenuID ? m_overrideGossipMenuID : GetCreatureTemplate()->GossipMenuId; }

        void SetOverrideVendorEntry(uint32 entry) { m_overrideVendorEntry = entry; }
        VendorItemData const* GetVendorItems() const;
        uint32 GetVendorItemCurrentCount(VendorItem const* vItem);
        uint32 UpdateVendorItemCurrentCount(VendorItem const* vItem, uint32 used_count);

        TrainerSpellData const* GetTrainerSpells() const;

        CreatureTemplate const* GetCreatureTemplate() const { return m_creatureInfo; }
        CreatureData const* GetCreatureData() const { return m_creatureData; }
        CreatureAddon const* GetCreatureAddon() const;

        float GetSparringHealthLimit() const;

        std::string GetAIName() const;
        std::string GetScriptName() const;
        uint32 GetScriptId() const;

        // override WorldObject function for proper name localization
        std::string const& GetNameForLocaleIdx(LocaleConstant locale_idx) const;

        void setDeathState(DeathState s);                   // override virtual Unit::setDeathState

        bool LoadFromDB(uint32 guid, Map* map) { return LoadCreatureFromDB(guid, map, false); }
        bool LoadCreatureFromDB(uint32 guid, Map* map, bool addToMap = true);
        void SaveToDB();
                                                            // overriden in Pet
        virtual void SaveToDB(uint32 mapid, uint16 spawnMask, uint32 phaseMask);
        virtual void DeleteFromDB();                        // overriden in Pet

        Loot loot;
        bool lootForPickPocketed;
        bool lootForBody;
        void StartPickPocketRefillTimer();
        void ResetPickPocketRefillTimer() { m_pickpocketLootRestore = TimeValue::zero(); }
        Player* GetLootRecipient() const;
        Group* GetLootRecipientGroup() const;
        bool IsLootRecipientGroupMember(uint64 guid) const { return m_lootRecipientGroupMembers.empty() || m_lootRecipientGroupMembers.find(guid) != m_lootRecipientGroupMembers.end(); }
        std::set<uint64> const& GetLootRecipients() const { return m_lootRecipients; }
        bool HasLootRecipient() const { return m_lootRecipient || m_lootRecipientGroup; }
        bool HasLootRecipient(Player const* player) const;
        bool IsTappedBy(Player const* player) const;                          // return true if the creature is tapped by the player or a member of his party.

        void SetLootRecipient(Unit* unit);
        void AddLootRecipient(uint64 guid) { m_lootRecipients.insert(guid); } // Additional loot recipients, for rare mobs on Timeless Isle in generally
        void AllLootRemovedFromCorpse();

        uint16 GetLootMode() { return m_LootMode; }
        bool HasLootMode(uint16 lootMode) { return m_LootMode & lootMode; }
        void SetLootMode(uint16 lootMode) { m_LootMode = lootMode; }
        void AddLootMode(uint16 lootMode) { m_LootMode |= lootMode; }
        void RemoveLootMode(uint16 lootMode) { m_LootMode &= ~lootMode; }
        void ResetLootMode() { m_LootMode = LOOT_MODE_DEFAULT; }
        bool HasNormalLootMode() const { return m_hasNormalLootMode; }

        SpellInfo const* reachWithSpellAttack(Unit* victim);
        SpellInfo const* reachWithSpellCure(Unit* victim);

        uint32 m_spells[CREATURE_MAX_SPELLS];
        CreatureSpellCooldowns m_CreatureSpellCooldowns;
        CreatureSpellCooldowns m_CreatureCategoryCooldowns;

        bool CanStartAttack(Unit const* u, bool force) const;
        float GetAttackDistance(Unit const* player) const;
        float GetAggroRange(Unit const* target) const;

        void SendAIReaction(AiReaction reactionType);

        Unit* SelectNearestTarget(float dist = 0, bool playerOnly = false) const;
        Unit* SelectNearestTargetInAttackDistance(float dist = 0) const;
        Player* SelectNearestPlayer(float distance = 0) const;
        Player* SelectNearestPlayerNotGM(float distance = 0) const;
        Unit* SelectNearestHostileUnitInAggroRange(bool useLOS = false) const;

        void DoFleeToGetAssistance();
        void CallForHelp(float fRadius);
        void CallAssistance();
        void SetNoCallAssistance(bool val) { m_AlreadyCallAssistance = val; }
        void SetNoSearchAssistance(bool val) { m_AlreadySearchedAssistance = val; }
        bool HasSearchedAssistance() { return m_AlreadySearchedAssistance; }
        bool CanAssistTo(const Unit* u, const Unit* enemy, bool checkfaction = true) const;
        bool _IsTargetAcceptable(const Unit* target) const;

        MovementGeneratorType GetDefaultMovementType() const { return m_defaultMovementType; }
        void SetDefaultMovementType(MovementGeneratorType mgt) { m_defaultMovementType = mgt; }

        void RemoveCorpse(bool setSpawnTime = true);
        void SetCorpseRemoveTime(time_t time) { m_corpseRemoveTime = time; }

        void DespawnOrUnsummon(uint32 msTimeToDespawn = 0);

        time_t const& GetRespawnTime() const { return m_respawnTime; }
        time_t GetRespawnTimeEx() const;
        void SetRespawnTime(uint32 respawn) { m_respawnTime = respawn ? time(NULL) + respawn : 0; }
        void Respawn(bool force = false);
        void SaveRespawnTime();

        uint32 GetRespawnDelay() const { return m_respawnDelay; }
        uint32 GetRespawnDelayMax() const { return m_respawnDelayMax; }
        void SetRespawnDelay(uint32 delay) { m_respawnDelay = delay; }

        float GetRespawnRadius() const { return m_respawnradius; }
        void SetRespawnRadius(float dist) { m_respawnradius = dist; }

        uint32 m_groupLootTimer;                            // (msecs)timer used for group loot
        uint32 lootingGroupLowGUID;                         // used to find group which is looting corpse

        void SendZoneUnderAttackMessage(Player* attacker);

        void SetInCombatWithZone();
        void SetCombatDistance(float dist) { m_CombatDistance = dist < 5.0f ? 5.0f : dist; }

        bool hasQuest(uint32 quest_id) const;
        bool hasInvolvedQuest(uint32 quest_id)  const;

        bool isRegeneratingHealth() { return m_regenHealth; }
        void setRegeneratingHealth(bool regenHealth) { m_regenHealth = regenHealth; }
        bool isRegeneratingMana() const { return m_regenMana; }
        void setRegeneratingMana(bool regenMana) { m_regenMana = regenMana; }
        virtual uint8 GetPetAutoSpellSize() const { return MAX_SPELL_CHARM; }
        virtual uint32 GetPetAutoSpellOnPos(uint8 pos) const;

        void SetPosition(float x, float y, float z, float o);
        void SetPosition(const Position &pos) { SetPosition(pos.GetPositionX(), pos.GetPositionY(), pos.GetPositionZ(), pos.GetOrientation()); }

        void SetHomePosition(float x, float y, float z, float o) { m_homePosition.Relocate(x, y, z, o); if (m_originalOrientation < 0) m_originalOrientation = Position::NormalizeOrientation(o); }
        void SetHomePosition(Position const& pos) { m_homePosition.Relocate(pos); if (m_originalOrientation < 0) m_originalOrientation = Position::NormalizeOrientation(pos.GetOrientation()); }
        void GetHomePosition(float& x, float& y, float& z, float& ori) const { m_homePosition.GetPosition(x, y, z, ori); }
        Position const& GetHomePosition() const { return m_homePosition; }
        float GetOriginalOrientation() const { return m_originalOrientation; }

        void SetTransportHomePosition(float x, float y, float z, float o) { m_transportHomePosition.Relocate(x, y, z, o); }
        void SetTransportHomePosition(Position const& pos) { m_transportHomePosition.Relocate(pos); }
        void GetTransportHomePosition(float& x, float& y, float& z, float& ori) const { m_transportHomePosition.GetPosition(x, y, z, ori); }
        Position const& GetTransportHomePosition() const { return m_transportHomePosition; }

        uint32 GetWaypointPath(){return m_path_id;}
        void LoadPath(uint32 pathid) { m_path_id = pathid; }

        uint32 GetCurrentWaypointID() const { return m_waypointID; }
        void UpdateWaypointID(uint32 wpID) { m_waypointID = wpID; }

        void SearchFormation();
        CreatureGroup* GetFormation() {return m_formation;}
        void SetFormation(CreatureGroup* formation) {m_formation = formation;}

        Unit* SelectVictim();

        void PlayMusic(uint32 MusicID);

        void SetDisableReputationGain(bool disable) { DisableReputationGain = disable; }
        bool IsReputationGainDisabled() { return DisableReputationGain; }
        bool IsDamageEnoughForLootingAndReward() const { return m_PlayerDamageReq == 0; }
        void LowerPlayerDamageReq(uint32 unDamage);
        void ResetPlayerDamageReq() { m_PlayerDamageReq = GetHealth() / 2; }
        uint32 m_PlayerDamageReq;

        uint32 GetOriginalEntry() const { return m_originalEntry; }
        void SetOriginalEntry(uint32 entry) { m_originalEntry = entry; }

        static float _GetDamageMod(int32 Rank);

        float m_SightDistance, m_CombatDistance, m_ReactDistance;

        bool m_isTempWorldObject; //true when possessed

        // Handling caster facing during spellcast
        void SetTarget(uint64 guid);
        void FocusTarget(Spell const* focusSpell, WorldObject const* target);
        void ReleaseFocus(Spell const* focusSpell);

        void ApplyInstanceAuraIfNeeded();

        void RecalculateDynamicHealth(uint32 newHealth);

    protected:
        bool CreateFromProto(uint32 guidlow, uint32 Entry, uint32 vehId, uint32 team, const CreatureData* data = NULL);
        bool InitEntry(uint32 entry, uint32 team=ALLIANCE, const CreatureData* data=NULL);

        virtual void Regenerate();
        void RegenerateMana();
        void Regenerate(Powers power);

        uint32 m_overrideGossipMenuID = 0;

        // vendor items
        uint32 m_overrideVendorEntry = 0;
        VendorItemCounts m_vendorItemCounts;

        static float _GetHealthMod(int32 Rank);

        uint64 m_lootRecipient;
        uint32 m_lootRecipientGroup;
        std::set<uint64> m_lootRecipients;
        std::set<uint64> m_lootRecipientGroupMembers;

        /// Timers
        time_t m_corpseRemoveTime;                          // (msecs)timer for death or corpse disappearance
        time_t m_respawnTime;                               // (secs) time of next respawn
        uint32 m_respawnDelay;                              // (secs) delay between corpse disappearance and respawning
        uint32 m_respawnDelayMax;                           // (secs) used for dynamic respawn
        uint32 m_corpseDelay;                               // (secs) delay between death and corpse disappearance
        TimeValue m_pickpocketLootRestore;
        float m_respawnradius;

        ReactStates m_reactState;                           // for AI, not charmInfo

        MovementGeneratorType m_defaultMovementType;
        uint32 m_DBTableGuid;                               ///< For new or temporary creatures is 0 for saved it is lowguid
        uint8 m_equipmentId;
        int8 m_originalEquipmentId; // can be -1

        bool m_AlreadyCallAssistance;
        bool m_AlreadySearchedAssistance;
        bool m_regenHealth;
        bool m_regenMana = true;
        bool m_AI_locked;
        bool m_hasNormalLootMode = true;

        SpellSchoolMask m_meleeDamageSchoolMask;
        uint32 m_originalEntry;

        Position m_homePosition;
        Position m_transportHomePosition;
        Position m_lastMovementFlagsUpdatePosition = Position{ INVALID_HEIGHT, INVALID_HEIGHT, INVALID_HEIGHT };
        float m_originalOrientation = -1;

        bool DisableReputationGain;

        CreatureTemplate const* m_creatureInfo;                 // Can differ from sObjectMgr->GetCreatureTemplate(GetEntry()) in difficulty mode > 0
        CreatureData const* m_creatureData;

        InhabitTypeValues m_inhabitTypeOverride = INHABIT_NONE;

        uint16 m_LootMode;                                  // Bitmask (default: LOOT_MODE_DEFAULT) that determines what loot will be lootable
        uint32 guid_transport;

        bool IsInvisibleDueToDespawn() const;
        bool CanAlwaysSee(WorldObject const* obj) const;

        uint32 dynamicHealthPlayersCount;

    public:
        void ForcedDespawn(uint32 timeMSToDespawn = 0);
    private:
        //WaypointMovementGenerator vars
        uint32 m_waypointID;
        uint32 m_path_id;

        //Formation var
        CreatureGroup* m_formation;
        bool TriggerJustRespawned;

        Spell const* _focusSpell;   ///> Locks the target during spell cast for proper facing
};

class AssistDelayEvent : public BasicEvent
{
    public:
        AssistDelayEvent(uint64 victim, Unit& owner) : BasicEvent(), m_victim(victim), m_owner(owner) { }

        bool Execute(uint64 e_time, uint32 p_time);
        void AddAssistant(uint64 guid) { m_assistants.push_back(guid); }
    private:
        AssistDelayEvent();

        uint64            m_victim;
        std::list<uint64> m_assistants;
        Unit&             m_owner;
};

class ForcedDespawnDelayEvent : public BasicEvent
{
    public:
        ForcedDespawnDelayEvent(Creature& owner) : BasicEvent(), m_owner(owner) { }
        bool Execute(uint64 e_time, uint32 p_time);

    private:
        Creature& m_owner;
};

typedef std::unordered_map<uint32, float /*SparringHealthLimit*/> CreatureSparringTemplateMap;
#endif
