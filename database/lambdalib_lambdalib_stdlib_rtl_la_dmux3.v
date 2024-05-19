// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: 3-Input one-hot mux                                             #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_dmux3 #(
    parameter PROP = "DEFAULT"
) (
    input  sel0,
    input  sel1,
    input  sel2,
    input  in0,
    input  in1,
    input  in2,
    output out
);

    assign out = (sel0 & in0) | (sel1 & in1) | (sel2 & in2);

endmodule
