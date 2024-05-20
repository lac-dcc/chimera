// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : SRAM_SP_16x128_wrap.v
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
module SRAM_SP_16x128_wrap(
                Q,
                CLK,
                ME,
                WE,
                ADR,
                D,
		reset_n,
		scan_mode
   	);


input [127:0] 	D;
input          	CLK;
input        	ME;
input          	WE;
input [3:0]  	ADR;
input		reset_n;
input		scan_mode;
output [127:0] 	Q;

wire 		addr_xor;
wire		data_xor;
wire [127:0]	Q_mem;
reg		addr_xor_ff;
reg		data_xor_ff;
wire  [4:0]	ADR_int;

assign data_xor = (D[127] ^ D[126] ^ D[125] ^ D[124] ^ D[123] ^ D[122] ^ D[121] ^ D[120] ^ D[119] ^ D[118] ^ D[117] ^ D[116] ^ D[115] ^ D[114] ^ D[113] ^ D[112] ^ D[111] ^ D[110] ^ D[109] ^ D[108] ^ D[107] ^ D[106] ^ D[105] ^ D[104] ^ D[103] ^ D[102] ^ D[101] ^ D[100] ^ D[99] ^ D[98] ^ D[97] ^ D[96] ^ D[95] ^ D[94] ^ D[93] ^ D[92] ^ D[91] ^ D[90] ^ D[89] ^ D[88] ^ D[87] ^ D[86] ^ D[85] ^ D[84] ^ D[83] ^ D[82] ^ D[81] ^ D[80] ^ D[79] ^ D[78] ^ D[77] ^ D[76] ^ D[75] ^ D[74] ^ D[73] ^ D[72] ^ D[71] ^ D[70] ^ D[69] ^ D[68] ^ D[67] ^ D[66] ^ D[65] ^ D[64] ^ D[63] ^ D[62] ^ D[61] ^ D[60] ^ D[59] ^ D[58] ^ D[57] ^ D[56] ^ D[55] ^ D[54] ^ D[53] ^ D[52] ^ D[51] ^ D[50] ^ D[49] ^ D[48] ^ D[47] ^ D[46] ^ D[45] ^ D[44] ^ D[43] ^ D[42] ^ D[41] ^ D[40] ^ D[39] ^ D[38] ^ D[37] ^ D[36] ^ D[35] ^ D[34] ^ D[33] ^ D[32] ^ D[31] ^ D[30] ^ D[29] ^ D[28] ^ D[27] ^ D[26] ^ D[25] ^ D[24] ^ D[23] ^ D[22] ^ D[21] ^ D[20] ^ D[19] ^ D[18] ^ D[17] ^ D[16] ^ D[15] ^ D[14] ^ D[13] ^ D[12] ^ D[11] ^ D[10] ^ D[9] ^ D[8] ^ D[7] ^ D[6] ^ D[5] ^ D[4] ^ D[3] ^ D[2] ^ D[1] ^ D[0]);

assign addr_xor = (ADR[3] ^ ADR[2] ^ ADR[1] ^ ADR[0] ^ ME ^ WE);

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

assign ADR_int[4] = 1'b0;
assign ADR_int[3:0] = ADR[3:0];

`ifdef FV_KIT_RTL_MEMORY_MODELS

generic_sram #(128, 16, 4) i_ram
  (.clk  (CLK),
   .n_cs (1'b0),
   .n_we (~(|WE)),
   .n_oe (1'b0),
   .ad   (ADR),
   .din  (D),
   .dout (Q_mem)
   );

`else

ulp_sp_32x128cm4sw1bk1 i_sram_core(
                .Q(Q_mem),
                .CLK(CLK),
                .ME(ME),
                .WE(WE),
                .ADR(ADR_int),
                .D(D),
		.WEM(128'hffffffffffffffffffffffffffffffff),
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
