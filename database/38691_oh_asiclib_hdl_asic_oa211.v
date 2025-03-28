// This program was cloned from: https://github.com/aolofsson/oh
// License: MIT License

//#############################################################################
//# Function: Or-And (oa211) Gate                                             #
//# Copyright: OH Project Authors. ALl rights Reserved.                       #
//# License:  MIT (see LICENSE file in OH repository)                         #
//#############################################################################

module asic_oa211 #(parameter PROP = "DEFAULT")   (
    input  a0,
    input  a1,
    input  b0,
    input  c0,
    output z
    );

   assign z = (a0 | a1) & b0 & c0;

endmodule
