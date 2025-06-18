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

#include "HMACSHA1.h"
#include "BigNumber.h"
#include "Common.h"

HmacHash::HmacHash(uint32 len, uint8* seed) : m_mac(EVP_MAC_fetch(NULL, "HMAC", NULL)), m_ctx(EVP_MAC_CTX_new(m_mac))
{
    m_params[0] = OSSL_PARAM_construct_utf8_string("digest", const_cast<char*>("SHA1"), 0);
    m_params[1] = OSSL_PARAM_construct_end();
    EVP_MAC_init(m_ctx, seed, len, m_params);
}

HmacHash::~HmacHash()
{
    EVP_MAC_CTX_free(m_ctx);
    EVP_MAC_free(m_mac);
}

void HmacHash::UpdateData(std::string const& str)
{
    EVP_MAC_update(m_ctx, reinterpret_cast<uint8 const*>(str.c_str()), str.length());
}

void HmacHash::UpdateData(uint8 const* data, int len)
{
    EVP_MAC_update(m_ctx, data, len);
}

void HmacHash::Finalize()
{
    size_t length = 0;
    EVP_MAC_final(m_ctx, (uint8*)m_digest, &length, sizeof(m_digest));
    ASSERT(length == SHA_DIGEST_LENGTH);
}

uint8 *HmacHash::ComputeHash(BigNumber* bn)
{
    EVP_MAC_update(m_ctx, bn->AsByteArray(), bn->GetNumBytes());
    Finalize();
    return (uint8*)m_digest;
}
