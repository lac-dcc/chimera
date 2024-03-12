`timescale 1ns/1ns

module FDM(
	input CK,
	input D,
	output reg Q,
	output nQ
);

	initial
		Q <= 1'b0;

	always @(posedge CK)
		Q <= #2 D;
	
	assign nQ = ~Q;

endmodule
