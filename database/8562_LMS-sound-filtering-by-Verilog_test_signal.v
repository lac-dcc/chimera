// This program was cloned from: https://github.com/maxs-well/LMS-sound-filtering-by-Verilog
// License: GNU General Public License v3.0

/**
	*	@Function: LMS order
	*	@Date		:	2019/07/09
	*	@Vision		:	v1.0
	*	@Note		: 	refer to LMS_Delay.mdl lms64 16_oder w0
	*	@Author		:	WoodFan
	*	@param	clk		: fpga main clock
	*	@param	rst_n	: active low reset signal
	*/
`timescale 1ns/10ps

module test_signal
(	
	input	       clk,
	input	[15:0] in,
	output  reg[15:0] out
);

//assign out = {{B{in[W-1]}},in[W-1-:O_W-B]};

always @ (posedge clk)
begin
	out <= in;
end


endmodule 
