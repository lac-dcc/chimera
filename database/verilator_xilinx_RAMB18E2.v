// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// RAMB18E2 primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator lint_off UNUSED */
/* verilator coverage_off */
module RAMB18E2
#(
    // Cascading mode
    parameter string  CASCADE_ORDER_A = "NONE",
    parameter string  CASCADE_ORDER_B = "NONE",
    // Registered outputs
    parameter integer DOA_REG         = 1,
    parameter integer DOB_REG         = 1,
    // Use address latch enable
    parameter string  ENADDRENA       = "FALSE",
    parameter string  ENADDRENB       = "FALSE",
    // Memory initialization
    parameter [255:0] INITP_00        = 256'h0,
    parameter [255:0] INITP_01        = 256'h0,
    parameter [255:0] INITP_02        = 256'h0,
    parameter [255:0] INITP_03        = 256'h0,
    parameter [255:0] INITP_04        = 256'h0,
    parameter [255:0] INITP_05        = 256'h0,
    parameter [255:0] INITP_06        = 256'h0,
    parameter [255:0] INITP_07        = 256'h0,
    parameter [255:0] INIT_00         = 256'h0,
    parameter [255:0] INIT_01         = 256'h0,
    parameter [255:0] INIT_02         = 256'h0,
    parameter [255:0] INIT_03         = 256'h0,
    parameter [255:0] INIT_04         = 256'h0,
    parameter [255:0] INIT_05         = 256'h0,
    parameter [255:0] INIT_06         = 256'h0,
    parameter [255:0] INIT_07         = 256'h0,
    parameter [255:0] INIT_08         = 256'h0,
    parameter [255:0] INIT_09         = 256'h0,
    parameter [255:0] INIT_0A         = 256'h0,
    parameter [255:0] INIT_0B         = 256'h0,
    parameter [255:0] INIT_0C         = 256'h0,
    parameter [255:0] INIT_0D         = 256'h0,
    parameter [255:0] INIT_0E         = 256'h0,
    parameter [255:0] INIT_0F         = 256'h0,
    parameter [255:0] INIT_10         = 256'h0,
    parameter [255:0] INIT_11         = 256'h0,
    parameter [255:0] INIT_12         = 256'h0,
    parameter [255:0] INIT_13         = 256'h0,
    parameter [255:0] INIT_14         = 256'h0,
    parameter [255:0] INIT_15         = 256'h0,
    parameter [255:0] INIT_16         = 256'h0,
    parameter [255:0] INIT_17         = 256'h0,
    parameter [255:0] INIT_18         = 256'h0,
    parameter [255:0] INIT_19         = 256'h0,
    parameter [255:0] INIT_1A         = 256'h0,
    parameter [255:0] INIT_1B         = 256'h0,
    parameter [255:0] INIT_1C         = 256'h0,
    parameter [255:0] INIT_1D         = 256'h0,
    parameter [255:0] INIT_1E         = 256'h0,
    parameter [255:0] INIT_1F         = 256'h0,
    parameter [255:0] INIT_20         = 256'h0,
    parameter [255:0] INIT_21         = 256'h0,
    parameter [255:0] INIT_22         = 256'h0,
    parameter [255:0] INIT_23         = 256'h0,
    parameter [255:0] INIT_24         = 256'h0,
    parameter [255:0] INIT_25         = 256'h0,
    parameter [255:0] INIT_26         = 256'h0,
    parameter [255:0] INIT_27         = 256'h0,
    parameter [255:0] INIT_28         = 256'h0,
    parameter [255:0] INIT_29         = 256'h0,
    parameter [255:0] INIT_2A         = 256'h0,
    parameter [255:0] INIT_2B         = 256'h0,
    parameter [255:0] INIT_2C         = 256'h0,
    parameter [255:0] INIT_2D         = 256'h0,
    parameter [255:0] INIT_2E         = 256'h0,
    parameter [255:0] INIT_2F         = 256'h0,
    parameter [255:0] INIT_30         = 256'h0,
    parameter [255:0] INIT_31         = 256'h0,
    parameter [255:0] INIT_32         = 256'h0,
    parameter [255:0] INIT_33         = 256'h0,
    parameter [255:0] INIT_34         = 256'h0,
    parameter [255:0] INIT_35         = 256'h0,
    parameter [255:0] INIT_36         = 256'h0,
    parameter [255:0] INIT_37         = 256'h0,
    parameter [255:0] INIT_38         = 256'h0,
    parameter [255:0] INIT_39         = 256'h0,
    parameter [255:0] INIT_3A         = 256'h0,
    parameter [255:0] INIT_3B         = 256'h0,
    parameter [255:0] INIT_3C         = 256'h0,
    parameter [255:0] INIT_3D         = 256'h0,
    parameter [255:0] INIT_3E         = 256'h0,
    parameter [255:0] INIT_3F         = 256'h0,
    parameter         INIT_FILE       = "NONE",
    // Signals polarities
    parameter   [0:0] IS_CLKARDCLK_INVERTED     = 1'b0,
    parameter   [0:0] IS_CLKBWRCLK_INVERTED     = 1'b0,
    parameter   [0:0] IS_ENARDEN_INVERTED       = 1'b0,
    parameter   [0:0] IS_ENBWREN_INVERTED       = 1'b0,
    parameter   [0:0] IS_RSTRAMARSTRAM_INVERTED = 1'b0,
    parameter   [0:0] IS_RSTRAMB_INVERTED       = 1'b0,
    parameter   [0:0] IS_RSTREGARSTREG_INVERTED = 1'b0,
    parameter   [0:0] IS_RSTREGB_INVERTED       = 1'b0,
    // NOT USED IN THIS MODEL
    parameter string  RDADDRCHANGEA       = "FALSE",
    parameter string  RDADDRCHANGEB       = "FALSE",
    parameter string  CLOCK_DOMAINS       = "INDEPENDENT",
    parameter string  SIM_COLLISION_CHECK = "ALL",
    parameter string  SLEEP_ASYNC         = "FALSE",
    // Resets configurations
    parameter string  RSTREG_PRIORITY_A   = "RSTREG",
    parameter string  RSTREG_PRIORITY_B   = "RSTREG",
    // Data registers init values
    parameter  [17:0] INIT_A              = 18'h0,
    parameter  [17:0] INIT_B              = 18'h0,
    parameter  [17:0] SRVAL_A             = 18'h0,
    parameter  [17:0] SRVAL_B             = 18'h0,
    // Write-to-read bypass mode
    parameter string  WRITE_MODE_A        = "NO_CHANGE",
    parameter string  WRITE_MODE_B        = "NO_CHANGE",
    // Data buses sizes
    parameter integer READ_WIDTH_A        = 0,
    parameter integer READ_WIDTH_B        = 0,
    parameter integer WRITE_WIDTH_A       = 0,
    parameter integer WRITE_WIDTH_B       = 0
)
(
    output wire [15:0] CASDOUTA,
    output wire [15:0] CASDOUTB,
    output wire  [1:0] CASDOUTPA,
    output wire  [1:0] CASDOUTPB,
    output wire [15:0] DOUTADOUT,
    output wire [15:0] DOUTBDOUT,
    output wire  [1:0] DOUTPADOUTP,
    output wire  [1:0] DOUTPBDOUTP,
    
    input wire  [13:0] ADDRARDADDR,
    input wire  [13:0] ADDRBWRADDR,
    input wire         ADDRENA,
    input wire         ADDRENB,
    input wire         CASDIMUXA,
    input wire         CASDIMUXB,
    input wire  [15:0] CASDINA,
    input wire  [15:0] CASDINB,
    input wire   [1:0] CASDINPA,
    input wire   [1:0] CASDINPB,
    input wire         CASDOMUXA,
    input wire         CASDOMUXB,
    input wire         CASDOMUXEN_A,
    input wire         CASDOMUXEN_B,
    input wire         CASOREGIMUXA,
    input wire         CASOREGIMUXB,
    input wire         CASOREGIMUXEN_A,
    input wire         CASOREGIMUXEN_B,
    input wire         CLKARDCLK,
    input wire         CLKBWRCLK,
    input wire  [15:0] DINADIN,
    input wire  [15:0] DINBDIN,
    input wire   [1:0] DINPADINP,
    input wire   [1:0] DINPBDINP,
    input wire         ENARDEN,
    input wire         ENBWREN,
    input wire         REGCEAREGCE,
    input wire         REGCEB,
    input wire         RSTRAMARSTRAM,
    input wire         RSTRAMB,
    input wire         RSTREGARSTREG,
    input wire         RSTREGB,
    input wire         SLEEP,
    input wire   [1:0] WEA,
    input wire   [3:0] WEBWE
);
    // ========================================================================
    // Read / write helper functions
    // ========================================================================
    
    function [35:0] read_1_bit;
        input  [4:0] addr;
        input [35:0] data;
        begin
            read_1_bit = { 35'b0, data[{ 1'b0, addr }] };
        end
    endfunction
    
    function [35:0] write_1_bit;
        input  [4:0] addr;
        input [35:0] data_old;
        input [35:0] data_new;
        begin
            write_1_bit = data_old;
            write_1_bit[{ 1'b0, addr }] = data_new[0];
        end
    endfunction
    
    function [35:0] read_2_bits;
        input  [3:0] addr;
        input [35:0] data;
        begin
            read_2_bits = { 34'b0, data[{ 1'b0, addr, 1'b0 } +: 2] };
        end
    endfunction
    
    function [35:0] write_2_bits;
        input  [3:0] addr;
        input [35:0] data_old;
        input [35:0] data_new;
        begin
            write_2_bits = data_old;
            write_2_bits[{ 1'b0, addr, 1'b0 } +: 2] = data_new[1:0];
        end
    endfunction
    
    function [35:0] read_4_bits;
        input  [2:0] addr;
        input [35:0] data;
        begin
            read_4_bits = { 32'b0, data[{ 1'b0, addr, 2'b0 } +: 4] };
        end
    endfunction
    
    function [35:0] write_4_bits;
        input  [2:0] addr;
        input [35:0] data_old;
        input [35:0] data_new;
        begin
            write_4_bits = data_old;
            write_4_bits[{ 1'b0, addr, 2'b0 } +: 4] = data_new[3:0];
        end
    endfunction
    
    function [35:0] read_9_bits;
        input  [1:0] addr;
        input [35:0] data;
        begin
            read_9_bits[35:32] = {  3'b0, data[{ 4'd8, addr       } +: 1] };
            read_9_bits[31: 0] = { 24'b0, data[{ 1'b0, addr, 3'b0 } +: 8] };
        end
    endfunction
    
    function [35:0] write_9_bits;
        input  [1:0] addr;
        input [35:0] data_old;
        input [35:0] data_new;
        begin
            write_9_bits = data_old;
            write_9_bits[{ 4'd8, addr       } +: 1] = data_new[32];
            write_9_bits[{ 1'b0, addr, 3'b0 } +: 8] = data_new[7:0];
        end
    endfunction
    
    function [35:0] read_18_bits;
        input        addr;
        input [35:0] data;
        begin
            read_18_bits[35:32] = {  2'b0, data[{ 4'd8, addr, 1'b0 } +:  2] };
            read_18_bits[31: 0] = { 16'b0, data[{ 1'b0, addr, 4'b0 } +: 16] };
        end
    endfunction
    
    function [35:0] write_18_bits;
        input        addr;
        input [35:0] data_old;
        input [35:0] data_new;
        begin
            write_18_bits = data_old;
            write_18_bits[{ 4'd8, addr, 1'b0 } +:  2] = data_new[33:32];
            write_18_bits[{ 1'b0, addr, 4'b0 } +: 16] = data_new[15: 0];
        end
    endfunction
    
    // ========================================================================
    // Global Set/Reset
    // ========================================================================

    `ifdef TOP_LEVEL
    wire        _GSR = `TOP_LEVEL.GSR;
    `else
    wire        _GSR = 1'b0;
    `endif /* TOP_LEVEL */

    // ========================================================================
    // Simple Dual Ported mode
    // ========================================================================
    wire        _w_sdp_mode_wr  = (WRITE_WIDTH_B == 36) ? 1'b1 : 1'b0;
    wire        _w_sdp_mode_rd  = (READ_WIDTH_A  == 36) ? 1'b1 : 1'b0;
    wire        _w_sdp_mode     = _w_sdp_mode_rd | _w_sdp_mode_wr;
    
    // ========================================================================
    // Address latch enable
    // ========================================================================
    wire        _w_ADDRENA      = (ENADDRENA == "TRUE") ? ADDRENA : 1'b1;
    wire        _w_ADDRENB      = (ENADDRENB == "TRUE") ? ADDRENB : 1'b1;
    
    // ========================================================================
    // Signals polarities
    // ========================================================================
    wire        _w_CLKAWRCLK    = CLKARDCLK     ^ IS_CLKARDCLK_INVERTED;
    wire        _w_CLKBWRCLK    = CLKBWRCLK     ^ IS_CLKBWRCLK_INVERTED;
    wire        _w_ENARDEN      = ENARDEN       ^ IS_ENARDEN_INVERTED;
    wire        _w_ENBWREN      = ENBWREN       ^ IS_ENBWREN_INVERTED;
    wire        _w_RSTRAMA      = RSTRAMARSTRAM ^ IS_RSTRAMARSTRAM_INVERTED;
    wire        _w_RSTRAMB      = RSTRAMB       ^ IS_RSTRAMB_INVERTED;
    wire        _w_RSTREGA      = RSTREGARSTREG ^ IS_RSTREGARSTREG_INVERTED;
    wire        _w_RSTREGB      = RSTREGB       ^ IS_RSTREGB_INVERTED;
    
    // ========================================================================
    // Inputs cascading
    // ========================================================================
    wire  [1:0] _w_DINPADINP    = (((CASCADE_ORDER_A == "LAST") ||
                                    (CASCADE_ORDER_A == "MIDDLE")) && CASDIMUXA)
                                ? CASDINPA
                                : DINPADINP;
    wire [15:0] _w_DINADIN      = (((CASCADE_ORDER_A == "LAST") ||
                                    (CASCADE_ORDER_A == "MIDDLE")) && CASDIMUXA)
                                ? CASDINA
                                : DINADIN;
    wire  [1:0] _w_DINPBDINP    = (((CASCADE_ORDER_B == "LAST") ||
                                    (CASCADE_ORDER_B == "MIDDLE")) && CASDIMUXB)
                                ? CASDINPB
                                : DINPBDINP;
    wire [15:0] _w_DINBDIN      = (((CASCADE_ORDER_B == "LAST") ||
                                    (CASCADE_ORDER_B == "MIDDLE")) && CASDIMUXB)
                                ? CASDINB
                                : DINBDIN;
    
    // ========================================================================
    // Resets
    // ========================================================================
    wire        _w_RSTREG_A     = (RSTREG_PRIORITY_A == "RSTREG")
                                ? _w_RSTREGA
                                : _w_RSTREGA & REGCEAREGCE;
    wire        _w_RSTREG_B     = (RSTREG_PRIORITY_B == "RSTREG")
                                ? _w_RSTREGB
                                : _w_RSTREGB & REGCEB;
    wire        _w_mem_rst_a    = _w_RSTRAMA;
    wire        _w_mem_rst_b    = (_w_sdp_mode) ? _w_RSTRAMA : _w_RSTRAMB;
    
    // ========================================================================
    // Set/Reset values
    // ========================================================================
    wire [35:0] _w_INIT_A       = (READ_WIDTH_A <= 9)  ? { {4{INIT_A[    8]}}, {4{INIT_A[ 7:0]}} }
                                : (READ_WIDTH_A == 18) ? { {2{INIT_A[17:16]}}, {2{INIT_A[15:0]}} }
                                : {INIT_B[17:16], INIT_A[17:16], INIT_B[15:0], INIT_A[15:0] };
    wire [17:0] _w_INIT_B       = (READ_WIDTH_B <= 9)  ? { {2{INIT_B[8]}}, {2{INIT_B[7:0]}}}
                                : INIT_B;
    wire [35:0] _w_SRVAL_A      = (READ_WIDTH_A <= 9)  ? { {4{SRVAL_A[    8]}}, {4{SRVAL_A[ 7:0]}} }
                                : (READ_WIDTH_A == 18) ? { {2{SRVAL_A[17:16]}}, {2{SRVAL_A[15:0]}} }
                                : {SRVAL_B[17:16], SRVAL_A[17:16], SRVAL_B[15:0], SRVAL_A[15:0] };
    wire [17:0] _w_SRVAL_B      = (READ_WIDTH_B <= 9)  ? { {2{SRVAL_B[8]}}, {2{SRVAL_B[7:0]}}}
                                : SRVAL_B;
                                  
    // ========================================================================
    // Internal clocks
    // ========================================================================
    wire        _w_mem_rd_clk_a = _w_CLKAWRCLK;
    wire        _w_mem_rd_clk_b = (_w_sdp_mode) ? 1'b0 : _w_CLKBWRCLK;
    wire        _w_mem_wr_clk_a = (_w_sdp_mode) ? 1'b0 : _w_CLKAWRCLK;
    wire        _w_mem_wr_clk_b = _w_CLKBWRCLK;
    
    // ========================================================================
    // Port A signals
    // ========================================================================
    wire        _w_mem_rd_en_a;
    wire        _w_mem_wr_en_a;
    reg         _r_mem_wr_en_a_wf;
    wire [35:0] _w_mem_wr_a;
    reg  [35:0] _r_mem_a_wf_p0;
    reg  [35:0] _r_mem_a_rd_p0;
    wire [35:0] _w_mem_a_out_p0;
    wire [35:0] _w_mem_a_mux_p0;
    reg  [35:0] _r_mem_a_rd_p1;
    wire [35:0] _w_mem_a_mux_p1;
    
    // ========================================================================
    // Port B signals
    // ========================================================================
    wire        _w_mem_rd_en_b;
    wire        _w_mem_wr_en_b;
    reg         _r_mem_wr_en_b_wf;
    wire [35:0] _w_mem_wr_b;
    reg  [35:0] _r_mem_b_wf_p0;
    reg  [17:0] _r_mem_b_rd_p0;
    wire [17:0] _w_mem_b_out_p0;
    wire [17:0] _w_mem_b_mux_p0;
    reg  [17:0] _r_mem_b_rd_p1;
    wire [17:0] _w_mem_b_mux_p1;
    
    // ========================================================================
    // 512 x 36-bit block RAM
    // ========================================================================
    
    /* verilator lint_off MULTIDRIVEN */
    reg [35:0] _r_mem [0:511];
    /* verilator lint_on MULTIDRIVEN */
    
    // ========================================================================
    // Block RAM initialization
    // ========================================================================
    
    generate
        if (INIT_FILE == "NONE") begin : GEN_XILINX_INIT
            initial begin : XILINX_INIT
                reg [255:0] _v_init  [0:63];
                reg  [31:0] _v_data;
                reg  [31:0] _v_initp [0:63];
                reg   [3:0] _v_datap;
                reg   [8:0] _v_addr;
                integer _i, _j;
                
                // Initialization vectors (data & parity)
                _v_init[6'h00] = INIT_00; _v_initp[6'h00] = INITP_00['h00 +: 32];
                _v_init[6'h01] = INIT_01; _v_initp[6'h01] = INITP_00['h20 +: 32];
                _v_init[6'h02] = INIT_02; _v_initp[6'h02] = INITP_00['h40 +: 32];
                _v_init[6'h03] = INIT_03; _v_initp[6'h03] = INITP_00['h60 +: 32];
                _v_init[6'h04] = INIT_04; _v_initp[6'h04] = INITP_00['h80 +: 32];
                _v_init[6'h05] = INIT_05; _v_initp[6'h05] = INITP_00['hA0 +: 32];
                _v_init[6'h06] = INIT_06; _v_initp[6'h06] = INITP_00['hC0 +: 32];
                _v_init[6'h07] = INIT_07; _v_initp[6'h07] = INITP_00['hE0 +: 32];
                _v_init[6'h08] = INIT_08; _v_initp[6'h08] = INITP_01['h00 +: 32];
                _v_init[6'h09] = INIT_09; _v_initp[6'h09] = INITP_01['h20 +: 32];
                _v_init[6'h0A] = INIT_0A; _v_initp[6'h0A] = INITP_01['h40 +: 32];
                _v_init[6'h0B] = INIT_0B; _v_initp[6'h0B] = INITP_01['h60 +: 32];
                _v_init[6'h0C] = INIT_0C; _v_initp[6'h0C] = INITP_01['h80 +: 32];
                _v_init[6'h0D] = INIT_0D; _v_initp[6'h0D] = INITP_01['hA0 +: 32];
                _v_init[6'h0E] = INIT_0E; _v_initp[6'h0E] = INITP_01['hC0 +: 32];
                _v_init[6'h0F] = INIT_0F; _v_initp[6'h0F] = INITP_01['hE0 +: 32];
                _v_init[6'h10] = INIT_10; _v_initp[6'h10] = INITP_02['h00 +: 32];
                _v_init[6'h11] = INIT_11; _v_initp[6'h11] = INITP_02['h20 +: 32];
                _v_init[6'h12] = INIT_12; _v_initp[6'h12] = INITP_02['h40 +: 32];
                _v_init[6'h13] = INIT_13; _v_initp[6'h13] = INITP_02['h60 +: 32];
                _v_init[6'h14] = INIT_14; _v_initp[6'h14] = INITP_02['h80 +: 32];
                _v_init[6'h15] = INIT_15; _v_initp[6'h15] = INITP_02['hA0 +: 32];
                _v_init[6'h16] = INIT_16; _v_initp[6'h16] = INITP_02['hC0 +: 32];
                _v_init[6'h17] = INIT_17; _v_initp[6'h17] = INITP_02['hE0 +: 32];
                _v_init[6'h18] = INIT_18; _v_initp[6'h18] = INITP_03['h00 +: 32];
                _v_init[6'h19] = INIT_19; _v_initp[6'h19] = INITP_03['h20 +: 32];
                _v_init[6'h1A] = INIT_1A; _v_initp[6'h1A] = INITP_03['h40 +: 32];
                _v_init[6'h1B] = INIT_1B; _v_initp[6'h1B] = INITP_03['h60 +: 32];
                _v_init[6'h1C] = INIT_1C; _v_initp[6'h1C] = INITP_03['h80 +: 32];
                _v_init[6'h1D] = INIT_1D; _v_initp[6'h1D] = INITP_03['hA0 +: 32];
                _v_init[6'h1E] = INIT_1E; _v_initp[6'h1E] = INITP_03['hC0 +: 32];
                _v_init[6'h1F] = INIT_1F; _v_initp[6'h1F] = INITP_03['hE0 +: 32];
                _v_init[6'h20] = INIT_20; _v_initp[6'h20] = INITP_04['h00 +: 32];
                _v_init[6'h21] = INIT_21; _v_initp[6'h21] = INITP_04['h20 +: 32];
                _v_init[6'h22] = INIT_22; _v_initp[6'h22] = INITP_04['h40 +: 32];
                _v_init[6'h23] = INIT_23; _v_initp[6'h23] = INITP_04['h60 +: 32];
                _v_init[6'h24] = INIT_24; _v_initp[6'h24] = INITP_04['h80 +: 32];
                _v_init[6'h25] = INIT_25; _v_initp[6'h25] = INITP_04['hA0 +: 32];
                _v_init[6'h26] = INIT_26; _v_initp[6'h26] = INITP_04['hC0 +: 32];
                _v_init[6'h27] = INIT_27; _v_initp[6'h27] = INITP_04['hE0 +: 32];
                _v_init[6'h28] = INIT_28; _v_initp[6'h28] = INITP_05['h00 +: 32];
                _v_init[6'h29] = INIT_29; _v_initp[6'h29] = INITP_05['h20 +: 32];
                _v_init[6'h2A] = INIT_2A; _v_initp[6'h2A] = INITP_05['h40 +: 32];
                _v_init[6'h2B] = INIT_2B; _v_initp[6'h2B] = INITP_05['h60 +: 32];
                _v_init[6'h2C] = INIT_2C; _v_initp[6'h2C] = INITP_05['h80 +: 32];
                _v_init[6'h2D] = INIT_2D; _v_initp[6'h2D] = INITP_05['hA0 +: 32];
                _v_init[6'h2E] = INIT_2E; _v_initp[6'h2E] = INITP_05['hC0 +: 32];
                _v_init[6'h2F] = INIT_2F; _v_initp[6'h2F] = INITP_05['hE0 +: 32];
                _v_init[6'h30] = INIT_30; _v_initp[6'h30] = INITP_06['h00 +: 32];
                _v_init[6'h31] = INIT_31; _v_initp[6'h31] = INITP_06['h20 +: 32];
                _v_init[6'h32] = INIT_32; _v_initp[6'h32] = INITP_06['h40 +: 32];
                _v_init[6'h33] = INIT_33; _v_initp[6'h33] = INITP_06['h60 +: 32];
                _v_init[6'h34] = INIT_34; _v_initp[6'h34] = INITP_06['h80 +: 32];
                _v_init[6'h35] = INIT_35; _v_initp[6'h35] = INITP_06['hA0 +: 32];
                _v_init[6'h36] = INIT_36; _v_initp[6'h36] = INITP_06['hC0 +: 32];
                _v_init[6'h37] = INIT_37; _v_initp[6'h37] = INITP_06['hE0 +: 32];
                _v_init[6'h38] = INIT_38; _v_initp[6'h38] = INITP_07['h00 +: 32];
                _v_init[6'h39] = INIT_39; _v_initp[6'h39] = INITP_07['h20 +: 32];
                _v_init[6'h3A] = INIT_3A; _v_initp[6'h3A] = INITP_07['h40 +: 32];
                _v_init[6'h3B] = INIT_3B; _v_initp[6'h3B] = INITP_07['h60 +: 32];
                _v_init[6'h3C] = INIT_3C; _v_initp[6'h3C] = INITP_07['h80 +: 32];
                _v_init[6'h3D] = INIT_3D; _v_initp[6'h3D] = INITP_07['hA0 +: 32];
                _v_init[6'h3E] = INIT_3E; _v_initp[6'h3E] = INITP_07['hC0 +: 32];
                _v_init[6'h3F] = INIT_3F; _v_initp[6'h3F] = INITP_07['hE0 +: 32];
                
                // Loop over the 64 initialization vectors
                for (_j = 0; _j < 64; _j = _j + 1) begin
                    // Map them to the 512 x 36-bit block RAM
                    for (_i = 0; _i < 8; _i = _i + 1) begin
                        _v_addr         = { _j[5:0] ,_i[2:0] };
                        _v_datap        = _v_initp[_j][_i * 4 +: 4];
                        _v_data         = _v_init[_j][_i * 32 +: 32];
                        _r_mem[_v_addr] = { _v_datap, _v_data };
                    end
                end
            end
        end
        else begin : GEN_VERILOG_INIT
            initial begin : VERILOG_INIT
                integer _i;
                
                // First, clear array
                for (_i = 0; _i < 512; _i = _i + 1) begin
                    _r_mem[_i] = { 4'b0, 32'h00000000 };
                end
                // Simple .mem file (always mapped as a 512 x 36-bit hexadecimal dump)
                $readmemh(INIT_FILE, _r_mem);
            end
        end
    endgenerate

    // ========================================================================
    // Cascade control
    // ========================================================================
    reg          _r_CASDOMUXA;
    reg          _r_CASOREGIMUXA;
    reg          _r_CASDOMUXB;
    reg          _r_CASOREGIMUXB;
    wire         _w_CASDOMUXB;
    
    initial begin
        _r_CASDOMUXA    = 1'b0;
        _r_CASOREGIMUXA = 1'b0;
        _r_CASDOMUXB    = 1'b0;
        _r_CASOREGIMUXB = 1'b0;
    end
  
    always @ (posedge _w_mem_rd_clk_a) begin
    
        if (_GSR) begin
            _r_CASDOMUXA <= 1'b0;
        end
        else if (CASDOMUXEN_A) begin
            _r_CASDOMUXA <= CASDOMUXA;
        end
    end

    always @ (posedge _w_mem_rd_clk_a) begin
    
        if (_GSR) begin
            _r_CASOREGIMUXA <= 1'b0;
        end
        else if (CASOREGIMUXEN_A) begin
            _r_CASOREGIMUXA <= CASOREGIMUXA;
        end
    end

    always @ (posedge _w_mem_rd_clk_b) begin
    
        if (_GSR) begin
            _r_CASDOMUXB <= 1'b0;
        end
        else if (CASDOMUXEN_B) begin
            _r_CASDOMUXB <= CASDOMUXB;
        end
    end

    always @ (posedge _w_mem_rd_clk_b) begin
    
        if (_GSR) begin
            _r_CASOREGIMUXB <= 1'b0;
        end
        else if (CASOREGIMUXEN_B) begin
            _r_CASOREGIMUXB <= CASOREGIMUXB;
        end
    end

    assign _w_CASDOMUXB = (READ_WIDTH_A == 36) ? _r_CASDOMUXA : _r_CASDOMUXB;

    // ========================================================================
    // Port A read
    // ========================================================================
    
    assign _w_mem_rd_en_a = (WRITE_MODE_A == "NO_CHANGE")
                          ? _w_ENARDEN & (~_w_mem_wr_en_a | _w_mem_rst_a)
                          : _w_ENARDEN;
                          
    initial begin
        _r_mem_a_rd_p0 = _w_INIT_A;
        _r_mem_a_rd_p1 = _w_INIT_A;
    end
    
    always @(posedge _w_mem_rd_clk_a) begin : PORTA_READ_P0
        reg [35:0] _v_tmp1;
        reg [13:0] _v_addr;
    
        // Address latch
        if (_w_ADDRENA) begin
            _v_addr = ADDRARDADDR;
        end
        
        // Data latch
        if (_GSR) begin
            _r_mem_a_rd_p0 <= _w_INIT_A;
        end
        else if (_w_mem_rst_a) begin
            _r_mem_a_rd_p0 <= _w_SRVAL_A;
        end
        else if (_w_mem_rd_en_a) begin
            // Read memory array
            _v_tmp1 = _r_mem[_v_addr[13:5]];
            // Extract bits
            case (READ_WIDTH_A)
                1       : _r_mem_a_rd_p0 <= read_1_bit   (_v_addr[4:0], _v_tmp1);
                2       : _r_mem_a_rd_p0 <= read_2_bits  (_v_addr[4:1], _v_tmp1);
                4       : _r_mem_a_rd_p0 <= read_4_bits  (_v_addr[4:2], _v_tmp1);
                9       : _r_mem_a_rd_p0 <= read_9_bits  (_v_addr[4:3], _v_tmp1);
                18      : _r_mem_a_rd_p0 <= read_18_bits (_v_addr[4  ], _v_tmp1);
                36      : _r_mem_a_rd_p0 <= _v_tmp1;
                default : _r_mem_a_rd_p0 <= 36'b0; // Wrong width
            endcase // READ_WIDTH_A
        end
    end
    
    // Write first mode
    assign _w_mem_a_out_p0 = (_r_mem_wr_en_a_wf) ? _r_mem_a_wf_p0 : _r_mem_a_rd_p0;
    
    // Cascading mode
    assign _w_mem_a_mux_p0 =
        (((CASCADE_ORDER_A == "LAST") || (CASCADE_ORDER_A == "MIDDLE")) && _r_CASOREGIMUXA)
        ? { CASDINPB, CASDINPA, CASDINB, CASDINA } : _w_mem_a_out_p0;
    
    // Registered output
    always @ (posedge _w_mem_rd_clk_a) begin : PORTA_READ_P1
    
        if (_GSR) begin
            _r_mem_a_rd_p1 <= _w_INIT_A;
        end
        else if (_w_RSTREG_A) begin
            _r_mem_a_rd_p1 <= _w_SRVAL_A;
        end
        else if (REGCEAREGCE) begin
            _r_mem_a_rd_p1 <= _w_mem_a_mux_p0;
        end
    end

    // Registered / un-registered output
    assign _w_mem_a_mux_p1 = (DOA_REG == 1) ? _r_mem_a_rd_p1  : _w_mem_a_out_p0;
    
    // Cascading mode
    assign DOUTADOUT   = (((CASCADE_ORDER_A == "LAST") ||
                           (CASCADE_ORDER_A == "MIDDLE")) && _r_CASDOMUXA) ?
                            CASDINA  : _w_mem_a_mux_p1[15:0];
    assign DOUTPADOUTP = (((CASCADE_ORDER_A == "LAST") ||
                           (CASCADE_ORDER_A == "MIDDLE")) && _r_CASDOMUXA) ?
                            CASDINPA : _w_mem_a_mux_p1[33:32];
    assign CASDOUTA    = ((CASCADE_ORDER_A == "FIRST") || (CASCADE_ORDER_A == "MIDDLE"))
                       ? DOUTADOUT
                       : 16'b0;
    assign CASDOUTPA   = ((CASCADE_ORDER_A == "FIRST") || (CASCADE_ORDER_A == "MIDDLE"))
                       ? DOUTPADOUTP
                       : 2'b0;
    
    // ========================================================================
    // Port A write
    // ========================================================================
    
    assign _w_mem_wr_en_a = (_w_sdp_mode) ? 1'b0 : _w_ENARDEN & |WEA;
    assign _w_mem_wr_a    = { 2'b0, _w_DINPADINP, 16'b0, _w_DINADIN };
    
    always @ (posedge _w_mem_wr_clk_a) begin : PORTA_WRITE
        reg [13:0] _v_addr;
        reg [35:0] _v_tmp1;
        reg [35:0] _v_tmp2;
        
        // Address latch
        if (_w_ADDRENA) begin
            _v_addr = ADDRARDADDR;
        end
        
        if (_w_mem_wr_en_a) begin
            // Read memory array
            _v_tmp1 = _r_mem[_v_addr[13:5]];
            // Insert bits
            case (WRITE_WIDTH_A)
                1       : _v_tmp2 = write_1_bit   (_v_addr[4:0], _v_tmp1, _w_mem_wr_a);
                2       : _v_tmp2 = write_2_bits  (_v_addr[4:1], _v_tmp1, _w_mem_wr_a);
                4       : _v_tmp2 = write_4_bits  (_v_addr[4:2], _v_tmp1, _w_mem_wr_a);
                9       : _v_tmp2 = write_9_bits  (_v_addr[4:3], _v_tmp1, _w_mem_wr_a);
                18      : _v_tmp2 = write_18_bits (_v_addr[4],   _v_tmp1, _w_mem_wr_a);
                default : _v_tmp2 = _v_tmp1; // Wrong width
            endcase // WRITE_WIDTH_A
        
            // Write back memory array
            // 1/2/4/9-bit mode
            if (WRITE_WIDTH_A <= 9) begin
                if (WEA[0]) begin
                    _r_mem[_v_addr[13:5]] <= _v_tmp2;
                end
            end
            // 18-bit mode
            else if (WRITE_WIDTH_A == 18) begin
                if (WEA[1]) begin
                    _r_mem[_v_addr[13:5]][   35] <= _v_tmp2[   35];
                    _r_mem[_v_addr[13:5]][   33] <= _v_tmp2[   33];
                    _r_mem[_v_addr[13:5]][31:24] <= _v_tmp2[31:24];
                    _r_mem[_v_addr[13:5]][15: 8] <= _v_tmp2[15: 8];
                end
                if (WEA[0]) begin
                    _r_mem[_v_addr[13:5]][   34] <= _v_tmp2[   34];
                    _r_mem[_v_addr[13:5]][   32] <= _v_tmp2[   32];
                    _r_mem[_v_addr[13:5]][23:16] <= _v_tmp2[23:16];
                    _r_mem[_v_addr[13:5]][ 7: 0] <= _v_tmp2[ 7: 0];
                end
            end // WRITE_WIDTH_A
            
            // Write first mode
            if (WRITE_MODE_A == "WRITE_FIRST") begin
                case (READ_WIDTH_A)
                    1       : _r_mem_a_wf_p0 <= read_1_bit   (_v_addr[4:0], _v_tmp2);
                    2       : _r_mem_a_wf_p0 <= read_2_bits  (_v_addr[4:1], _v_tmp2);
                    4       : _r_mem_a_wf_p0 <= read_4_bits  (_v_addr[4:2], _v_tmp2);
                    9       : _r_mem_a_wf_p0 <= read_9_bits  (_v_addr[4:3], _v_tmp2);
                    18      : _r_mem_a_wf_p0 <= read_18_bits (_v_addr[4],   _v_tmp2);
                    36      : _r_mem_a_wf_p0 <= _v_tmp2;
                    default : _r_mem_a_wf_p0 <= 36'b0; // Wrong width
                endcase // READ_WIDTH_A
            end
        end
        
        // Write first mode
        if (_w_mem_rst_a) begin
            _r_mem_wr_en_a_wf <= 1'b0;
        end
        else if (_w_mem_rd_en_a) begin
            if (WRITE_MODE_A == "WRITE_FIRST") begin
                _r_mem_wr_en_a_wf <= _w_mem_wr_en_a;
            end
            else begin
                _r_mem_wr_en_a_wf <= 1'b0;
            end
        end
    end
   
    // ========================================================================
    // Port B read
    // ========================================================================
    
    assign _w_mem_rd_en_b = (_w_sdp_mode)
                          ? 1'b0
                          : (WRITE_MODE_B == "NO_CHANGE")
                          ? _w_ENBWREN & (~_w_mem_wr_en_b | _w_mem_rst_b)
                          : _w_ENBWREN;

    initial begin
        _r_mem_b_rd_p0 = _w_INIT_B;
        _r_mem_b_rd_p1 = _w_INIT_B;
    end
    
    always @(posedge _w_mem_rd_clk_b) begin : PORTB_READ_P0
        reg [13:0] _v_addr;
        reg [35:0] _v_tmp1;
        reg [35:0] _v_tmp2;
    
        // Address latch
        if (_w_ADDRENB) begin
            _v_addr = ADDRBWRADDR;
        end
        
        // Data latch
        if (_GSR) begin
            _r_mem_b_rd_p0 <= _w_INIT_B;
        end
        else if (_w_mem_rst_b) begin
            _r_mem_b_rd_p0 <= _w_SRVAL_B;
        end
        else if (_w_mem_rd_en_b) begin
            // Read memory array
            _v_tmp1 = _r_mem[_v_addr[13:5]];
            // Extract bits
            case (READ_WIDTH_B)
                1       : _v_tmp2 = read_1_bit   (_v_addr[4:0], _v_tmp1);
                2       : _v_tmp2 = read_2_bits  (_v_addr[4:1], _v_tmp1);
                4       : _v_tmp2 = read_4_bits  (_v_addr[4:2], _v_tmp1);
                9       : _v_tmp2 = read_9_bits  (_v_addr[4:3], _v_tmp1);
                18      : _v_tmp2 = read_18_bits (_v_addr[4],   _v_tmp1);
                default : _v_tmp2 = 36'b0; // Wrong width
            endcase // READ_WIDTH_B
            _r_mem_b_rd_p0 <= { _v_tmp2[33:32], _v_tmp2[15:0] };
        end
    end
    
    // Write first mode
    assign _w_mem_b_out_p0 = (_r_mem_wr_en_b_wf) ? { _r_mem_b_wf_p0[33:32], _r_mem_b_wf_p0[15:0] } : _r_mem_b_rd_p0;
    
    // Cascading mode
    assign _w_mem_b_mux_p0 =
        (((CASCADE_ORDER_B == "LAST") || (CASCADE_ORDER_B == "MIDDLE")) && _r_CASOREGIMUXB)
        ? { CASDINPB, CASDINB } : _w_mem_b_out_p0;
    
    // Registered output
    always @ (posedge _w_mem_rd_clk_b) begin : PORTB_READ_P1
   
        if (_GSR) begin
            _r_mem_b_rd_p1 <= _w_INIT_B;
        end
        else if (_w_RSTREG_B) begin
            _r_mem_b_rd_p1 <= _w_SRVAL_B;
        end
        else if (REGCEB) begin
            _r_mem_b_rd_p1 <= _w_mem_b_mux_p0;
        end
    end

    // Registered / un-registered output
    assign _w_mem_b_mux_p1 = (DOB_REG == 1) ? _r_mem_b_rd_p1 : _w_mem_b_out_p0;
    
    // Cascading mode
    assign DOUTBDOUT   = (((CASCADE_ORDER_B == "LAST") ||
                           (CASCADE_ORDER_B == "MIDDLE")) && _w_CASDOMUXB)
                       ? CASDINB
                       : (_w_sdp_mode_rd) ? _w_mem_a_mux_p1[31:16] : _w_mem_b_mux_p1[15:0];
    assign DOUTPBDOUTP = (((CASCADE_ORDER_B == "LAST") ||
                           (CASCADE_ORDER_B == "MIDDLE")) && _w_CASDOMUXB)
                       ? CASDINPB
                       : (_w_sdp_mode_rd) ? _w_mem_a_mux_p1[35:34] : _w_mem_b_mux_p1[17:16];
    assign CASDOUTB    = ((CASCADE_ORDER_B == "FIRST") || (CASCADE_ORDER_B == "MIDDLE"))
                       ? DOUTBDOUT
                       : 16'b0;
    assign CASDOUTPB   = ((CASCADE_ORDER_B == "FIRST") || (CASCADE_ORDER_B == "MIDDLE"))
                       ? DOUTPBDOUTP
                       : 2'b0;

    // ========================================================================
    // Port B write
    // ========================================================================
    
    assign _w_mem_wr_en_b = (_w_sdp_mode) 
                          ? _w_ENBWREN & |WEBWE[3:0]
                          : _w_ENBWREN & |WEBWE[1:0];
    assign _w_mem_wr_b    = (_w_sdp_mode)
                          ? { _w_DINPBDINP, _w_DINPADINP, _w_DINBDIN, _w_DINADIN }
                          : { 2'b0, _w_DINPBDINP, 16'b0, _w_DINBDIN };
    
    always @ (posedge _w_mem_wr_clk_b) begin : PORTB_WRITE
        reg [13:0] _v_addr;
        reg [35:0] _v_tmp1;
        reg [35:0] _v_tmp2;
        
        // Address latch
        if (_w_ADDRENB) begin
            _v_addr = ADDRBWRADDR;
        end
    
        if (_w_mem_wr_en_b) begin
            // Read memory array
            _v_tmp1 = _r_mem[_v_addr[13:5]];
            // Insert bits
            case (WRITE_WIDTH_B)
                1       : _v_tmp2 = write_1_bit   (_v_addr[4:0], _v_tmp1, _w_mem_wr_b);
                2       : _v_tmp2 = write_2_bits  (_v_addr[4:1], _v_tmp1, _w_mem_wr_b);
                4       : _v_tmp2 = write_4_bits  (_v_addr[4:2], _v_tmp1, _w_mem_wr_b);
                9       : _v_tmp2 = write_9_bits  (_v_addr[4:3], _v_tmp1, _w_mem_wr_b);
                18      : _v_tmp2 = write_18_bits (_v_addr[4],   _v_tmp1, _w_mem_wr_b);
                36      : _v_tmp2 = _w_mem_wr_b;
                default : _v_tmp2 = _v_tmp1; // Wrong width
            endcase // WRITE_WIDTH_B
        
            // Write back memory array
            // 1/2/4/9-bit mode
            if (WRITE_WIDTH_B <= 9) begin
                if (WEBWE[0]) begin
                    _r_mem[_v_addr[13:5]] <= _v_tmp2;
                end
            end
            // 18-bit mode
            else if (WRITE_WIDTH_B == 18) begin
                if (WEBWE[1]) begin
                    _r_mem[_v_addr[13:5]][   35] <= _v_tmp2[   35];
                    _r_mem[_v_addr[13:5]][   33] <= _v_tmp2[   33];
                    _r_mem[_v_addr[13:5]][31:24] <= _v_tmp2[31:24];
                    _r_mem[_v_addr[13:5]][15: 8] <= _v_tmp2[15: 8];
                end
                if (WEBWE[0]) begin
                    _r_mem[_v_addr[13:5]][   34] <= _v_tmp2[   34];
                    _r_mem[_v_addr[13:5]][   32] <= _v_tmp2[   32];
                    _r_mem[_v_addr[13:5]][23:16] <= _v_tmp2[23:16];
                    _r_mem[_v_addr[13:5]][ 7: 0] <= _v_tmp2[ 7: 0];
                end
            end
            // 36-bit mode
            else if (WRITE_WIDTH_B == 36) begin
                if (WEBWE[3]) begin
                    _r_mem[_v_addr[13:5]][   35] <= _v_tmp2[   35];
                    _r_mem[_v_addr[13:5]][31:24] <= _v_tmp2[31:24];
                end
                if (WEBWE[2]) begin
                    _r_mem[_v_addr[13:5]][   34] <= _v_tmp2[   34];
                    _r_mem[_v_addr[13:5]][23:16] <= _v_tmp2[23:16];
                end
                if (WEBWE[1]) begin
                    _r_mem[_v_addr[13:5]][   33] <= _v_tmp2[   33];
                    _r_mem[_v_addr[13:5]][15: 8] <= _v_tmp2[15: 8];
                end
                if (WEBWE[0]) begin
                    _r_mem[_v_addr[13:5]][   32] <= _v_tmp2[   32];
                    _r_mem[_v_addr[13:5]][ 7: 0] <= _v_tmp2[ 7: 0];
                end
            end // WRITE_WIDTH_B
            
            // Write first mode
            if (WRITE_MODE_B == "WRITE_FIRST") begin
                case (READ_WIDTH_B)
                    1       : _r_mem_b_wf_p0 <= read_1_bit   (_v_addr[4:0], _v_tmp2);
                    2       : _r_mem_b_wf_p0 <= read_2_bits  (_v_addr[4:1], _v_tmp2);
                    4       : _r_mem_b_wf_p0 <= read_4_bits  (_v_addr[4:2], _v_tmp2);
                    9       : _r_mem_b_wf_p0 <= read_9_bits  (_v_addr[4:3], _v_tmp2);
                    18      : _r_mem_b_wf_p0 <= read_18_bits (_v_addr[4],   _v_tmp2);
                    default : _r_mem_b_wf_p0 <= 36'b0; // Wrong width
                endcase // READ_WIDTH_B
            end
        end
        
        // Write first mode
        if (_w_mem_rst_b) begin
            _r_mem_wr_en_b_wf <= 1'b0;
        end
        else if (_w_mem_rd_en_b) begin
            if (WRITE_MODE_B == "WRITE_FIRST") begin
                _r_mem_wr_en_b_wf <= _w_mem_wr_en_b;
            end
            else begin
                _r_mem_wr_en_b_wf <= 1'b0;
            end
        end
    end
   
    // ========================================================================
    // Read/Write collision check (TBD)
    // ========================================================================

/*
    localparam [13:0] rd_addr_a_mask = 
        (READ_WIDTH_A ==  0) ? 14'b11111111111111 :
        (READ_WIDTH_A ==  1) ? 14'b11111111111111 :
        (READ_WIDTH_A ==  2) ? 14'b11111111111110 :
        (READ_WIDTH_A ==  4) ? 14'b11111111111100 :
        (READ_WIDTH_A ==  9) ? 14'b11111111111000 :
        (READ_WIDTH_A == 18) ? 14'b11111111110000 :
        (READ_WIDTH_A == 36) ? 14'b11111111100000 : 14'b11111111111111;
    
    localparam [13:0] rd_addr_b_mask = 
        (READ_WIDTH_B ==  0) ? 14'b11111111111111 :
        (READ_WIDTH_B ==  1) ? 14'b11111111111111 :
        (READ_WIDTH_B ==  2) ? 14'b11111111111110 :
        (READ_WIDTH_B ==  4) ? 14'b11111111111100 :
        (READ_WIDTH_B ==  9) ? 14'b11111111111000 :
        (READ_WIDTH_B == 18) ? 14'b11111111110000 : 14'b11111111111111;
    
    localparam [13:0] wr_addr_a_mask = 
        (WRITE_WIDTH_A ==  0) ? 14'b11111111111111 :
        (WRITE_WIDTH_A ==  1) ? 14'b11111111111111 :
        (WRITE_WIDTH_A ==  2) ? 14'b11111111111110 :
        (WRITE_WIDTH_A ==  4) ? 14'b11111111111100 :
        (WRITE_WIDTH_A ==  9) ? 14'b11111111111000 :
        (WRITE_WIDTH_A == 18) ? 14'b11111111110000 : 14'b11111111111111;
    
    localparam [13:0] wr_addr_b_mask = 
        (WRITE_WIDTH_B ==  0) ? 14'b11111111111111 :
        (WRITE_WIDTH_B ==  1) ? 14'b11111111111111 :
        (WRITE_WIDTH_B ==  2) ? 14'b11111111111110 :
        (WRITE_WIDTH_B ==  4) ? 14'b11111111111100 :
        (WRITE_WIDTH_B ==  9) ? 14'b11111111111000 :
        (WRITE_WIDTH_B == 18) ? 14'b11111111110000 :
        (WRITE_WIDTH_B == 36) ? 14'b11111111100000 : 14'b11111111111111;
        
    reg  [13:0] rd_addr_a;
    reg  [13:0] rd_addr_b;
    reg  [13:0] wr_addr_a;
    reg  [13:0] wr_addr_b;
    wire        wr_a_rd_b_addr_coll;
    wire        wr_addr_coll;
    wire        wr_b_rd_a_addr_coll;

    initial begin
        rd_addr_a = 14'b0;
        rd_addr_b = 14'b0;
        wr_addr_a = 14'b0;
        wr_addr_b = 14'b0;
    end
    
    always @(ADDRARDADDR or _w_CLKAWRCLK or _w_ADDRENA) begin
    
        if (~_w_CLKAWRCLK & _w_ADDRENA) begin
            rd_addr_a = ADDRARDADDR & rd_addr_a_mask;
            wr_addr_a = ADDRARDADDR & wr_addr_a_mask;
        end
    end

    always @(ADDRBWRADDR or _w_CLKBWRCLK or _w_ADDRENB) begin
    
        if (~_w_CLKBWRCLK & _w_ADDRENB) begin
            rd_addr_b = ADDRBWRADDR & rd_addr_b_mask;
            wr_addr_b = ADDRBWRADDR & wr_addr_b_mask;
        end
    end

    assign wr_b_rd_a_addr_coll = ((wr_addr_b & rd_addr_a_mask) == (rd_addr_a & wr_addr_b_mask)) ?                _w_mem_wr_en_b & _w_mem_rd_en_a & ~_w_mem_wr_en_a : 1'b0;
    assign wr_a_rd_b_addr_coll = ((wr_addr_a & rd_addr_b_mask) == (rd_addr_b & wr_addr_a_mask)) ? ~_w_sdp_mode & _w_mem_wr_en_a & _w_mem_rd_en_b & ~_w_mem_wr_en_b : 1'b0;
    assign wr_addr_coll        = ((wr_addr_a & wr_addr_b_mask) == (wr_addr_b & wr_addr_a_mask)) ? ~_w_sdp_mode & _w_mem_wr_en_b & _w_mem_wr_en_a : 1'b0;
*/

endmodule
/* verilator lint_on UNUSED */
/* verilator coverage_on */
