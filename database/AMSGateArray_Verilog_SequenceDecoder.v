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
module SequenceDecoder(input CLK_n,
                       input[7 : 0] S,
                       input RD_n,
                       input IORQ_n,
                       output reg PHI_n,
                       output reg RAS_n,
                       output reg READY,
                       output reg CASAD_n,
                       output reg CPU_n,
                       output reg CCLK,
                       output reg MWE_n,
                       output reg s244E_n);
  always
    @(posedge CLK_n)
      begin
        PHI_n <= (S[1] ^ S[3]) | (S[5] ^ S[7]);
        RAS_n <= (S[6] | ~S[2]) & S[0];
        CPU_n <= ~(S[1] & ~S[7]);
        CCLK <= ~(S[2] | S[5]);
        MWE_n <= ~(S[0] & S[5] & RD_n);
        s244E_n <= ~(S[2] & S[3] & ~IORQ_n);
      end
  always
    @(negedge CLK_n)
      begin
        CASAD_n <= RAS_n;
        READY <= (~RAS_n & READY) | (S[3] & ~S[6]);
      end
endmodule
