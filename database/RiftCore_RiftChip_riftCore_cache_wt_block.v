// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: wt_block
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-03-12 10:33:54
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-17 18:04:50
*/



/*
  Copyright (c) 2020 - 2021 Ruige Lee <wut.ruigeli@gmail.com>

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

`timescale 1 ns / 1 ps
`include "define.vh"



module wt_block #
(
	parameter DW = 64 + 8 + 32,
	parameter DP = 8,
	parameter TAG_W = 32
)
(
	input [31:0] chkAddr,
	output isHazard_r,

	input push,
	input [DW-1:0] data_i,

	input pop,
	output [DW-1:0] data_o,

	input commit,
	output isOpin_O,
	output isOpin_W,
	output empty,
	output full,

	input flush,
	input CLK,
	input RSTn
);






	// assign io_access = (& (~lsu_op1[63:32]) ) & ~lsu_op1[31] & ~lsu_op1[30];
	// assign mem_access = (& (~lsu_op1[63:32]) ) & lsu_op1[31];



wire [DP-1:0] isAddrHit_r;
wire [DP-1:0] Op_O;
wire [DP-1:0] Op_W;

generate
	for ( genvar dp = 0; dp < DP; dp = dp + 1 ) begin

		wire [31:0] wtb_addr_qout = wtb_info_qout[ DW*dp +: 32];

		assign Op_O[dp] = ~wtb_addr_qout[31] & ~wtb_addr_qout[30];
		assign Op_W[dp] = wtb_addr_qout[31];

		assign isAddrHit_r[dp] = 
			  (Op_W[dp] & ( chkAddr[31 -: TAG_W] == wtb_addr_qout[31 -: TAG_W] ) & valid_qout[dp])
			| (Op_O[dp] & ( chkAddr == wtb_addr_qout ) & valid_qout[dp]);

	end
endgenerate

assign isHazard_r = | isAddrHit_r;
assign isOpin_O = | Op_O;
assign isOpin_W = | Op_W;

assign data_o = wtb_info_qout[DW*rdp_qout[AW-1:0]+:DW];







wire [DW*DP-1:0] wtb_info_dnxt;
wire [DW*DP-1:0] wtb_info_qout;
wire [DP-1:0] wtb_info_en;

wire [DP-1:0] valid_dnxt;
wire [DP-1:0] valid_qout;
wire [DP-1:0] valid_en;

wire [DP-1:0] commit_dnxt;
wire [DP-1:0] commit_qout;
// wire [DP-1:0] commit_en;



localparam AW = $clog2(DP);




assign wtb_info_en = {DP{push}} & ((1 << wrp_qout[AW-1:0]));


assign valid_en =
		  ({DP{pop }} & (1 << rdp_qout[AW-1:0]))
		| ({DP{push}} & (1 << wrp_qout[AW-1:0]))
		| flush;




// assign commit_en = 
// 		  ({DP{pop }} & (1 << rdp_qout[AW-1:0]))
// 		| ({DP{commit}} & (1 << ccp_qout[AW-1:0]));		


assign commit_dnxt =
			(
				commit_qout
				& ~({DP{pop }} & (1 << rdp_qout[AW-1:0]))
			)
				| ({DP{commit}} & (1 << ccp_qout[AW-1:0]));

generate
	for ( genvar dp = 0; dp < DP; dp = dp + 1 ) begin


		assign wtb_info_dnxt[DW*dp+:DW] = data_i;
	assign valid_dnxt[dp] = flush ? commit_dnxt[dp] : (push & wrp_qout[AW-1:0] == dp );
	// assign commit_dnxt[dp] = commit & (ccp_qout[AW-1:0] == dp);



		gen_dffren # (.DW(DW)) wtb_info_dffren 
		(
			.dnxt(wtb_info_dnxt[DW*dp +: DW]),
			.qout(wtb_info_qout[DW*dp +: DW]),
			.en(wtb_info_en[dp]),
			.CLK(CLK),
			.RSTn(RSTn)
		);


		gen_dffr # (.DW(1)) commit_dffr
		(
			.dnxt(commit_dnxt[dp]),
			.qout(commit_qout[dp]),
			// .en(commit_en[dp]),
			.CLK(CLK),
			.RSTn(RSTn)
		);




		gen_dffren # (.DW(1)) valid_dffren
		(
			.dnxt(valid_dnxt[dp]),
			.qout(valid_qout[dp]),
			.en(valid_en[dp]),
			.CLK(CLK),
			.RSTn(RSTn)
		);

	end

endgenerate






wire [AW+1-1:0] rdp_dnxt;
wire [AW+1-1:0] rdp_qout;
wire [AW+1-1:0] wrp_dnxt;
wire [AW+1-1:0] wrp_qout;
wire [AW+1-1:0] ccp_dnxt;
wire [AW+1-1:0] ccp_qout;


gen_dffr #( .DW(AW+1) ) rdp_dffr ( .dnxt(rdp_dnxt), .qout(rdp_qout), .CLK(CLK), .RSTn(RSTn));
gen_dffr #( .DW(AW+1) ) wrp_dffr ( .dnxt(wrp_dnxt), .qout(wrp_qout), .CLK(CLK), .RSTn(RSTn));
gen_dffr #( .DW(AW+1) ) ccp_dffr ( .dnxt(ccp_dnxt), .qout(ccp_qout), .CLK(CLK), .RSTn(RSTn));


assign rdp_dnxt = pop  ? rdp_qout + 'd1 : rdp_qout;
assign wrp_dnxt = flush ? ccp_qout : (push ? wrp_qout + 'd1 : wrp_qout);
assign ccp_dnxt = commit ? ccp_qout + 'd1 : ccp_qout;


assign full = (wrp_qout[AW-1:0] == rdp_qout[AW-1:0]) & (wrp_qout[AW] != rdp_qout[AW]);
assign empty = ccp_qout == rdp_qout;





//ASSERT
always @( negedge CLK ) begin

	if (0) begin
		$display("Assert Fail at wtb_block");
		$stop;
	end

end






endmodule






