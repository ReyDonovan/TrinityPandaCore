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

#ifndef TRINITY_COMPILERDEFS_H
#define TRINITY_COMPILERDEFS_H

#define PLATFORM_WINDOWS 0
#define PLATFORM_UNIX    1
#define PLATFORM_APPLE   2
#define PLATFORM_INTEL   3

// must be first (win 64 also define _WIN32)
#if defined( _WIN64 )
#  define PLATFORM PLATFORM_WINDOWS
#elif defined( __WIN32__ ) || defined( WIN32 ) || defined( _WIN32 )
#  define PLATFORM PLATFORM_WINDOWS
#elif defined( __APPLE_CC__ )
#  define PLATFORM PLATFORM_APPLE
#elif defined( __INTEL_COMPILER )
#  define PLATFORM PLATFORM_INTEL
#else
#  define PLATFORM PLATFORM_UNIX
#endif

#define COMPILER_MICROSOFT 0
#define COMPILER_GNU       1
#define COMPILER_BORLAND   2
#define COMPILER_INTEL     3

#ifdef _MSC_VER
#  define COMPILER COMPILER_MICROSOFT
#include <sdkddkver.h>
#elif defined( __BORLANDC__ )
#  define COMPILER COMPILER_BORLAND
#elif defined( __INTEL_COMPILER )
#  define COMPILER COMPILER_INTEL
#elif defined( __GNUC__ )
#  define COMPILER COMPILER_GNU
#  define GCC_VERSION (__GNUC__ * 10000 + __GNUC_MINOR__ * 100 + __GNUC_PATCHLEVEL__)
#else
#  error "FATAL ERROR: Unknown compiler."
#endif

#if COMPILER == COMPILER_MICROSOFT && _MSC_VER >= 1910 && _HAS_CXX17
#define ACE_LACKS_AUTO_PTR 1
#endif

#ifdef __clang__
#  if !defined (ACE_HAS_GCC_ATOMIC_BUILTINS)
#    define ACE_HAS_GCC_ATOMIC_BUILTINS 1
#  endif
#endif

#endif
