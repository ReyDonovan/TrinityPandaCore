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

#include "MD5.h"
#include "Common.h"

MD5Hash::MD5Hash() : m_ctx(EVP_MD_CTX_new())
{
    EVP_DigestInit_ex(m_ctx, EVP_md5(), NULL);
}

MD5Hash::~MD5Hash()
{
    EVP_MD_CTX_free(m_ctx);
}

void MD5Hash::UpdateData(const std::string &str)
{
    EVP_DigestUpdate(m_ctx, (uint8 const*)str.c_str(), str.length());
}

void MD5Hash::UpdateData(const uint8* data, size_t len)
{
    EVP_DigestUpdate(m_ctx, data, len);
}

void MD5Hash::Finalize(const uint8* data, uint32 len)
{
    EVP_DigestFinal_ex(m_ctx, (uint8*)data, &len);
}
