// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
	
    assign out = a^b^c^d;
    
endmodule