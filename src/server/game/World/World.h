/*
 * Copyright (C) 2011-2016 Project SkyFire <http://www.projectskyfire.org/>
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2005-2016 MaNGOS <http://getmangos.com/>
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

/// \addtogroup world The World
/// @{
/// \file

#ifndef SF_WORLD_H
#define SF_WORLD_H

#include "Common.h"
#include "Timer.h"
#include <ace/Singleton.h>
#include <ace/Atomic_Op.h>
#include "SharedDefines.h"
#include "QueryResult.h"
#include "Callback.h"
#include "ByteBuffer.h"
#include "Transaction.h"

#include <thread>
#include <map>
#include <set>
#include <list>

class Object;
class WorldPacket;
class WorldSession;
class Player;
class WorldSocket;
class SystemMgr;
class Quest;
enum class DevToolType : uint8;
union DevToolSettings;
struct CliCommandHolder;

// ServerMessages.dbc
enum ServerMessageType
{
    SERVER_MSG_SHUTDOWN_TIME          = 1,
    SERVER_MSG_RESTART_TIME           = 2,
    SERVER_MSG_STRING                 = 3,
    SERVER_MSG_SHUTDOWN_CANCELLED     = 4,
    SERVER_MSG_RESTART_CANCELLED      = 5,
    SERVER_MSG_BG_SHUTDOWN_TIME       = 6,
    SERVER_MSG_BG_RESTART_TIME        = 7,
    SERVER_MSG_INSTANCE_SHUTDOWN_TIME = 8,
    SERVER_MSG_INSTANCE_RESTART_TIME  = 9,
    SERVER_MSG_CONTENT_READY          = 10,
    SERVER_MSG_TICKET_SERVICED_SOON   = 11,
    SERVER_MSG_WAIT_TIME_UNAVAILABLE  = 12,
    SERVER_MSG_TICKET_WAIT_TIME       = 13,
};

enum ShutdownMask
{
    SHUTDOWN_MASK_RESTART = 1,
    SHUTDOWN_MASK_IDLE    = 2
};

enum ShutdownExitCode
{
    SHUTDOWN_EXIT_CODE = 0,
    ERROR_EXIT_CODE    = 1,
    RESTART_EXIT_CODE  = 2
};

/// Timers for different object refresh rates
enum WorldTimers
{
    WUPDATE_AUCTIONS,
    WUPDATE_WEATHERS,
    WUPDATE_UPTIME,
    WUPDATE_CORPSES,
    WUPDATE_EVENTS,
    WUPDATE_CLEANDB,
    WUPDATE_AUTOBROADCAST,
    WUPDATE_MAILBOXQUEUE,
    WUPDATE_DELETECHARS,
    WUPDATE_AHBOT,
    WUPDATE_PINGDB,
    WUPDATE_GUILDSAVE,
    WUPDATE_BLACK_MARKET,
    WUPDATE_DIFFSTAT,
    WUPDATE_BONUS_RATES,
    WUPDATE_project_MEMBER_INFO,
    WUPDATE_COUNT
};

/// Configuration elements
enum WorldBoolConfigs
{
    CONFIG_DURABILITY_LOSS_IN_PVP = 0,
    CONFIG_ADDON_CHANNEL,
    CONFIG_ALLOW_PLAYER_COMMANDS,
    CONFIG_CLEAN_CHARACTER_DB,
    CONFIG_GRID_UNLOAD,
    CONFIG_STATS_SAVE_ONLY_ON_LOGOUT,
    CONFIG_ALLOW_TWO_SIDE_INTERACTION_CALENDAR,
    CONFIG_ALLOW_TWO_SIDE_INTERACTION_CHANNEL,
    CONFIG_ALLOW_TWO_SIDE_INTERACTION_GROUP,
    CONFIG_ALLOW_TWO_SIDE_INTERACTION_GUILD,
    CONFIG_ALLOW_TWO_SIDE_INTERACTION_AUCTION,
    CONFIG_ALLOW_TWO_SIDE_TRADE,
    CONFIG_ALL_TAXI_PATHS,
    CONFIG_INSTANT_TAXI,
    CONFIG_INSTANCE_IGNORE_LEVEL,
    CONFIG_INSTANCE_IGNORE_RAID,
    CONFIG_CAST_UNSTUCK,
    CONFIG_ALLOW_GM_GROUP,
    CONFIG_GM_LOWER_SECURITY,
    CONFIG_GM_USE_ONLINE_MUTES,
    CONFIG_SKILL_PROSPECTING,
    CONFIG_SKILL_MILLING,
    CONFIG_SAVE_RESPAWN_TIME_IMMEDIATELY,
    CONFIG_WEATHER,
    CONFIG_QUEST_IGNORE_RAID,
    CONFIG_DETECT_POS_COLLISION,
    CONFIG_RESTRICTED_LFG_CHANNEL,
    CONFIG_TALENTS_INSPECTING,
    CONFIG_CHAT_FAKE_MESSAGE_PREVENTING,
    CONFIG_DEATH_CORPSE_RECLAIM_DELAY_PVP,
    CONFIG_DEATH_CORPSE_RECLAIM_DELAY_PVE,
    CONFIG_DEATH_BONES_WORLD,
    CONFIG_DEATH_BONES_BG_OR_ARENA,
    CONFIG_DIE_COMMAND_MODE,
    CONFIG_DECLINED_NAMES_USED,
    CONFIG_BATTLEGROUND_CAST_DESERTER,
    CONFIG_BATTLEGROUND_IGNORE_FACTION,
    CONFIG_BATTLEGROUND_QUEUE_ANNOUNCER_ENABLE,
    CONFIG_BATTLEGROUND_QUEUE_ANNOUNCER_PLAYERONLY,
    CONFIG_BG_XP_FOR_KILL,
    CONFIG_ARENA_QUEUE_ANNOUNCER_ENABLE,
    CONFIG_ARENA_QUEUE_ANNOUNCER_PLAYERONLY,
    CONFIG_ARENA_SEASON_IN_PROGRESS,
    CONFIG_ARENA_LOG_EXTENDED_INFO,
    CONFIG_OFFHAND_CHECK_AT_SPELL_UNLEARN,
    CONFIG_VMAP_INDOOR_CHECK,
    CONFIG_START_ALL_SPELLS,
    CONFIG_START_ALL_EXPLORED,
    CONFIG_START_ALL_REP,
    CONFIG_ALWAYS_MAXSKILL,
    CONFIG_PVP_TOKEN_ENABLE,
    CONFIG_NO_RESET_TALENT_COST,
    CONFIG_SHOW_KICK_IN_WORLD,
    CONFIG_CHATLOG_CHANNEL,
    CONFIG_CHATLOG_WHISPER,
    CONFIG_CHATLOG_SYSCHAN,
    CONFIG_CHATLOG_PARTY,
    CONFIG_CHATLOG_RAID,
    CONFIG_CHATLOG_GUILD,
    CONFIG_CHATLOG_PUBLIC,
    CONFIG_CHATLOG_ADDON,
    CONFIG_CHATLOG_BGROUND,
    CONFIG_AUTOBROADCAST,
    CONFIG_LFG_CASTDESERTER,
    CONFIG_LFG_OVERRIDE_ROLES_REQUIRED,
    CONFIG_LFG_MULTIQUEUE_ENABLED,
    CONFIG_LFG_KEEP_QUEUES_IN_DUNGEON,
    CONFIG_DBC_ENFORCE_ITEM_ATTRIBUTES,
    CONFIG_PRESERVE_CUSTOM_CHANNELS,
    CONFIG_PDUMP_NO_PATHS,
    CONFIG_PDUMP_NO_OVERWRITE,
    CONFIG_QUEST_IGNORE_AUTO_ACCEPT,
    CONFIG_QUEST_IGNORE_AUTO_COMPLETE,
    CONFIG_WARDEN_ENABLED,
    CONFIG_ENABLE_MMAPS,
    CONFIG_MMAP_ALLOW_REUSE_OF_PREVIOUS_PATH_SEGMENTS,
    CONFIG_WINTERGRASP_ENABLE,
    CONFIG_TOLBARAD_ENABLE,
    CONFIG_GUILD_LEVELING_ENABLED,
    CONFIG_UI_QUESTLEVELS_IN_DIALOGS,     // Should we add quest levels to the title in the NPC dialogs?
    CONFIG_EVENT_ANNOUNCE,
    CONFIG_STATS_LIMITS_ENABLE,
    CONFIG_INSTANCES_RESET_ANNOUNCE,
    CONFIG_BLACK_MARKET_OPEN,
    CONFIG_TICKETS_GM_ENABLED,
    CONFIG_TICKETS_FEEDBACK_SYSTEM_ENABLED,
    CONFIG_CALCULATE_CREATURE_ZONE_AREA_DATA,
    CONFIG_CALCULATE_GAMEOBJECT_ZONE_AREA_DATA,
    CONFIG_GM_LOG_TRADE,
    CONFIG_SILENTLY_GM_JOIN_TO_CHANNEL,
    CONFIG_ALLOW_GM_FRIEND,
    CONFIG_ALLOW_TWO_SIDE_ADD_FRIEND,
    CONFIG_ALLOW_TWO_SIDE_WHO_LIST,
    CONFIG_ALLOW_TWO_SIDE_INTERACTION_MAIL,
    CONFIG_ALLOW_TWO_SIDE_INTERACTION_LFG,
    CONFIG_ALLOW_TWO_SIDE_ACCOUNTS,
    CONFIG_ALLOW_TWO_SIDE_INTERACTION_CHAT,
    CONFIG_BETA_TEST,
    CONFIG_BETA_TEST_MODE,
    CONFIG_TRANSPORT_DISABLE_MAPOBJ_PRESPAWN,
    CONFIG_TRANSPORT_DISABLE_LOCAL_PRESPAWN,
    CONFIG_TRANSPORT_PREFER_SERVER_WORLD_POSITION,
    CONFIG_TRANSPORT_LOAD_GRIDS,
    CONFIG_DEBUG_OPCODES,
    CONFIG_ANTICHEAT_ENABLE,
    CONFIG_BONUS_RATES_ENABLED,
    CONFIG_TRANSFER_MAIL_ENABLED,
    CONFIG_EXECUTED_SERVICES_LOG,
    CONFIG_ICORE_project_DAILY_QUESTS_ENABLED,
    CONFIG_GROUP_LOG_ENABLED,
    CONFIG_BANK_COMMAND_PREMIUM,
    CONFIG_MAIL_COMMAND_PREMIUM,
    CONFIG_AUC_COMMAND_PREMIUM,
    CONFIG_ENABLE_ILVL_SCALING_PVE,
    CONFIG_ENABLE_ILVL_SCALING_PVP,
    CONFIG_PET_BATTLES_ENABLED,
    CONFIG_project_MEMBER_REWARD_ENABLED,
    CONFIG_SOLO_QUEUE_ENABLED,
    CONFIG_SOLO_QUEUE_GROUP_REGISTRATION_ENABLED,
    CONFIG_SOLO_QUEUE_GROUP_ONLY_HEALER_AND_DAMAGER,
    CONFIG_SOLO_QUEUE_PROGRESSIVE_MMR_ENABLED,
    CONFIG_SOLO_QUEUE_PROGRESSIVE_MMR_ONLY_HEALERS,
    CONFIG_SOLO_QUEUE_INTERFACTIONAL_TEAMS,
    CONFIG_SOLO_QUEUE_BALANCE_PRIORITY_ENABLED,
    CONFIG_SOLO_QUEUE_ALLOW_ACHIEVEMENTS,
    CONFIG_SOLO_QUEUE_ALLOW_BUY_ARENA_STUFF,
    CONFIG_ICORE_QUEUE_ANNOUNCE_ARENA,
    CONFIG_ICORE_QUEUE_ANNOUNCE_ARENA_SOLO,
    CONFIG_ICORE_QUEUE_ANNOUNCE_BATTLEGROUND,
    CONFIG_ICORE_QUEUE_ANNOUNCE_RAID,
    CONFIG_DELETING_ITEM_LOG,
    CONFIG_AUCTIONHOUSE_ALLOW_SORTING,
    CONFIG_AUCTIONHOUSE_FORCE_MAIN_THREAD,
    CONFIG_BATTLEGROUND_DT_BG_ENABLED,
    CONFIG_BATTLEGROUND_REWARDS_ENABLED,
    CONFIG_RBG_REWARDS_FOR_ARENA_ENABLED,
    CONFIG_SOLO_QUEUE_ALLOW_WITHOUT_HEALERS,
    CONFIG_ICORE_RICH_PVP_REWARD_ENABLED,
    CONFIG_ARENA_WIN_STREAK_MOD_ENABLED,
    CONFIG_ICORE_ROYALE_EVENT_ENABLED,
    CONFIG_BOOST_PROMOTION,
	CONFIG_WORD_FILTER_ENABLE,
    CONFIG_WOW_TOKEN,
    CONFIG_TIME_IS_MONEY_ENABLE,    
    BOOL_CONFIG_VALUE_COUNT
};

enum WorldFloatConfigs
{
    CONFIG_GROUP_XP_DISTANCE = 0,
    CONFIG_MAX_RECRUIT_A_FRIEND_DISTANCE,
    CONFIG_SIGHT_MONSTER,
    CONFIG_SIGHT_GUARDER,
    CONFIG_LISTEN_RANGE_SAY,
    CONFIG_LISTEN_RANGE_TEXTEMOTE,
    CONFIG_LISTEN_RANGE_YELL,
    CONFIG_CREATURE_FAMILY_FLEE_ASSISTANCE_RADIUS,
    CONFIG_CREATURE_FAMILY_ASSISTANCE_RADIUS,
    CONFIG_THREAT_RADIUS,
    CONFIG_CHANCE_OF_GM_SURVEY,
    CONFIG_STATS_LIMITS_DODGE,
    CONFIG_STATS_LIMITS_PARRY,
    CONFIG_STATS_LIMITS_BLOCK,
    CONFIG_STATS_LIMITS_CRIT,
    CONFIG_LFR_LOOT_CHANCE,
    CONFIG_BONUS_ROLL_LOOT_CHANCE,
    CONFIG_BONUS_ROLL_BONUS_CHANCE,
    CONFIG_PVP_RESILIENCE_BELOW_90,
    CONFIG_PVP_RESILIENCE_90,
    CONFIG_BATTLE_FATIGUE,
    CONFIG_VENGEANCE_MULTIPLIER,
    // CUSTOM BALANCE SYSTEM FOR TORGHASTWOW
    CONFIGSPECMAGEARCANE,
    CONFIGSPECMAGEFIRE,
    CONFIGSPECMAGEFROST,
    CONFIGSPECPALADINHOLY,
    CONFIGSPECPALADINPROTECTION,
    CONFIGSPECPALADINRETRIBUTION,
    CONFIGSPECWARRIORARMS,
    CONFIGSPECWARRIORFURY,
    CONFIGSPECWARRIORPROTECTION,
    CONFIGSPECPETFEROCITY,
    CONFIGSPECPETCUNNING,
    CONFIGSPECPETTENACITY,
    CONFIGSPECDRUIDBALANCE,
    CONFIGSPECDRUIDFERAL,
    CONFIGSPECDRUIDGUARDIAN,
    CONFIGSPECDRUIDRESTORATION,
    CONFIGSPECDEATHKNIGHTBLOOD,
    CONFIGSPECDEATHKNIGHTFROST,
    CONFIGSPECDEATHKNIGHTUNHOLY,
    CONFIGSPECHUNTERBEASTMASTERY,
    CONFIGSPECHUNTERMARKSMANSHIP,
    CONFIGSPECHUNTERSURVIVAL,
    CONFIGSPECPRIESTDISCIPLINE,
    CONFIGSPECPRIESTHOLY,
    CONFIGSPECPRIESTSHADOW,
    CONFIGSPECROGUEASSASSINATION,
    CONFIGSPECROGUECOMBAT,
    CONFIGSPECROGUESUBTLETY,
    CONFIGSPECSHAMANELEMENTAL,
    CONFIGSPECSHAMANENHANCEMENT,
    CONFIGSPECSHAMANRESTORATION,
    CONFIGSPECWARLOCKAFFLICTION,
    CONFIGSPECWARLOCKDEMONOLOGY,
    CONFIGSPECWARLOCKDESTRUCTION,
    CONFIGSPECMONKBREWMASTER,
    CONFIGSPECMONKWINDWALKER,
    CONFIGSPECMONKMISTWEAVER,
    HEALCONFIGSPECMAGEARCANE,
    HEALCONFIGSPECMAGEFIRE,
    HEALCONFIGSPECMAGEFROST,
    HEALCONFIGSPECPALADINHOLY,
    HEALCONFIGSPECPALADINPROTECTION,
    HEALCONFIGSPECPALADINRETRIBUTION,
    HEALCONFIGSPECWARRIORARMS,
    HEALCONFIGSPECWARRIORFURY,
    HEALCONFIGSPECWARRIORPROTECTION,
    HEALCONFIGSPECPETFEROCITY,
    HEALCONFIGSPECPETCUNNING,
    HEALCONFIGSPECPETTENACITY,
    HEALCONFIGSPECDRUIDBALANCE,
    HEALCONFIGSPECDRUIDFERAL,
    HEALCONFIGSPECDRUIDGUARDIAN,
    HEALCONFIGSPECDRUIDRESTORATION,
    HEALCONFIGSPECDEATHKNIGHTBLOOD,
    HEALCONFIGSPECDEATHKNIGHTFROST,
    HEALCONFIGSPECDEATHKNIGHTUNHOLY,
    HEALCONFIGSPECHUNTERBEASTMASTERY,
    HEALCONFIGSPECHUNTERMARKSMANSHIP,
    HEALCONFIGSPECHUNTERSURVIVAL,
    HEALCONFIGSPECPRIESTDISCIPLINE,
    HEALCONFIGSPECPRIESTHOLY,
    HEALCONFIGSPECPRIESTSHADOW,
    HEALCONFIGSPECROGUEASSASSINATION,
    HEALCONFIGSPECROGUECOMBAT,
    HEALCONFIGSPECROGUESUBTLETY,
    HEALCONFIGSPECSHAMANELEMENTAL,
    HEALCONFIGSPECSHAMANENHANCEMENT,
    HEALCONFIGSPECSHAMANRESTORATION,
    HEALCONFIGSPECWARLOCKAFFLICTION,
    HEALCONFIGSPECWARLOCKDEMONOLOGY,
    HEALCONFIGSPECWARLOCKDESTRUCTION,
    HEALCONFIGSPECMONKBREWMASTER,
    HEALCONFIGSPECMONKWINDWALKER,
    HEALCONFIGSPECMONKMISTWEAVER,
    // NEW PETS CONFIG FOR TORGHASTWOW
    CONFIG_SPEC_PET_FEROCITY,
    CONFIG_SPEC_PET_TENACITY,
    CONFIG_SPEC_PET_CUNNING,
    CONFIG_PET_NO_SPEC,

    FLOAT_CONFIG_VALUE_COUNT
};

enum WorldIntConfigs
{
    CONFIG_COMPRESSION = 0,
    CONFIG_INTERVAL_SAVE,
    CONFIG_INTERVAL_GRIDCLEAN,
    CONFIG_INTERVAL_MAPUPDATE,
    CONFIG_INTERVAL_CHANGEWEATHER,
    CONFIG_INTERVAL_DISCONNECT_TOLERANCE,
    CONFIG_PORT_WORLD,
    CONFIG_SOCKET_TIMEOUTTIME,
    CONFIG_SESSION_ADD_DELAY,
    CONFIG_GAME_TYPE,
    CONFIG_REALM_ZONE,
    CONFIG_STRICT_PLAYER_NAMES,
    CONFIG_STRICT_CHARTER_NAMES,
    CONFIG_STRICT_PET_NAMES,
    CONFIG_MIN_PLAYER_NAME,
    CONFIG_MIN_CHARTER_NAME,
    CONFIG_MIN_PET_NAME,
    CONFIG_CHARACTER_CREATING_DISABLED,
    CONFIG_CHARACTER_CREATING_DISABLED_RACEMASK,
    CONFIG_CHARACTER_CREATING_DISABLED_CLASSMASK,
    CONFIG_CHARACTERS_PER_ACCOUNT,
    CONFIG_CHARACTERS_PER_REALM,
    CONFIG_HEROIC_CHARACTERS_PER_REALM,
    CONFIG_CHARACTER_CREATING_MIN_LEVEL_FOR_HEROIC_CHARACTER,
    CONFIG_SKIP_CINEMATICS,
    CONFIG_MAX_PLAYER_LEVEL,
    CONFIG_MIN_DUALSPEC_LEVEL,
    CONFIG_START_PLAYER_LEVEL,
    CONFIG_START_HEROIC_PLAYER_LEVEL,
    CONFIG_START_PLAYER_MONEY,
    CONFIG_CURRENCY_START_JUSTICE_POINTS,
    CONFIG_CURRENCY_MAX_JUSTICE_POINTS,
    CONFIG_CURRENCY_START_HONOR_POINTS,
    CONFIG_CURRENCY_MAX_HONOR_POINTS,
    CONFIG_CURRENCY_START_CONQUEST_POINTS,
    CONFIG_CURRENCY_CONQUEST_POINTS_WEEK_CAP,
    CONFIG_CURRENCY_CONQUEST_POINTS_ARENA_REWARD,
    CONFIG_CURRENCY_CONQUEST_POINTS_RATED_BG_REWARD,
    CONFIG_CURRENCY_RESET_HOUR,
    CONFIG_CURRENCY_RESET_DAY,
    CONFIG_CURRENCY_RESET_INTERVAL,
    CONFIG_MAX_RECRUIT_A_FRIEND_BONUS_PLAYER_LEVEL,
    CONFIG_MAX_RECRUIT_A_FRIEND_BONUS_PLAYER_LEVEL_DIFFERENCE,
    CONFIG_INSTANCE_RESET_TIME_HOUR,
    CONFIG_INSTANCE_RESET_TIME_DAY,
    CONFIG_INSTANCE_UNLOAD_DELAY,
    CONFIG_MAX_PRIMARY_TRADE_SKILL,
    CONFIG_MIN_PETITION_SIGNS,
    CONFIG_GM_LOGIN_STATE,
    CONFIG_GM_VISIBLE_STATE,
    CONFIG_GM_ACCEPT_TICKETS,
    CONFIG_GM_CHAT,
    CONFIG_GM_WHISPERING_TO,
    CONFIG_GM_LEVEL_IN_GM_LIST,
    CONFIG_GM_LEVEL_IN_WHO_LIST,
    CONFIG_START_GM_LEVEL,
    CONFIG_GM_MAX_MUTE_TIME,
    CONFIG_GROUP_VISIBILITY,
    CONFIG_MAIL_DELIVERY_DELAY,
    CONFIG_UPTIME_UPDATE,
    CONFIG_SKILL_CHANCE_ORANGE,
    CONFIG_SKILL_CHANCE_YELLOW,
    CONFIG_SKILL_CHANCE_GREEN,
    CONFIG_SKILL_CHANCE_GREY,
    CONFIG_SKILL_CHANCE_MINING_STEPS,
    CONFIG_SKILL_CHANCE_SKINNING_STEPS,
    CONFIG_SKILL_GAIN_CRAFTING,
    CONFIG_SKILL_GAIN_GATHERING,
    CONFIG_MAX_OVERSPEED_PINGS,
    CONFIG_EXPANSION,
    CONFIG_CHATFLOOD_MESSAGE_COUNT,
    CONFIG_CHATFLOOD_MESSAGE_DELAY,
    CONFIG_CHATFLOOD_MUTE_TIME,
    CONFIG_CREATURE_FAMILY_ASSISTANCE_DELAY,
    CONFIG_CREATURE_FAMILY_FLEE_DELAY,
    CONFIG_WORLD_BOSS_LEVEL_DIFF,
    CONFIG_QUEST_LOW_LEVEL_HIDE_DIFF,
    CONFIG_QUEST_HIGH_LEVEL_HIDE_DIFF,
    CONFIG_CHAT_STRICT_LINK_CHECKING_SEVERITY,
    CONFIG_CHAT_STRICT_LINK_CHECKING_KICK,
    CONFIG_CHAT_CHANNEL_LEVEL_REQ,
    CONFIG_CHAT_WHISPER_LEVEL_REQ,
    CONFIG_CHAT_SAY_LEVEL_REQ,
    CONFIG_TRADE_LEVEL_REQ,
    CONFIG_TICKET_LEVEL_REQ,
    CONFIG_AUCTION_LEVEL_REQ,
    CONFIG_MAIL_LEVEL_REQ,
    CONFIG_CORPSE_DECAY_NORMAL,
    CONFIG_CORPSE_DECAY_RARE,
    CONFIG_CORPSE_DECAY_ELITE,
    CONFIG_CORPSE_DECAY_RAREELITE,
    CONFIG_CORPSE_DECAY_WORLDBOSS,
    CONFIG_DEATH_SICKNESS_LEVEL,
    CONFIG_INSTANT_LOGOUT,
    CONFIG_DISABLE_BREATHING,
    CONFIG_BATTLEGROUND_INVITATION_TYPE,
    CONFIG_BATTLEGROUND_PREMATURE_FINISH_TIMER,
    CONFIG_BATTLEGROUND_PREMADE_GROUP_WAIT_FOR_MATCH,
    CONFIG_BATTLEGROUND_HUGE_BG_START_TIME,
    CONFIG_BATTLEGROUND_HUGE_BG_END_TIME,
    CONFIG_BATTLEGROUND_DT_BG_START_TIME,
    CONFIG_BATTLEGROUND_DT_BG_END_TIME,
    CONFIG_ARENA_MAX_RATING_DIFFERENCE,
    CONFIG_ARENA_RATING_DISCARD_TIMER,
    CONFIG_ARENA_RATED_UPDATE_TIMER,
    CONFIG_ARENA_SEASON_ID,
    CONFIG_ARENA_START_RATING,
    CONFIG_ARENA_START_PERSONAL_RATING,
    CONFIG_ARENA_START_MATCHMAKER_RATING,
    CONFIG_ARENA_PROGRESSIVE_MMR_TIMER,
    CONFIG_ARENA_PROGRESSIVE_MMR_STEPSIZE,
    CONFIG_MAX_WHO,
    CONFIG_MAX_ICORE,
    CONFIG_HONOR_AFTER_DUEL,
    CONFIG_PVP_TOKEN_MAP_TYPE,
    CONFIG_PVP_TOKEN_ID,
    CONFIG_PVP_TOKEN_COUNT,
    CONFIG_INTERVAL_LOG_UPDATE,
    CONFIG_MIN_LOG_UPDATE,
    CONFIG_ENABLE_SINFO_LOGIN,
    CONFIG_PLAYER_ALLOW_COMMANDS,
    CONFIG_NUMTHREADS,
    CONFIG_LOGDB_CLEARINTERVAL,
    CONFIG_LOGDB_CLEARTIME,
    CONFIG_CLIENTCACHE_VERSION,
    CONFIG_GUILD_NEWS_LOG_COUNT,
    CONFIG_GUILD_EVENT_LOG_COUNT,
    CONFIG_GUILD_BANK_EVENT_LOG_COUNT,
    CONFIG_MIN_LEVEL_STAT_SAVE,
    CONFIG_RANDOM_BG_RESET_HOUR,
    CONFIG_GUILD_RESET_HOUR,
    CONFIG_CHARDELETE_KEEP_DAYS,
    CONFIG_CHARDELETE_METHOD,
    CONFIG_CHARDELETE_MIN_LEVEL,
    CONFIG_CHARDELETE_HEROIC_MIN_LEVEL,
    CONFIG_AUTOBROADCAST_CENTER,
    CONFIG_AUTOBROADCAST_INTERVAL,
    CONFIG_MAX_RESULTS_LOOKUP_COMMANDS,
    CONFIG_DB_PING_INTERVAL,
    CONFIG_PRESERVE_CUSTOM_CHANNEL_DURATION,
    CONFIG_PERSISTENT_CHARACTER_CLEAN_FLAGS,
    CONFIG_LFG_OPTIONSMASK,
    CONFIG_LFG_TANKS_NEEDED,
    CONFIG_LFG_HEALERS_NEEDED,
    CONFIG_LFG_DPS_NEEDED,
    CONFIG_LFG_SHORTAGE_CHECK_INTERVAL,
    CONFIG_LFG_SHORTAGE_PERCENT,
    CONFIG_LFG_MAX_LFR_QUEUES,
    CONFIG_MAX_INSTANCES_PER_HOUR,
    CONFIG_WARDEN_CLIENT_RESPONSE_DELAY,
    CONFIG_WARDEN_CLIENT_CHECK_HOLDOFF,
    CONFIG_WARDEN_CLIENT_FAIL_ACTION,
    CONFIG_WARDEN_CLIENT_BAN_DURATION,
    CONFIG_WARDEN_NUM_MEM_CHECKS,
    CONFIG_WARDEN_NUM_OTHER_CHECKS,
    CONFIG_WINTERGRASP_PLR_MAX,
    CONFIG_WINTERGRASP_PLR_MIN,
    CONFIG_WINTERGRASP_PLR_MIN_LVL,
    CONFIG_WINTERGRASP_BATTLETIME,
    CONFIG_WINTERGRASP_NOBATTLETIME,
    CONFIG_WINTERGRASP_RESTART_AFTER_CRASH,
    CONFIG_TOLBARAD_PLR_MAX,
    CONFIG_TOLBARAD_PLR_MIN,
    CONFIG_TOLBARAD_PLR_MIN_LVL,
    CONFIG_TOLBARAD_BATTLETIME,
    CONFIG_TOLBARAD_BONUSTIME,
    CONFIG_TOLBARAD_NOBATTLETIME,
    CONFIG_TOLBARAD_RESTART_AFTER_CRASH,
    CONFIG_GUILD_SAVE_INTERVAL,
    CONFIG_GUILD_MAX_LEVEL,
    CONFIG_GUILD_UNDELETABLE_LEVEL,
    CONFIG_GUILD_DAILY_XP_CAP,
    CONFIG_GUILD_WEEKLY_REP_CAP,
    CONFIG_PACKET_SPOOF_POLICY,
    CONFIG_PACKET_SPOOF_BANMODE,
    CONFIG_PACKET_SPOOF_BANDURATION,
    CONFIG_ACC_PASSCHANGESEC,
    CONFIG_RBAC_FREE_PERMISSION_MODE,
    CONFIG_BG_REWARD_WINNER_HONOR_FIRST,
    CONFIG_BG_REWARD_WINNER_HONOR_LAST,
    CONFIG_BG_REWARD_WINNER_CONQUEST_FIRST,
    CONFIG_BG_REWARD_WINNER_CONQUEST_LAST,
    CONFIG_BG_REWARD_LOSER_HONOR_FIRST,
    CONFIG_BG_REWARD_LOSER_HONOR_LAST,
    CONFIG_BATTLE_PET_LOADOUT_UNLOCK_COUNT,
    CONFIG_BATTLE_PET_INITIAL_LEVEL,
    CONFIG_BLACK_MARKET_MAX_AUCTIONS,
    CONFIG_BLACK_MARKET_AUCTION_DELAY,
    CONFIG_BLACK_MARKET_AUCTION_DELAY_MOD,
    CONFIG_BIRTHDAY_TIME,
    CONFIG_ANTICHEAT_DETECTIONS_ENABLED,
    CONFIG_ANTICHEAT_REPORTS_INGAME_NOTIFICATION,
    CONFIG_ANTICHEAT_MAX_REPORTS_FOR_DAILY_REPORT,
    CONFIG_SHOW_INFO_BAN_PLAYER,
    CONFIG_SHOW_INFO_KICK_PLAYER,
    CONFIG_SHOW_INFO_MUTE_PLAYER,
    CONFIG_CURRENCY_LOG_LOOT_MOB,
    CONFIG_CURRENCY_LOG_LOOT_ITEM,
    CONFIG_CURRENCY_LOG_MAIL,
    CONFIG_CURRENCY_LOG_QUEST_REWARD,
    CONFIG_CURRENCY_LOG_TRADE,
    CONFIG_CURRENCY_LOG_SELL_ITEM,
    CONFIG_CURRENCY_LOG_GUILD_BANK,
    CONFIG_CURRENCY_LOG_AUCTION,
    CONFIG_CURRENCY_LOG_CLEAR_INTERVAL,
    CONFIG_XP_KILL_LEVEL_DIFFERENCE,
    CONFIG_XP_GATHER_LEVEL_DIFFERENCE,
    CONFIG_CUSTOM_VISIBILITY_MAP_THRESHOLD,
    CONFIG_CUSTOM_VISIBILITY_ZONE_THRESHOLD,
    CONFIG_ICORE_PROMOCODES_COOLDOWN,
    CONFIG_ICORE_PROMOCODES_DAILY_LIMIT,
    CONFIG_ICORE_project_DAILY_QUESTS_LIMIT,
    CONFIG_ICORE_project_DAILY_QUESTS_LIMIT_PREMIUM,
    CONFIG_ICORE_project_DAILY_QUESTS_REWARD_BONUS_PREMIUM_PCT,
    CONFIG_ICORE_project_DAILY_QUESTS_REWARD_BONUS_PREMIUM_FLAT,
    CONFIG_ICORE_project_DAILY_QUESTS_REWARD_BONUS_MMOTOP_PCT,
    CONFIG_ICORE_project_DAILY_QUESTS_REWARD_BONUS_MMOTOP_FLAT,
    CONFIG_ICORE_project_DAILY_QUESTS_REWARD_BONUS_MMOVOTE_PCT,
    CONFIG_ICORE_project_DAILY_QUESTS_REWARD_BONUS_MMOVOTE_FLAT,
    CONFIG_ICORE_PREMIUM_ENABLE_FOR_ALL_SET_DATE,
    CONFIG_ICORE_PREMIUM_ENABLE_FOR_ALL_UNSET_DATE,
    CONFIG_ICORE_ARENA_HIGH_LATENCY_THRESHOLD,
    CONFIG_ILVL_SCALING_PVE,
    CONFIG_ILVL_SCALING_PVP,
    CONFIG_BONUS_ROLL_MONEY_MIN,
    CONFIG_BONUS_ROLL_MONEY_MAX,
    CONFIG_DAMAGE_LOG_MIN_DAMAGE,
    CONFIG_ISLE_OF_THUNDER_STAGE,
    CONFIG_ISLE_OF_THUNDER_PROGRESSION_HORDE,
    CONFIG_ISLE_OF_THUNDER_PROGRESSION_ALLIANCE,
    CONFIG_SOLO_QUEUE_MATCH_MAKER_RATING_DIFFERENCE,
    CONFIG_SOLO_QUEUE_MIN_QUEUE_SIZE,
    CONFIG_SOLO_QUEUE_TEAMMATE_BASE_RATING_DIFFERENCE,
    CONFIG_SOLO_QUEUE_PROGRESSIVE_MMR_THRESHOLD,
    CONFIG_SOLO_QUEUE_DESERTER_TIMER_LEAVE,
    CONFIG_SOLO_QUEUE_DESERTER_TIMER_NOT_ACCEPT,
    CONFIG_SOLO_QUEUE_DESERTER_RATING_PENALTY,
    CONFIG_SOLO_QUEUE_NOT_ACCEPTED_RATING_PENALTY,
    CONFIG_SOLO_QUEUE_TEAMMATE_BLOCKING_TIMER,
    CONFIG_SOLO_QUEUE_AVERAGE_ITEM_LEVEL,
    CONFIG_SOLO_QUEUE_GROUP_RATING_DIFFERENCE,
    CONFIG_SOLO_QUEUE_MIN_PVP_POWER,
    CONFIG_DELETING_ITEM_KEEP_DAYS,
    CONFIG_DELETING_ITEM_MIN_ITEM_LEVEL_EQUIP,
    CONFIG_DELETING_ITEM_MIN_ITEM_LEVEL_OTHER,
    CONFIG_DELETING_ITEM_MIN_QUALITY,
    CONFIG_DELETING_ITEM_MAX_QUALITY,
    CONFIG_CREATURE_PICKPOCKET_REFILL,
    CONFIG_AHBOT_UPDATE_INTERVAL,
    CONFIG_AUCTIONHOUSE_MIN_DIFF_FOR_LOG,
    CONFIG_AUCTIONHOUSE_MIN_DIFF_FOR_THROTTLE,
    CONFIG_BATTLEGROUND_REWARD,
    CONFIG_BATTLEGROUND_GAMES,
    CONFIG_ICORE_RICH_PVP_REWARD,
    CONFIG_ICORE_RICH_PVP_REWARD_CHANCE,
    CONFIG_ICORE_RICH_PVP_REWARD_GAMES,
    CONFIG_ARENA_WIN_STREAK_MOD_LIMIT,
	CONFIG_WORD_FILTER_MUTE_DURATION,
    CONFIG_TIME_IS_MONEY_INTERVAL,
    CONFIG_TIME_IS_MONEY_CREDIT,
    INT_CONFIG_VALUE_COUNT
};

/// Server rates
enum Rates
{
    RATE_HEALTH = 0,
    RATE_POWER_MANA,
    RATE_POWER_RAGE_INCOME,
    RATE_POWER_RAGE_LOSS,
    RATE_POWER_RUNICPOWER_INCOME,
    RATE_POWER_RUNICPOWER_LOSS,
    RATE_POWER_FOCUS,
    RATE_POWER_ENERGY,
    RATE_POWER_CHI,
    RATE_SKILL_DISCOVERY,
    RATE_DROP_ITEM_POOR,
    RATE_DROP_ITEM_NORMAL,
    RATE_DROP_ITEM_UNCOMMON,
    RATE_DROP_ITEM_RARE,
    RATE_DROP_ITEM_EPIC,
    RATE_DROP_ITEM_LEGENDARY,
    RATE_DROP_ITEM_ARTIFACT,
    RATE_DROP_ITEM_REFERENCED,
    RATE_DROP_ITEM_REFERENCED_AMOUNT,
    RATE_DROP_MONEY,
    RATE_XP_KILL,
    RATE_XP_KILL_PREMIUM,
    RATE_XP_QUEST,
    RATE_XP_QUEST_PREMIUM,
    RATE_XP_GUILD_MODIFIER,
    RATE_XP_EXPLORE,
    RATE_XP_GATHER,
    RATE_XP_EXPLORE_PREMIUM,
    RATE_REPAIRCOST,
    RATE_REPUTATION_GAIN,
    RATE_REPUTATION_LOWLEVEL_KILL,
    RATE_REPUTATION_LOWLEVEL_QUEST,
    RATE_REPUTATION_RECRUIT_A_FRIEND_BONUS,
    RATE_CREATURE_NORMAL_HP,
    RATE_CREATURE_ELITE_ELITE_HP,
    RATE_CREATURE_ELITE_RAREELITE_HP,
    RATE_CREATURE_ELITE_WORLDBOSS_HP,
    RATE_CREATURE_ELITE_RARE_HP,
    RATE_CREATURE_NORMAL_DAMAGE,
    RATE_CREATURE_ELITE_ELITE_DAMAGE,
    RATE_CREATURE_ELITE_RAREELITE_DAMAGE,
    RATE_CREATURE_ELITE_WORLDBOSS_DAMAGE,
    RATE_CREATURE_ELITE_RARE_DAMAGE,
    RATE_CREATURE_NORMAL_SPELLDAMAGE,
    RATE_CREATURE_ELITE_ELITE_SPELLDAMAGE,
    RATE_CREATURE_ELITE_RAREELITE_SPELLDAMAGE,
    RATE_CREATURE_ELITE_WORLDBOSS_SPELLDAMAGE,
    RATE_CREATURE_ELITE_RARE_SPELLDAMAGE,
    RATE_CREATURE_AGGRO,
    RATE_MAX_MODW,
    RATE_REST_INGAME,
    RATE_REST_OFFLINE_IN_TAVERN_OR_CITY,
    RATE_REST_OFFLINE_IN_WILDERNESS,
    RATE_DAMAGE_FALL,
    RATE_AUCTION_TIME,
    RATE_AUCTION_DEPOSIT,
    RATE_AUCTION_CUT,
    RATE_HONOR,
    RATE_CORPSE_DECAY_LOOTED,
    RATE_INSTANCE_RESET_TIME,
    RATE_TARGET_POS_RECALCULATION_RANGE,
    RATE_DURABILITY_LOSS_ON_DEATH,
    RATE_DURABILITY_LOSS_DAMAGE,
    RATE_DURABILITY_LOSS_PARRY,
    RATE_DURABILITY_LOSS_ABSORB,
    RATE_DURABILITY_LOSS_BLOCK,
    RATE_MOVESPEED,
    RATE_REPUTATION_GAIN_PREMIUM,
    RATE_HONOR_PREMIUM,
    MAX_RATES
};

/// Can be used in SMSG_AUTH_RESPONSE packet
enum BillingPlanFlags
{
    SESSION_NONE            = 0x00,
    SESSION_UNUSED          = 0x01,
    SESSION_RECURRING_BILL  = 0x02,
    SESSION_FREE_TRIAL      = 0x04,
    SESSION_IGR             = 0x08,
    SESSION_USAGE           = 0x10,
    SESSION_TIME_MIXTURE    = 0x20,
    SESSION_RESTRICTED      = 0x40,
    SESSION_ENABLE_CAIS     = 0x80
};

/// Type of server, this is values from second column of Cfg_Configs.dbc
enum RealmType
{
    REALM_TYPE_NORMAL       = 0,
    REALM_TYPE_PVP          = 1,
    REALM_TYPE_NORMAL2      = 4,
    REALM_TYPE_RP           = 6,
    REALM_TYPE_RPPVP        = 8,
    REALM_TYPE_FFA_PVP      = 16                            // custom, free for all pvp mode like arena PvP in all zones except rest activated places and sanctuaries
                                                            // replaced by REALM_PVP in realm list
};

enum RealmZone
{
    REALM_ZONE_UNKNOWN       = 0,                           // any language
    REALM_ZONE_DEVELOPMENT   = 1,                           // any language
    REALM_ZONE_UNITED_STATES = 2,                           // extended-Latin
    REALM_ZONE_OCEANIC       = 3,                           // extended-Latin
    REALM_ZONE_LATIN_AMERICA = 4,                           // extended-Latin
    REALM_ZONE_TOURNAMENT_5  = 5,                           // basic-Latin at create, any at login
    REALM_ZONE_KOREA         = 6,                           // East-Asian
    REALM_ZONE_TOURNAMENT_7  = 7,                           // basic-Latin at create, any at login
    REALM_ZONE_ENGLISH       = 8,                           // extended-Latin
    REALM_ZONE_GERMAN        = 9,                           // extended-Latin
    REALM_ZONE_FRENCH        = 10,                          // extended-Latin
    REALM_ZONE_SPANISH       = 11,                          // extended-Latin
    REALM_ZONE_RUSSIAN       = 12,                          // Cyrillic
    REALM_ZONE_TOURNAMENT_13 = 13,                          // basic-Latin at create, any at login
    REALM_ZONE_TAIWAN        = 14,                          // East-Asian
    REALM_ZONE_TOURNAMENT_15 = 15,                          // basic-Latin at create, any at login
    REALM_ZONE_CHINA         = 16,                          // East-Asian
    REALM_ZONE_CN1           = 17,                          // basic-Latin at create, any at login
    REALM_ZONE_CN2           = 18,                          // basic-Latin at create, any at login
    REALM_ZONE_CN3           = 19,                          // basic-Latin at create, any at login
    REALM_ZONE_CN4           = 20,                          // basic-Latin at create, any at login
    REALM_ZONE_CN5           = 21,                          // basic-Latin at create, any at login
    REALM_ZONE_CN6           = 22,                          // basic-Latin at create, any at login
    REALM_ZONE_CN7           = 23,                          // basic-Latin at create, any at login
    REALM_ZONE_CN8           = 24,                          // basic-Latin at create, any at login
    REALM_ZONE_TOURNAMENT_25 = 25,                          // basic-Latin at create, any at login
    REALM_ZONE_TEST_SERVER   = 26,                          // any language
    REALM_ZONE_TOURNAMENT_27 = 27,                          // basic-Latin at create, any at login
    REALM_ZONE_QA_SERVER     = 28,                          // any language
    REALM_ZONE_CN9           = 29,                          // basic-Latin at create, any at login
    REALM_ZONE_TEST_SERVER_2 = 30,                          // any language
    REALM_ZONE_CN10          = 31,                          // basic-Latin at create, any at login
    REALM_ZONE_CTC           = 32,
    REALM_ZONE_CNC           = 33,
    REALM_ZONE_CN1_4         = 34,                          // basic-Latin at create, any at login
    REALM_ZONE_CN2_6_9       = 35,                          // basic-Latin at create, any at login
    REALM_ZONE_CN3_7         = 36,                          // basic-Latin at create, any at login
    REALM_ZONE_CN5_8         = 37                           // basic-Latin at create, any at login
};

enum WorldStates
{
    WS_WEEKLY_QUEST_RESET_TIME  = 20002,                     // Next weekly reset time
    WS_BG_DAILY_RESET_TIME      = 20003,                     // Next daily BG reset time
    WS_CLEANING_FLAGS           = 20004,                     // Cleaning Flags
    WS_GUILD_DAILY_RESET_TIME   = 20006,                     // Next guild cap reset time
    WS_MONTHLY_QUEST_RESET_TIME = 20007,                     // Next monthly reset time
    WS_ARENA_SEASON_WEEK        = 20008,                     // Current week of the arena season
    WS_ARENA_SEASON_ID          = 20009,                     // Current season id

    // Cata specific custom worldstates
    WS_GUILD_WEEKLY_RESET_TIME  = 20050,                     // Next guild week reset time
};

typedef std::unordered_map<uint32, WorldSession*> SessionMap;

#define MAX_DECLINED_NAME_CASES 5

struct DeclinedName
{
    std::string name[MAX_DECLINED_NAME_CASES];
};

struct CharacterNameData
{
    ~CharacterNameData() { delete m_declinedName; }

    std::string m_name;
    uint8 m_class;
    uint8 m_race;
    uint8 m_gender;
    uint8 m_level;
    uint32 m_accountID;
    DeclinedName const* m_declinedName = nullptr;
};

struct AccountCacheData
{
    uint32 MemberID = 0;
};

struct AutoBroadcastEntry
{
    template<class T>
    struct Optional
    {
        bool HasValue = false;
        T Value;
    };
    struct ScheduleData
    {
        struct Part
        {
            bool Valid = true;

            bool Any = false;
            Optional<uint8> AcceptedValue;
            Optional<std::set<uint8>> AcceptedValues;
            Optional<std::pair<uint8, uint8>> AcceptedRange;

            uint8 Denominator = 0;

            void Set(std::string dbData);

            bool Satisfies(uint8 value) const;

        private:
            bool SatisfiesValue(uint8 const& value) const;
            bool SatisfiesDenominator(uint8 const& value) const;

            bool ValidateValue(uint32 value);
            uint8 ParseToken(std::string token);
        };

        ScheduleData(std::string const& dbData);

        bool Valid = false;

        Part Minute;
        Part Hour;
        Part Day;
        Part Month;
        Part Weekday;

        bool Satisfies(tm const& lt) const;
    };

    AutoBroadcastEntry(int32 id, std::string const& text, std::string const& scheduleData) : ID(id), Text(text), Schedule(scheduleData) { }

    int32 ID;
    std::string Text;
    ScheduleData Schedule;

    time_t CooldownUntil = 0;

    void Update(time_t const& now, tm const& lt);
};

class BonusRatesEntry
{
    public:
        void Load(Field* fields);

        void Update(time_t const& now, tm const& lt);

        bool IsActive() const { return m_active; }
        void SetActive(bool active);
        bool IsAffectingRate(char const* rateConfigName) const;
        float GetMultiplier() const { return m_multiplier; }

        std::string const& GetActiveAnnouncement() const { return m_activeAnnouncement; }

    private:
        bool m_active = false;
        bool m_activatedBySchedule = false;
        time_t m_timeToDeactivate = 0;

        uint32 m_id;
        std::vector<AutoBroadcastEntry::ScheduleData> m_schedules;
        float m_multiplier;
        std::unordered_set<std::string> m_rates;
        std::string m_startAnnouncement;
        std::string m_endAnnouncement;
        std::string m_activeAnnouncement;
};

// Contains project-specific info about a website account. Loaded when any game account associated with the website account first logs in, stored globally, synchronized with cross-server.
struct projectMemberInfo
{
    // Don't change the order, used in DB
    enum class Setting : uint32
    {
        Undefined,

        RateXPKill,
        RateXPQuest,
        RateReputation,
        RateHonor,
        ServerBirthday2016,
        NotificationLevelUp,
        NotificationReputationRank,
        NotificationQuestComplete,
        NotificationTrade,
        NotificationMail,
        NotificationRMT,
        NotificationRaidInvite,
        NotificationRaidConvert,
        NotificationBattlegroundQueue,
        NotificationArenaQueue,
        AutoAcceptprojectDailyQuests,
        SoloArenaBanUnbanDate,
        SoloArenaBanBannedBy,
        VoteBonusEndDateMMOTOP,
        VoteBonusEndDateMMOVOTE,
        NotificationVotingBonusStarted,
        NotificationVotingBonusExpired,
        BattlegroundLadderReportChanges,
        NotificationBattlegroundLadder,
        PromocodesRedemptionData,
        ServerBirthday2017,
        ServerBirthday2018,
        CollectionsSkinUnlockMessage,
        NotificationCollections,
        QueueAnnounceArenaTirion,
        QueueAnnounceBattlegroundTirion,
        QueueAnnounceArenaHorizon,
        QueueAnnounceBattlegroundHorizon,
        QueueAnnounceRaidFinder,
        InstanceRunParticipation,
        InstanceRunNotifications,
        CrossFactionBGMirrorImageMode,
        BattlegroundRatingDeserterData,
        NotificationArenaRewards,
        NotificationArenaWinStreak,
        NotificationArenaRBGRewards,
        NotificationBGRewards,
    };
    enum class SettingType : uint8
    {
        Undefined,

        Bool,
        UInt32,
        Float,
        String,
    };
    struct SettingValue
    {
        union
        {
            bool Bool;
            uint32 UInt32;
            float Float;
        };
        std::string String;

        SettingValue() : UInt32(0) { }
        SettingValue(bool value) : Bool(value) { }
        SettingValue(uint32 value) : UInt32(value) { }
        SettingValue(float value) : Float(value) { }
        SettingValue(std::string const& value) : String(value) { }

        template<typename T, typename = typename std::enable_if<std::is_enum<T>::value || std::is_integral<T>::value>::type> T As() const { return static_cast<T>(UInt32); }
        template<typename T, typename = typename std::enable_if<std::is_enum<T>::value || std::is_integral<T>::value>::type> static SettingValue From(T value) { return { static_cast<uint32>(value) }; }
    };
    struct SettingDefault
    {
        SettingType Type;
        SettingValue Value;

        template<class T>
        static SettingDefault Make(T const& value);
    };

    static std::map<Setting, SettingDefault> const SettingDefaults;

    // Game accounts the user logging in with at least once during this server session. Only used to speed up online account lookup, no need to sync it.
    std::unordered_set<uint32> GameAccountIDs;

    // Because need to find it at cross;
    uint32 MemberID;

    bool PremiumActive = false;
    time_t PremiumUnsetDate = 0;

    bool IsVerified = false;

    std::map<Setting, SettingValue> Settings;

    // Feature: project Daily Quests
    uint32 CompletedDailyQuestsCount = 0;
    std::set<uint32> CompletedDailyQuestExclusiveGroups;

    // Feature: Notifications
    enum class Notification : uint8
    {
        LevelUp,
        ReputationRank,
        QuestComplete,
        Trade,
        Mail,
        RMT,
        RaidInvite,
        RaidConvert,
        BattlegroundQueue,
        ArenaQueue,
        VotingBonusStarted,
        VotingBonusExpired,
        BattlegroundLadder, // unused
        Collections, // unused
        ArenaRewards,
        ArenaWinStreak,
        ArenaRBGRewards,
        BGRewards,
    };
    struct NotificationData
    {
        char const* TextConfigName;
        projectMemberInfo::Setting Setting;
        time_t Cooldown;

        std::string GetFullConfigName() const { return std::string("ICore.Notifications.") + TextConfigName; }
    };
    static std::map<Notification, NotificationData> const NotificationsData;
    std::map<Notification, time_t> NotificationCooldowns;

    // Feature: Voting
    bool ActiveVotingBonusesUpdated = false; // False whenever the player logs in for the first time during current server uptime
    std::set<Setting> ActiveVotingBonuses;

    void Write(ByteBuffer& data) const
    {
        Write<uint8 >(data, PremiumActive);
        Write<uint64>(data, PremiumUnsetDate);

        Write<uint8 >(data, IsVerified);

        Write<uint32>(data, Settings.size());
        for (auto&& value : Settings)
        {
            Write<uint32>(data, value.first);
            Write<uint32>(data, value.second.UInt32);
            Write<std::string>(data, value.second.String);
        }

        Write<uint32>(data, CompletedDailyQuestsCount);
        Write<uint32>(data, CompletedDailyQuestExclusiveGroups.size());
        for (auto&& value : CompletedDailyQuestExclusiveGroups)
            Write<uint32>(data, value);

        Write<uint32>(data, NotificationCooldowns.size());
        for (auto&& value : NotificationCooldowns)
        {
            Write<uint32>(data, value.first);
            Write<time_t>(data, value.second);
        }
    }
    void Read(ByteBuffer& data)
    {
        uint32 size;

        Read<uint8 >(data, PremiumActive);
        Read<uint64>(data, PremiumUnsetDate);

        Read<uint8 >(data, IsVerified);

        Read<uint32>(data, size);
        Settings.clear();
        for (uint32 i = 0; i < size; ++i)
        {
            uint32 setting;
            Read<uint32>(data, setting);

            SettingValue& value = Settings[(Setting)setting];
            Read<uint32>(data, value.UInt32);
            Read<std::string>(data, value.String);
        }

        Read<uint32>(data, CompletedDailyQuestsCount);
        Read<uint32>(data, size);
        CompletedDailyQuestExclusiveGroups.clear();
        for (uint32 i = 0; i < size; ++i)
            CompletedDailyQuestExclusiveGroups.insert(data.read<uint32>());

        Read<uint32>(data, size);
        NotificationCooldowns.clear();
        for (uint32 i = 0; i < size; ++i)
        {
            uint32 notification;
            Read<uint32>(data, notification);
            Read<time_t>(data, NotificationCooldowns[(Notification)notification]);
        }
    }

    template<class TData, class TField>
    static void Write(ByteBuffer& data, TField const& field)
    {
        data << TData(field);
    }
    template<class TData, class TField>
    static void Read(ByteBuffer& data, TField& field)
    {
        TData temp;
        data >> temp;
        field = temp;
    }

    void SyncWithCross();

    bool IsPremium();
    time_t GetPremiumUnsetDate();

    SettingValue const& GetSetting(Setting setting) const;
    void SetSetting(Setting setting, SettingValue const& value, SQLTransaction&& trans = nullptr);

    float GetRate(Rates rate, bool maximum = false);

    bool IsDailyQuestsFeatureAvailable();
    bool CanCompleteMoreDailyQuests();
    uint32 GetRemainingDailyQuestsToday();
    uint32 GetMaximumDailyQuestCount();
    uint32 GetPremiumQuestRewardBonus(Quest const* quest);
    uint32 GetVotingQuestRewardBonus(Quest const* quest);
    void GetVotingRewardBonus(uint32& totalPct, uint32& totalFlat);
    void GetVotingStats(uint32& count, uint32& total);
    Setting GetVotingSetting(uint32 webSourceId);
    std::vector<std::tuple<char const*, bool, time_t, uint32, uint32>> GetRewardBonuses();
    void ModifyQuestReward(Quest const* quest, uint32 index, uint32& id, uint32& count);

    bool Notify(Player* player, Notification notification, ...);
    bool Notify(Player* player, std::initializer_list<Notification> notifications);
};

template<> inline projectMemberInfo::SettingDefault projectMemberInfo::SettingDefault::Make<bool>(bool const& value) { return SettingDefault{ SettingType::Bool, SettingValue(value) }; }
template<> inline projectMemberInfo::SettingDefault projectMemberInfo::SettingDefault::Make<uint32>(uint32 const& value) { return SettingDefault{ SettingType::UInt32, SettingValue(value) }; }
template<> inline projectMemberInfo::SettingDefault projectMemberInfo::SettingDefault::Make<float>(float const& value) { return SettingDefault{ SettingType::Float, SettingValue(value) }; }
template<> inline projectMemberInfo::SettingDefault projectMemberInfo::SettingDefault::Make<std::string>(std::string const& value) { return SettingDefault{ SettingType::String, SettingValue(value) }; }

template <typename ConfigEnum, typename UnderlyingType, int Size>
class ConfigStorage
{
public:
    UnderlyingType& operator[](ConfigEnum enumVal)
    {
        return _storage[enumVal];
    }

    UnderlyingType const& operator[](ConfigEnum enumVal) const
    {
        return _storage[enumVal];
    }


private:
    UnderlyingType _storage[Size];
};

/// The World
class World
{
        World();
        ~World();
    public:
        static ACE_Atomic_Op<ACE_Thread_Mutex, uint32> m_worldLoopCounter;

        static World* instance()
        {
            static World _instance;
            return &_instance;
        }

        WorldSession* FindSession(uint32 id) const;
        void AddSession(WorldSession* s);
        bool RemoveSession(uint32 id);

        /// Autobroadcast
        void SendAutoBroadcast();
        /// Get the number of current active sessions
        void UpdateMaxSessionCounters();
        const SessionMap& GetAllSessions() const { return m_sessions; }
        uint32 GetActiveAndQueuedSessionCount() const { return m_sessions.size(); }
        uint32 GetActiveSessionCount() const { return m_sessions.size() - m_QueuedPlayer.size(); }
        uint32 GetQueuedSessionCount() const { return m_QueuedPlayer.size(); }
        /// Get the maximum number of parallel sessions on the server since last reboot
        uint32 GetMaxQueuedSessionCount() const { return m_maxQueuedSessionCount; }
        uint32 GetMaxActiveSessionCount() const { return m_maxActiveSessionCount; }
        /// Get number of players
        inline uint32 GetPlayerCount() const { return m_PlayerCount; }
        inline uint32 GetMaxPlayerCount() const { return m_MaxPlayerCount; }
        /// Increase/Decrease number of players
        inline void IncreasePlayerCount()
        {
            m_PlayerCount++;
            m_MaxPlayerCount = std::max(m_MaxPlayerCount, m_PlayerCount);
        }
        inline void DecreasePlayerCount() { m_PlayerCount--; }

        Player* FindPlayerInZone(uint32 zone);

        /// Deny clients?
        bool IsClosed() const;

        /// Close world
        void SetClosed(bool val);

        /// Security level limitations
        AccountTypes GetPlayerSecurityLimit() const { return m_allowedSecurityLevel; }
        void SetPlayerSecurityLimit(AccountTypes sec);
        void LoadDBAllowedSecurityLevel();

        /// Active session server limit
        void SetPlayerAmountLimit(uint32 limit) { m_playerLimit = limit; }
        uint32 GetPlayerAmountLimit() const { return m_playerLimit; }

        //player Queue
        typedef std::list<WorldSession*> Queue;
        void AddQueuedPlayer(WorldSession*);
        bool RemoveQueuedPlayer(WorldSession* session);
        int32 GetQueuePos(WorldSession*);
        bool HasRecentlyDisconnected(WorldSession*);

        /// @todo Actions on m_allowMovement still to be implemented
        /// Is movement allowed?
        bool getAllowMovement() const { return m_allowMovement; }
        /// Allow/Disallow object movements
        void SetAllowMovement(bool allow) { m_allowMovement = allow; }

        /// Set a new Message of the Day
        void SetMotd(std::string const& motd);
        /// Get the current Message of the Day
        const char* GetMotd() const;

        /// Set the string for new characters (first login)
        void SetNewCharString(std::string const& str) { m_newCharString = str; }
        /// Get the string for new characters (first login)
        std::string const& GetNewCharString() const { return m_newCharString; }

        LocaleConstant GetDefaultDbcLocale() const { return m_defaultDbcLocale; }

        /// Get the path where data (dbc, maps) are stored on disk
        std::string const& GetDataPath() const { return m_dataPath; }

        /// When server started?
        time_t const& GetStartTime() const { return m_startTime; }
        /// What time is it?
        time_t const& GetGameTime() const { return m_gameTime; }
        /// Uptime (in secs)
        uint32 GetUptime() const { return uint32(m_gameTime - m_startTime); }
        /// Update time
        uint32 GetUpdateTime() const { return m_updateTime; }
        void SetRecordDiffInterval(int32 t) { if (t >= 0) m_int_configs[CONFIG_INTERVAL_LOG_UPDATE] = (uint32)t; }

        /// Next daily quests and random bg reset time
        time_t GetNextDailyQuestsResetTime() const { return m_NextDailyQuestReset; }
        time_t GetNextWeeklyQuestsResetTime() const { return m_NextWeeklyQuestReset; }
        time_t GetNextRandomBGResetTime() const { return m_NextRandomBGReset; }

        /// Get the maximum skill level a player can reach
        uint16 GetConfigMaxSkillValue() const
        {
            uint8 lvl = uint8(getIntConfig(CONFIG_MAX_PLAYER_LEVEL));
            return lvl > 85 ? 525 + ((lvl - 85) * 75) / 5 :
                   lvl > 80 ? 450 + ((lvl - 80) * 75) / 5 :
                   lvl > 60 ? 300 + ((lvl - 60) * 75) / 10 : lvl * 5;
        }

        void SetInitialWorldSettings();
        void LoadConfigSettings(bool reload = false);
        void LoadRates(bool loading = false);

        void SendWorldText(int32 string_id, ...);
        void SendGlobalText(const char* text, WorldSession* self);
        void SendGMText(int32 string_id, ...);
        void SendGlobalMessage(WorldPacket* packet, WorldSession* self = 0, uint32 team = 0);
        void SendGlobalMessage(WorldPacket* packet, AccountTypes security, WorldSession* self = 0, uint32 team = 0);
        void SendGlobalGMMessage(WorldPacket* packet, WorldSession* self = 0, uint32 team = 0);
        void SendZoneMessage(uint32 zone, WorldPacket* packet, WorldSession* self = 0, uint32 team = 0);
        void SendZoneText(uint32 zone, const char *text, WorldSession* self = 0, uint32 team = 0);
        void SendServerMessage(ServerMessageType type, const char *text = "", Player* player = NULL);

        /// Are we in the middle of a shutdown?
        bool IsShuttingDown() const { return m_ShutdownTimer > 0; }
        uint32 GetShutDownTimeLeft() const { return m_ShutdownTimer; }
        void ShutdownServ(uint32 time, uint32 options, uint8 exitcode);
        void ShutdownCancel();
        void ShutdownMsg(bool show = false, Player* player = NULL);
        static uint8 GetExitCode() { return m_ExitCode; }
        static void StopNow(uint8 exitcode) { m_stopEvent = true; m_ExitCode = exitcode; }
        static bool IsStopped() { return m_stopEvent.value(); }

        void Update(uint32 diff);

        void UpdateSessions(uint32 diff);
        /// Set a server rate (see #Rates)
        void setRate(Rates rate, float value) { rate_values[rate]=value; }
        /// Get a server rate (see #Rates)
        float getRate(Rates rate) const { return rate_values[rate]; }
        float getRate(Rates rate, Player* player) const;
        float getRate(Rates rate, WorldSession* session) const;

        /// Bonus rates on schedule
        std::map<uint32, BonusRatesEntry> const& GetBonusRates() const { return m_bonusRates; }
        void UpdateBonusRatesState();

        /// Set a server configuration element (see #WorldConfigs)
        void setBoolConfig(WorldBoolConfigs index, bool value)
        {
            if (index < BOOL_CONFIG_VALUE_COUNT)
                m_bool_configs[index] = value;
        }

        /// Get a server configuration element (see #WorldConfigs)
        bool getBoolConfig(WorldBoolConfigs index) const
        {
            return index < BOOL_CONFIG_VALUE_COUNT ? m_bool_configs[index] : 0;
        }

        /// Set a server configuration element (see #WorldConfigs)
        void setFloatConfig(WorldFloatConfigs index, float value)
        {
            if (index < FLOAT_CONFIG_VALUE_COUNT)
                m_float_configs[index] = value;
        }

        /// Get a server configuration element (see #WorldConfigs)
        float getFloatConfig(WorldFloatConfigs index) const
        {
            return index < FLOAT_CONFIG_VALUE_COUNT ? m_float_configs[index] : 0;
        }

        /// Set a server configuration element (see #WorldConfigs)
        void setIntConfig(WorldIntConfigs index, uint32 value)
        {
            if (index < INT_CONFIG_VALUE_COUNT)
                m_int_configs[index] = value;
        }

        /// Get a server configuration element (see #WorldConfigs)
        uint32 getIntConfig(WorldIntConfigs index) const
        {
            return index < INT_CONFIG_VALUE_COUNT ? m_int_configs[index] : 0;
        }

        void setWorldState(uint32 index, uint64 value);
        uint64 getWorldState(uint32 index) const;
        void LoadWorldStates();

        /// Are we on a "Player versus Player" server?
        bool IsPvPRealm() const { return (getIntConfig(CONFIG_GAME_TYPE) == REALM_TYPE_PVP || getIntConfig(CONFIG_GAME_TYPE) == REALM_TYPE_RPPVP || getIntConfig(CONFIG_GAME_TYPE) == REALM_TYPE_FFA_PVP); }
        bool IsFFAPvPRealm() const { return getIntConfig(CONFIG_GAME_TYPE) == REALM_TYPE_FFA_PVP; }

        void KickAll();
        void KickAllLess(AccountTypes sec);
        BanReturn BanAccount(BanMode mode, std::string const& nameOrIP, std::string const& duration, std::string const& reason, std::string const& author);
        BanReturn BanAccount(BanMode mode, std::string const& nameOrIP, uint32 duration_secs, std::string const& reason, std::string const& author);
        bool RemoveBanAccount(BanMode mode, std::string const& nameOrIP);
        BanReturn BanCharacter(std::string const& name, std::string const& duration, std::string const& reason, std::string const& author);
        bool RemoveBanCharacter(std::string const& name);

        // for max speed access
        static float GetMaxVisibleDistanceOnContinents()    { return m_MaxVisibleDistanceOnContinents; }
        static float GetMaxVisibleDistanceInInstances()     { return m_MaxVisibleDistanceInInstances;  }
        static float GetMaxVisibleDistanceInBGArenas()      { return m_MaxVisibleDistanceInBGArenas;   }

        static int32 GetVisibilityNotifyPeriodOnContinents(){ return m_visibility_notify_periodOnContinents; }
        static int32 GetVisibilityNotifyPeriodInInstances() { return m_visibility_notify_periodInInstances;  }
        static int32 GetVisibilityNotifyPeriodInBGArenas()  { return m_visibility_notify_periodInBGArenas;   }

        static float Visibility_RelocationLowerLimit;
        static uint32 Visibility_AINotifyDelay;

        void ProcessCliCommands();
        void QueueCliCommand(CliCommandHolder* commandHolder) { cliCmdQueue.add(commandHolder); }

        void ForceGameEventUpdate();

        void UpdateRealmCharCount(uint32 accid);

        LocaleConstant GetAvailableDbcLocale(LocaleConstant locale) const { if (m_availableDbcLocaleMask & (1 << locale)) return locale; else return m_defaultDbcLocale; }

        // used World DB version
        void LoadDBVersion();
        char const* GetDBVersion() const { return m_DBVersion.c_str(); }

        void RecordTimeDiff(const char * text, ...);
        void RecordTimeDiff(uint32 diff, char const* text, ...);
        void RecordTimeDiffLocal(TimeValue const& start, char const* msg, ...);

        void LoadAutobroadcasts();

        void UpdateAreaDependentAuras();

        void ProcessStartEvent();
        void ProcessStopEvent();
        bool GetEventKill() const { return isEventKillStart; }

        bool isEventKillStart;

        CharacterNameData const* GetCharacterNameData(uint32 guid) const;
        void AddCharacterNameData(uint32 guid, std::string const& name, uint8 gender, uint8 race, uint8 playerClass, uint8 level);
        void UpdateCharacterNameData(uint32 guid, std::string const& name, uint8 gender = GENDER_NONE, uint8 race = RACE_NONE, DeclinedName const* declinedName = nullptr);
        void UpdateCharacterNameDataLevel(uint32 guid, uint8 level);
        void UpdateCharacterNameDataClass(uint32 guid, uint8 classID);
        void UpdateCharacterNameDataAccount(uint32 guid, uint32 account);
        void DeleteCharacterNameData(uint32 guid) { _characterNameDataMap.erase(guid); }
        bool HasCharacterNameData(uint32 guid) { return _characterNameDataMap.find(guid) != _characterNameDataMap.end(); }

        AccountCacheData& GetAccountCacheData(uint32 accountId);
        void UpdateAccountCacheDataMemberID(uint32 accountId, uint32 memberId);

        bool AreprojectDailyQuestsEnabled() const { return getBoolConfig(CONFIG_ICORE_project_DAILY_QUESTS_ENABLED); }
        uint32 GetTodaysprojectDailyDay() const;
        void LoadprojectDailyQuestRelations();
        std::vector<Quest const*> const* GetprojectDailyQuestRelation(uint32 entry);
        void ResetprojectDailyQuests();

        uint32 GetprojectMemberID(uint32 accountId);
        bool LoadprojectMemberInfoIfNeeded(uint32 accountId);
        void AddprojectMemberInfo(uint32 memberId, projectMemberInfo const& info);
        projectMemberInfo* GetprojectMemberInfo(uint32 memberId, bool logError = true);
        void SendprojectMemberInfoContainer();

        uint32 GetCleaningFlags() const { return m_CleaningFlags; }
        void   SetCleaningFlags(uint32 flags) { m_CleaningFlags = flags; }
        void   ResetEventSeasonalQuests(uint16 event_id);

        void UpdatePhaseDefinitions();

        DevToolType GetDevToolType(uint32 accountId) { return m_devToolSettings[accountId].first; }
        DevToolSettings*& GetDevToolSettings(uint32 accountId) { return m_devToolSettings[accountId].second; }
        DevToolSettings*& SetDevTool(uint32 accountId, DevToolType type) { m_devToolSettings[accountId].first = type; return m_devToolSettings[accountId].second; }

        void OnStartup();
        std::thread::id GetThreadId() const { return m_threadId; }

        // Dumb shit for arena logging, ignore
        bool IsArenaPrecastSpell(uint32 spellID) const { return m_arenaPrecastSpells.find(spellID) != m_arenaPrecastSpells.end(); }
        std::set<uint32> m_arenaPrecastSpells;

        void SendRaidQueueInfo(Player* player = nullptr);

        union DebugValue { uint32 UInt32; float Float; };
        DebugValue & GetDebugValue(uint32 id) { return m_debugValues[id]; }

    protected:
        void _UpdateGameTime();
        // callback for UpdateRealmCharacters
        void _UpdateRealmCharCount(PreparedQueryResult resultCharCount);

        void InitDailyQuestResetTime();
        void InitWeeklyQuestResetTime();
        void InitMonthlyQuestResetTime();
        void InitRandomBGResetTime();
        void InitGuildResetTime();
        void InitCurrencyResetTime();
        void ResetDailyQuests();
        void ResetWeeklyQuests();
        void ResetMonthlyQuests();
        void ResetRandomBG();
        void ResetGuildCap();
        void ResetCurrencyWeekCap();
        void ResetLootLockouts();

        void DBCleanup();

    private:
        static ACE_Atomic_Op<ACE_Thread_Mutex, bool> m_stopEvent;
        static uint8 m_ExitCode;
        uint32 m_ShutdownTimer;
        uint32 m_ShutdownMask;

        uint32 m_CleaningFlags;

        bool m_isClosed;

        time_t m_startTime;
        time_t m_gameTime;
        IntervalTimer m_timers[WUPDATE_COUNT];
        time_t mail_timer;
        time_t mail_timer_expires;
        uint32 m_updateTime, m_updateTimeSum;
        uint32 m_currentTime;

        SessionMap m_sessions;
        typedef std::unordered_map<uint32, time_t> DisconnectMap;
        DisconnectMap m_disconnects;
        uint32 m_maxActiveSessionCount;
        uint32 m_maxQueuedSessionCount;
        uint32 m_PlayerCount;
        uint32 m_MaxPlayerCount;

        std::map<uint32, projectMemberInfo> m_projectMemberInfos;
        ACE_RW_Thread_Mutex m_projectMemberInfosLock;
        void UpdateprojectMemberInfos();

        std::string m_newCharString;

        float rate_values[MAX_RATES];
        std::map<uint32, BonusRatesEntry> m_bonusRates;

        typedef ConfigStorage<WorldIntConfigs, uint32, INT_CONFIG_VALUE_COUNT> IntConfig;
        typedef ConfigStorage<WorldBoolConfigs, bool, BOOL_CONFIG_VALUE_COUNT> BoolConfig;
        typedef ConfigStorage<WorldFloatConfigs, float, FLOAT_CONFIG_VALUE_COUNT> FloatConfig;

        IntConfig m_int_configs;
        BoolConfig m_bool_configs;
        FloatConfig m_float_configs;

        typedef std::map<uint32, uint64> WorldStatesMap;
        WorldStatesMap m_worldstates;
        uint32 m_playerLimit;
        AccountTypes m_allowedSecurityLevel;
        LocaleConstant m_defaultDbcLocale;                     // from config for one from loaded DBC locales
        uint32 m_availableDbcLocaleMask;                       // by loaded DBC
        bool m_allowMovement;
        std::string m_motd;
        std::string m_dataPath;

        // for max speed access
        static float m_MaxVisibleDistanceOnContinents;
        static float m_MaxVisibleDistanceInInstances;
        static float m_MaxVisibleDistanceInBGArenas;

        static int32 m_visibility_notify_periodOnContinents;
        static int32 m_visibility_notify_periodInInstances;
        static int32 m_visibility_notify_periodInBGArenas;

        // CLI command holder to be thread safe
        ACE_Based::LockedQueue<CliCommandHolder*, ACE_Thread_Mutex> cliCmdQueue;

        // scheduled reset times
        time_t m_NextDailyQuestReset;
        time_t m_NextWeeklyQuestReset;
        time_t m_NextMonthlyQuestReset;
        time_t m_NextRandomBGReset;
        time_t m_NextGuildReset;
        time_t m_nextCurrencyReset;

        //Player Queue
        Queue m_QueuedPlayer;

        // sessions that are added async
        void AddSession_(WorldSession* s);
        ACE_Based::LockedQueue<WorldSession*, ACE_Thread_Mutex> addSessQueue;

        // used versions
        std::string m_DBVersion;

        typedef std::map<uint8, std::string> AutobroadcastsMap;
        AutobroadcastsMap m_autobroadcasts;

        typedef std::map<uint8, uint8> AutobroadcastsWeightMap;
        AutobroadcastsWeightMap m_autobroadcastsWeights;

        std::map<uint32, CharacterNameData> _characterNameDataMap;
        void LoadCharacterNameData();
        void LoadAccountCacheData();

        std::map<uint32, AccountCacheData> _accountCacheData;
        ACE_RW_Thread_Mutex _accountCacheDataLock;

        void ProcessQueryCallbacks();
        ACE_Future_Set<PreparedQueryResult> m_realmCharCallbacks;

        uint32 m_minDiff = 0;
        uint32 m_maxDiff = 0;
        uint32 m_statDiffCounter = 0;
        std::thread::id m_threadId;

        std::map<uint32, std::pair<DevToolType, DevToolSettings*>> m_devToolSettings;

        std::map<uint32, DebugValue> m_debugValues;
};

typedef std::map<uint32, std::string> RealmNameMap;

extern RealmNameMap realmNameStore;
extern uint32 realmID;

#define sWorld World::instance()

#define ENSURE_WORLD_THREAD() ASSERT(std::this_thread::get_id() == sWorld->GetThreadId())

#endif
/// @}
