// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: Or-And-Inverter (oai31) Gate                                    #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_oai31 #(
    parameter PROP = "DEFAULT"
) (
    input  a0,
    input  a1,
    input  a2,
    input  b0,
    output z
);

    assign z = ~((a0 | a1 | a2) & b0);

endmodule
