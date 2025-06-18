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

#ifndef _AUTH_MD5_H
#define _AUTH_MD5_H

#include "Define.h"
#include <string>
#include <openssl/evp.h>

class MD5Hash
{
    public:
        MD5Hash();
        ~MD5Hash();
        void UpdateData(const std::string &str);
        void UpdateData(const uint8* data, size_t len);
        void Finalize(const uint8* data, uint32 len);
    private:
        EVP_MD_CTX* m_ctx;
};
#endif
