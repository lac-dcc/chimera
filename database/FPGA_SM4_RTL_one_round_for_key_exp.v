// This program was cloned from: https://github.com/raymondrc/FPGA_SM4
// License: GNU General Public License v3.0

`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Raymond Rui Chen, raymond.rui.chen@qq.com
// 
// Create Date: 2018/03/09 21:13:57
// Design Name: 
// Module Name: one_round_for_key_exp
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module one_round_for_key_exp
	(
		count_round_in,
		data_in,
		ck_parameter_in,
		result_out
	);

input	[127 : 0]	data_in;
input	[31  : 0]	ck_parameter_in;
input 	[4   : 0] 	count_round_in;

output	[127 : 0]	result_out;


localparam FK0	=	32'ha3b1bac6;
localparam FK1	=	32'h56aa3350;
localparam FK2	=	32'h677d9197;
localparam FK3	=	32'hb27022dc;

wire	[31:0]	word_0;
wire	[31:0]	word_1;
wire	[31:0]	word_2;
wire	[31:0]	word_3;
wire	[31:0]	tmp_0;
wire	[31:0]	tmp_1;
wire	[31:0]	data_for_xor;
wire	[31:0]	data_for_transform;
wire	[31:0]	data_after_transform_key;
wire	[31:0]	k0;
wire	[31:0]	k1;
wire	[31:0]	k2;
wire	[31:0]	k3;

assign	{	word_0,
			word_1,
			word_2,
			word_3}	=	data_in;

assign	k0					=	word_0^FK0;
assign	k1					=	word_1^FK1;
assign	k2					=	word_2^FK2;
assign	k3					=	word_3^FK3;
assign	data_for_xor		=	ck_parameter_in;
assign	tmp_0				=	count_round_in == 'd0 ? k1^k2 : word_1^word_2;
assign	tmp_1				=	count_round_in == 'd0 ? k3^data_for_xor	: word_3^data_for_xor;
assign	data_for_transform	=	tmp_0 ^ tmp_1;

assign	result_out			=	count_round_in == 'd0	?
								{k1, k2, k3, data_after_transform_key ^ k0}:
								{word_1, word_2, word_3, data_after_transform_key ^ word_0};

transform_for_key_exp	u_transform_key
	(
		.data_in(data_for_transform),
		.data_after_linear_key_out(data_after_transform_key)
	);

	
endmodule
						
