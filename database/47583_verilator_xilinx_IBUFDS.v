// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// IBUFDS primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator coverage_off */
module IBUFDS
#(
    parameter CAPACITANCE      = "DONT_CARE",
    parameter DIFF_TERM        = "FALSE",
    parameter DQS_BIAS         = "FALSE",
    parameter IBUF_DELAY_VALUE = "0",
    parameter IBUF_LOW_PWR     = "TRUE",
    parameter IFD_DELAY_VALUE  = "AUTO",
    parameter IOSTANDARD       = "DEFAULT"
)
(
    // Clock input
    input  I,
    input  IB,
    // Clock outputs
    output O /* verilator clocker */
);

    assign O = I;
    
endmodule
/* verilator coverage_on */
