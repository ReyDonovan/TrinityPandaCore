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

#include "Chat.h"
#include "Config.h"
#include "WorldSession.h"

class Time_is_money : public PlayerScript
{
public:
    Time_is_money() : PlayerScript("Time_is_money") { }
    uint32 timeInterval = 0;

    void OnUpdate(Player* player, uint32 diff)
    {
        timeInterval += diff;
        if (timeInterval >= player->ptr_Interval)
        {
            timeInterval -= player->ptr_Interval;
            if (player->IsInWorld() && sWorld->getBoolConfig(CONFIG_TIME_IS_MONEY_ENABLE))
            {
                std::ostringstream ss;
                ss << "|cff3DAEFF[Zeit ist Geld]|cffFFD800 Du bekommst |cffFF0000" << sConfigMgr->GetIntDefault("TimeIsMoney.Credit", 0) / 10000 << "|cffFFD800 Euro Guthaben, aufgrund |cffFF0000" << sConfigMgr->GetIntDefault("TimeIsMoney.Interval", 0) / 60 << "|cffFFD800 Minute(n) erreichter Spielzeit.|cffFFD800";
                sWorld->SendServerMessage(SERVER_MSG_STRING, ss.str().c_str()); ("");

                PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_UPD_BATTLEPAY_INCREMENT_COINS);
                stmt->setUInt32(0, sConfigMgr->GetIntDefault("TimeIsMoney.Credit", 0));
                stmt->setUInt32(1, player->GetSession()->GetAccountId());
                LoginDatabase.Query(stmt);                
            }
        }
    }
};

void AddSC_time_is_money()
{
	new Time_is_money();
}
