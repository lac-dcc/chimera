// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : SRAM_DP_64x36_wrap.v
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
module SRAM_DP_64x36_wrap(
                QA,                         
                QB,                         
                ADRA,                        
                DA,                         
                WEA,                              
                MEA,                              
                CLKA,                             
                ADRB,                        
                DB,                         
                WEB,                              
                MEB,                              
                CLKB,                             
      		reset_n,
		scan_mode
   	);


input  [5:0]    ADRA;                       
input [35:0]    DA;                         
input           WEA;                              
input           MEA;                              
input           CLKA;                             
input  [5:0]    ADRB;                       
input [35:0]    DB;                       
input           WEB;                              
input           MEB;                              
input           CLKB;                             

input		reset_n;
input		scan_mode;
output [35:0]   QA;                         
output [35:0]   QB;                         

wire 		addra_xor;
wire		dataa_xor;
wire 		addrb_xor;
wire		datab_xor;
wire [35:0]	QA_mem;
wire [35:0]	QB_mem;
reg		addra_xor_ff;
reg		dataa_xor_ff;
reg		addrb_xor_ff;
reg		datab_xor_ff;


assign dataa_xor = (DA[35] ^ DA[34] ^ DA[33] ^ DA[32] ^ DA[31] ^ DA[30] ^ DA[29] ^ DA[28] ^ DA[27] ^ DA[26] ^ DA[25] ^ DA[24] ^ DA[23] ^ DA[22] ^ DA[21] ^ DA[20] ^ DA[19] ^ DA[18] ^ DA[17] ^ DA[16] ^ DA[15] ^ DA[14] ^ DA[13] ^ DA[12] ^ DA[11] ^ DA[10] ^ DA[9] ^ DA[8] ^ DA[7] ^ DA[6] ^ DA[5] ^ DA[4] ^ DA[3] ^ DA[2] ^ DA[1] ^ DA[0]);

assign datab_xor = (DB[35] ^ DB[34] ^ DB[33] ^ DB[32] ^ DB[31] ^ DB[30] ^ DB[29] ^ DB[28] ^ DB[27] ^ DB[26] ^ DB[25] ^ DB[24] ^ DB[23] ^ DB[22] ^ DB[21] ^ DB[20] ^ DB[19] ^ DB[18] ^ DB[17] ^ DB[16] ^ DB[15] ^ DB[14] ^ DB[13] ^ DB[12] ^ DB[11] ^ DB[10] ^ DB[9] ^ DB[8] ^ DB[7] ^ DB[6] ^ DB[5] ^ DB[4] ^ DB[3] ^ DB[2] ^ DB[1] ^ DB[0]);

assign addra_xor = (ADRA[5] ^ ADRA[4] ^ ADRA[3] ^ ADRA[2] ^ ADRA[1] ^ ADRA[0] ^ MEA ^ WEA);
assign addrb_xor = (ADRB[5] ^ ADRB[4] ^ ADRB[3] ^ ADRB[2] ^ ADRB[1] ^ ADRB[0] ^ MEB ^ WEB);

 	always @ (posedge CLKA or negedge reset_n)
     		if (~reset_n)
      			begin
         		addra_xor_ff   <= 1'b0;
         		dataa_xor_ff   <= 1'b0;
			end
		else
			begin
			addra_xor_ff <= addra_xor;
			dataa_xor_ff <= dataa_xor;
			end

 	always @ (posedge CLKB or negedge reset_n)
     		if (~reset_n)
      			begin
         		addrb_xor_ff   <= 1'b0;
         		datab_xor_ff   <= 1'b0;
			end
		else
			begin
			addrb_xor_ff <= addrb_xor;
			datab_xor_ff <= datab_xor;
			end



	assign QA = scan_mode ? 36'b0 : QA_mem;
	assign QB = scan_mode ? 36'b0 : QB_mem;



`ifdef FV_KIT_RTL_MEMORY_MODELS

generic_dpsram #(36, 64, 6) i_sram_core
  (.clk0  (CLKA),
   .clk1  (CLKB),
   .n_cs0 (~MEA),
   .n_cs1 (~MEB),
   .n_we0 (~WEA),
   .n_we1 (~WEB),
   .n_oe0 (1'b0),
   .n_oe1 (1'b0),
   .ad0   (ADRA),
   .ad1   (ADRB),
   .di0   (DA),
   .di1   (DB),
   .do0   (QA_mem),
   .do1   (QB_mem)
  );

`else

ulp_dp_64x36cm4sw1bk1 i_sram_core(
                .QA(QA_mem),
                .QB(QB_mem),
                .CLKA(CLKA),
                .CLKB(CLKB),
                .MEA(MEA),
                .WEA(WEA),
                .ADRA(ADRA),
                .DA(DA),
		.WEMA(36'hfffffffff),
                .MEB(MEB),
                .WEB(WEB),
                .ADRB(ADRB),
                .DB(DB),
		.WEMB(36'hfffffffff),
                .RMA(4'b0),                         
		.RMB(4'b0),
                .RMENA(1'b0),                            
		.RMENB(1'b0)
    );

`endif


endmodule
