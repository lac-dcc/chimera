// bootrom16.v - Simple ROM module
//
// Copyright (c) 2011, 2012  Anthony Green.  All Rights Reserved.
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

module bootrom16 (
		  input 	clk_i,
		  input [15:0] 	wb_dat_i,
		  output [15:0] wb_dat_o,
		  input [31:0] 	wb_adr_i,
		  input 	wb_we_i,
		  input 	wb_tga_i,
		  input 	wb_stb_i,
		  input 	wb_cyc_i,
		  input [1:0] 	wb_sel_i,
		  output [0:0]	wb_ack_o
		  );

  // 4k boot ROM
  reg  [7:0] rom[0:4095];
  wire [11:0] index;

  // We're just looking at the least significant 4k address bits
  assign index = wb_adr_i[11:0];

  reg [0:0]  wb_ack_o_reg;
  reg [15:0] wb_dat_o_reg;

   assign wb_ack_o = wb_ack_o_reg;
   assign wb_dat_o = wb_dat_o_reg;
   
  always @(posedge clk_i)
    begin
      wb_dat_o_reg <= {rom[index], rom[index+1]};
      wb_ack_o_reg <= wb_stb_i & wb_cyc_i;
    end
  
  initial
    begin
      $readmemh("bootrom.vh", rom);
    end

endmodule
