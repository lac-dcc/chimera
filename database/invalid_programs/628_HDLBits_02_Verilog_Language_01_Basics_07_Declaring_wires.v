// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    
    wire one, two, three;
    assign one = a && b; 
    assign two = c && d;
    
    assign three = one || two;
    assign out = three;
    assign out_n = ~three;
    
endmodule