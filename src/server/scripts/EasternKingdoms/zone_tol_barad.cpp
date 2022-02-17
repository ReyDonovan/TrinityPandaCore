#include "ScriptPCH.h"
#include "BattlefieldMgr.h"
#include "BattlefieldTB.h"
#include "Battlefield.h"
#include "ScriptSystem.h"
#include "WorldSession.h"
#include "ObjectMgr.h"

enum eTBqueuenpctext
{
    TB_NPCQUEUE_TEXT_H_NOWAR       = 110006,
    TB_NPCQUEUE_TEXT_H_QUEUE       = 110002,
    TB_NPCQUEUE_TEXT_H_WAR         = 110005,
    TB_NPCQUEUE_TEXT_A_NOWAR       = 110003,
    TB_NPCQUEUE_TEXT_A_QUEUE       = 110001,
    TB_NPCQUEUE_TEXT_A_WAR         = 110004,
    TB_NPCQUEUE_TEXTOPTION_JOIN    = -1732009,
};

enum TBSpiritGuide
{
    SPELL_CHANNEL_SPIRIT_HEAL = 22011,

    GOSSIP_OPTION_ID_SLAGWORKS = 0,
    GOSSIP_OPTION_ID_IRONCLAD_GARRISON = 1,
    GOSSIP_OPTION_ID_WARDENS_VIGIL = 2,
    GOSSIP_OPTION_ID_EAST_SPIRE = 3,
    GOSSIP_OPTION_ID_WEST_SPIRE = 4,
    GOSSIP_OPTION_ID_SOUTH_SPIRE = 5,
};

class npc_tb_spirit_guide : public CreatureScript
{
public:
    npc_tb_spirit_guide() : CreatureScript("npc_tb_spirit_guide") { }

    struct npc_tb_spirit_guideAI : public ScriptedAI
    {
        npc_tb_spirit_guideAI(Creature* creature) : ScriptedAI(creature) { }

        void UpdateAI(uint32 /*diff*/) override
        {
            if (!me->HasUnitState(UNIT_STATE_CASTING))
                DoCast(me, SPELL_CHANNEL_SPIRIT_HEAL);
        }

        void sGossipSelect(Player* player, uint32 /*menuId*/, uint32 gossipListId) override
        {
            player->PlayerTalkClass->SendCloseGossip();

            uint32 areaId = 0;
            switch (gossipListId)
            {
            case GOSSIP_OPTION_ID_SLAGWORKS:
                areaId = TB_GY_SLAGWORKS;
                break;
            case GOSSIP_OPTION_ID_IRONCLAD_GARRISON:
                areaId = TB_GY_IRONCLAD_GARRISON;
                break;
            case GOSSIP_OPTION_ID_WARDENS_VIGIL:
                areaId = TB_GY_WARDENS_VIGIL;
                break;
            case GOSSIP_OPTION_ID_EAST_SPIRE:
                areaId = TB_GY_EAST_SPIRE;
                break;
            case GOSSIP_OPTION_ID_WEST_SPIRE:
                areaId = TB_GY_WEST_SPIRE;
                break;
            case GOSSIP_OPTION_ID_SOUTH_SPIRE:
                areaId = TB_GY_SOUTH_SPIRE;
                break;
            default:
                return;
            }

            if (WorldSafeLocsEntry const* safeLoc = sWorldSafeLocsStore.LookupEntry(areaId))
                player->TeleportTo(safeLoc->map_id, safeLoc->x, safeLoc->y, safeLoc->z, 0);
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new npc_tb_spirit_guideAI(creature);
    }
};

class npc_tol_barad_battlemage : public CreatureScript
{
    public:
        npc_tol_barad_battlemage() : CreatureScript("npc_tol_barad_battlemage") { }

        bool OnGossipHello(Player* player, Creature* creature) override
        {
            if (creature->IsQuestGiver())
                player->PrepareQuestMenu(creature->GetGUID());

            Battlefield* BfTB = sBattlefieldMgr->GetBattlefieldByBattleId(BATTLEFIELD_BATTLEID_TB);
            if (BfTB)
            {
                if (BfTB->IsWarTime())
                {
                    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(TB_NPCQUEUE_TEXTOPTION_JOIN), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
                    player->SEND_GOSSIP_MENU(BfTB->GetDefenderTeam() ? TB_NPCQUEUE_TEXT_H_WAR : TB_NPCQUEUE_TEXT_A_WAR, creature->GetGUID());
                }
                else
                {
                    uint32 uiTime = BfTB->GetTimer()/1000;
                    player->SendUpdateWorldState(5332, time(NULL)+uiTime);
                    if (uiTime < 15 * MINUTE)
                    {
                        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, sObjectMgr->GetTrinityStringForDBCLocale(TB_NPCQUEUE_TEXTOPTION_JOIN), GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);
                        player->SEND_GOSSIP_MENU(BfTB->GetDefenderTeam() ? TB_NPCQUEUE_TEXT_H_QUEUE : TB_NPCQUEUE_TEXT_A_QUEUE, creature->GetGUID());
                    }
                    else
                    {
                        player->SEND_GOSSIP_MENU(BfTB->GetDefenderTeam() ? TB_NPCQUEUE_TEXT_H_NOWAR:TB_NPCQUEUE_TEXT_A_NOWAR, creature->GetGUID());
                    }
                }
            }
            return true;
        }

        bool OnGossipSelect(Player* player, Creature* /*creature*/, uint32 /*sender*/, uint32 /*action*/) override
        {
            player->CLOSE_GOSSIP_MENU();

            Battlefield* BfTB = sBattlefieldMgr->GetBattlefieldByBattleId(BATTLEFIELD_BATTLEID_TB);
            if (BfTB)
            {
                if (BfTB->IsWarTime()){
                    BfTB->InvitePlayerToWar(player);
                }
                else
                {
                    uint32 uiTime = BfTB->GetTimer()/1000;
                    if (uiTime < 15 * MINUTE)
                        BfTB->InvitePlayerToQueue(player);
                }
            }
            return true;
        }
};

// 85123 - Siege Cannon - selects random target
class spell_siege_cannon : public SpellScriptLoader
{
public:
    spell_siege_cannon() : SpellScriptLoader("spell_siege_cannon") { }

    class spell_siege_cannon_SpellScript : public SpellScript
    {
        PrepareSpellScript(spell_siege_cannon_SpellScript);

        void SelectRandomTarget(std::list<WorldObject*>& targets)
        {
            if (targets.empty())
                return;

            WorldObject* target = Trinity::Containers::SelectRandomContainerElement(targets);
            targets.clear();
            targets.push_back(target);
        }

        void Register() override
        {
            OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_siege_cannon_SpellScript::SelectRandomTarget, EFFECT_0, TARGET_UNIT_SRC_AREA_ENTRY);
        }
    };

    SpellScript* GetSpellScript() const override
    {
        return new spell_siege_cannon_SpellScript();
    }
};

void AddSC_tol_barad()
{
   new npc_tol_barad_battlemage();
   new npc_tb_spirit_guide();
   new spell_siege_cannon();
}