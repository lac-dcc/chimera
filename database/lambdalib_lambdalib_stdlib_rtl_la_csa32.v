// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: Carry Save Adder (3:2)                                          #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_csa32 #(
    parameter PROP = "DEFAULT"
) (
    input  a,
    input  b,
    input  c,
    output sum,
    output carry
);

    assign sum   = a ^ b ^ c;
    assign carry = (a & b) | (b & c) | (c & a);

endmodule
