`timescale 1ns/1ns

module FD3(
	input nCK,
	input D,
	input nSET,
	output reg Q = 1'b0,
	output nQ
);

	always @(posedge ~nCK or posedge ~nSET)
	begin
		if (!nSET)
			Q <= #1 1'b1;
		else
			Q <= #1 D;
	end
	
	assign nQ = ~Q;

endmodule
