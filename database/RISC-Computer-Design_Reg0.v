// This program was cloned from: https://github.com/Harminder13/RISC-Computer-Design
// License: MIT License

module Reg0 (
	input wire clk, 
	input wire clr, 
	input wire W_E, 
	input wire BAout, 
	input wire[31:0] input_D, 
	output reg[31:0] busMuxIn
	);
	
	initial output_Q = 32'b0;
	
	always @ (posedge clk) begin
		
		Register R0(
		.clk(clk),
		.clr(clr),
		.W_E(W_E),
		.input_D(input_D),
		.output_Q(output_Q)
		);
		
		busMuxIn <= (~BAout && output_Q);
		
	end
endmodule
