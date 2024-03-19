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
//      Acknowledgements:
//
//  Based on 40010-simplified_V03.pdf by Gerald 
//  (https://www.cpcwiki.eu/forum/amstrad-cpc-hardware/gate-array-decapped!) 
//  
//  Partially based on the Amstrad MiSTer core by Gyorgy Szombathelyi
//  https://github.com/MiSTer-devel/Amstrad_MiSTer
// ===============================================================================
module ColourMuxBit(input CLK_n,
                    input COLOUR_KEEP,
                    input BORDER_SEL,
                    input BORDER,
                    input INK_SEL,
                    input[15 : 0] INKR,
                    input[3 : 0] CIDX,
                    input MODE_IS_0,
                    input MODE_IS_2,
                    output reg INK);
  // Note: component numbers relate to ColourMuxBit0 on the schematics
  wire u1701,
       u1702,
       u1703,
       u1718,
       u1719,
       u1720,
       u1721;
  wire [3 : 0] ink_0;
  wire [3 : 0] ink_1;
  wire [3 : 0] muxOutput;

  assign u1701 = CIDX[2] & MODE_IS_0;
  assign ink_0 = { (u1701 | INKR[1]) & (INKR[5] | ~u1701), (u1701 | INKR[3]) & (INKR[7] | ~u1701), (u1701 | INKR[0]) & (INKR[4] | ~u1701), (u1701 | INKR[2]) & (INKR[6] | ~u1701) };
  assign ink_1 = { (u1701 | INKR[9]) & (INKR[13] | ~u1701), (u1701 | INKR[11]) & (INKR[15] | ~u1701), (u1701 | INKR[8]) & (INKR[12] | ~u1701), (u1701 | INKR[10]) & (INKR[14] | ~u1701) };
  assign u1702 = CIDX[3] & MODE_IS_0;
  assign muxOutput = u1702 ? ink_1 : ink_0;
  assign u1703 = CIDX[1] & ~MODE_IS_2;
  assign u1718 = (u1703 | muxOutput[3]) & (~u1703 | muxOutput[2]);
  assign u1719 = (u1703 | muxOutput[1]) & (~u1703 | muxOutput[0]);
  assign u1720 = INK_SEL & CIDX[0] & u1718;
  assign u1721 = INK_SEL & ~CIDX[0] & u1719;

  always
    @(posedge CLK_n)
      INK = (INK & COLOUR_KEEP) | (BORDER_SEL & BORDER) | u1720 | u1721;
endmodule
