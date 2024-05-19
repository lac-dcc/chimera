// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: 3-Input Inverting Mux                                           #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_muxi3 #(
    parameter PROP = "DEFAULT"
) (
    input  d0,
    input  d1,
    input  d2,
    input  s0,
    input  s1,
    output z
);

    assign z = ~((d0 & ~s0 & ~s1) | (d1 & s0 & ~s1) | (d2 & s1));

endmodule
