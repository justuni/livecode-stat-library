script "libqrtstat2"
/*
Quartam Statistical Functions Library for LiveCode [libqrtstat.livecode]
Copyright (C) 2011-2016 Quartam Software / Jan Schenkel

This program is free software; you can redistribute it and/or modify 
it under the terms of the GNU Lesser General Public License as 
published by the Free Software Foundation, either version 3 of the 
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License 
along with this program.  If not, see <http://www.gnu.org/licenses>.

You can be released from the requirements of the license by purchasing a 
commercial license.

For more information, please contact Quartam Software at this address:
licenses@quartam.com
*/

--> constants

constant kLibVersion = "2.0.0"

--> public commands and functions

function qrtSTAT_VersionNumber
   return kLibVersion
end qrtSTAT_VersionNumber

function qrtSTAT_AverageDeviation pNumbersList
   local tIndex
   if the paramCount > 1 then
      repeat with tIndex = 2 to the paramCount
         put comma & param(tIndex) after pNumbersList
      end repeat
   end if
   --
   local tCount
   if pNumbersList is an array then
      put the number of elements in pNumbersList into tCount
   else
      put the number of items in pNumbersList into tCount
   end if
   --
   if tCount is 0 then
      return 0
   else
      local tMean, tAbsDevSum
      put average(pNumbersList) into tMean
      if pNumbersList is an array then
         repeat for each element tNumber in pNumbersList
            add abs(tNumber - tMean) to tAbsDevSum
         end repeat
      else
         repeat for each item tNumber in pNumbersList
            add abs(tNumber - tMean) to tAbsDevSum
         end repeat
      end if
      return tAbsDevSum / tCount
   end if
end qrtSTAT_AverageDeviation

function qrtSTAT_GeometricMean pNumbersList
   local tIndex
   if the paramCount > 1 then
      repeat with tIndex = 2 to the paramCount
         put comma & param(tIndex) after pNumbersList
      end repeat
   end if
   --
   local tCount
   if pNumbersList is an array then
      put the number of elements in pNumbersList into tCount
   else
      put the number of items in pNumbersList into tCount
   end if
   --
   if tCount is 0 then
      return 0
   else
      local tGeometricMean, tPower
      put 1 into tGeometricMean
      put 1 / tCount into tPower
      if pNumbersList is an array then
         repeat for each element tNumber in pNumbersList
            multiply tGeometricMean by tNumber ^ tPower
         end repeat
      else
         repeat for each item tNumber in pNumbersList
            multiply tGeometricMean by tNumber ^ tPower
         end repeat
      end if
      return tGeometricMean
   end if
end qrtSTAT_GeometricMean

function qrtSTAT_HarmonicMean pNumbersList
   local tIndex
   if the paramCount > 1 then
      repeat with tIndex = 2 to the paramCount
         put comma & param(tIndex) after pNumbersList
      end repeat
   end if
   --
   local tCount
   if pNumbersList is an array then
      put the number of elements in pNumbersList into tCount
   else
      put the number of items in pNumbersList into tCount
   end if
   --
   if tCount is 0 then
      return 0
   else
      local tReciprocalSum
      if pNumbersList is an array then
         repeat for each element tNumber in pNumbersList
            add 1 / tNumber to tReciprocalSum
         end repeat
      else
         repeat for each item tNumber in pNumbersList
            add 1 / tNumber to tReciprocalSum
         end repeat
      end if
      return tCount / tReciprocalSum
   end if
end qrtSTAT_HarmonicMean

function qrtSTAT_PopulationStandardDeviation pNumbersList
   return sqrt(qrtSTAT_PopulationVariance(pNumbersList))
end qrtSTAT_PopulationStandardDeviation

function qrtSTAT_PopulationVariance pNumbersList
   local tIndex
   if the paramCount > 1 then
      repeat with tIndex = 2 to the paramCount
         put comma & param(tIndex) after pNumbersList
      end repeat
   end if
   --
   local tCount
   if pNumbersList is an array then
      put the number of elements in pNumbersList into tCount
   else
      put the number of items in pNumbersList into tCount
   end if
   --
   if tCount is 0 then
      return 0
   else
      local tMean, tDeviationSum
      put average(pNumbersList) into tMean
      if pNumbersList is an array then
         repeat for each element tNumber in pNumbersList
            add (tNumber - tMean) ^ 2 to tDeviationSum
         end repeat
      else
         repeat for each item tNumber in pNumbersList
            add (tNumber - tMean) ^ 2 to tDeviationSum
         end repeat
      end if
      return tDeviationSum / tCount
   end if
end qrtSTAT_PopulationVariance
