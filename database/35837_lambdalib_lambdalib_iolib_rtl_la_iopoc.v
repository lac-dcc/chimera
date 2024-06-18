// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

/*****************************************************************************
 * Function: IO power-on-control cell
 * Copyright: Lambda Project Authors. All rights Reserved.
 * License:  MIT (see LICENSE file in Lambda repository)
 *
 * Docs:
 *
 *
 ****************************************************************************/
module la_iopoc #(
    parameter TYPE  = "DEFAULT",  // cell type
    parameter SIDE  = "NO",       // "NO", "SO", "EA", "WE"
    parameter RINGW = 8           // width of io ring
) (
    inout             vdd,    // core supply
    inout             vss,    // core ground
    inout             vddio,  // io supply
    inout             vssio,  // io ground
    inout [RINGW-1:0] ioring  // generic io-ring interface
);

endmodule
