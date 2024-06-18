// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module (
    input [4:1] x, 
    output f );
	
    assign f = (x[2]&x[4])|(x[3]&x[4])|(x[3]&~x[1]);
endmodule
