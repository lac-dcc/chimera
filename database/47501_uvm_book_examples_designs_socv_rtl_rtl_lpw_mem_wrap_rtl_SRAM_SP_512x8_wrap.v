// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : SRAM_SP_512x8_wrap.v
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
module SRAM_SP_512x8_wrap(
                Q,
                CLK,
                ME,
                WE,
                ADR,
                D,
		reset_n,
		scan_mode
   	);


input [7:0] 	D;
input          	CLK;
input        	ME;
input          	WE;
input [8:0]  	ADR;
input		reset_n;
input		scan_mode;
output [7:0] 	Q;

wire 		addr_xor;
wire		data_xor;
wire [7:0]	Q_mem;
reg		addr_xor_ff;
reg		data_xor_ff;


assign data_xor = (D[7] ^ D[6] ^ D[5] ^ D[4] ^ D[3] ^ D[2] ^ D[1] ^ D[0]);

assign addr_xor = (ADR[8] ^ ADR[7] ^ ADR[6] ^ ADR[5] ^ ADR[4] ^ ADR[3] ^ ADR[2] ^ ADR[1] ^ ADR[0] ^ ME ^ WE);

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

generic_sram #(8, 512, 9) i_ram
  (.clk  (CLK),
   .n_cs (1'b0),
   .n_we (~WE),
   .n_oe (1'b0),
   .ad   (ADR),
   .din  (D),
   .dout (Q_mem)
   );

`else

ulp_sp_512x8cm4sw1bk1 i_sram_core(
                .Q(Q_mem),
                .CLK(CLK),
                .ME(ME),
                .WE(WE),
                .ADR(ADR),
                .D(D),
		.WEM(8'hff),
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
