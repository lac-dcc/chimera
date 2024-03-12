`timescale 1ns/1ns

module FS2(
	input CK,
	input [3:0] P,
	input SD, L,
	output reg [3:0] Q = 4'd0
);

	always @(posedge ~CK)	// negedge CK
	begin
		if (L)
			Q <= #1 P;					// Load
		else
			Q <= #1 {Q[2:0], SD};	// Shift
	end

endmodule
