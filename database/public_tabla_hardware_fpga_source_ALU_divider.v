// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
module divider (
	in1,
  	in2,
  	out
);
	//--------------------------------------------------------------------------------------
	parameter dataLen = 32;
	parameter fractionLen = 15;
	//--------------------------------------------------------------------------------------

	//--------------------------------------------------------------------------------------
	input [dataLen - 1 : 0 ]  in1;
	input [dataLen - 1 : 0 ]  in2;
	output [dataLen - 1 : 0 ] out;
	//--------------------------------------------------------------------------------------

	assign out = in1 / in2;

endmodule
