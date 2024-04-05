// cpu_write.v - The writeback unit
//
// Copyright (c) 2011, 2012, 2017 Anthony Green.  All Rights Reserved.
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

`include "defines.h"

module cpu_write (/*AUTOARG*/
  // Inputs
  rst_i, clk_i, pipeline_control_bits_i,
  memory_address_i, mem_result_i, PC_i
  );
  
  // --- Clock and Reset ------------------------------------------
  input  rst_i, clk_i;
  
  input [`PCB_WIDTH-1:0] pipeline_control_bits_i;
  input [31:0] memory_address_i;
  input [31:0] mem_result_i;
  input [31:0] PC_i;

  wire [31:0] 	data;
  
  wire [0:0] register_wea_o = pipeline_control_bits_i[`PCB_WA];

  // The data cache. Fake. Never stalls.  Note that we can do a single
  // cycle memory-to-memory transfer.
  dcache cache (.clk_i (clk_i),
		.rst_i (rst_i),
		.we_i (pipeline_control_bits_i[`PCB_WM]),
		.address_i (memory_address_i),
		.data_i (mem_result_i),
		.data_o (data),
		.stall_o ());
  
endmodule // cpu_write
