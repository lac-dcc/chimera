// dcache.v - Data cache for the moxie core
//
// Copyright (c) 2011, 2017  Anthony Green.  All Rights Reserved.
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

module dcache (/*AUTOARG*/
  // Outputs
  data_o, stall_o,
  // Inputs
  rst_i, clk_i, address_i, data_i, we_i
  );

  // --- Clock and Reset ------------------------------------------
  input  rst_i, clk_i;
  
  // --- Memory request interface ---------------------------------
  input  [31:0] address_i;
  output [31:0] data_o;
  input  [31:0] data_i;
  input [0:0] 	we_i;
  output [0:0] 	stall_o;

  // This is a place holder data cache module with 4k of fake memory.
  reg  [7:0] ram[0:4095];
  wire [11:0] index;
  assign index = address_i[11:0];

  // Read data 
  assign data_o = {ram[index],ram[index+1],ram[index+2],ram[index+3]};
  assign stall_o = 0;

  // Write data
  always @(posedge clk_i) begin
    if (!rst_i & we_i)
      {ram[index],ram[index+1],ram[index+2],ram[index+3]} <= data_i;
  end

endmodule
