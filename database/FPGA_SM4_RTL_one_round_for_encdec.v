`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Raymond Rui Chen, raymond.rui.chen@qq.com
// 
// Create Date: 2018/03/10 10:20:34
// Design Name: 
// Module Name: one_round_for_encdec
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
module one_round_for_encdec(
		data_in,
		round_key_in,
		result_out
	);
input	[127:0]		data_in;
input	[31:0]		round_key_in;
output	[127:0]		result_out;

wire	[31:0]	word_0;
wire	[31:0]	word_1;
wire	[31:0]	word_2;
wire	[31:0]	word_3;
wire	[31:0]	tmp_0;
wire	[31:0]	tmp_1;
wire	[31:0]	data_for_transform;
wire	[31:0]	data_after_transform;

assign { word_0, word_1, word_2, word_3} = data_in;
			
assign	tmp_0				=	word_1 ^ word_2;
assign	tmp_1				=	word_3 ^ round_key_in;
assign	data_for_transform	=	tmp_0 ^ tmp_1;
assign	result_out			=	{word_1, word_2, word_3, data_after_transform ^ word_0}	;

transform_for_encdec u_transform	
	(
		.data_in(data_for_transform),
		.result_out(data_after_transform)
	);
	
endmodule	