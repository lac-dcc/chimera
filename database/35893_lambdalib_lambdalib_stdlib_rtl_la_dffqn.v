// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: Positive edge-triggered inverting static D-type flop-flop       #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_dffqn #(
    parameter PROP = "DEFAULT"
) (
    input d,
    input clk,
    output reg qn
);

    always @(posedge clk) qn <= ~d;

endmodule
