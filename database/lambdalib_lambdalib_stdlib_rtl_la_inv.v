// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: Inverter                                                        #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_inv #(
    parameter PROP = "DEFAULT"
) (
    input  a,
    output z
);

    assign z = ~a;

endmodule
