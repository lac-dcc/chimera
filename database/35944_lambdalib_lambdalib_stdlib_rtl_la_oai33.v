// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: Or-And-Inverter (oai33) Gate                                    #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_oai33 #(
    parameter PROP = "DEFAULT"
) (
    input  a0,
    input  a1,
    input  a2,
    input  b0,
    input  b1,
    input  b2,
    output z
);

    assign z = ~((a0 | a1 | a2) & (b0 | b1 | b2));

endmodule
