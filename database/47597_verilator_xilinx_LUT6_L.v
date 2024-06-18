// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// LUT6_L primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator coverage_off */
module LUT6_L
#(
    parameter [63:0] INIT = 64'h0000000000000000
)
(
    input  wire I0, I1, I2, I3, I4, I5,
    output wire LO
);
    wire [5:0] _w_idx = { I5, I4, I3, I2, I1, I0 };
    
    assign LO = INIT[_w_idx];

endmodule
/* verilator coverage_on */
