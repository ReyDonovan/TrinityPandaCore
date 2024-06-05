/* This program is free software; you can redistribute it and/or modify it
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

#ifndef TRINITY_UNARY_FUNCTION_H
#define TRINITY_UNARY_FUNCTION_H

template<class ArgumentType, class ResultType>
struct unary_function
{
    typedef ArgumentType argument_type;
    typedef ResultType result_type;
};

#define TC_UNARY_FUNCTION unary_function

#endif