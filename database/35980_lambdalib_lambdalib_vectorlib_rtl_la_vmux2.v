// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: 2-Input one-hot vectorized mux                                  #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_vmux2 #(
    parameter N    = 1,         // width of mux
    parameter PROP = "DEFAULT"  // cell property
) (
    input          sel1,
    input          sel0,
    input  [N-1:0] in1,
    input  [N-1:0] in0,
    output [N-1:0] out    //selected data output
);

    assign out[N-1:0] = ({(N) {sel0}} & in0[N-1:0] | {(N) {sel1}} & in1[N-1:0]);

endmodule
