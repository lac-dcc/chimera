// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// BUFG primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/*verilator coverage_off*/
module BUFG
(
    input  I,
    output O /* verilator clocker */
);

    assign O = I;

endmodule
/*verilator coverage_on*/