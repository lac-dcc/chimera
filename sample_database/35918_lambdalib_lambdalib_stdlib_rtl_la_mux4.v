// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: 4-Input Mux                                                     #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_mux4 #(
    parameter PROP = "DEFAULT"
) (
    input  d0,
    input  d1,
    input  d2,
    input  d3,
    input  s0,
    input  s1,
    output z
);

    assign z = (d0 & ~s1 & ~s0) | (d1 & ~s1 & s0) | (d2 & s1 & ~s0) | (d3 & s1 & s0);

endmodule
