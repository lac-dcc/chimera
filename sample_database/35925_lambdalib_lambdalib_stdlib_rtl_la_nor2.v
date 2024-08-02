// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: 2 Input Nor Gate                                                #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_nor2 #(
    parameter PROP = "DEFAULT"
) (
    input  a,
    input  b,
    output z
);

    assign z = ~(a | b);

endmodule
