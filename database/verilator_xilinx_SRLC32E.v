// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// SRLC32E primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator coverage_off */
module SRLC32E
#(
    parameter [31:0] INIT = 32'h0,
    parameter  [0:0] IS_CLK_INVERTED = 1'b0
)
(
    // Clock
    input  wire       CLK,
    // Clock enable
    input  wire       CE,
    // Bit output position
    input  wire [4:0] A,
    // Data in
    input  wire       D,
    // Data out
    output wire       Q,
    // Cascading data out
    output wire       Q31
);
    
    // 32-bit shift register
    reg  [31:0] _r_srl;
    
    // Power-up value
    initial begin
        _r_srl = INIT;
    end
    
    // Shifter logic
    generate
        if (IS_CLK_INVERTED) begin : GEN_CLK_NEG
            always @(negedge CLK) begin : SHIFTER_32B
            
                if (CE) begin
                    _r_srl <= { _r_srl[30:0], D };
                end
            end
        end
        else begin : GEN_CLK_POS
            always @(posedge CLK) begin : SHIFTER_32B
            
                if (CE) begin
                    _r_srl <= { _r_srl[30:0], D };
                end
            end
        end
    endgenerate
    
    // Data out
    assign Q   = _r_srl[A];
    
    // Cascading data out
    assign Q31 = _r_srl[31];

endmodule
/* verilator coverage_on */
