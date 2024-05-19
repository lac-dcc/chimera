// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: mul
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-12-22 10:50:16
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-11 19:19:01
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


module mul #(
	parameter DW = `MUL_EXEPARAM_DW 
)
(
	input mul_exeparam_valid,
	output mul_execute_ready,
	input [DW-1:0] mul_exeparam,

	output mul_writeback_valid,
	output [63:0] mul_res_qout,
	output [(5+`RB)-1:0] mul_rd0_qout,

	//from regFile
	input [(64*`RP*32)-1:0] regFileX_read,

	input flush,
	input CLK,
	input RSTn		
);



	wire rv64m_mul, rv64m_mulh, rv64m_mullhsu, rv64m_mulhu, rv64m_div, rv64m_divu, rv64m_rem, rv64m_remu, rv64m_mulw, rv64m_divw, rv64m_divuw, rv64_remw, rv64m_remuw;

	wire [(5+`RB)-1:0] mul_rs1;
	wire [(5+`RB)-1:0] mul_rs2;
	wire [(5+`RB)-1:0] mul_rd0_dnxt;


	assign {
			rv64m_mul,
			rv64m_mulh,
			rv64m_mullhsu,
			rv64m_mulhu,
			rv64m_div,
			rv64m_divu,
			rv64m_rem,
			rv64m_remu,
			rv64m_mulw,
			rv64m_divw,
			rv64m_divuw,
			rv64_remw,
			rv64m_remuw,

			mul_rd0_dnxt,
			mul_rs1,
			mul_rs2

			} = mul_exeparam;


	wire [63:0] src1 = regFileX_read[ 64*mul_rs1 +: 64];
	wire [63:0] src2 = regFileX_read[ 64*mul_rs2 +: 64];

	initial $warning("only can syn in FPGA in this verison");

	wire mul_fun = rv64m_mul | rv64m_mulh | rv64m_mullhsu | rv64m_mulhu | rv64m_mulw;



	wire mul_op1_sign = (rv64m_mul | rv64m_mulh | rv64m_mullhsu | rv64m_mulw) & ( rv64m_mulw ? src1[31] : src1[63]);
	wire mul_op2_sign = (rv64m_mul | rv64m_mulh | rv64m_mulw) & ( rv64m_mulw ? src2[31] : src2[63]);

	wire [64:0] mul_op1 = rv64m_mulw ? { {33{mul_op1_sign}}, src1[31:0] } : { mul_op1_sign, src1 };
	wire [64:0] mul_op2 = rv64m_mulw ? { {33{mul_op2_sign}}, src2[31:0] } : { mul_op2_sign, src2 };

	wire signed [127:0] muls = $signed(mul_op1) * $signed(mul_op2);







	//div
	wire div_fun = 
		rv64m_div
		| rv64m_divu
		| rv64m_rem
		| rv64m_remu
		| rv64m_divw
		| rv64m_divuw
		| rv64_remw
		| rv64m_remuw;

	wire is32w = rv64m_divw | rv64m_divuw | rv64_remw | rv64m_remuw;
	wire isUsi = rv64m_divu | rv64m_remu | rv64m_divuw | rv64m_remuw;


	wire [127:0] dividend_dnxt, dividend_qout;
	wire [63:0] divisor_dnxt, divisor_qout;
	wire [63:0] div_res_dnxt, div_res_qout;
	wire [6:0] div_cnt_dnxt, div_cnt_qout;

	wire [63:0] dividend_load = isUsi ? 
									src1 : 
									( 
										is32w ?  
											{ 32'b0, (src1[31] ? $signed(-src1[31:0]) : src1[31:0])} : 
											(src1[63] ? $signed(-src1) : src1)
									);

	wire [63:0] divisor_load = isUsi ? 
									src2 : 
									( 
										is32w ?  
										{ {32'b0}, (src2[31] ? $signed(-src2[31:0]) : src2[31:0])} : 
											(src2[63] ? $signed(-src2) : src2)
									);


	wire div_cmp;
	wire [127:0] dividend_shift;
	wire [127:0] divided;

	assign dividend_dnxt = 
		(mul_exeparam_valid & div_fun) ? 
			{64'd0, dividend_load} :
			((div_cnt_qout == 7'd64) ? dividend_qout : divided)
			;

	assign divisor_dnxt = (mul_exeparam_valid & div_fun) ? 
						divisor_load :
						divisor_qout;


	assign div_cnt_dnxt = (mul_exeparam_valid & div_fun) ? 
							7'd0 :
							(div_cnt_qout == 7'd65 ? div_cnt_qout : div_cnt_qout + 1);


	assign dividend_shift = dividend_qout << 1;
	assign div_cmp = dividend_shift[127:64] >= divisor_qout;
	assign divided = div_cmp ? 
						{(dividend_shift[127:64] - divisor_qout), dividend_shift[63:1], 1'b1} :
						dividend_shift;



	wire dividend_sign = isUsi ? 1'b0 : (is32w ? src1[31] : src1[63]);
	wire divisor_sign  = isUsi ? 1'b0 : (is32w ? src2[31] : src2[63]);
	wire div_by_zero = (src2 == 64'd0);
	wire div_overflow = ~isUsi & 
							(
								(is32w & (src1[31] & ~src1[30:0]) & (&src2[31:0]))
								|
								(~is32w & (src1[63] & ~src1[62:0]) & (&src2[63:0]))								
							);



	wire [63:0] quot = 
		({64{div_by_zero}} & {64{1'b1}})
		|
		({64{div_overflow}} & (is32w ? { {33{1'b1}}, 31'b0 } : {1'b1, 63'b0}))
		|
		(
			{64{(~div_by_zero)&(~div_overflow)}} &
				((dividend_sign^divisor_sign) ? $signed(-dividend_qout[63:0]) : dividend_qout[63:0])
		);

	wire [63:0] rema = 
		({64{div_by_zero}} & (is32w ? { {32{src1[31]}}, src1} : src1 ) )
		|
		({64{div_overflow}} & 64'd0 )
		|
		(
			{64{(~div_by_zero)&(~div_overflow)}} &
				((dividend_sign) ? $signed(-dividend_qout[127:64]): dividend_qout[127:64])
		);
		

	gen_dffr # (.DW(128)) dividend ( .dnxt(dividend_dnxt), .qout(dividend_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(64)) divisor ( .dnxt(divisor_dnxt), .qout(divisor_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(7)) div_cnt ( .dnxt(div_cnt_dnxt), .qout(div_cnt_qout), .CLK(CLK), .RSTn(RSTn));









	wire [63:0] mul_res_dnxt = {64{valid_dnxt}} & 
		(
			( {64{rv64m_mul}} & muls[63:0] )
			| ({64{rv64m_mulh}} & muls[127:64] )
			| ({64{rv64m_mullhsu}} & muls[127:64] )
			| ({64{rv64m_mulhu}} & muls[127:64] )
			| ({64{rv64m_div}} & quot)
			| ({64{rv64m_divu}} & quot)
			| ({64{rv64m_rem}} & rema)
			| ({64{rv64m_remu}} & rema)
			| ({64{rv64m_mulw}} & {{32{muls[31]}},muls[31:0]} )
			| ({64{rv64m_divw}} & {{32{quot[31]}}, quot[31:0]} )
			| ({64{rv64m_divuw}} & {{32{quot[31]}}, quot[31:0]} )
			| ({64{rv64_remw}} & { {32{rema[31]}}, rema[31:0] } )
			| ({64{rv64m_remuw}} & { {32{rema[31]}}, rema[31:0]})
		);



	wire valid_dnxt;

	wire mul_valid;
	wire div_valid;

	assign mul_valid = mul_exeparam_valid & mul_fun;
	assign div_valid = div_fun & 
						(
							(mul_exeparam_valid & (div_by_zero | div_overflow))
							|
							(div_cnt_qout == 7'd64 & ~mul_execute_ready)
						);


	assign valid_dnxt = (~flush) & (mul_valid | div_valid);


	wire ready_set;
	wire ready_rst;

	assign ready_set = (mul_valid | div_valid) | flush;
	assign ready_rst = ~ready_set & mul_exeparam_valid & ~flush;

	// assign ready_dnxt = (mul_exeparam_valid & 1'b0)
	// 					|
	// 					(valid_dnxt & 1'b1)
	// 					|
	// 					(~mul_exeparam_valid & ~valid_dnxt & mul_execute_ready);
	// 					|
	// 					flush


	gen_dffr # (.DW((5+`RB))) mul_rd0 ( .dnxt(mul_rd0_dnxt), .qout(mul_rd0_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(64)) mul_res ( .dnxt(mul_res_dnxt), .qout(mul_res_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(1)) valid ( .dnxt(valid_dnxt), .qout(mul_writeback_valid), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr # (.DW(1), .rstValue(1'b1)) ready_rsffr ( .set_in(ready_set), .rst_in(ready_rst), .qout(mul_execute_ready), .CLK(CLK), .RSTn(RSTn));




endmodule
















