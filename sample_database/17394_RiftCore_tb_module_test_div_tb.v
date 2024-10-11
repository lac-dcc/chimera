// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: div_tb
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-12-23 14:37:23
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-03 12:08:10
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



module div_tb (

);
	reg CLK;
	reg RSTn;
	reg mulDiv_exeparam_valid;
	reg rv64m_div,rv64m_divu, rv64m_rem, rv64m_remu, rv64m_divw, rv64m_divuw, rv64_remw, rv64m_remuw;	

	reg [63:0] src1;
	reg [63:0] src2;






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
		(mulDiv_exeparam_valid & div_fun) ? 
			{64'd0, dividend_load} :
			((div_cnt_qout == 6'd0) ? dividend_qout : divided)
			;

	assign divisor_dnxt = (mulDiv_exeparam_valid & div_fun) ? 
						divisor_load :
						divisor_qout;


	assign div_cnt_dnxt = (mulDiv_exeparam_valid & div_fun) ? 
							7'd64 :
							(div_cnt_qout == 6'd0 ? div_cnt_qout : div_cnt_qout - 1);


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
				dividend_sign ? $signed(-dividend_qout[63:0]) : dividend_qout[63:0]
		);

	wire [63:0] rema = 
		({64{div_by_zero}} & (is32w ? { {32{src1[31]}}, src1} : src1 ) )
		|
		({64{div_overflow}} & 64'd0 )
		|
		(
			{64{(~div_by_zero)&(~div_overflow)}} &
				(dividend_sign^divisor_sign) ? $signed(-dividend_qout[127:64]): dividend_qout[127:64]
		);
		





	gen_dffr # (.DW(128)) dividend ( .dnxt(dividend_dnxt), .qout(dividend_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(64)) divisor ( .dnxt(divisor_dnxt), .qout(divisor_qout), .CLK(CLK), .RSTn(RSTn));
	gen_dffr # (.DW(7)) div_cnt ( .dnxt(div_cnt_dnxt), .qout(div_cnt_qout), .CLK(CLK), .RSTn(RSTn));








initial
begin
	$dumpfile("../build/div_tb.vcd"); //生成的vcd文件名称
	$dumpvars(0, div_tb);//tb模块名称
end



initial begin

	CLK = 0;
	RSTn = 0;

	#20

	RSTn <= 1;

	#8000
			$display("Time Out !!!");
	 $finish;
end

initial begin
	forever begin 
		#5 CLK <= ~CLK;
	end
end

initial begin

	mulDiv_exeparam_valid = 0;
	rv64m_div = 0;
	rv64m_divu = 0;
	rv64m_rem = 0;
	rv64m_remu = 0;
	rv64m_divw = 0;
	rv64m_divuw = 0;
	rv64_remw = 0;
	rv64m_remuw	= 0;

	src1 = 0;
	src2 = 0;

	#36

	mulDiv_exeparam_valid = 1;
	rv64m_div = 0;
	rv64m_divu = 1;
	rv64m_rem = 0;
	rv64m_remu = 0;
	rv64m_divw = 0;
	rv64m_divuw = 0;
	rv64_remw = 0;
	rv64m_remuw	= 0;

	src1 = 64'hffffffffffff0000;
	src2 = 1;

# 10

	mulDiv_exeparam_valid = 0;




end
































endmodule



