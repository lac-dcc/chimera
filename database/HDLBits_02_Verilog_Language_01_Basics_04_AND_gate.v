// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module( 
    input a, 
    input b, 
    output out );
	assign out = a && b;
endmodule