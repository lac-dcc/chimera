// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function:  Positive edge-triggered static inverting D-type flop-flop with #
//             async active low reset.                                        #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:   MIT (see LICENSE file in Lambda repository)                    #
//#############################################################################

module la_dffrqn #(
    parameter PROP = "DEFAULT"
) (
    input      d,
    input      clk,
    input      nreset,
    output reg qn
);

    always @(posedge clk or negedge nreset)
        if (!nreset) qn <= 1'b1;
        else qn <= ~d;

endmodule
