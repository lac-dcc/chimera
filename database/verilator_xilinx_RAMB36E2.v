// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// RAMB36E2 primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator lint_off UNUSED */
/* verilator coverage_off */
module RAMB36E2
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
    // Use error correction code
    parameter string  EN_ECC_PIPE     = "FALSE",
    parameter string  EN_ECC_READ     = "FALSE",
    parameter string  EN_ECC_WRITE    = "FALSE",
    // Memory initialization
    parameter [255:0] INITP_00        = 256'h0,
    parameter [255:0] INITP_01        = 256'h0,
    parameter [255:0] INITP_02        = 256'h0,
    parameter [255:0] INITP_03        = 256'h0,
    parameter [255:0] INITP_04        = 256'h0,
    parameter [255:0] INITP_05        = 256'h0,
    parameter [255:0] INITP_06        = 256'h0,
    parameter [255:0] INITP_07        = 256'h0,
    parameter [255:0] INITP_08        = 256'h0,
    parameter [255:0] INITP_09        = 256'h0,
    parameter [255:0] INITP_0A        = 256'h0,
    parameter [255:0] INITP_0B        = 256'h0,
    parameter [255:0] INITP_0C        = 256'h0,
    parameter [255:0] INITP_0D        = 256'h0,
    parameter [255:0] INITP_0E        = 256'h0,
    parameter [255:0] INITP_0F        = 256'h0,
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
    parameter [255:0] INIT_40         = 256'h0,
    parameter [255:0] INIT_41         = 256'h0,
    parameter [255:0] INIT_42         = 256'h0,
    parameter [255:0] INIT_43         = 256'h0,
    parameter [255:0] INIT_44         = 256'h0,
    parameter [255:0] INIT_45         = 256'h0,
    parameter [255:0] INIT_46         = 256'h0,
    parameter [255:0] INIT_47         = 256'h0,
    parameter [255:0] INIT_48         = 256'h0,
    parameter [255:0] INIT_49         = 256'h0,
    parameter [255:0] INIT_4A         = 256'h0,
    parameter [255:0] INIT_4B         = 256'h0,
    parameter [255:0] INIT_4C         = 256'h0,
    parameter [255:0] INIT_4D         = 256'h0,
    parameter [255:0] INIT_4E         = 256'h0,
    parameter [255:0] INIT_4F         = 256'h0,
    parameter [255:0] INIT_50         = 256'h0,
    parameter [255:0] INIT_51         = 256'h0,
    parameter [255:0] INIT_52         = 256'h0,
    parameter [255:0] INIT_53         = 256'h0,
    parameter [255:0] INIT_54         = 256'h0,
    parameter [255:0] INIT_55         = 256'h0,
    parameter [255:0] INIT_56         = 256'h0,
    parameter [255:0] INIT_57         = 256'h0,
    parameter [255:0] INIT_58         = 256'h0,
    parameter [255:0] INIT_59         = 256'h0,
    parameter [255:0] INIT_5A         = 256'h0,
    parameter [255:0] INIT_5B         = 256'h0,
    parameter [255:0] INIT_5C         = 256'h0,
    parameter [255:0] INIT_5D         = 256'h0,
    parameter [255:0] INIT_5E         = 256'h0,
    parameter [255:0] INIT_5F         = 256'h0,
    parameter [255:0] INIT_60         = 256'h0,
    parameter [255:0] INIT_61         = 256'h0,
    parameter [255:0] INIT_62         = 256'h0,
    parameter [255:0] INIT_63         = 256'h0,
    parameter [255:0] INIT_64         = 256'h0,
    parameter [255:0] INIT_65         = 256'h0,
    parameter [255:0] INIT_66         = 256'h0,
    parameter [255:0] INIT_67         = 256'h0,
    parameter [255:0] INIT_68         = 256'h0,
    parameter [255:0] INIT_69         = 256'h0,
    parameter [255:0] INIT_6A         = 256'h0,
    parameter [255:0] INIT_6B         = 256'h0,
    parameter [255:0] INIT_6C         = 256'h0,
    parameter [255:0] INIT_6D         = 256'h0,
    parameter [255:0] INIT_6E         = 256'h0,
    parameter [255:0] INIT_6F         = 256'h0,
    parameter [255:0] INIT_70         = 256'h0,
    parameter [255:0] INIT_71         = 256'h0,
    parameter [255:0] INIT_72         = 256'h0,
    parameter [255:0] INIT_73         = 256'h0,
    parameter [255:0] INIT_74         = 256'h0,
    parameter [255:0] INIT_75         = 256'h0,
    parameter [255:0] INIT_76         = 256'h0,
    parameter [255:0] INIT_77         = 256'h0,
    parameter [255:0] INIT_78         = 256'h0,
    parameter [255:0] INIT_79         = 256'h0,
    parameter [255:0] INIT_7A         = 256'h0,
    parameter [255:0] INIT_7B         = 256'h0,
    parameter [255:0] INIT_7C         = 256'h0,
    parameter [255:0] INIT_7D         = 256'h0,
    parameter [255:0] INIT_7E         = 256'h0,
    parameter [255:0] INIT_7F         = 256'h0,
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
    parameter  [35:0] INIT_A              = 36'h0,
    parameter  [35:0] INIT_B              = 36'h0,
    parameter  [35:0] SRVAL_A             = 36'h0,
    parameter  [35:0] SRVAL_B             = 36'h0,
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
    output wire [31:0] CASDOUTA,
    output wire [31:0] CASDOUTB,
    output wire  [3:0] CASDOUTPA,
    output wire  [3:0] CASDOUTPB,
    output wire        CASOUTDBITERR,
    output wire        CASOUTSBITERR,
    output wire        DBITERR,
    output wire [31:0] DOUTADOUT,
    output wire [31:0] DOUTBDOUT,
    output wire  [3:0] DOUTPADOUTP,
    output wire  [3:0] DOUTPBDOUTP,
    output wire  [7:0] ECCPARITY,
    output wire  [8:0] RDADDRECC,
    output wire        SBITERR,
    
    input wire  [14:0] ADDRARDADDR,
    input wire  [14:0] ADDRBWRADDR,
    input wire         ADDRENA,
    input wire         ADDRENB,
    input wire         CASDIMUXA,
    input wire         CASDIMUXB,
    input wire  [31:0] CASDINA,
    input wire  [31:0] CASDINB,
    input wire   [3:0] CASDINPA,
    input wire   [3:0] CASDINPB,
    input wire         CASDOMUXA,
    input wire         CASDOMUXB,
    input wire         CASDOMUXEN_A,
    input wire         CASDOMUXEN_B,
    input wire         CASINDBITERR,
    input wire         CASINSBITERR,
    input wire         CASOREGIMUXA,
    input wire         CASOREGIMUXB,
    input wire         CASOREGIMUXEN_A,
    input wire         CASOREGIMUXEN_B,
    input wire         CLKARDCLK,
    input wire         CLKBWRCLK,
    input wire  [31:0] DINADIN,
    input wire  [31:0] DINBDIN,
    input wire   [3:0] DINPADINP,
    input wire   [3:0] DINPBDINP,
    input wire         ECCPIPECE,
    input wire         ENARDEN,
    input wire         ENBWREN,
    input wire         INJECTDBITERR,
    input wire         INJECTSBITERR,
    input wire         REGCEAREGCE,
    input wire         REGCEB,
    input wire         RSTRAMARSTRAM,
    input wire         RSTRAMB,
    input wire         RSTREGARSTREG,
    input wire         RSTREGB,
    input wire         SLEEP,
    input wire   [3:0] WEA,
    input wire   [7:0] WEBWE
);
    // ========================================================================
    // Read / write helper functions
    // ========================================================================
    
    function [71:0] read_1_bit;
        input  [5:0] addr;
        input [71:0] data;
        begin
            read_1_bit = { 71'b0, data[{ 1'b0, addr }] };
        end
    endfunction
    
    function [71:0] write_1_bit;
        input  [5:0] addr;
        input [71:0] data_old;
        input [71:0] data_new;
        begin
            write_1_bit = data_old;
            write_1_bit[{ 1'b0, addr }] = data_new[0];
        end
    endfunction
    
    function [71:0] read_2_bits;
        input  [4:0] addr;
        input [71:0] data;
        begin
            read_2_bits = { 70'b0, data[{ 1'b0, addr, 1'b0 } +: 2] };
        end
    endfunction
    
    function [71:0] write_2_bits;
        input  [4:0] addr;
        input [71:0] data_old;
        input [71:0] data_new;
        begin
            write_2_bits = data_old;
            write_2_bits[{ 1'b0, addr, 1'b0 } +: 2] = data_new[1:0];
        end
    endfunction
    
    function [71:0] read_4_bits;
        input  [3:0] addr;
        input [71:0] data;
        begin
            read_4_bits = { 68'b0, data[{ 1'b0, addr, 2'b0 } +: 4] };
        end
    endfunction
    
    function [71:0] write_4_bits;
        input  [3:0] addr;
        input [71:0] data_old;
        input [71:0] data_new;
        begin
            write_4_bits = data_old;
            write_4_bits[{ 1'b0, addr, 2'b0 } +: 4] = data_new[3:0];
        end
    endfunction
    
    function [71:0] read_9_bits;
        input  [2:0] addr;
        input [71:0] data;
        begin
            read_9_bits[71:64] = {  7'b0, data[{ 4'd8, addr       } +: 1] };
            read_9_bits[63: 0] = { 56'b0, data[{ 1'b0, addr, 3'b0 } +: 8] };
        end
    endfunction
    
    function [71:0] write_9_bits;
        input  [2:0] addr;
        input [71:0] data_old;
        input [71:0] data_new;
        begin
            write_9_bits = data_old;
            write_9_bits[{ 4'd8, addr       } +: 1] = data_new[64];
            write_9_bits[{ 1'b0, addr, 3'b0 } +: 8] = data_new[7:0];
        end
    endfunction
    
    function [71:0] read_18_bits;
        input  [1:0] addr;
        input [71:0] data;
        begin
            read_18_bits[71:64] = {  6'b0, data[{ 4'd8, addr, 1'b0 } +:  2] };
            read_18_bits[63: 0] = { 48'b0, data[{ 1'b0, addr, 4'b0 } +: 16] };
        end
    endfunction
    
    function [71:0] write_18_bits;
        input  [1:0] addr;
        input [71:0] data_old;
        input [71:0] data_new;
        begin
            write_18_bits = data_old;
            write_18_bits[{ 4'd8, addr, 1'b0 } +:  2] = data_new[65:64];
            write_18_bits[{ 1'b0, addr, 4'b0 } +: 16] = data_new[15: 0];
        end
    endfunction
    
    function [71:0] read_36_bits;
        input        addr;
        input [71:0] data;
        begin
            read_36_bits[71:64] = {  4'b0, data[{ 4'd8, addr, 2'b0 } +:  4] };
            read_36_bits[63: 0] = { 32'b0, data[{ 1'b0, addr, 5'b0 } +: 32] };
        end
    endfunction
    
    function [71:0] write_36_bits;
        input        addr;
        input [71:0] data_old;
        input [71:0] data_new;
        begin
            write_36_bits = data_old;
            write_36_bits[{ 4'd8, addr, 2'b0 } +:  4] = data_new[67:64];
            write_36_bits[{ 1'b0, addr, 5'b0 } +: 32] = data_new[31: 0];
        end
    endfunction
    
    // ========================================================================
    // ECC computation functions
    // ========================================================================

    function [7:0] fn_ecc
    (
        input        encode,
        input [63:0] d_i,
        input  [7:0] dp_i
    );
    begin
        //                                                [6]                             [5]             [4]     [3] [2]
        fn_ecc[0] = ^{ dp_i[0] & ~encode, d_i & 64'b1010101_1010101010101010101010101010101_101010101010101_1010101_101_1 };
        fn_ecc[1] = ^{ dp_i[1] & ~encode, d_i & 64'b1100110_1100110011001100110011001100110_110011001100110_1100110_110_1 };
        fn_ecc[2] = ^{ dp_i[2] & ~encode, d_i & 64'b1111000_1111000011110000111100001111000_111100001111000_1111000_111_0 };
        fn_ecc[3] = ^{ dp_i[3] & ~encode, d_i & 64'b0000000_1111111100000000111111110000000_111111110000000_1111111_000_0 };
        fn_ecc[4] = ^{ dp_i[4] & ~encode, d_i & 64'b0000000_1111111111111111000000000000000_111111111111111_0000000_000_0 };
        fn_ecc[5] = ^{ dp_i[5] & ~encode, d_i & 64'b0000000_1111111111111111111111111111111_000000000000000_0000000_000_0 };
        fn_ecc[6] = ^{ dp_i[6] & ~encode, d_i & 64'b1111111_0000000000000000000000000000000_000000000000000_0000000_000_0 };
        fn_ecc[7] = (encode) ? ^{ fn_ecc[6:0], d_i } : ^{ dp_i[7:0], d_i };
    end
    endfunction
    
    function [71:0] fn_cor_bit
    (
        input  [6:0] error_bit,
        input [63:0] d_i,
        input  [7:0] dp_i
    );
    reg [71:0] _d;
    begin
        _d = { d_i[63:57], dp_i[6], d_i[56:26], dp_i[5], d_i[25:11], dp_i[4],
               d_i[10:4], dp_i[3], d_i[3:1], dp_i[2], d_i[0], dp_i[1:0], dp_i[7] };
        _d[error_bit] = ~_d[error_bit];
        fn_cor_bit = { _d[0], _d[64], _d[32], _d[16], _d[8], _d[4], _d[2], _d[1],
                       _d[71:65], _d[63:33], _d[31:17], _d[15:9], _d[7:5], _d[3] };
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
    wire        _w_sdp_mode_wr  = (WRITE_WIDTH_B == 72) ? 1'b1 : 1'b0;
    wire        _w_sdp_mode_rd  = (READ_WIDTH_A  == 72) ? 1'b1 : 1'b0;
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
    wire  [3:0] _w_DINPADINP    = (((CASCADE_ORDER_A == "LAST") ||
                                    (CASCADE_ORDER_A == "MIDDLE")) && CASDIMUXA)
                                ? CASDINPA
                                : DINPADINP;
    wire [31:0] _w_DINADIN      = (((CASCADE_ORDER_A == "LAST") ||
                                    (CASCADE_ORDER_A == "MIDDLE")) && CASDIMUXA)
                                ? CASDINA
                                : DINADIN;
    wire  [3:0] _w_DINPBDINP    = (((CASCADE_ORDER_B == "LAST") ||
                                    (CASCADE_ORDER_B == "MIDDLE")) && CASDIMUXB)
                                ? CASDINPB
                                : DINPBDINP;
    wire [31:0] _w_DINBDIN      = (((CASCADE_ORDER_B == "LAST") ||
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
    wire [71:0] _w_INIT_A       = (READ_WIDTH_A <= 9)  ? { {8{INIT_A[    8]}}, {8{INIT_A[ 7:0]}} }
                                : (READ_WIDTH_A == 18) ? { {4{INIT_A[17:16]}}, {4{INIT_A[15:0]}} }
                                : (READ_WIDTH_A == 36) ? { {2{INIT_A[35:32]}}, {2{INIT_A[31:0]}} }
                                : {INIT_B[35:32], INIT_A[35:32], INIT_B[31:0], INIT_A[31:0] };
    wire [35:0] _w_INIT_B       = (READ_WIDTH_B <= 9)  ? { {4{INIT_B[    8]}}, {4{INIT_B[ 7:0]}} }
                                : (READ_WIDTH_B == 18) ? { {2{INIT_B[17:16]}}, {2{INIT_B[15:0]}} }
                                : INIT_B;
    wire [71:0] _w_SRVAL_A      = (READ_WIDTH_A <= 9)  ? { {8{SRVAL_A[    8]}}, {8{SRVAL_A[ 7:0]}} }
                                : (READ_WIDTH_A == 18) ? { {4{SRVAL_A[17:16]}}, {4{SRVAL_A[15:0]}} }
                                : (READ_WIDTH_A == 36) ? { {2{SRVAL_A[35:32]}}, {2{SRVAL_A[31:0]}} }
                                : {SRVAL_B[35:32], SRVAL_A[35:32], SRVAL_B[31:0], SRVAL_A[31:0] };
    wire [35:0] _w_SRVAL_B      = (READ_WIDTH_B <= 9)  ? { {4{SRVAL_B[    8]}}, {4{SRVAL_B[ 7:0]}} }
                                : (READ_WIDTH_B == 18) ? { {2{SRVAL_B[17:16]}}, {2{SRVAL_B[15:0]}} }
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
    wire [71:0] _w_mem_wr_a;
    reg  [71:0] _r_mem_a_wf_p0;
    reg  [71:0] _r_mem_a_rd_p0;
    wire [71:0] _w_mem_a_out_p0;
    wire [71:0] _w_mem_a_mux_p0;
    reg  [71:0] _r_mem_a_rd_p1;
    wire [71:0] _w_mem_a_mux_p1;
    
    // ========================================================================
    // Port B signals
    // ========================================================================
    wire        _w_mem_rd_en_b;
    wire        _w_mem_wr_en_b;
    reg         _r_mem_wr_en_b_wf;
    wire [63:0] _w_mem_wr_b;
    reg  [71:0] _r_mem_b_wf_p0;
    reg  [35:0] _r_mem_b_rd_p0;
    wire [35:0] _w_mem_b_out_p0;
    wire [35:0] _w_mem_b_mux_p0;
    reg  [35:0] _r_mem_b_rd_p1;
    wire [35:0] _w_mem_b_mux_p1;
    
    // ========================================================================
    // ECC signals
    // ========================================================================
    reg   [7:0] _r_ECCPARITY;
    reg         _w_ECCENA;
    reg         _r_ecc_run;
    reg         _r_ecc_sbit_p0;
    reg         _r_ecc_dbit_p0;
    reg   [8:0] _r_ecc_addr_p0;
    reg  [71:0] _r_ecc_a_rd_p1;
    reg         _r_ecc_sbit_p1;
    reg         _r_ecc_dbit_p1;
    reg   [8:0] _r_ecc_addr_p1;
    wire        _w_ecc_sbit_p1;
    wire        _w_ecc_dbit_p1;
    wire  [8:0] _w_ecc_addr_p1;
    reg         _r_ecc_sbit_p2;
    reg         _r_ecc_dbit_p2;
    reg   [8:0] _r_ecc_addr_p2;
    
    // ========================================================================
    // 512 x 72-bit block RAM
    // ========================================================================
    
    /* verilator lint_off MULTIDRIVEN */
    reg [71:0] _r_mem [0:511];
    /* verilator lint_on MULTIDRIVEN */
    
    // ========================================================================
    // Block RAM initialization
    // ========================================================================
    
    generate
        if (INIT_FILE == "NONE") begin : GEN_XILINX_INIT
            initial begin : XILINX_INIT
                reg [255:0] _v_init  [0:127];
                reg  [63:0] _v_data;
                reg  [31:0] _v_initp [0:127];
                reg   [7:0] _v_datap;
                reg   [8:0] _v_addr;
                integer _i, _j;
                
                // Initialization vectors (data & parity)
                _v_init[7'h00] = INIT_00; _v_initp[7'h00] = INITP_00['h00 +: 32];
                _v_init[7'h01] = INIT_01; _v_initp[7'h01] = INITP_00['h20 +: 32];
                _v_init[7'h02] = INIT_02; _v_initp[7'h02] = INITP_00['h40 +: 32];
                _v_init[7'h03] = INIT_03; _v_initp[7'h03] = INITP_00['h60 +: 32];
                _v_init[7'h04] = INIT_04; _v_initp[7'h04] = INITP_00['h80 +: 32];
                _v_init[7'h05] = INIT_05; _v_initp[7'h05] = INITP_00['hA0 +: 32];
                _v_init[7'h06] = INIT_06; _v_initp[7'h06] = INITP_00['hC0 +: 32];
                _v_init[7'h07] = INIT_07; _v_initp[7'h07] = INITP_00['hE0 +: 32];
                _v_init[7'h08] = INIT_08; _v_initp[7'h08] = INITP_01['h00 +: 32];
                _v_init[7'h09] = INIT_09; _v_initp[7'h09] = INITP_01['h20 +: 32];
                _v_init[7'h0A] = INIT_0A; _v_initp[7'h0A] = INITP_01['h40 +: 32];
                _v_init[7'h0B] = INIT_0B; _v_initp[7'h0B] = INITP_01['h60 +: 32];
                _v_init[7'h0C] = INIT_0C; _v_initp[7'h0C] = INITP_01['h80 +: 32];
                _v_init[7'h0D] = INIT_0D; _v_initp[7'h0D] = INITP_01['hA0 +: 32];
                _v_init[7'h0E] = INIT_0E; _v_initp[7'h0E] = INITP_01['hC0 +: 32];
                _v_init[7'h0F] = INIT_0F; _v_initp[7'h0F] = INITP_01['hE0 +: 32];
                _v_init[7'h10] = INIT_10; _v_initp[7'h10] = INITP_02['h00 +: 32];
                _v_init[7'h11] = INIT_11; _v_initp[7'h11] = INITP_02['h20 +: 32];
                _v_init[7'h12] = INIT_12; _v_initp[7'h12] = INITP_02['h40 +: 32];
                _v_init[7'h13] = INIT_13; _v_initp[7'h13] = INITP_02['h60 +: 32];
                _v_init[7'h14] = INIT_14; _v_initp[7'h14] = INITP_02['h80 +: 32];
                _v_init[7'h15] = INIT_15; _v_initp[7'h15] = INITP_02['hA0 +: 32];
                _v_init[7'h16] = INIT_16; _v_initp[7'h16] = INITP_02['hC0 +: 32];
                _v_init[7'h17] = INIT_17; _v_initp[7'h17] = INITP_02['hE0 +: 32];
                _v_init[7'h18] = INIT_18; _v_initp[7'h18] = INITP_03['h00 +: 32];
                _v_init[7'h19] = INIT_19; _v_initp[7'h19] = INITP_03['h20 +: 32];
                _v_init[7'h1A] = INIT_1A; _v_initp[7'h1A] = INITP_03['h40 +: 32];
                _v_init[7'h1B] = INIT_1B; _v_initp[7'h1B] = INITP_03['h60 +: 32];
                _v_init[7'h1C] = INIT_1C; _v_initp[7'h1C] = INITP_03['h80 +: 32];
                _v_init[7'h1D] = INIT_1D; _v_initp[7'h1D] = INITP_03['hA0 +: 32];
                _v_init[7'h1E] = INIT_1E; _v_initp[7'h1E] = INITP_03['hC0 +: 32];
                _v_init[7'h1F] = INIT_1F; _v_initp[7'h1F] = INITP_03['hE0 +: 32];
                _v_init[7'h20] = INIT_20; _v_initp[7'h20] = INITP_04['h00 +: 32];
                _v_init[7'h21] = INIT_21; _v_initp[7'h21] = INITP_04['h20 +: 32];
                _v_init[7'h22] = INIT_22; _v_initp[7'h22] = INITP_04['h40 +: 32];
                _v_init[7'h23] = INIT_23; _v_initp[7'h23] = INITP_04['h60 +: 32];
                _v_init[7'h24] = INIT_24; _v_initp[7'h24] = INITP_04['h80 +: 32];
                _v_init[7'h25] = INIT_25; _v_initp[7'h25] = INITP_04['hA0 +: 32];
                _v_init[7'h26] = INIT_26; _v_initp[7'h26] = INITP_04['hC0 +: 32];
                _v_init[7'h27] = INIT_27; _v_initp[7'h27] = INITP_04['hE0 +: 32];
                _v_init[7'h28] = INIT_28; _v_initp[7'h28] = INITP_05['h00 +: 32];
                _v_init[7'h29] = INIT_29; _v_initp[7'h29] = INITP_05['h20 +: 32];
                _v_init[7'h2A] = INIT_2A; _v_initp[7'h2A] = INITP_05['h40 +: 32];
                _v_init[7'h2B] = INIT_2B; _v_initp[7'h2B] = INITP_05['h60 +: 32];
                _v_init[7'h2C] = INIT_2C; _v_initp[7'h2C] = INITP_05['h80 +: 32];
                _v_init[7'h2D] = INIT_2D; _v_initp[7'h2D] = INITP_05['hA0 +: 32];
                _v_init[7'h2E] = INIT_2E; _v_initp[7'h2E] = INITP_05['hC0 +: 32];
                _v_init[7'h2F] = INIT_2F; _v_initp[7'h2F] = INITP_05['hE0 +: 32];
                _v_init[7'h30] = INIT_30; _v_initp[7'h30] = INITP_06['h00 +: 32];
                _v_init[7'h31] = INIT_31; _v_initp[7'h31] = INITP_06['h20 +: 32];
                _v_init[7'h32] = INIT_32; _v_initp[7'h32] = INITP_06['h40 +: 32];
                _v_init[7'h33] = INIT_33; _v_initp[7'h33] = INITP_06['h60 +: 32];
                _v_init[7'h34] = INIT_34; _v_initp[7'h34] = INITP_06['h80 +: 32];
                _v_init[7'h35] = INIT_35; _v_initp[7'h35] = INITP_06['hA0 +: 32];
                _v_init[7'h36] = INIT_36; _v_initp[7'h36] = INITP_06['hC0 +: 32];
                _v_init[7'h37] = INIT_37; _v_initp[7'h37] = INITP_06['hE0 +: 32];
                _v_init[7'h38] = INIT_38; _v_initp[7'h38] = INITP_07['h00 +: 32];
                _v_init[7'h39] = INIT_39; _v_initp[7'h39] = INITP_07['h20 +: 32];
                _v_init[7'h3A] = INIT_3A; _v_initp[7'h3A] = INITP_07['h40 +: 32];
                _v_init[7'h3B] = INIT_3B; _v_initp[7'h3B] = INITP_07['h60 +: 32];
                _v_init[7'h3C] = INIT_3C; _v_initp[7'h3C] = INITP_07['h80 +: 32];
                _v_init[7'h3D] = INIT_3D; _v_initp[7'h3D] = INITP_07['hA0 +: 32];
                _v_init[7'h3E] = INIT_3E; _v_initp[7'h3E] = INITP_07['hC0 +: 32];
                _v_init[7'h3F] = INIT_3F; _v_initp[7'h3F] = INITP_07['hE0 +: 32];
                _v_init[7'h40] = INIT_40; _v_initp[7'h40] = INITP_08['h00 +: 32];
                _v_init[7'h41] = INIT_41; _v_initp[7'h41] = INITP_08['h20 +: 32];
                _v_init[7'h42] = INIT_42; _v_initp[7'h42] = INITP_08['h40 +: 32];
                _v_init[7'h43] = INIT_43; _v_initp[7'h43] = INITP_08['h60 +: 32];
                _v_init[7'h44] = INIT_44; _v_initp[7'h44] = INITP_08['h80 +: 32];
                _v_init[7'h45] = INIT_45; _v_initp[7'h45] = INITP_08['hA0 +: 32];
                _v_init[7'h46] = INIT_46; _v_initp[7'h46] = INITP_08['hC0 +: 32];
                _v_init[7'h47] = INIT_47; _v_initp[7'h47] = INITP_08['hE0 +: 32];
                _v_init[7'h48] = INIT_48; _v_initp[7'h48] = INITP_09['h00 +: 32];
                _v_init[7'h49] = INIT_49; _v_initp[7'h49] = INITP_09['h20 +: 32];
                _v_init[7'h4A] = INIT_4A; _v_initp[7'h4A] = INITP_09['h40 +: 32];
                _v_init[7'h4B] = INIT_4B; _v_initp[7'h4B] = INITP_09['h60 +: 32];
                _v_init[7'h4C] = INIT_4C; _v_initp[7'h4C] = INITP_09['h80 +: 32];
                _v_init[7'h4D] = INIT_4D; _v_initp[7'h4D] = INITP_09['hA0 +: 32];
                _v_init[7'h4E] = INIT_4E; _v_initp[7'h4E] = INITP_09['hC0 +: 32];
                _v_init[7'h4F] = INIT_4F; _v_initp[7'h4F] = INITP_09['hE0 +: 32];
                _v_init[7'h50] = INIT_50; _v_initp[7'h50] = INITP_0A['h00 +: 32];
                _v_init[7'h51] = INIT_51; _v_initp[7'h51] = INITP_0A['h20 +: 32];
                _v_init[7'h52] = INIT_52; _v_initp[7'h52] = INITP_0A['h40 +: 32];
                _v_init[7'h53] = INIT_53; _v_initp[7'h53] = INITP_0A['h60 +: 32];
                _v_init[7'h54] = INIT_54; _v_initp[7'h54] = INITP_0A['h80 +: 32];
                _v_init[7'h55] = INIT_55; _v_initp[7'h55] = INITP_0A['hA0 +: 32];
                _v_init[7'h56] = INIT_56; _v_initp[7'h56] = INITP_0A['hC0 +: 32];
                _v_init[7'h57] = INIT_57; _v_initp[7'h57] = INITP_0A['hE0 +: 32];
                _v_init[7'h58] = INIT_58; _v_initp[7'h58] = INITP_0B['h00 +: 32];
                _v_init[7'h59] = INIT_59; _v_initp[7'h59] = INITP_0B['h20 +: 32];
                _v_init[7'h5A] = INIT_5A; _v_initp[7'h5A] = INITP_0B['h40 +: 32];
                _v_init[7'h5B] = INIT_5B; _v_initp[7'h5B] = INITP_0B['h60 +: 32];
                _v_init[7'h5C] = INIT_5C; _v_initp[7'h5C] = INITP_0B['h80 +: 32];
                _v_init[7'h5D] = INIT_5D; _v_initp[7'h5D] = INITP_0B['hA0 +: 32];
                _v_init[7'h5E] = INIT_5E; _v_initp[7'h5E] = INITP_0B['hC0 +: 32];
                _v_init[7'h5F] = INIT_5F; _v_initp[7'h5F] = INITP_0B['hE0 +: 32];
                _v_init[7'h60] = INIT_60; _v_initp[7'h60] = INITP_0C['h00 +: 32];
                _v_init[7'h61] = INIT_61; _v_initp[7'h61] = INITP_0C['h20 +: 32];
                _v_init[7'h62] = INIT_62; _v_initp[7'h62] = INITP_0C['h40 +: 32];
                _v_init[7'h63] = INIT_63; _v_initp[7'h63] = INITP_0C['h60 +: 32];
                _v_init[7'h64] = INIT_64; _v_initp[7'h64] = INITP_0C['h80 +: 32];
                _v_init[7'h65] = INIT_65; _v_initp[7'h65] = INITP_0C['hA0 +: 32];
                _v_init[7'h66] = INIT_66; _v_initp[7'h66] = INITP_0C['hC0 +: 32];
                _v_init[7'h67] = INIT_67; _v_initp[7'h67] = INITP_0C['hE0 +: 32];
                _v_init[7'h68] = INIT_68; _v_initp[7'h68] = INITP_0D['h00 +: 32];
                _v_init[7'h69] = INIT_69; _v_initp[7'h69] = INITP_0D['h20 +: 32];
                _v_init[7'h6A] = INIT_6A; _v_initp[7'h6A] = INITP_0D['h40 +: 32];
                _v_init[7'h6B] = INIT_6B; _v_initp[7'h6B] = INITP_0D['h60 +: 32];
                _v_init[7'h6C] = INIT_6C; _v_initp[7'h6C] = INITP_0D['h80 +: 32];
                _v_init[7'h6D] = INIT_6D; _v_initp[7'h6D] = INITP_0D['hA0 +: 32];
                _v_init[7'h6E] = INIT_6E; _v_initp[7'h6E] = INITP_0D['hC0 +: 32];
                _v_init[7'h6F] = INIT_6F; _v_initp[7'h6F] = INITP_0D['hE0 +: 32];
                _v_init[7'h70] = INIT_70; _v_initp[7'h70] = INITP_0E['h00 +: 32];
                _v_init[7'h71] = INIT_71; _v_initp[7'h71] = INITP_0E['h20 +: 32];
                _v_init[7'h72] = INIT_72; _v_initp[7'h72] = INITP_0E['h40 +: 32];
                _v_init[7'h73] = INIT_73; _v_initp[7'h73] = INITP_0E['h60 +: 32];
                _v_init[7'h74] = INIT_74; _v_initp[7'h74] = INITP_0E['h80 +: 32];
                _v_init[7'h75] = INIT_75; _v_initp[7'h75] = INITP_0E['hA0 +: 32];
                _v_init[7'h76] = INIT_76; _v_initp[7'h76] = INITP_0E['hC0 +: 32];
                _v_init[7'h77] = INIT_77; _v_initp[7'h77] = INITP_0E['hE0 +: 32];
                _v_init[7'h78] = INIT_78; _v_initp[7'h78] = INITP_0F['h00 +: 32];
                _v_init[7'h79] = INIT_79; _v_initp[7'h79] = INITP_0F['h20 +: 32];
                _v_init[7'h7A] = INIT_7A; _v_initp[7'h7A] = INITP_0F['h40 +: 32];
                _v_init[7'h7B] = INIT_7B; _v_initp[7'h7B] = INITP_0F['h60 +: 32];
                _v_init[7'h7C] = INIT_7C; _v_initp[7'h7C] = INITP_0F['h80 +: 32];
                _v_init[7'h7D] = INIT_7D; _v_initp[7'h7D] = INITP_0F['hA0 +: 32];
                _v_init[7'h7E] = INIT_7E; _v_initp[7'h7E] = INITP_0F['hC0 +: 32];
                _v_init[7'h7F] = INIT_7F; _v_initp[7'h7F] = INITP_0F['hE0 +: 32];
                
                // Loop over the 128 initialization vectors
                for (_j = 0; _j < 128; _j = _j + 1) begin
                    // Map them to the 512 x 72-bit block RAM
                    _v_addr[8:2] = _j[6:0];
                    for (_i = 0; _i < 4; _i = _i + 1) begin
                        _v_addr[1:0] = _i[1:0];
                        _v_datap        = _v_initp[_j][_i * 8 +: 8];
                        _v_data         = _v_init[_j][_i * 64 +: 64];
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
                    _r_mem[_i] = { 8'b0, 64'h0000000000000000 };
                end
                // Simple .mem file (always mapped as a 512 x 72-bit hexadecimal dump)
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

    assign _w_CASDOMUXB = (READ_WIDTH_A == 72) ? _r_CASDOMUXA : _r_CASDOMUXB;

    // ========================================================================
    // Port A read
    // ========================================================================
    
    assign _w_mem_rd_en_a = (WRITE_MODE_A == "NO_CHANGE")
                          ? _w_ENARDEN & (~_w_mem_wr_en_a | _w_mem_rst_a)
                          : _w_ENARDEN;
                          
    assign _w_ECCENA      = (EN_ECC_PIPE == "TRUE") ? ECCPIPECE & _r_ecc_run : 1'b0;
                          
    initial begin
        _r_mem_a_rd_p0 = _w_INIT_A;
        _r_mem_a_rd_p1 = _w_INIT_A;
        _r_ecc_a_rd_p1 = _w_INIT_A;
        _r_ecc_run     = 1'b0;
    end
    
    always @(posedge _w_mem_rd_clk_a) begin : PORTA_READ_P0
        reg [71:0] _v_tmp1;
        reg [14:0] _v_addr;
        reg  [7:0] _v_ecc;
    
        // Address latch
        if (_w_ADDRENA) begin
            _v_addr = ADDRARDADDR;
        end
        
        // Data latch
        if (_GSR) begin
            _r_mem_a_rd_p0 <= _w_INIT_A;
            _r_ecc_run     <= 1'b0;
        end
        else if (_w_mem_rst_a) begin
            _r_mem_a_rd_p0 <= _w_SRVAL_A;
            _r_ecc_sbit_p0 <= 1'b0;
            _r_ecc_dbit_p0 <= 1'b0;
            _r_ecc_addr_p0 <= 9'b0;
        end
        else if (_w_mem_rd_en_a) begin
            // Read memory array
            _v_tmp1 = _r_mem[_v_addr[14:6]];

            // ECC correction / detection
            if ((EN_ECC_READ == "TRUE") && (_w_sdp_mode)) begin
                _v_ecc = fn_ecc(1'b0, _v_tmp1[63:0], _v_tmp1[71:64]);
                _r_ecc_sbit_p0 <= (|_v_ecc) &  _v_ecc[7];
                _r_ecc_dbit_p0 <= (|_v_ecc) & ~_v_ecc[7];
                _r_ecc_addr_p0 <= _v_addr[14:6];
            end
            else begin
                _r_ecc_sbit_p0 <= 1'b0;
                _r_ecc_dbit_p0 <= 1'b0;
                _r_ecc_addr_p0 <= 9'b0;
            end
            _r_ecc_run <= 1'b1;
            
            // Extract bits
            case (READ_WIDTH_A)
                1       : _r_mem_a_rd_p0 <= read_1_bit   (_v_addr[5:0], _v_tmp1);
                2       : _r_mem_a_rd_p0 <= read_2_bits  (_v_addr[5:1], _v_tmp1);
                4       : _r_mem_a_rd_p0 <= read_4_bits  (_v_addr[5:2], _v_tmp1);
                9       : _r_mem_a_rd_p0 <= read_9_bits  (_v_addr[5:3], _v_tmp1);
                18      : _r_mem_a_rd_p0 <= read_18_bits (_v_addr[5:4], _v_tmp1);
                36      : _r_mem_a_rd_p0 <= read_36_bits (_v_addr[5  ], _v_tmp1);
                72      : _r_mem_a_rd_p0 <= (EN_ECC_READ == "TRUE")
                                          ? fn_cor_bit(_v_ecc[6:0], _v_tmp1[63:0], _v_tmp1[71:64])
                                          : _v_tmp1;
                default : _r_mem_a_rd_p0 <= 72'b0; // Wrong width
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
    assign _w_mem_a_mux_p1 = (DOA_REG == 1) ? _r_mem_a_rd_p1 : _w_mem_a_out_p0;
    
    // Cascading mode
    assign DOUTADOUT     = (((CASCADE_ORDER_A == "LAST") ||
                             (CASCADE_ORDER_A == "MIDDLE")) && _r_CASDOMUXA) ?
                              CASDINA  : _w_mem_a_mux_p1[31:0];
    assign DOUTPADOUTP   = (((CASCADE_ORDER_A == "LAST") ||
                             (CASCADE_ORDER_A == "MIDDLE")) && _r_CASDOMUXA) ?
                              CASDINPA : _w_mem_a_mux_p1[67:64];
    assign CASDOUTA      = ((CASCADE_ORDER_A == "FIRST") || (CASCADE_ORDER_A == "MIDDLE"))
                         ? DOUTADOUT
                         : 32'b0;
    assign CASDOUTPA     = ((CASCADE_ORDER_A == "FIRST") || (CASCADE_ORDER_A == "MIDDLE"))
                         ? DOUTPADOUTP
                         : 4'b0;
    
    // ========================================================================
    // ECC pipeline
    // ========================================================================
    
    always @ (posedge _w_mem_rd_clk_a) begin : PORTA_ECC_P1
    
        if (_GSR) begin
            _r_ecc_a_rd_p1 <= _w_INIT_A;
            _r_ecc_sbit_p1 <= 1'b0;
            _r_ecc_dbit_p1 <= 1'b0;
            _r_ecc_addr_p1 <= 9'b0;
        end
        else if (_w_ECCENA) begin
            _r_ecc_a_rd_p1 <= _r_mem_a_rd_p0;
            _r_ecc_sbit_p1 <= _r_ecc_sbit_p0;
            _r_ecc_dbit_p1 <= _r_ecc_dbit_p0;
            _r_ecc_addr_p1 <= _r_ecc_addr_p0;
        end
    end
    
    assign _w_ecc_sbit_p1 =
        (((CASCADE_ORDER_A == "LAST") || (CASCADE_ORDER_A == "MIDDLE")) && _r_CASOREGIMUXA)
        ? CASINSBITERR
        : (EN_ECC_PIPE == "TRUE")
        ? _r_ecc_sbit_p1
        : _r_ecc_sbit_p0;
    assign _w_ecc_dbit_p1 =
        (((CASCADE_ORDER_A == "LAST") || (CASCADE_ORDER_A == "MIDDLE")) && _r_CASOREGIMUXA)
        ? CASINDBITERR
        : (EN_ECC_PIPE == "TRUE")
        ? _r_ecc_dbit_p1
        : _r_ecc_dbit_p0;
    assign _w_ecc_addr_p1 =
        (EN_ECC_PIPE == "TRUE")
        ? _r_ecc_addr_p1
        : _r_ecc_addr_p0;

    always @ (posedge _w_mem_rd_clk_a) begin : PORTA_ECC_P2
    
        if (_GSR) begin
            _r_ecc_sbit_p2 <= 1'b0;
            _r_ecc_dbit_p2 <= 1'b0;
            _r_ecc_addr_p2 <= 9'b0;
        end
        else if (REGCEAREGCE) begin
            _r_ecc_sbit_p2 <= _w_ecc_sbit_p1;
            _r_ecc_dbit_p2 <= _w_ecc_dbit_p1;
            _r_ecc_addr_p2 <= _w_ecc_addr_p1;
        end
    end

    assign RDADDRECC     = (DOA_REG == 1) ? _r_ecc_addr_p2 : _w_ecc_addr_p1;
    assign SBITERR       = (((CASCADE_ORDER_A == "LAST") ||
                             (CASCADE_ORDER_A == "MIDDLE")) && _r_CASDOMUXA)
                         ? CASINSBITERR
                         : (DOA_REG == 1)
                         ? _r_ecc_sbit_p2
                         : (EN_ECC_PIPE == "TRUE")
                         ? _r_ecc_sbit_p1
                         : _r_ecc_sbit_p0;
    assign DBITERR       = (((CASCADE_ORDER_A == "LAST") ||
                             (CASCADE_ORDER_A == "MIDDLE")) && _r_CASDOMUXA)
                         ? CASINDBITERR
                         : (DOA_REG == 1)
                         ? _r_ecc_dbit_p2
                         : (EN_ECC_PIPE == "TRUE")
                         ? _r_ecc_dbit_p1
                         : _r_ecc_dbit_p0;
    assign CASOUTSBITERR = ((CASCADE_ORDER_A == "FIRST") || (CASCADE_ORDER_A == "MIDDLE"))
                         ? SBITERR
                         : 1'b0;
    assign CASOUTDBITERR = ((CASCADE_ORDER_A == "FIRST") || (CASCADE_ORDER_A == "MIDDLE"))
                         ? DBITERR
                         : 1'b0;
    
    // ========================================================================
    // Port A write
    // ========================================================================
    
    assign _w_mem_wr_en_a = (_w_sdp_mode) ? 1'b0 : _w_ENARDEN & |WEA;
    assign _w_mem_wr_a    = { 4'b0, _w_DINPADINP, 32'b0, _w_DINADIN };
    
    always @ (posedge _w_mem_wr_clk_a) begin : PORTA_WRITE
        reg [14:0] _v_addr;
        reg [71:0] _v_tmp1;
        reg [71:0] _v_tmp2;
        
        // Address latch
        if (_w_ADDRENA) begin
            _v_addr = ADDRARDADDR;
        end
        
        if (_w_mem_wr_en_a) begin
            // Read memory array
            _v_tmp1 = _r_mem[_v_addr[14:6]];
            // Insert bits
            case (WRITE_WIDTH_A)
                1       : _v_tmp2 = write_1_bit   (_v_addr[5:0], _v_tmp1, _w_mem_wr_a);
                2       : _v_tmp2 = write_2_bits  (_v_addr[5:1], _v_tmp1, _w_mem_wr_a);
                4       : _v_tmp2 = write_4_bits  (_v_addr[5:2], _v_tmp1, _w_mem_wr_a);
                9       : _v_tmp2 = write_9_bits  (_v_addr[5:3], _v_tmp1, _w_mem_wr_a);
                18      : _v_tmp2 = write_18_bits (_v_addr[5:4], _v_tmp1, _w_mem_wr_a);
                36      : _v_tmp2 = write_36_bits (_v_addr[5  ], _v_tmp1, _w_mem_wr_a);
                default : _v_tmp2 = _v_tmp1; // Wrong width
            endcase // WRITE_WIDTH_A
        
            // Write back memory array
            // 1/2/4/9-bit mode
            if (WRITE_WIDTH_A <= 9) begin
                if (WEA[0]) begin
                    _r_mem[_v_addr[14:6]] <= _v_tmp2;
                end
            end
            // 18-bit mode
            else if (WRITE_WIDTH_A == 18) begin
                if (WEA[1]) begin
                    _r_mem[_v_addr[14:6]][   71] <= _v_tmp2[   71];
                    _r_mem[_v_addr[14:6]][   69] <= _v_tmp2[   69];
                    _r_mem[_v_addr[14:6]][   67] <= _v_tmp2[   67];
                    _r_mem[_v_addr[14:6]][   65] <= _v_tmp2[   65];
                    _r_mem[_v_addr[14:6]][63:56] <= _v_tmp2[63:56];
                    _r_mem[_v_addr[14:6]][47:40] <= _v_tmp2[47:40];
                    _r_mem[_v_addr[14:6]][31:24] <= _v_tmp2[31:24];
                    _r_mem[_v_addr[14:6]][15: 8] <= _v_tmp2[15: 8];
                end
                if (WEA[0]) begin
                    _r_mem[_v_addr[14:6]][   70] <= _v_tmp2[   70];
                    _r_mem[_v_addr[14:6]][   68] <= _v_tmp2[   68];
                    _r_mem[_v_addr[14:6]][   66] <= _v_tmp2[   66];
                    _r_mem[_v_addr[14:6]][   64] <= _v_tmp2[   64];
                    _r_mem[_v_addr[14:6]][55:48] <= _v_tmp2[55:48];
                    _r_mem[_v_addr[14:6]][39:32] <= _v_tmp2[39:32];
                    _r_mem[_v_addr[14:6]][23:16] <= _v_tmp2[23:16];
                    _r_mem[_v_addr[14:6]][ 7: 0] <= _v_tmp2[ 7: 0];
                end
            end
            // 36-bit mode
            else if (WRITE_WIDTH_A == 36) begin
                if (WEA[3]) begin
                    _r_mem[_v_addr[14:6]][   71] <= _v_tmp2[   71];
                    _r_mem[_v_addr[14:6]][   67] <= _v_tmp2[   67];
                    _r_mem[_v_addr[14:6]][63:56] <= _v_tmp2[63:56];
                    _r_mem[_v_addr[14:6]][31:24] <= _v_tmp2[31:24];
                end
                if (WEA[2]) begin
                    _r_mem[_v_addr[14:6]][   70] <= _v_tmp2[   70];
                    _r_mem[_v_addr[14:6]][   66] <= _v_tmp2[   66];
                    _r_mem[_v_addr[14:6]][55:48] <= _v_tmp2[55:48];
                    _r_mem[_v_addr[14:6]][23:16] <= _v_tmp2[23:16];
                end
                if (WEA[1]) begin
                    _r_mem[_v_addr[14:6]][   69] <= _v_tmp2[   69];
                    _r_mem[_v_addr[14:6]][   65] <= _v_tmp2[   65];
                    _r_mem[_v_addr[14:6]][47:40] <= _v_tmp2[47:40];
                    _r_mem[_v_addr[14:6]][15: 8] <= _v_tmp2[15: 8];
                end
                if (WEA[0]) begin
                    _r_mem[_v_addr[14:6]][   68] <= _v_tmp2[   68];
                    _r_mem[_v_addr[14:6]][   64] <= _v_tmp2[   64];
                    _r_mem[_v_addr[14:6]][39:32] <= _v_tmp2[39:32];
                    _r_mem[_v_addr[14:6]][ 7: 0] <= _v_tmp2[ 7: 0];
                end
            end // WRITE_WIDTH_A
            
            // Write first mode
            if (WRITE_MODE_A == "WRITE_FIRST") begin
                case (READ_WIDTH_A)
                    1       : _r_mem_a_wf_p0 <= read_1_bit   (_v_addr[5:0], _v_tmp2);
                    2       : _r_mem_a_wf_p0 <= read_2_bits  (_v_addr[5:1], _v_tmp2);
                    4       : _r_mem_a_wf_p0 <= read_4_bits  (_v_addr[5:2], _v_tmp2);
                    9       : _r_mem_a_wf_p0 <= read_9_bits  (_v_addr[5:3], _v_tmp2);
                    18      : _r_mem_a_wf_p0 <= read_18_bits (_v_addr[5:4], _v_tmp2);
                    36      : _r_mem_a_wf_p0 <= read_36_bits (_v_addr[5  ], _v_tmp2);
                    72      : _r_mem_a_wf_p0 <= _v_tmp2;
                    default : _r_mem_a_wf_p0 <= 72'b0; // Wrong width
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
        reg [14:0] _v_addr;
        reg [71:0] _v_tmp1;
        reg [71:0] _v_tmp2;
    
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
            _v_tmp1 = _r_mem[_v_addr[14:6]];
            // Extract bits
            case (READ_WIDTH_B)
                1       : _v_tmp2 = read_1_bit   (_v_addr[5:0], _v_tmp1);
                2       : _v_tmp2 = read_2_bits  (_v_addr[5:1], _v_tmp1);
                4       : _v_tmp2 = read_4_bits  (_v_addr[5:2], _v_tmp1);
                9       : _v_tmp2 = read_9_bits  (_v_addr[5:3], _v_tmp1);
                18      : _v_tmp2 = read_18_bits (_v_addr[5:4], _v_tmp1);
                36      : _v_tmp2 = read_36_bits (_v_addr[5  ], _v_tmp1);
                default : _v_tmp2 = 72'b0; // Wrong width
            endcase // READ_WIDTH_B
            _r_mem_b_rd_p0 <= { _v_tmp2[67:64], _v_tmp2[31:0] };
        end
    end
    
    // Write first mode
    assign _w_mem_b_out_p0 = (_r_mem_wr_en_b_wf) ? { _r_mem_b_wf_p0[67:64], _r_mem_b_wf_p0[31:0] } : _r_mem_b_rd_p0;
    
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
                       : (_w_sdp_mode_rd) ? _w_mem_a_mux_p1[63:32] : _w_mem_b_mux_p1[31:0];
    assign DOUTPBDOUTP = (((CASCADE_ORDER_B == "LAST") ||
                           (CASCADE_ORDER_B == "MIDDLE")) && _w_CASDOMUXB)
                       ? CASDINPB
                       : (_w_sdp_mode_rd) ? _w_mem_a_mux_p1[71:68] : _w_mem_b_mux_p1[35:32];
    assign CASDOUTB    = ((CASCADE_ORDER_B == "FIRST") || (CASCADE_ORDER_B == "MIDDLE"))
                       ? DOUTBDOUT
                       : 32'b0;
    assign CASDOUTPB   = ((CASCADE_ORDER_B == "FIRST") || (CASCADE_ORDER_B == "MIDDLE"))
                       ? DOUTPBDOUTP
                       : 4'b0;

    // ========================================================================
    // Port B write
    // ========================================================================
    
    assign _w_mem_wr_en_b = (_w_sdp_mode) 
                          ? _w_ENBWREN & |WEBWE[7:0]
                          : _w_ENBWREN & |WEBWE[3:0];
    assign _w_mem_wr_b    = (_w_sdp_mode)
                          ? { _w_DINBDIN, _w_DINADIN }
                          : {      32'b0, _w_DINBDIN };
    
    initial begin
        _r_ECCPARITY = 8'b0;
    end
    
    always @ (posedge _w_mem_wr_clk_b) begin : PORTB_WRITE
        reg [14:0] _v_addr;
        reg  [7:0] _v_ecc;
        reg [71:0] _v_tmp1;
        reg [71:0] _v_tmp2;
        reg [71:0] _v_tmp3;
        
        // Address latch
        if (_w_ADDRENB) begin
            _v_addr = ADDRBWRADDR;
        end
    
        if (_w_mem_wr_en_b) begin
            // Read memory array
            _v_tmp1 = _r_mem[_v_addr[14:6]];
            // ECC bits
            if (EN_ECC_WRITE == "TRUE") begin
                _v_ecc = fn_ecc(1'b1, _w_mem_wr_b, 8'b0);
                // Errors injections
                if (INJECTSBITERR) begin
                    _v_tmp2 = { _v_ecc, _w_mem_wr_b ^ 64'h0000000040000000 };
                end
                else if (INJECTDBITERR) begin
                    _v_tmp2 = { _v_ecc, _w_mem_wr_b ^ 64'h4000000040000000 };
                end
                else begin
                    _v_tmp2 = { _v_ecc, _w_mem_wr_b };
                end
            end
            else begin
                _v_ecc  = 8'b0;
                _v_tmp2 = { _w_DINPBDINP, _w_DINPADINP, _w_mem_wr_b };
            end
            // Insert bits
            case (WRITE_WIDTH_B)
                1       : _v_tmp3 = write_1_bit   (_v_addr[5:0], _v_tmp1, _v_tmp2);
                2       : _v_tmp3 = write_2_bits  (_v_addr[5:1], _v_tmp1, _v_tmp2);
                4       : _v_tmp3 = write_4_bits  (_v_addr[5:2], _v_tmp1, _v_tmp2);
                9       : _v_tmp3 = write_9_bits  (_v_addr[5:3], _v_tmp1, _v_tmp2);
                18      : _v_tmp3 = write_18_bits (_v_addr[5:4], _v_tmp1, _v_tmp2);
                36      : _v_tmp3 = write_36_bits (_v_addr[5  ], _v_tmp1, _v_tmp2);
                72      : _v_tmp3 = _v_tmp2;
                default : _v_tmp3 = _v_tmp1; // Wrong width
            endcase // WRITE_WIDTH_B
        
            // Write back memory array
            // 1/2/4/9-bit mode
            if (WRITE_WIDTH_B <= 9) begin
                if (WEBWE[0]) begin
                    _r_mem[_v_addr[14:6]] <= _v_tmp3;
                end
            end
            // 18-bit mode
            else if (WRITE_WIDTH_B == 18) begin
                if (WEBWE[1]) begin
                    _r_mem[_v_addr[14:6]][   71] <= _v_tmp3[   71];
                    _r_mem[_v_addr[14:6]][   69] <= _v_tmp3[   69];
                    _r_mem[_v_addr[14:6]][   67] <= _v_tmp3[   67];
                    _r_mem[_v_addr[14:6]][   65] <= _v_tmp3[   65];
                    _r_mem[_v_addr[14:6]][63:56] <= _v_tmp3[63:56];
                    _r_mem[_v_addr[14:6]][47:40] <= _v_tmp3[47:40];
                    _r_mem[_v_addr[14:6]][31:24] <= _v_tmp3[31:24];
                    _r_mem[_v_addr[14:6]][15: 8] <= _v_tmp3[15: 8];
                end
                if (WEBWE[0]) begin
                    _r_mem[_v_addr[14:6]][   70] <= _v_tmp3[   70];
                    _r_mem[_v_addr[14:6]][   68] <= _v_tmp3[   68];
                    _r_mem[_v_addr[14:6]][   66] <= _v_tmp3[   66];
                    _r_mem[_v_addr[14:6]][   64] <= _v_tmp3[   64];
                    _r_mem[_v_addr[14:6]][55:48] <= _v_tmp3[55:48];
                    _r_mem[_v_addr[14:6]][39:32] <= _v_tmp3[39:32];
                    _r_mem[_v_addr[14:6]][23:16] <= _v_tmp3[23:16];
                    _r_mem[_v_addr[14:6]][ 7: 0] <= _v_tmp3[ 7: 0];
                end
            end
            // 36-bit mode
            else if (WRITE_WIDTH_B == 36) begin
                if (WEBWE[3]) begin
                    _r_mem[_v_addr[14:6]][   71] <= _v_tmp3[   71];
                    _r_mem[_v_addr[14:6]][   67] <= _v_tmp3[   67];
                    _r_mem[_v_addr[14:6]][63:56] <= _v_tmp3[63:56];
                    _r_mem[_v_addr[14:6]][31:24] <= _v_tmp3[31:24];
                end
                if (WEBWE[2]) begin
                    _r_mem[_v_addr[14:6]][   70] <= _v_tmp3[   70];
                    _r_mem[_v_addr[14:6]][   66] <= _v_tmp3[   66];
                    _r_mem[_v_addr[14:6]][55:48] <= _v_tmp3[55:48];
                    _r_mem[_v_addr[14:6]][23:16] <= _v_tmp3[23:16];
                end
                if (WEBWE[1]) begin
                    _r_mem[_v_addr[14:6]][   69] <= _v_tmp3[   69];
                    _r_mem[_v_addr[14:6]][   65] <= _v_tmp3[   65];
                    _r_mem[_v_addr[14:6]][47:40] <= _v_tmp3[47:40];
                    _r_mem[_v_addr[14:6]][15: 8] <= _v_tmp3[15: 8];
                end
                if (WEBWE[0]) begin
                    _r_mem[_v_addr[14:6]][   68] <= _v_tmp3[   68];
                    _r_mem[_v_addr[14:6]][   64] <= _v_tmp3[   64];
                    _r_mem[_v_addr[14:6]][39:32] <= _v_tmp3[39:32];
                    _r_mem[_v_addr[14:6]][ 7: 0] <= _v_tmp3[ 7: 0];
                end
            end
            // 72-bit mode
            else if (WRITE_WIDTH_B == 72) begin
                if (WEBWE[7]) begin
                    _r_mem[_v_addr[14:6]][   71] <= _v_tmp3[   71];
                    _r_mem[_v_addr[14:6]][63:56] <= _v_tmp3[63:56];
                end
                if (WEBWE[6]) begin
                    _r_mem[_v_addr[14:6]][   70] <= _v_tmp3[   70];
                    _r_mem[_v_addr[14:6]][55:48] <= _v_tmp3[55:48];
                end
                if (WEBWE[5]) begin
                    _r_mem[_v_addr[14:6]][   69] <= _v_tmp3[   69];
                    _r_mem[_v_addr[14:6]][47:40] <= _v_tmp3[47:40];
                end
                if (WEBWE[4]) begin
                    _r_mem[_v_addr[14:6]][   68] <= _v_tmp3[   68];
                    _r_mem[_v_addr[14:6]][39:32] <= _v_tmp3[39:32];
                end
                if (WEBWE[3]) begin
                    _r_mem[_v_addr[14:6]][   67] <= _v_tmp3[   67];
                    _r_mem[_v_addr[14:6]][31:24] <= _v_tmp3[31:24];
                end
                if (WEBWE[2]) begin
                    _r_mem[_v_addr[14:6]][   66] <= _v_tmp3[   66];
                    _r_mem[_v_addr[14:6]][23:16] <= _v_tmp3[23:16];
                end
                if (WEBWE[1]) begin
                    _r_mem[_v_addr[14:6]][   65] <= _v_tmp3[   65];
                    _r_mem[_v_addr[14:6]][15: 8] <= _v_tmp3[15: 8];
                end
                if (WEBWE[0]) begin
                    _r_mem[_v_addr[14:6]][   64] <= _v_tmp3[   64];
                    _r_mem[_v_addr[14:6]][ 7: 0] <= _v_tmp3[ 7: 0];
                end
            end // WRITE_WIDTH_B
            
            // Write first mode
            if (WRITE_MODE_B == "WRITE_FIRST") begin
                case (READ_WIDTH_B)
                    1       : _r_mem_b_wf_p0 <= read_1_bit   (_v_addr[5:0], _v_tmp3);
                    2       : _r_mem_b_wf_p0 <= read_2_bits  (_v_addr[5:1], _v_tmp3);
                    4       : _r_mem_b_wf_p0 <= read_4_bits  (_v_addr[5:2], _v_tmp3);
                    9       : _r_mem_b_wf_p0 <= read_9_bits  (_v_addr[5:3], _v_tmp3);
                    18      : _r_mem_b_wf_p0 <= read_18_bits (_v_addr[5:4], _v_tmp3);
                    36      : _r_mem_b_wf_p0 <= read_36_bits (_v_addr[5  ], _v_tmp3);
                    default : _r_mem_b_wf_p0 <= 72'b0; // Wrong width
                endcase // READ_WIDTH_B
            end
        end
        else begin
            _v_ecc = 8'b0;
        end
        
        // ECC register
        if (_GSR) begin
            _r_ECCPARITY <= 8'b0;
        end
        else if (_w_ENBWREN) begin
            _r_ECCPARITY <= _v_ecc;
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
    
    assign ECCPARITY = _r_ECCPARITY;
   
    // ========================================================================
    // Read/Write collision check (TBD)
    // ========================================================================

/*
    localparam [14:0] rd_addr_a_mask = 
        (READ_WIDTH_A ==  0) ? 15'b111111111111111 :
        (READ_WIDTH_A ==  1) ? 15'b111111111111111 :
        (READ_WIDTH_A ==  2) ? 15'b111111111111110 :
        (READ_WIDTH_A ==  4) ? 15'b111111111111100 :
        (READ_WIDTH_A ==  9) ? 15'b111111111111000 :
        (READ_WIDTH_A == 18) ? 15'b111111111110000 :
        (READ_WIDTH_A == 36) ? 15'b111111111100000 :
        (READ_WIDTH_A == 72) ? 15'b111111111000000 : 15'b111111111111111;
    
    localparam [14:0] rd_addr_b_mask = 
        (READ_WIDTH_B ==  0) ? 15'b111111111111111 :
        (READ_WIDTH_B ==  1) ? 15'b111111111111111 :
        (READ_WIDTH_B ==  2) ? 15'b111111111111110 :
        (READ_WIDTH_B ==  4) ? 15'b111111111111100 :
        (READ_WIDTH_B ==  9) ? 15'b111111111111000 :
        (READ_WIDTH_B == 18) ? 15'b111111111110000 :
        (READ_WIDTH_B == 36) ? 15'b111111111100000 : 15'b111111111111111;
    
    localparam [14:0] wr_addr_a_mask = 
        (WRITE_WIDTH_A ==  0) ? 15'b111111111111111 :
        (WRITE_WIDTH_A ==  1) ? 15'b111111111111111 :
        (WRITE_WIDTH_A ==  2) ? 15'b111111111111110 :
        (WRITE_WIDTH_A ==  4) ? 15'b111111111111100 :
        (WRITE_WIDTH_A ==  9) ? 15'b111111111111000 :
        (WRITE_WIDTH_A == 18) ? 15'b111111111110000 :
        (WRITE_WIDTH_A == 36) ? 15'b111111111100000 : 15'b111111111111111;
    
    localparam [14:0] wr_addr_b_mask = 
        (WRITE_WIDTH_B ==  0) ? 15'b111111111111111 :
        (WRITE_WIDTH_B ==  1) ? 15'b111111111111111 :
        (WRITE_WIDTH_B ==  2) ? 15'b111111111111110 :
        (WRITE_WIDTH_B ==  4) ? 15'b111111111111100 :
        (WRITE_WIDTH_B ==  9) ? 15'b111111111111000 :
        (WRITE_WIDTH_B == 18) ? 15'b111111111110000 :
        (WRITE_WIDTH_B == 36) ? 15'b111111111100000 :
        (WRITE_WIDTH_B == 72) ? 15'b111111111000000 : 15'b111111111111111;
        
    reg  [14:0] rd_addr_a;
    reg  [14:0] rd_addr_b;
    reg  [14:0] wr_addr_a;
    reg  [14:0] wr_addr_b;
    wire        wr_a_rd_b_addr_coll;
    wire        wr_addr_coll;
    wire        wr_b_rd_a_addr_coll;
    
    initial begin
        rd_addr_a = 15'b0;
        rd_addr_b = 15'b0;
        wr_addr_a = 15'b0;
        wr_addr_b = 15'b0;
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
