// ===============================================================================
//
//  Amstrad CPC Gate Array for Xilinx X95288XL
//
//  Copyright (C) 2021 Darren Johnstone <darren@darrenjohnstone.scot>
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
//  Acknowledgements:
//
//  Based on 40010-simplified_V03.pdf by Gerald 
//  (https://www.cpcwiki.eu/forum/amstrad-cpc-hardware/gate-array-decapped!) 
//  
//  Partially based on the Amstrad MiSTer core by Gyorgy Szombathelyi
//  https://github.com/MiSTer-devel/Amstrad_MiSTer/tree/master/rtl/GA40010
// ===============================================================================
module ROMMapping(input LROMEN,
                  input A15,
                  input A14,
                  input HROMEN,
                  input MREQ_n,
                  input RD_n,
                  output ROMEN_n,
                  output RAMRD_n);
  wire rom = (~LROMEN & ~A15 & ~A14) | (A15 & A14 & ~HROMEN);
  assign ROMEN_n = ~rom | MREQ_n | RD_n;
  assign RAMRD_n = rom | MREQ_n | RD_n;
endmodule
