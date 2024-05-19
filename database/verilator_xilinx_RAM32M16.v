// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// RAM32M16 primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator coverage_off */
module RAM32M16
#(
    parameter  [63:0] INIT_A           = 64'h0,
    parameter  [63:0] INIT_B           = 64'h0,
    parameter  [63:0] INIT_C           = 64'h0,
    parameter  [63:0] INIT_D           = 64'h0,
    parameter  [63:0] INIT_E           = 64'h0,
    parameter  [63:0] INIT_F           = 64'h0,
    parameter  [63:0] INIT_G           = 64'h0,
    parameter  [63:0] INIT_H           = 64'h0,
    parameter   [0:0] IS_WCLK_INVERTED = 1'b0
)
(
    // Write clock
    input  wire       WCLK,
    // Write enable
    input  wire       WE,
    // Port A
    input  wire [4:0] ADDRA,
    input  wire [1:0] DIA,
    output wire [1:0] DOA,
    // Port B
    input  wire [4:0] ADDRB,
    input  wire [1:0] DIB,
    output wire [1:0] DOB,
    // Port C
    input  wire [4:0] ADDRC,
    input  wire [1:0] DIC,
    output wire [1:0] DOC,
    // Port D
    input  wire [4:0] ADDRD,
    input  wire [1:0] DID,
    output wire [1:0] DOD,
    // Port E
    input  wire [4:0] ADDRE,
    input  wire [1:0] DIE,
    output wire [1:0] DOE,
    // Port F
    input  wire [4:0] ADDRF,
    input  wire [1:0] DIF,
    output wire [1:0] DOF,
    // Port G
    input  wire [4:0] ADDRG,
    input  wire [1:0] DIG,
    output wire [1:0] DOG,
    // Port H
    input  wire [4:0] ADDRH,
    input  wire [1:0] DIH,
    output wire [1:0] DOH
);
    // 64 x 8-bit Select RAM
    reg [63:0] _r_mem_a;
    reg [63:0] _r_mem_b;
    reg [63:0] _r_mem_c;
    reg [63:0] _r_mem_d;
    reg [63:0] _r_mem_e;
    reg [63:0] _r_mem_f;
    reg [63:0] _r_mem_g;
    reg [63:0] _r_mem_h;

    // Power-up value
    initial begin : INIT_STATE
        _r_mem_a = INIT_A;
        _r_mem_b = INIT_B;
        _r_mem_c = INIT_C;
        _r_mem_d = INIT_D;
        _r_mem_e = INIT_E;
        _r_mem_f = INIT_F;
        _r_mem_g = INIT_G;
        _r_mem_h = INIT_H;
    end
    
    // Synchronous memory write
    generate
        if (IS_WCLK_INVERTED) begin : GEN_WCLK_NEG
            always @(negedge WCLK) begin : MEM_WRITE
            
                if (WE) begin
                    _r_mem_a[{ ADDRH, 1'b0 } +: 2] <= DIA;
                    _r_mem_b[{ ADDRH, 1'b0 } +: 2] <= DIB;
                    _r_mem_c[{ ADDRH, 1'b0 } +: 2] <= DIC;
                    _r_mem_d[{ ADDRH, 1'b0 } +: 2] <= DID;
                    _r_mem_e[{ ADDRH, 1'b0 } +: 2] <= DIE;
                    _r_mem_f[{ ADDRH, 1'b0 } +: 2] <= DIF;
                    _r_mem_g[{ ADDRH, 1'b0 } +: 2] <= DIG;
                    _r_mem_h[{ ADDRH, 1'b0 } +: 2] <= DIH;
                end
            end
        end
        else begin : GEN_WCLK_POS
            always @(posedge WCLK) begin : MEM_WRITE
            
                if (WE) begin
                    _r_mem_a[{ ADDRH, 1'b0 } +: 2] <= DIA;
                    _r_mem_b[{ ADDRH, 1'b0 } +: 2] <= DIB;
                    _r_mem_c[{ ADDRH, 1'b0 } +: 2] <= DIC;
                    _r_mem_d[{ ADDRH, 1'b0 } +: 2] <= DID;
                    _r_mem_e[{ ADDRH, 1'b0 } +: 2] <= DIE;
                    _r_mem_f[{ ADDRH, 1'b0 } +: 2] <= DIF;
                    _r_mem_g[{ ADDRH, 1'b0 } +: 2] <= DIG;
                    _r_mem_h[{ ADDRH, 1'b0 } +: 2] <= DIH;
                end
            end
        end
    endgenerate
    
    // Asynchronous memory read
    assign DOA = _r_mem_a[{ ADDRA, 1'b0 } +: 2];
    assign DOB = _r_mem_b[{ ADDRB, 1'b0 } +: 2];
    assign DOC = _r_mem_c[{ ADDRC, 1'b0 } +: 2];
    assign DOD = _r_mem_d[{ ADDRD, 1'b0 } +: 2];
    assign DOE = _r_mem_e[{ ADDRE, 1'b0 } +: 2];
    assign DOF = _r_mem_f[{ ADDRF, 1'b0 } +: 2];
    assign DOG = _r_mem_g[{ ADDRG, 1'b0 } +: 2];
    assign DOH = _r_mem_h[{ ADDRH, 1'b0 } +: 2];
    
endmodule
/* verilator coverage_on */
