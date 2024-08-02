// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
module comp #(
parameter   LEN = 8
)(
    in1,
    in2,
    out
);

	// *****************************************************************************
	

	// *****************************************************************************
	input	[LEN - 1 : 0]   in1;
	input	[LEN - 1 : 0]   in2;
	output out;

	// *****************************************************************************
	assign out = ( in1 >= in2 ) ? 1 : 0;

endmodule
