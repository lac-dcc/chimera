// testram.v - Simple RAM module for testing
//
// Copyright (c) 2011  Anthony Green.  All Rights Reserved.
// DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
// 
// The above named program is free software; you can redistribute it
// and/or modify it under the terms of the GNU General Public License
// version 2 as published by the Free Software Foundation.
// 
// The above named program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied warranty
// of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this work; if not, write to the Free Software
// Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
// 02110-1301, USA.

module testram (/*AUTOARG*/
    // Wishbone slave interface
    input  [31:0] wb_dat_i,
    output [31:0] wb_dat_o,
    input  [31:0] wb_adr_i,
    input         wb_we_i,
    input         wb_tga_i,
    input         wb_stb_i,
    input         wb_cyc_i,
    input  [ 1:0] wb_sel_i,
    output        wb_ack_o
  );

  reg  [7:0] ram[0:4095];
  wire [8:0] index;

  assign index = wb_adr_i[9:0];
  assign wb_ack_o = wb_stb_i & wb_cyc_i;
  assign wb_dat_o = {ram[index],ram[index+1],ram[index+2],ram[index+3]};

endmodule
