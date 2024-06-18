// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module( 
    input a, b,
    output cout, sum );
	
    assign sum  = a^b;
    assign cout = a&b;
        
endmodule
