// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

module DataPath (BRGCLK, cnt_en, cnt_rst, ld_en,N);
	input BRGCLK, cnt_en, cnt_rst, ld_en;
 	output [7 : 0]N;
	wire [7 : 0] cnt_output;

	my_cnt counter(BRGCLK, cnt_en, cnt_rst, cnt_output);
	Reg my_reg(BRGCLK, ld_en, cnt_output, N);
endmodule

module my_cnt(clk, en, rst,out);
	input clk, en, rst;
	output reg [7 : 0]out;
	always @(posedge clk, posedge rst)
	begin
		if (rst)
			out <= 0;
		else if (en)
			out <= out + 1;
	end
endmodule

module Reg(clk, ld,in,out);

	input clk, ld;
	input [7 : 0]in;
	output reg [7 : 0] out;	
	always @(posedge clk)
	begin
		if (ld)
			out <= in;
	end
endmodule