// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// LDCE primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator coverage_off */
module LDCE
#(
    parameter INIT = 1'b0
)
(
    // Asynchronous clear
    input  wire CLR,
    // Latch
    input  wire G,
    // Latch enable
    input  wire GE,
    // Data in
    input  wire D,
    // Data out
    output wire Q
);
    reg _r_Q;

    initial begin : INIT_STATE
        _r_Q = INIT[0];
    end
    
    always @(CLR or G or GE or D) begin : LATCH
    
        if (CLR) begin
            _r_Q = 1'b0;
        end
        else if (G & GE) begin
            _r_Q = D;
        end
    end
    
    assign Q = _r_Q;

endmodule
/* verilator coverage_on */
