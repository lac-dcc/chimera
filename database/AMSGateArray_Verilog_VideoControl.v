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
module VideoControl(input CLK_n,
                    input DISPEN_BUF,
                    input S5,
                    input S6,
                    input PHI_n,
                    input[1 : 0] MODE,
                    input MODE_SYNC,
                    output LOAD,
                    output COLOUR_KEEP,
                    output INK_SEL,
                    output BORDER_SEL,
                    output SHIFT,
                    output KEEP,
                    output MODE_IS_0,
                    output MODE_IS_2);
  reg _mode_is_0;
  reg _mode_is_1;
  reg _mode_is_2;
  // u1009, u1010, u1011
  always
    @(posedge MODE_SYNC)
      begin
        _mode_is_2 <= ~MODE[0] & MODE[1];
        _mode_is_1 <= MODE[0] & ~MODE[1];
        _mode_is_0 <= ~MODE[0] & ~MODE[1];
      end
  assign MODE_IS_0 = _mode_is_0;
  assign MODE_IS_2 = _mode_is_2;
  reg u1005,
      u1013,
      u1007,
      _load,
      _colour_keep,
      _ink_sel,
      _border_sel,
      _shift,
      _keep;
  wire u1008 = _load ? DISPEN_BUF : u1005;
  wire u1017 = _mode_is_2 | (_mode_is_1 & u1013) | (u1013 & u1007);
  always
    @(posedge CLK_n)
      begin
        _load <= S5 ^ S6;
        u1007 <= ~PHI_n;
        u1005 <= u1008;
        u1013 <= _load | ~u1013;
        _colour_keep <= ~(u1013 | _mode_is_2);
        _ink_sel <= (u1013 | _mode_is_2) & u1008;
        _border_sel <= (u1013 | _mode_is_2) & ~u1008;
        _shift <= u1017 & ~(S5 ^ S6);
        _keep <= ~u1017;
      end
  assign LOAD = _load;
  assign COLOUR_KEEP = _colour_keep;
  assign INK_SEL = _ink_sel;
  assign BORDER_SEL = _border_sel;
  assign SHIFT = _shift;
  assign KEEP = _keep;
endmodule
