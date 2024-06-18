// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: N-Input one hot mux                                             #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_vmux #(
    parameter N    = 1,         // number of ports
    parameter W    = 1,         // data width
    parameter PROP = "DEFAULT"  // cell property
) (
    input      [  N-1:0] sel,  // select vector
    input      [W*N-1:0] in,   // concatenated input {..,in1[W-1:0],in0[W-1:0]}
    output reg [  W-1:0] out   // output
);

    integer i;
    always @* begin
        out[W-1:0] = 'b0;
        for (i = 0; i < N; i = i + 1) out[W-1:0] = out[W-1:0] | {(W) {sel[i]}} & in[i*W+:W];
    end

    // TODO: Add One hot warning
    // Add generate code to map to actual la_mux sizes..

endmodule
