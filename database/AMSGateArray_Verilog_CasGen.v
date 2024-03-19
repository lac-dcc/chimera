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
module CasGen(input CLK_n,
              input RESET,
              input M1_n,
              input PHI_n,
              input MREQ_n,
              input[7 : 0] S,
              output reg CAS_n);

  // u705
  reg u705;
  always
    @(posedge PHI_n)
      u705 = M1_n;

  wire u707 = ~M1_n | u705;
  // u708
  reg u708;
  always
    @(posedge MREQ_n,
      negedge u707,
      posedge RESET)
      if (RESET)
        u708 <= 1;
      else
        if (~u707)
          u708 <= 0;
        else
          u708 <= 1; //5V

  // u706
  reg u706;
  always
    @(posedge CLK_n)
      u706 <= (~S[4] & S[5]) | (~S[3] & S[1]) | (S[1] & S[7]);

  // u709
  reg u709;
  always
    @(negedge CLK_n)
      u709 <= u706;

  reg u710, u712;
  always 
  @(posedge CLK_n)
  begin
    u710 = ~u708 | MREQ_n | ~S[4] | S[5];
    u712 = u710 & S[2] & (u706 | u712);
    CAS_n = u712 | u706 | u709;
  end
endmodule
