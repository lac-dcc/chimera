// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// RAM32X1D primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator coverage_off */
module RAM32X1D
#(
    parameter  [31:0] INIT = 32'h0,
    parameter   [0:0] IS_WCLK_INVERTED = 1'b0
)
(
    // Write clock
    input  wire       WCLK,
    // Write enable
    input  wire       WE,
    // Read / Write address
    input  wire       A0,
    input  wire       A1,
    input  wire       A2,
    input  wire       A3,
    input  wire       A4,
    // Read address
    input  wire       DPRA0,
    input  wire       DPRA1,
    input  wire       DPRA2,
    input  wire       DPRA3,
    input  wire       DPRA4,
    // Data in
    input  wire       D,
    // Data out
    output wire       SPO,
    output wire       DPO
);
    // Read / Write address
    wire  [4:0] _w_A    = { A4, A3, A2, A1, A0 };
    // Read address
    wire  [4:0] _w_DPRA = { DPRA4, DPRA3, DPRA2, DPRA1, DPRA0 };
    // 32 x 1-bit Select RAM
    reg  [31:0] _r_mem;
    
    // Power-up value
    initial begin : INIT_STATE
        _r_mem = INIT;
    end
    
    // Synchronous memory write
    generate
        if (IS_WCLK_INVERTED) begin : GEN_WCLK_NEG
            always @(negedge WCLK) begin : MEM_WRITE
            
                if (WE) begin
                    _r_mem[_w_A] <= D;
                end
            end
        end
        else begin : GEN_WCLK_POS
            always @(posedge WCLK) begin : MEM_WRITE
            
                if (WE) begin
                    _r_mem[_w_A] <= D;
                end
            end
        end
    endgenerate
    
    // Asynchronous memory read
    assign SPO = _r_mem[_w_A];
    assign DPO = _r_mem[_w_DPRA];

endmodule
/* verilator coverage_on */
