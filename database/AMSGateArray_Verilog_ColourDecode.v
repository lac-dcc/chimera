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
module ColourDecode(input HCNTLT28,
                    input HSYNC,
                    input[4 : 0] COLOUR,
                    input CLK_n,
                    output reg BLUE_OEn,
                    output reg BLUE,
                    output reg GREEN_OEn,
                    output reg GREEN,
                    output reg RED_OEn,
                    output reg RED);
  wire FORCE_BLANK = HCNTLT28 | HSYNC;
  always
    @(posedge CLK_n,
      posedge FORCE_BLANK)
      begin
        if (FORCE_BLANK)
          begin // Blank
            BLUE_OEn <= 0;
            BLUE <= 0;
            GREEN_OEn <= 0;
            GREEN <= 0;
            RED_OEn <= 0;
            RED <= 0;
          end
        else
          begin
            BLUE_OEn <= ~((COLOUR[1] | COLOUR[2]) & (COLOUR[3] | COLOUR[4]));
            BLUE <= COLOUR[0];
            GREEN_OEn <= (COLOUR[1] & COLOUR[2]) | ~(COLOUR[1] | COLOUR[2] | COLOUR[3] | COLOUR[4]);
            GREEN <= (~COLOUR[2] & COLOUR[0]) | COLOUR[1];
            RED_OEn <= ~(COLOUR[1] | COLOUR[2] | COLOUR[3] | COLOUR[4]) | (COLOUR[3] & COLOUR[4]);
            RED <= (COLOUR[0] & ~COLOUR[4]) | COLOUR[3];
          end
      end
endmodule
