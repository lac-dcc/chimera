// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: Positive edge-triggered static D-type flop-flop                 #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_dffq #(
    parameter PROP = "DEFAULT"
) (
    input      d,
    input      clk,
    output reg q
);

    always @(posedge clk) q <= d;

endmodule
