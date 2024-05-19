// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// FDRE primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator coverage_off */
module FDRE
#(
    parameter [0:0] IS_C_INVERTED = 1'b0,
    parameter [0:0] IS_D_INVERTED = 1'b0,
    parameter [0:0] IS_R_INVERTED = 1'b0,
    parameter [0:0] INIT          = 1'b0
)
(
    // Clock
    input  wire C,
    // Clock enable
    input  wire CE,
    // Synchronous reset
    input  wire R,
    // Data in
    input  wire D,
    // Data out
    output wire Q
);
    reg _r_Q;

    wire _w_D = D ^ IS_D_INVERTED;
    wire _w_R = R ^ IS_R_INVERTED;
    
    initial begin : INIT_STATE
        _r_Q = INIT[0];
    end

    generate
        if (IS_C_INVERTED) begin : GEN_CLK_NEG
            always @(negedge C) begin
            
                if (_w_R) begin
                    _r_Q <= 1'b0;
                end
                else if (CE) begin
                    _r_Q <= _w_D;
                end
            end
        end
        else begin : GEN_CLK_POS
            always @(posedge C) begin
            
                if (_w_R) begin
                    _r_Q <= 1'b0;
                end
                else if (CE) begin
                    _r_Q <= _w_D;
                end
            end
        end
    endgenerate
    
    assign Q = _r_Q;

endmodule
/* verilator coverage_on */
