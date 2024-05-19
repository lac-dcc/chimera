// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

`default_nettype none
`timescale 1ns/1ps

module clock_divider #( parameter DIV_N = 'd4 ) ( input wire clk_in, output wire clk_out, input wire do_reset, output reg is_ready );
 
	reg [DIV_N-1:0] divcounter;
 
	always @(posedge clk_in)
		if(do_reset) begin
			divcounter <= 32'b0;
			is_ready <= 1'b1;
		end
		else divcounter <= divcounter + 'd1;
 
	assign clk_out = divcounter[DIV_N-1];

endmodule

