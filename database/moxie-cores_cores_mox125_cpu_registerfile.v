// cpu_registerfile.v - moxie register file
//
// Copyright (c) 2010, 2011, 2012, 2017  Anthony Green.  All Rights Reserved.
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

module cpu_registerfile (/*AUTOARG*/
  // Outputs
  value0_o, value1_o, sp_o, fp_o,
  // Inputs
  rst_i, clk_i, write_enable0_i, write_enable1_i, value0_i, value1_i,
  reg_write_index0_i, reg_write_index1_i, reg_read_index0_i,
  reg_read_index1_i
  );

  // --- Clock and Reset ------------------------------------------
  input  rst_i, clk_i;

  output reg [31:0] value0_o, value1_o;
  output [31:0] sp_o /*verilator public*/;
  output [31:0] fp_o /*verilator public*/;

  input 	 write_enable0_i /*verilator public*/;
  input write_enable1_i /*verilator public*/;
  input [31:0] value0_i /*verilator public*/;
  input [31:0] value1_i /*verilator public*/;
  input [0:3]  reg_write_index0_i /*verilator public*/;
  input [0:3]  reg_write_index1_i  /*verilator public*/;
  
   input [0:3] reg_read_index0_i, reg_read_index1_i;

   /*
  MEM_2w4r mem_2w4r (.clock(clk_i),
		     .we0(write_enable0_i),
		     .we1(write_enable1_i),
		     .write_addr_0(reg_write_index0_i),
		     .write_data_0(value0_i),
		     .write_addr_1(reg_write_index1_i),
		     .write_data_1(value1_i),
		     .read_addr_0(reg_read_index0_i),
		     .read_data_0(value0_o),
		     .read_addr_1(reg_read_index1_i),
		     .read_data_1(value1_o),
		     .read_addr_2(4'b0),
		     .read_data_2(fp_o),
		     .read_addr_3(4'b1),
		     .read_data_3(sp_o)); */

   reg[31:0] mem[0:15];

   integer   i;

  wire [31:0]	     r0 /*verilator public*/;
  wire [31:0]	     r1 /*verilator public*/;
  wire [31:0]	     r2  /*verilator public*/;
  wire [31:0]	     r3  /*verilator public*/;
  wire [31:0]	     r4  /*verilator public*/;
  wire [31:0]	     r5  /*verilator public*/;
  wire [31:0]	     r6  /*verilator public*/;
  wire [31:0]	     r7  /*verilator public*/;

  assign r0 = mem[2];
  assign r1 = mem[3];
  assign r2 = mem[4];
  assign r3 = mem[5];
  assign r4 = mem[6];
  assign r5 = mem[7];
  assign r6 = mem[8];
  assign r7 = mem[9];

  assign fp_o = mem[0];
  assign sp_o = mem[1];
  
   always @ (posedge rst_i) begin
      for (i=0; i<16; i=i+1)
	mem[i] = 0;
   end

   // always @ (posedge clk_i) begin
   //   fp_o <= mem[0];
   //   sp_o <= mem[1];
   // end
  
   always @(posedge clk_i) begin
      value0_o <= mem[reg_read_index0_i];
      if (write_enable0_i) begin
	 mem[reg_write_index0_i] = value0_i;
      end
   end

   always @(posedge clk_i) begin
      value1_o <= mem[reg_read_index1_i];
      if (write_enable1_i) begin
	 mem[reg_write_index1_i] = value1_i;
      end
   end
  
endmodule // cpu_registerfile
