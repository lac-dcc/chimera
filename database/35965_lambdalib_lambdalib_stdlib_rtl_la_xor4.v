// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: 4-Input XOR Gate                                                #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_xor4 #(
    parameter PROP = "DEFAULT"
) (
    input  a,
    input  b,
    input  c,
    input  d,
    output z
);

    assign z = a ^ b ^ c ^ d;

endmodule
