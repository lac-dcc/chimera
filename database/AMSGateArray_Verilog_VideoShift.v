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
module VideoShift(input CLK_n,
                  input[7 : 0] VIDEO,
                  input KEEP,
                  input LOAD,
                  input SHIFT,
                  output[3 : 0] CIDX);
  reg[7 : 0] shift_reg;
  reg[7 : 0] shift_in;
  wire[7 : 0] shift_out = { shift_reg[6 : 0], 1'b0 };
  integer i;
  always
    @(*)
      begin
        for (i = 0; i <= 7; i = i + 1)
          begin
            shift_in[i] = (SHIFT & shift_out[i]) | (LOAD & VIDEO[i]) | (KEEP & shift_reg[i]);
          end
      end
  always
    @(posedge CLK_n)
      begin
        shift_reg <= shift_in;
      end
  assign CIDX = { shift_reg[1], shift_reg[5], shift_reg[3], shift_reg[7] };
endmodule
