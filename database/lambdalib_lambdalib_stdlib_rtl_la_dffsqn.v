// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function:  Positive edge-triggered static inverting D-type flop-flop with #
//             async active low set.                                          #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:   MIT (see LICENSE file in Lambda repository)                    #
//#############################################################################

module la_dffsqn #(
    parameter PROP = "DEFAULT"
) (
    input d,
    input clk,
    input nset,
    output reg qn
);

    always @(posedge clk or negedge nset)
        if (!nset) qn <= 1'b0;
        else qn <= ~d;

endmodule
