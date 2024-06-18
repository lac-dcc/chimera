// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module(
    input a,
    input b,
    input c,
    output out  ); 
    assign out = a&(~b)&(~c) | c | b&(~c);
endmodule