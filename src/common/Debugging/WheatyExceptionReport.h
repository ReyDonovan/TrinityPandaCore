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
 
#ifndef _WHEATYEXCEPTIONREPORT_
#define _WHEATYEXCEPTIONREPORT_

#if PLATFORM == PLATFORM_WINDOWS && !defined(__MINGW32__)

#define _NO_CVCONST_H

// Suppress some crap in visual studio 2015
#if (_MSC_VER == 1900)
#pragma warning(disable: 4091)
#include <DbgHelp.h>
#pragma warning(default: 4091)
#else
#include <DbgHelp.h>
#endif

#if _MSC_VER < 1400
#   define countof(array)   (sizeof(array) / sizeof(array[0]))
#else
#   include <stdlib.h>
#   define countof  _countof
#endif                                                      // _MSC_VER < 1400

enum BasicType                                              // Stolen from CVCONST.H in the DIA 2.0 SDK
{
    btNoType = 0,
    btVoid = 1,
    btChar = 2,
    btWChar = 3,
    btInt = 6,
    btUInt = 7,
    btFloat = 8,
    btBCD = 9,
    btBool = 10,
    btLong = 13,
    btULong = 14,
    btCurrency = 25,
    btDate = 26,
    btVariant = 27,
    btComplex = 28,
    btBit = 29,
    btBSTR = 30,
    btHresult = 31
};

const char* const rgBaseType[] =
{
    " <user defined> ",                                     // btNoType = 0,
    " void ",                                               // btVoid = 1,
    " char* ",                                              // btChar = 2,
    " wchar_t* ",                                           // btWChar = 3,
    " signed char ",
    " unsigned char ",
    " int ",                                                // btInt = 6,
    " unsigned int ",                                       // btUInt = 7,
    " float ",                                              // btFloat = 8,
    " <BCD> ",                                              // btBCD = 9,
    " bool ",                                               // btBool = 10,
    " short ",
    " unsigned short ",
    " long ",                                               // btLong = 13,
    " unsigned long ",                                      // btULong = 14,
    " __int8 ",
    " __int16 ",
    " __int32 ",
    " __int64 ",
    " __int128 ",
    " unsigned __int8 ",
    " unsigned __int16 ",
    " unsigned __int32 ",
    " unsigned __int64 ",
    " unsigned __int128 ",
    " <currency> ",                                         // btCurrency = 25,
    " <date> ",                                             // btDate = 26,
    " VARIANT ",                                            // btVariant = 27,
    " <complex> ",                                          // btComplex = 28,
    " <bit> ",                                              // btBit = 29,
    " BSTR ",                                               // btBSTR = 30,
    " HRESULT "                                             // btHresult = 31
};

class WheatyExceptionReport
{
    public:

        WheatyExceptionReport();
        ~WheatyExceptionReport();

        // entry point where control comes on an unhandled exception
        static LONG WINAPI WheatyUnhandledExceptionFilter(
            PEXCEPTION_POINTERS pExceptionInfo);

        static void printTracesForAllThreads();
    private:
        // where report info is extracted and generated
        static void GenerateExceptionReport(PEXCEPTION_POINTERS pExceptionInfo);
        static void PrintSystemInfo();
        static BOOL _GetWindowsVersion(TCHAR* szVersion, DWORD cntMax);
        static BOOL _GetProcessorName(TCHAR* sProcessorName, DWORD maxcount);

        // Helper functions
        static LPCTSTR GetExceptionString(DWORD dwCode);
        static BOOL GetLogicalAddress(PVOID addr, PTSTR szModule, DWORD len,
            DWORD& section, DWORD_PTR& offset);

        static void WriteStackDetails(PCONTEXT pContext, bool bWriteVariables, HANDLE pThreadHandle);

        static BOOL CALLBACK EnumerateSymbolsCallback(PSYMBOL_INFO, ULONG, PVOID);

        static bool FormatSymbolValue(PSYMBOL_INFO, STACKFRAME *, char * pszBuffer, unsigned cbBuffer);

        static char * DumpTypeIndex(char *, DWORD64, DWORD, unsigned, DWORD_PTR, bool &, char const*);

        static char * FormatOutputValue(char * pszCurrBuffer, BasicType basicType, DWORD64 length, PVOID pAddress);

        static BasicType GetBasicType(DWORD typeIndex, DWORD64 modBase);

        static int __cdecl _tprintf(const TCHAR * format, ...);

        // Variables used by the class
        static TCHAR m_szLogFileName[MAX_PATH];
        static TCHAR m_szDumpFileName[MAX_PATH];
        static LPTOP_LEVEL_EXCEPTION_FILTER m_previousFilter;
        static HANDLE m_hReportFile;
        static HANDLE m_hDumpFile;
        static HANDLE m_hProcess;
};

extern WheatyExceptionReport g_WheatyExceptionReport;       //  global instance of class
#endif                                                      // _WIN32
#endif                                                      // _WHEATYEXCEPTIONREPORT_
