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

#include "ARC4.h"
#include <openssl/sha.h>
#include <openssl/provider.h>

ARC4::ARC4() : m_ctx(EVP_CIPHER_CTX_new())
{
    OSSL_PROVIDER_load(nullptr, "legacy");
    EVP_CIPHER_CTX_reset(m_ctx);
    EVP_CipherInit(m_ctx, EVP_rc4(), nullptr, nullptr, 0);
}

ARC4::~ARC4()
{
    EVP_CIPHER_CTX_free(m_ctx);
}

void ARC4::Init(uint8 const* seed, size_t len)
{
#if defined(WIN32)
    m_params[0] = OSSL_PARAM_construct_size_t("keylen", &len);
    m_params[1] = OSSL_PARAM_construct_end();
    EVP_CipherInit_ex2(m_ctx, nullptr, seed, nullptr, 0, m_params);
#else
    EVP_CIPHER_CTX_set_key_length(m_ctx, len);
    EVP_CipherInit(m_ctx, NULL, seed, NULL, 0);
#endif
}

void ARC4::UpdateData(int len, uint8* data)
{
    int outlen = 0;
    EVP_CipherUpdate(m_ctx, data, &outlen, data, len);
    Finalize(outlen, data);
}

void ARC4::Finalize(int outlen, uint8* data)
{
    EVP_CipherFinal_ex(m_ctx, data, &outlen);
}
