// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
module FlipFlop (
	clk,
	reset,
	wrt,
	dataIn,
	dataOut
);
	//--------------------------------------------------------------------------------------
	input  clk;
	input  reset;
	input  wrt;
	input  dataIn;
	output dataOut;
	
	//--------------------------------------------------------------------------------------
	reg data;
	
	always @(posedge clk) begin
		if (wrt)
			data <= dataIn;
		
		if (reset)
			data <= 1'b0;
	end
	
	assign dataOut = data;

endmodule
