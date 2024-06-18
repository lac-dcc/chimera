// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : SRAM_SP_2kx32_wrap.v
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
module SRAM_SP_2kx32_wrap(
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
input  [3:0]   	WE;
input [10:0]  	ADR;
input		reset_n;
input		scan_mode;
output [31:0] 	Q;

wire 		addr_xor;
wire		data_xor;
wire [31:0]	Q_mem;
wire		write_accs;
reg		addr_xor_ff;
reg		data_xor_ff;


assign data_xor = (D[31] ^ D[30] ^ D[29] ^ D[28] ^ D[27] ^ D[26] ^ D[25] ^ D[24] ^ D[23] ^ D[22] ^ D[21] ^ D[20] ^ D[19] ^ D[18] ^ D[17] ^ D[16] ^ D[15] ^ D[14] ^ D[13] ^ D[12] ^ D[11] ^ D[10] ^ D[9] ^ D[8] ^ D[7] ^ D[6] ^ D[5] ^ D[4] ^ D[3] ^ D[2] ^ D[1] ^ D[0]);

assign addr_xor = (ADR[10] ^ ADR[9] ^ ADR[8] ^ ADR[7] ^ ADR[6] ^ ADR[5] ^ ADR[4] ^ ADR[3] ^ ADR[2] ^ ADR[1] ^ ADR[0] ^ ME ^ WE[3] ^ WE[2] ^ WE[1] ^ WE[0]);

// Detect a write to any byte
assign write_accs = WE[3] | WE [2] | WE[1] | WE[0];


 	always @ (posedge CLK or negedge reset_n)
     		if (~reset_n)
      			begin
         		addr_xor_ff   <= 1'b0;
         		data_xor_ff   <= 1'b0;
			end
		else
			begin
			addr_xor_ff <= addr_xor;
			data_xor_ff <= data_xor;
			end



	assign Q = Q_mem;


`ifdef FV_KIT_RTL_MEMORY_MODELS

generic_sram #(32, 2048, 11) i_ram
  (.clk  (CLK),
   .n_cs (1'b0),
   .n_we (~(|WE)),
   .n_oe (1'b0),
   .ad   (ADR),
   .din  (D),
   .dout (Q_mem)
   );

`else

ulp_sp_2kx32cm8sw1bk2 i_sram_core(
                .Q(Q_mem),
                .CLK(CLK),
                .ME(ME),
                .WE(write_accs),
                .ADR(ADR),
                .D(D),
		.WEM({WE[3], WE[3], WE[3], WE[3], WE[3], WE[3], WE[3], WE[3], WE[2], WE[2], WE[2], WE[2], WE[2], WE[2], WE[2], WE[2], WE[1], WE[1], WE[1], WE[1], WE[1], WE[1], WE[1], WE[1], WE[0], WE[0], WE[0], WE[0], WE[0], WE[0], WE[0], WE[0]}),
		.PD(1'b0),
		.AWT(scan_mode),
		.ALP(3'b0),
		.TEST_WB(1'b0),
		.TEST_TIMEOUT(1'b0),
		.RM(4'hf),
		.RME(1'b0)
    );

`endif


endmodule
