// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function:  Positive edge-triggered static D-type flop-flop with async     #
//#            active low preset and scan input.                              #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:   MIT (see LICENSE file in Lambda repository)                    #
//#############################################################################

module la_sdffsq #(
    parameter PROP = "DEFAULT"
) (
    input      d,
    input      si,
    input      se,
    input      clk,
    input      nset,
    output reg q
);

    always @(posedge clk or negedge nset)
        if (!nset) q <= 1'b1;
        else q <= se ? si : d;

endmodule
