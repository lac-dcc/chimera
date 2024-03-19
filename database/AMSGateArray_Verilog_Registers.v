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
//  Partially based on  the Amstrad MiSTer core by Gyorgy Szombathelyi
//  https://github.com/MiSTer-devel/Amstrad_MiSTer/tree/master/rtl/GA40010
// ===============================================================================
module Registers(input CLK_n,
                 input RESET,
                 input M1_n,
                 input A14,
                 input A15,
                 input IORQ_n,
                 input S0,
                 input S7,
                 input[7 : 0] D,
                 output reg [4 : 0] BORDER,
                 output reg IRQ_RESET,
                 output reg HROMEN,
                 output reg LROMEN,
                 output reg [1 : 0] MODE,
                 output reg [15 : 0] INKR0,
                 output reg [15 : 0] INKR1,
                 output reg [15 : 0] INKR2,
                 output reg [15 : 0] INKR3,
                 output reg [15 : 0] INKR4);

  reg[4 : 0] inksel;
  reg ink_en,
      reg_sel,
      inksel_en,
      border_en,
      reg_en;

  // Move to clock domain
  always
    @(posedge CLK_n)
      begin
        // wires
        reg_sel <= M1_n & A14 & ~A15 & ~IORQ_n & S0 & S7; // u401
        inksel_en <= reg_sel & ~D[7] & ~D[6]; // u402
        border_en <= reg_sel & ~D[7] & D[6] & inksel[4]; // u408
        reg_en <= reg_sel & D[7] & ~D[6]; // u414

        // on the schematic the ~inksel[4] condition is missing, but this would mean border 
        // and ink potentially being selected at the same time
        ink_en <= reg_sel & ~D[7] & D[6] & ~inksel[4]; // u420

        // inksel branch
        if (inksel_en)
          inksel <= D[4 : 0];
        // border branch
        if (RESET)
          BORDER <= 5'b10000;
        else
          if (border_en)
            BORDER <= D[4 : 0];
        // register branch
        if (RESET)
          { HROMEN, LROMEN, MODE[1], MODE[0] } <= 0;
        else
          if (reg_en)
            { HROMEN, LROMEN, MODE[1], MODE[0] } <= D[3 : 0];
        // ink branch
        if (ink_en)
          begin
            INKR0[inksel[3 : 0]] <= D[0];
            INKR1[inksel[3 : 0]] <= D[1];
            INKR2[inksel[3 : 0]] <= D[2];
            INKR3[inksel[3 : 0]] <= D[3];
            INKR4[inksel[3 : 0]] <= D[4];
          end

          IRQ_RESET <= reg_en & D[4];
      end

endmodule
