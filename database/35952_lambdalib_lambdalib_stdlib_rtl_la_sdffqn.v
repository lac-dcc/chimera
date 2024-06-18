// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: Positive edge-triggered inverting static D-type flop-flop       #
//#           with scan input.                                                #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_sdffqn #(
    parameter PROP = "DEFAULT"
) (
    input      d,
    input      si,
    input      se,
    input      clk,
    output reg qn
);

    always @(posedge clk) qn <= se ? ~si : ~d;

endmodule
