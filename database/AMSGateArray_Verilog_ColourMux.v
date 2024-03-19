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
module ColourMux(input CLK_n,
                 input[4 : 0] BORDER,
                 input[15 : 0] INKR0,
                 input[15 : 0] INKR1,
                 input[15 : 0] INKR2,
                 input[15 : 0] INKR3,
                 input[15 : 0] INKR4,
                 input COLOUR_KEEP,
                 input INK_SEL,
                 input BORDER_SEL,
                 input MODE_IS_0,
                 input MODE_IS_2,
                 input[3 : 0] CIDX,
                 output[4 : 0] COLOUR);
  reg[15 : 0] ink_bits[5 : 0];
  integer i;
  always
    @(*)
      begin
        for (i = 0; i < 16; i = i + 1)
          begin
            ink_bits[0][i] = INKR0[i];
            ink_bits[1][i] = INKR1[i];
            ink_bits[2][i] = INKR2[i];
            ink_bits[3][i] = INKR3[i];
            ink_bits[4][i] = INKR4[i];
          end
      end
  wire colour0,
       colour1,
       colour2,
       colour3,
       colour4;
  ColourMuxBit cb0(CLK_n, COLOUR_KEEP, BORDER_SEL, BORDER[0], INK_SEL, ink_bits[0], CIDX, MODE_IS_0, MODE_IS_2, colour0);
  ColourMuxBit cb1(CLK_n, COLOUR_KEEP, BORDER_SEL, BORDER[1], INK_SEL, ink_bits[1], CIDX, MODE_IS_0, MODE_IS_2, colour1);
  ColourMuxBit cb2(CLK_n, COLOUR_KEEP, BORDER_SEL, BORDER[2], INK_SEL, ink_bits[2], CIDX, MODE_IS_0, MODE_IS_2, colour2);
  ColourMuxBit cb3(CLK_n, COLOUR_KEEP, BORDER_SEL, BORDER[3], INK_SEL, ink_bits[3], CIDX, MODE_IS_0, MODE_IS_2, colour3);
  ColourMuxBit cb4(CLK_n, COLOUR_KEEP, BORDER_SEL, BORDER[4], INK_SEL, ink_bits[4], CIDX, MODE_IS_0, MODE_IS_2, colour4);
  assign COLOUR = { colour4, colour3, colour2, colour1, colour0 };
endmodule
