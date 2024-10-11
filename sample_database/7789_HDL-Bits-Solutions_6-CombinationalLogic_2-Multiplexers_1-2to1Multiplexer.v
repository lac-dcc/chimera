// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module( 
    input a, b, sel,
    output out ); 
	
    assign out  = sel?b:a;
endmodule
