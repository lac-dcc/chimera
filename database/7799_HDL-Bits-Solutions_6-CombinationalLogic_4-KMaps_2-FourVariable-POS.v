// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

//Here product of sum is used.

module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
	
    assign out = (c|!d|!b) & (!a|!b|c) & (a|b|!c|!d) & (!a|!c|d);
endmodule
