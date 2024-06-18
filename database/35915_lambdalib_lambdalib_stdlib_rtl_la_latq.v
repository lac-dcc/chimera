// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function:  D-type active-high transparent latch                           #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:   MIT (see LICENSE file in Lambda repository)                    #
//#############################################################################

module la_latq #(
    parameter PROP = "DEFAULT"
) (
    input      d,
    input      clk,
    output reg q
);

    always @(clk or d) if (clk) q <= d;

endmodule
