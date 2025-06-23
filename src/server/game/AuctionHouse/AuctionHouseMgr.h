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

#ifndef _AUCTION_HOUSE_MGR_H
#define _AUCTION_HOUSE_MGR_H

#include <ace/Singleton.h>

#include "Common.h"
#include "DatabaseEnv.h"
#include "DBCStructure.h"

class Item;
class Player;
class WorldPacket;
class LogFile;

#define MIN_AUCTION_TIME    (12 * HOUR)
#define MAX_AUCTION_ITEMS    32
#define AUCTION_SEARCH_DELAY 300 // time in MS till the player can search again

enum AuctionError
{
    ERR_AUCTION_OK                  = 0,
    ERR_AUCTION_INVENTORY           = 1,
    ERR_AUCTION_DATABASE_ERROR      = 2,
    ERR_AUCTION_NOT_ENOUGHT_MONEY   = 3,
    ERR_AUCTION_ITEM_NOT_FOUND      = 4,
    ERR_AUCTION_HIGHER_BID          = 5,
    ERR_AUCTION_BID_INCREMENT       = 7,
    ERR_AUCTION_BID_OWN             = 10,
    ERR_AUCTION_RESTRICTED_ACCOUNT  = 13
};

enum AuctionAction
{
    AUCTION_SELL_ITEM   = 0,
    AUCTION_CANCEL      = 1,
    AUCTION_PLACE_BID   = 2
};

enum MailAuctionAnswers
{
    AUCTION_OUTBIDDED           = 0,
    AUCTION_WON                 = 1,
    AUCTION_SUCCESSFUL          = 2,
    AUCTION_EXPIRED             = 3,
    AUCTION_CANCELLED_TO_BIDDER = 4,
    AUCTION_CANCELED            = 5,
    AUCTION_SALE_PENDING        = 6
};

enum AuctionHouses
{
    AUCTIONHOUSE_ALLIANCE       = 2,
    AUCTIONHOUSE_HORDE          = 6,
    AUCTIONHOUSE_NEUTRAL        = 7
};

struct AuctionEntry
{
    uint32 Id;
    uint32 auctioneer;                                      // creature low guid
    uint32 itemGUIDLow;
    uint32 itemEntry;
    uint32 itemCount;
    uint32 owner;
    uint32 startbid;                                        // maybe useless
    uint32 bid;
    uint32 buyout;
    time_t expire_time;
    uint32 bidder;
    uint32 deposit;                                         // deposit can be calculated only when creating auction
    AuctionHouseEntry const* auctionHouseEntry;             // in AuctionHouse.dbc
    uint32 factionTemplateId;

    // helpers
    uint32 GetHouseId() const { return auctionHouseEntry->houseId; }
    uint32 GetHouseFaction() const { return auctionHouseEntry->faction; }
    uint32 GetAuctionCut() const;
    uint32 GetAuctionOutBid() const;
    bool BuildAuctionInfo(WorldPacket & data) const;
    void DeleteFromDB(SQLTransaction& trans) const;
    void SaveToDB(SQLTransaction& trans) const;
    bool LoadFromDB(Field* fields);
    bool LoadFromFieldList(Field* fields);
    std::string BuildAuctionMailSubject(MailAuctionAnswers response) const;
    std::string BuildAuctionMailBody(MailAuctionAnswers response) const;
};

struct AuctionQueryContext : public ACE_Method_Request
{
    ~AuctionQueryContext();

    uint32 auctioneerFaction;
    uint64 playerGuid;
    LocaleConstant loc_idx;
    LocaleConstant locdbc_idx;
    std::string searchedname;
    uint32 listfrom;
    uint8 levelmin;
    uint8 levelmax;
    uint32 inventoryType;
    uint32 itemClass;
    uint32 itemSubClass;
    uint32 quality;
    bool getAll;
    std::vector<int8> sortOrder;

    int call();
};

//this class is used as auctionhouse instance
class AuctionHouseObject
{
  public:
    ~AuctionHouseObject()
    {
        TRINITY_WRITE_GUARD(ACE_RW_Thread_Mutex, AuctionsMapLock);
        for (AuctionEntryMap::iterator itr = AuctionsMap.begin(); itr != AuctionsMap.end(); ++itr)
            delete itr->second;
    }

    typedef std::map<uint32, AuctionEntry*> AuctionEntryMap;

    uint32 Getcount() const { return AuctionsMap.size(); }

    AuctionEntryMap::iterator GetAuctionsBegin() {return AuctionsMap.begin();}
    AuctionEntryMap::iterator GetAuctionsEnd() {return AuctionsMap.end();}

    AuctionEntry* GetAuction(uint32 id, bool skipLock = false)
    {
        if (!skipLock)
            AuctionsMapLock.acquire_read();

        AuctionEntryMap::const_iterator itr = AuctionsMap.find(id);
        AuctionEntry* result = itr != AuctionsMap.end() ? itr->second : NULL;

        if (!skipLock)
            AuctionsMapLock.release();

        return result;
    }

    void AddAuction(AuctionEntry* auction, bool skipLock = false);

    bool RemoveAuction(AuctionEntry* auction, bool skipLock = false);

    void Update();

    void BuildListBidderItems(WorldPacket& data, Player* player, uint32& count, uint32& totalcount);
    void BuildListOwnerItems(WorldPacket& data, Player* player, uint32& count, uint32& totalcount);
    bool BuildListAuctionItems(WorldPacket& data, Player* player, uint64 playerGuid, LocaleConstant loc_idx, LocaleConstant locdbc_idx,
        std::string const& searchedname, uint32 listfrom, uint8 levelmin, uint8 levelmax, uint8 usable,
        uint32 inventoryType, uint32 itemClass, uint32 itemSubClass, uint32 quality,
        bool getAll, std::vector<int8> const& sortOrder,
        uint32& count, uint32& totalcount, uint32& throttle);

  private:
    AuctionEntryMap AuctionsMap;
    ACE_RW_Thread_Mutex AuctionsMapLock;
    std::map<uint64, std::wstring> ItemNameCache[TOTAL_LOCALES];
    ACE_RW_Thread_Mutex ItemNameCacheLock;
};

class AuctionHouseMgr
{
    friend class ACE_Singleton<AuctionHouseMgr, ACE_Null_Mutex>;

    private:
        AuctionHouseMgr();
        ~AuctionHouseMgr();

    public:
        static AuctionHouseMgr* instance()
        {
            static AuctionHouseMgr _instance;
            return &_instance;
        }

        void Unload();

        typedef std::unordered_map<uint32, Item*> ItemMap;

        AuctionHouseObject* GetAuctionsMap(uint32 factionTemplateId);
        AuctionHouseObject* GetBidsMap(uint32 factionTemplateId);

        Item* GetAItem(uint32 id)
        {
            TRINITY_READ_GUARD(ACE_RW_Thread_Mutex, mAitemsLock);

            ItemMap::const_iterator itr = mAitems.find(id);
            if (itr != mAitems.end())
                return itr->second;

            return NULL;
        }

        //auction messages
        void SendAuctionWonMail(AuctionEntry* auction, SQLTransaction& trans);
        void SendAuctionSalePendingMail(AuctionEntry* auction, SQLTransaction& trans);
        void SendAuctionSuccessfulMail(AuctionEntry* auction, SQLTransaction& trans);
        void SendAuctionExpiredMail(AuctionEntry* auction, SQLTransaction& trans);
        void SendAuctionOutbiddedMail(AuctionEntry* auction, uint32 newPrice, Player* newBidder, SQLTransaction& trans);
        void SendAuctionCancelledToBidderMail(AuctionEntry* auction, SQLTransaction& trans, Item* item);

        static uint32 GetAuctionDeposit(AuctionHouseEntry const* entry, uint32 time, Item* pItem, uint32 count);
        static AuctionHouseEntry const* GetAuctionHouseEntry(uint32 factionTemplateId, bool forClient = false);

    public:

        // Used primarily at server start to avoid loading a list of expired auctions
        void DeleteExpiredAuctionsAtStartup();

        //load first auction items, because of check if item exists, when loading
        void LoadAuctionItems();
        void LoadAuctions();

        void AddAItem(Item* it);
        bool RemoveAItem(uint32 id);

        void Update();

        void QueryAuctionItems(uint32 auctioneerFaction, Player* player,
            std::string const& searchedname, uint32 listfrom, uint8 levelmin, uint8 levelmax, uint8 usable,
            uint32 inventoryType, uint32 itemClass, uint32 itemSubClass, uint32 quality,
            bool getAll, std::vector<int8> const& sortOrder);

        LogFile* GetLogger() const { return logger.get(); }

    private:

        AuctionHouseObject mHordeAuctions;
        AuctionHouseObject mAllianceAuctions;
        AuctionHouseObject mNeutralAuctions;

        ItemMap mAitems;
        ACE_RW_Thread_Mutex mAitemsLock;
        std::thread searchThread;
        ACE_Activation_Queue searchQueries;
        std::unique_ptr<LogFile> logger;
};

#define sAuctionMgr AuctionHouseMgr::instance()

#endif
