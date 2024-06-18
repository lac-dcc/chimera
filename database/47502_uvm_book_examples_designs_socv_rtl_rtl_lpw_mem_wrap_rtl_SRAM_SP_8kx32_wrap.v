// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : SRAM_SP_8kx32_wrap.v
//Title       : 
//Created     : 1999
//Description : 
//Notes       : 
//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------
module SRAM_SP_8kx32_wrap(
                Q,
                CLK,
                ME,
                WE,
                ADR,
                D,
		reset_n,
		scan_mode
   	);


input [31:0] 	D;
input          	CLK;
input        	ME;
input [3:0]    	WE;
input [12:0]  	ADR;
input		reset_n;
input		scan_mode;
output [31:0] 	Q;

wire [31:0]	Q_mem;
wire [31:0]	Q_mem0;
wire [31:0]	Q_mem1;
wire		mem0_me;
wire		mem1_me;
wire		write_accs;
reg		mem1_me_reg;


// Decode which memory is being accessed based on ADR[12] bit
assign mem0_me = ME & ADR[12];
assign mem1_me = ME & !ADR[12];


// Detect a write to any byte
assign write_accs = WE[3] | WE [2] | WE[1] | WE[0];

// Register read accesses to Mem1; Used to mux between data outputs of Mem1 and Mem0
always @ (posedge CLK or negedge reset_n)
      	begin : Read_Registered
      		if (~reset_n)
         		mem1_me_reg   <= 1'b0;
		else
         		mem1_me_reg   <= mem1_me & ~write_accs;
	end  // block: Read_Registered


generic_sram_bit #(32, 4096, 12) i_ram0
  (.clk  (CLK),
   .n_cs (1'b0),
   .n_we (~(write_accs & mem0_me)),
   .n_oe (1'b0),
   .mask(~{WE[3], WE[3], WE[3], WE[3], WE[3], WE[3], WE[3], WE[3], WE[2], WE[2], WE[2], WE[2], WE[2], WE[2], WE[2], WE[2], WE[1], WE[1], WE[1], WE[1], WE[1], WE[1], WE[1], WE[1], WE[0], WE[0], WE[0], WE[0], WE[0], WE[0], WE[0], WE[0]}),
   .ad   (ADR[11:0]),
   .din  (D),
   .dout (Q_mem0)
   );

generic_sram_bit #(32, 4096, 12) i_ram1
  (.clk  (CLK),
   .n_cs (1'b0),
   .n_we (~(write_accs & mem1_me)),
   .n_oe (1'b0),
   .mask(~{WE[3], WE[3], WE[3], WE[3], WE[3], WE[3], WE[3], WE[3], WE[2], WE[2], WE[2], WE[2], WE[2], WE[2], WE[2], WE[2], WE[1], WE[1], WE[1], WE[1], WE[1], WE[1], WE[1], WE[1], WE[0], WE[0], WE[0], WE[0], WE[0], WE[0], WE[0], WE[0]}),
   .ad   (ADR[11:0]),
   .din  (D),
   .dout (Q_mem1)
   );

// Mux between read data from the two mems
	assign Q = mem1_me_reg ? Q_mem1 : Q_mem0;



endmodule
