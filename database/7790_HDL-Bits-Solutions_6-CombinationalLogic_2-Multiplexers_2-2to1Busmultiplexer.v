// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );
	assign out = sel?b:a;
endmodule
