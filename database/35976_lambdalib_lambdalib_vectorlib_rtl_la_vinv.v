// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

//#############################################################################
//# Function: Vectorized inverter cell                                        #
//# Copyright: Lambda Project Authors. All rights Reserved.                   #
//# License:  MIT (see LICENSE file in Lambda repository)                     #
//#############################################################################

module la_vinv #(
    parameter N    = 1,         // width of data inputs
    parameter PROP = "DEFAULT"  // custom cell property
) (
    input  [N-1:0] a,
    output [N-1:0] z
);

    la_inv #(
        .PROP(PROP)
    ) i0[N-1:0] (
        .a(a[N-1:0]),
        .z(z[N-1:0])
    );

endmodule
