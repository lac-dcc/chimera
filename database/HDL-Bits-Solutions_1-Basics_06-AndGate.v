// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module( 
    input a, 
    input b, 
    output out );
	
    assign out = a & b;	// & : Bit-wise and operator
    
endmodule
