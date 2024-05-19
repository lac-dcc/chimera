// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: 2-Input one-hot mux                                             #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_dmux2 #(
    parameter PROP = "DEFAULT"
) (
    input  sel1,
    input  sel0,
    input  in1,
    input  in0,
    output out
);

    assign out = (sel0 & in0) | (sel1 & in1);

endmodule
