// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: 2-Input Inverting Mux                                           #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_muxi2 #(
    parameter PROP = "DEFAULT"
) (
    input  d0,
    input  d1,
    input  s,
    output z
);

    assign z = ~((d0 & ~s) | (d1 & s));

endmodule
