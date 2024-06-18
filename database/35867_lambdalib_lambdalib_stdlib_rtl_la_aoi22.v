// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: And-Or-Inverter (aoi22) Gate                                    #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_aoi22 #(
    parameter PROP = "DEFAULT"
) (
    input  a0,
    input  a1,
    input  b0,
    input  b1,
    output z
);

    assign z = ~((a0 & a1) | (b0 & b1));

endmodule
