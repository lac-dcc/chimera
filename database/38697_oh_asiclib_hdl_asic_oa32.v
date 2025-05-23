// This program was cloned from: https://github.com/aolofsson/oh
// License: MIT License

//#############################################################################
//# Function: Or-And (oa32) Gate                                              #
//# Copyright: OH Project Authors. ALl rights Reserved.                       #
//# License:  MIT (see LICENSE file in OH repository)                         #
//#############################################################################

module asic_oa32 #(parameter PROP = "DEFAULT")   (
    input  a0,
    input  a1,
    input  a2,
    input  b0,
    input  b1,
    output z
    );

   assign z = (a0 | a1 | a2) & (b0 | b1);

endmodule
