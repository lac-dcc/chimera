// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    assign out_or_bitwise[2:0] = a|b; 
    assign out_or_logical = a||b;
    assign out_not[5:3] = ~b;
    assign out_not[2:0] = ~a;

endmodule