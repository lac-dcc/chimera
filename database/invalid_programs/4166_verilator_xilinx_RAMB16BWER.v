// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// RAMB16BWER primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator lint_off UNUSED */
/* verilator coverage_off */
module RAMB16BWER
#(
    // Memory initialization
    parameter [255:0] INITP_00    = 256'h0,
    parameter [255:0] INITP_01    = 256'h0,
    parameter [255:0] INITP_02    = 256'h0,
    parameter [255:0] INITP_03    = 256'h0,
    parameter [255:0] INITP_04    = 256'h0,
    parameter [255:0] INITP_05    = 256'h0,
    parameter [255:0] INITP_06    = 256'h0,
    parameter [255:0] INITP_07    = 256'h0,
    parameter [255:0] INIT_00     = 256'h0,
    parameter [255:0] INIT_01     = 256'h0,
    parameter [255:0] INIT_02     = 256'h0,
    parameter [255:0] INIT_03     = 256'h0,
    parameter [255:0] INIT_04     = 256'h0,
    parameter [255:0] INIT_05     = 256'h0,
    parameter [255:0] INIT_06     = 256'h0,
    parameter [255:0] INIT_07     = 256'h0,
    parameter [255:0] INIT_08     = 256'h0,
    parameter [255:0] INIT_09     = 256'h0,
    parameter [255:0] INIT_0A     = 256'h0,
    parameter [255:0] INIT_0B     = 256'h0,
    parameter [255:0] INIT_0C     = 256'h0,
    parameter [255:0] INIT_0D     = 256'h0,
    parameter [255:0] INIT_0E     = 256'h0,
    parameter [255:0] INIT_0F     = 256'h0,
    parameter [255:0] INIT_10     = 256'h0,
    parameter [255:0] INIT_11     = 256'h0,
    parameter [255:0] INIT_12     = 256'h0,
    parameter [255:0] INIT_13     = 256'h0,
    parameter [255:0] INIT_14     = 256'h0,
    parameter [255:0] INIT_15     = 256'h0,
    parameter [255:0] INIT_16     = 256'h0,
    parameter [255:0] INIT_17     = 256'h0,
    parameter [255:0] INIT_18     = 256'h0,
    parameter [255:0] INIT_19     = 256'h0,
    parameter [255:0] INIT_1A     = 256'h0,
    parameter [255:0] INIT_1B     = 256'h0,
    parameter [255:0] INIT_1C     = 256'h0,
    parameter [255:0] INIT_1D     = 256'h0,
    parameter [255:0] INIT_1E     = 256'h0,
    parameter [255:0] INIT_1F     = 256'h0,
    parameter [255:0] INIT_20     = 256'h0,
    parameter [255:0] INIT_21     = 256'h0,
    parameter [255:0] INIT_22     = 256'h0,
    parameter [255:0] INIT_23     = 256'h0,
    parameter [255:0] INIT_24     = 256'h0,
    parameter [255:0] INIT_25     = 256'h0,
    parameter [255:0] INIT_26     = 256'h0,
    parameter [255:0] INIT_27     = 256'h0,
    parameter [255:0] INIT_28     = 256'h0,
    parameter [255:0] INIT_29     = 256'h0,
    parameter [255:0] INIT_2A     = 256'h0,
    parameter [255:0] INIT_2B     = 256'h0,
    parameter [255:0] INIT_2C     = 256'h0,
    parameter [255:0] INIT_2D     = 256'h0,
    parameter [255:0] INIT_2E     = 256'h0,
    parameter [255:0] INIT_2F     = 256'h0,
    parameter [255:0] INIT_30     = 256'h0,
    parameter [255:0] INIT_31     = 256'h0,
    parameter [255:0] INIT_32     = 256'h0,
    parameter [255:0] INIT_33     = 256'h0,
    parameter [255:0] INIT_34     = 256'h0,
    parameter [255:0] INIT_35     = 256'h0,
    parameter [255:0] INIT_36     = 256'h0,
    parameter [255:0] INIT_37     = 256'h0,
    parameter [255:0] INIT_38     = 256'h0,
    parameter [255:0] INIT_39     = 256'h0,
    parameter [255:0] INIT_3A     = 256'h0,
    parameter [255:0] INIT_3B     = 256'h0,
    parameter [255:0] INIT_3C     = 256'h0,
    parameter [255:0] INIT_3D     = 256'h0,
    parameter [255:0] INIT_3E     = 256'h0,
    parameter [255:0] INIT_3F     = 256'h0,
    parameter         INIT_FILE   = "NONE",
    // Output registers reset values
    parameter  [35:0] INIT_A      = 36'h0,
    parameter  [35:0] INIT_B      = 36'h0,
    parameter  [35:0] SRVAL_A     = 36'h0,
    parameter  [35:0] SRVAL_B     = 36'h0,
    // Collision check (not implemented)
    parameter SETUP_ALL           = 1000,
    parameter SETUP_READ_FIRST    = 3000,
    parameter SIM_COLLISION_CHECK = "ALL",
    // Reset configuration
    parameter RSTTYPE             = "SYNC",         // "SYNC", "ASYNC"
    parameter EN_RSTRAM_A         = "TRUE",         // "TRUE", "FALSE"
    parameter EN_RSTRAM_B         = "TRUE",         // "TRUE", "FALSE"
    parameter RST_PRIORITY_A      = "CE",           // "CE", "SR"
    parameter RST_PRIORITY_B      = "CE",           // "CE", "SR"
    // Block RAM mode
    parameter DATA_WIDTH_A        = 0,              // 0, 1, 2, 4, 9, 18, 36
    parameter DATA_WIDTH_B        = 0,              // 0, 1, 2, 4, 9, 18, 36
    parameter DOA_REG             = 0,              // 0, 1
    parameter DOB_REG             = 0,              // 0, 1
    parameter WRITE_MODE_A        = "WRITE_FIRST",  // "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    parameter WRITE_MODE_B        = "WRITE_FIRST",  // "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    // FPGA type
    parameter SIM_DEVICE          = "SPARTAN3ADSP"  // "SPARTAN3ADSP", "SPARTAN6"
)
(
    // Port A
    input  wire        RSTA,        // Reset
    input  wire        CLKA,        // Clock
    input  wire        ENA,         // Enable
    input  wire        REGCEA,      // Output register clock enable
    input  wire  [3:0] WEA,         // Byte write enable
    input  wire [13:0] ADDRA,       // Address
    input  wire  [3:0] DIPA,        // Parity in
    input  wire [31:0] DIA,         // Data in
    output wire  [3:0] DOPA,        // Parity out
    output wire [31:0] DOA,         // Data out
    // Port B
    input  wire        RSTB,        // Reset
    input  wire        CLKB,        // Clock
    input  wire        ENB,         // Enable
    input  wire        REGCEB,      // Output register clock enable
    input  wire  [3:0] WEB,         // Byte write enable
    input  wire [13:0] ADDRB,       // Address
    input  wire  [3:0] DIPB,        // Parity in
    input  wire [31:0] DIB,         // Data in
    output wire  [3:0] DOPB,        // Parity out
    output wire [31:0] DOB          // Data out
);
    
    // ========================================================================
    // Synchronous resets
    // ========================================================================
    
    /* verilator lint_off WIDTH */
    wire _w_regcea_p2 = (SIM_DEVICE == "SPARTAN3ADSP") ? ENA
                      : (SIM_DEVICE == "SPARTAN6") ? REGCEA : 1'b0;
    wire _w_regceb_p2 = (SIM_DEVICE == "SPARTAN3ADSP") ? ENB
                      : (SIM_DEVICE == "SPARTAN6") ? REGCEB : 1'b0;
    wire _w_srst_a_p1 = (EN_RSTRAM_A == "FALSE") ? 1'b0
                      : (RST_PRIORITY_A == "CE") ? ENA & RSTA
                      : (RST_PRIORITY_A == "SR") ? RSTA : 1'b0;
    
    wire _w_srst_a_p2 = (EN_RSTRAM_A == "FALSE") ? 1'b0
                      : (RST_PRIORITY_A == "CE") ? _w_regcea_p2 & RSTA
                      : (RST_PRIORITY_A == "SR") ? RSTA : 1'b0;
    
    wire _w_srst_b_p1 = (EN_RSTRAM_B == "FALSE") ? 1'b0
                      : (RST_PRIORITY_B == "CE") ? ENB & RSTB
                      : (RST_PRIORITY_B == "SR") ? RSTB : 1'b0;
    
    wire _w_srst_b_p2 = (EN_RSTRAM_B == "FALSE") ? 1'b0
                      : (RST_PRIORITY_B == "CE") ? _w_regceb_p2 & RSTB
                      : (RST_PRIORITY_B == "SR") ? RSTB : 1'b0;
    /* verilator lint_on WIDTH */
    
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
                _v_init[6'h20] = INIT_00; _v_initp[6'h20] = INITP_04['h00 +: 32];
                _v_init[6'h21] = INIT_01; _v_initp[6'h21] = INITP_04['h20 +: 32];
                _v_init[6'h22] = INIT_02; _v_initp[6'h22] = INITP_04['h40 +: 32];
                _v_init[6'h23] = INIT_03; _v_initp[6'h23] = INITP_04['h60 +: 32];
                _v_init[6'h24] = INIT_04; _v_initp[6'h24] = INITP_04['h80 +: 32];
                _v_init[6'h25] = INIT_05; _v_initp[6'h25] = INITP_04['hA0 +: 32];
                _v_init[6'h26] = INIT_06; _v_initp[6'h26] = INITP_04['hC0 +: 32];
                _v_init[6'h27] = INIT_07; _v_initp[6'h27] = INITP_04['hE0 +: 32];
                _v_init[6'h28] = INIT_08; _v_initp[6'h28] = INITP_05['h00 +: 32];
                _v_init[6'h29] = INIT_09; _v_initp[6'h29] = INITP_05['h20 +: 32];
                _v_init[6'h2A] = INIT_0A; _v_initp[6'h2A] = INITP_05['h40 +: 32];
                _v_init[6'h2B] = INIT_0B; _v_initp[6'h2B] = INITP_05['h60 +: 32];
                _v_init[6'h2C] = INIT_0C; _v_initp[6'h2C] = INITP_05['h80 +: 32];
                _v_init[6'h2D] = INIT_0D; _v_initp[6'h2D] = INITP_05['hA0 +: 32];
                _v_init[6'h2E] = INIT_0E; _v_initp[6'h2E] = INITP_05['hC0 +: 32];
                _v_init[6'h2F] = INIT_0F; _v_initp[6'h2F] = INITP_05['hE0 +: 32];
                _v_init[6'h30] = INIT_10; _v_initp[6'h30] = INITP_06['h00 +: 32];
                _v_init[6'h31] = INIT_11; _v_initp[6'h31] = INITP_06['h20 +: 32];
                _v_init[6'h32] = INIT_12; _v_initp[6'h32] = INITP_06['h40 +: 32];
                _v_init[6'h33] = INIT_13; _v_initp[6'h33] = INITP_06['h60 +: 32];
                _v_init[6'h34] = INIT_14; _v_initp[6'h34] = INITP_06['h80 +: 32];
                _v_init[6'h35] = INIT_15; _v_initp[6'h35] = INITP_06['hA0 +: 32];
                _v_init[6'h36] = INIT_16; _v_initp[6'h36] = INITP_06['hC0 +: 32];
                _v_init[6'h37] = INIT_17; _v_initp[6'h37] = INITP_06['hE0 +: 32];
                _v_init[6'h38] = INIT_18; _v_initp[6'h38] = INITP_07['h00 +: 32];
                _v_init[6'h39] = INIT_19; _v_initp[6'h39] = INITP_07['h20 +: 32];
                _v_init[6'h3A] = INIT_1A; _v_initp[6'h3A] = INITP_07['h40 +: 32];
                _v_init[6'h3B] = INIT_1B; _v_initp[6'h3B] = INITP_07['h60 +: 32];
                _v_init[6'h3C] = INIT_1C; _v_initp[6'h3C] = INITP_07['h80 +: 32];
                _v_init[6'h3D] = INIT_1D; _v_initp[6'h3D] = INITP_07['hA0 +: 32];
                _v_init[6'h3E] = INIT_1E; _v_initp[6'h3E] = INITP_07['hC0 +: 32];
                _v_init[6'h3F] = INIT_1F; _v_initp[6'h3F] = INITP_07['hE0 +: 32];
                
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
    // Read / write utility functions
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
        input [31:0] data_new;
        begin
            write_1_bit = data_old;
            write_1_bit[{ 1'b0, addr }] = data_new[0];
        end
    endfunction
    
    function [35:0] read_2_bits;
        input  [3:0] addr;
        input [35:0] data;
        begin
            read_2_bits = { 34'b0, data[{ 1'b0, addr, 1'b1 }], data[{ 1'b0, addr, 1'b0 }] };
        end
    endfunction
    
    function [35:0] write_2_bits;
        input  [3:0] addr;
        input [35:0] data_old;
        input [31:0] data_new;
        begin
            write_2_bits = data_old;
            write_2_bits[{ 1'b0, addr, 1'b1 }] = data_new[1];
            write_2_bits[{ 1'b0, addr, 1'b0 }] = data_new[0];
        end
    endfunction
    
    function [35:0] read_4_bits;
        input  [2:0] addr;
        input [35:0] data;
        begin
            case (addr)
                3'd0 : read_4_bits = { 32'b0, data[ 3: 0] };
                3'd1 : read_4_bits = { 32'b0, data[ 7: 4] };
                3'd2 : read_4_bits = { 32'b0, data[11: 8] };
                3'd3 : read_4_bits = { 32'b0, data[15:12] };
                3'd4 : read_4_bits = { 32'b0, data[19:16] };
                3'd5 : read_4_bits = { 32'b0, data[23:20] };
                3'd6 : read_4_bits = { 32'b0, data[27:24] };
                3'd7 : read_4_bits = { 32'b0, data[31:28] };
            endcase
        end
    endfunction
    
    function [35:0] write_4_bits;
        input  [2:0] addr;
        input [35:0] data_old;
        input [31:0] data_new;
        begin
            write_4_bits = data_old;
            case (addr)
                3'd0 : write_4_bits[ 3: 0] = data_new[3:0];
                3'd1 : write_4_bits[ 7: 4] = data_new[3:0];
                3'd2 : write_4_bits[11: 8] = data_new[3:0];
                3'd3 : write_4_bits[15:12] = data_new[3:0];
                3'd4 : write_4_bits[19:16] = data_new[3:0];
                3'd5 : write_4_bits[23:20] = data_new[3:0];
                3'd6 : write_4_bits[27:24] = data_new[3:0];
                3'd7 : write_4_bits[31:28] = data_new[3:0];
            endcase
        end
    endfunction
    
    function [35:0] read_9_bits;
        input  [1:0] addr;
        input [35:0] data;
        begin
            case (addr)
                2'd0 : read_9_bits = { 3'b0, data[32], 24'b0, data[ 7: 0] };
                2'd1 : read_9_bits = { 3'b0, data[33], 24'b0, data[15: 8] };
                2'd2 : read_9_bits = { 3'b0, data[34], 24'b0, data[23:16] };
                2'd3 : read_9_bits = { 3'b0, data[35], 24'b0, data[31:24] };
            endcase
        end
    endfunction
    
    function [35:0] write_9_bits;
        input  [1:0] addr;
        input [35:0] data_old;
        input [35:0] data_new;
        begin
            write_9_bits = data_old;
            case (addr)
                2'd0 : begin write_9_bits[32] = data_new[32]; write_9_bits[ 7: 0] = data_new[7:0]; end
                2'd1 : begin write_9_bits[33] = data_new[32]; write_9_bits[15: 8] = data_new[7:0]; end
                2'd2 : begin write_9_bits[34] = data_new[32]; write_9_bits[23:16] = data_new[7:0]; end
                2'd3 : begin write_9_bits[35] = data_new[32]; write_9_bits[31:24] = data_new[7:0]; end
            endcase
        end
    endfunction
    
    function [35:0] read_18_bits;
        input        addr;
        input [35:0] data;
        begin
            if (addr) begin
                read_18_bits = { 2'b0, data[35:34], 16'b0, data[31:16] };
            end
            else begin
                read_18_bits = { 2'b0, data[33:32], 16'b0, data[15: 0] };
            end
        end
    endfunction
    
    function [35:0] write_18_bits;
        input        addr;
        input [35:0] data_old;
        input [35:0] data_new;
        begin
            write_18_bits = data_old;
            if (addr) begin
                write_18_bits[35:34] = data_new[33:32];
                write_18_bits[31:16] = data_new[15: 0];
            end
            else begin
                write_18_bits[33:32] = data_new[33:32];
                write_18_bits[15: 0] = data_new[15: 0];
            end
        end
    endfunction
    
    // ========================================================================
    // Port A read
    // ========================================================================
    
    reg [35:0] _r_qa_p0;
    reg [35:0] _r_qa_p1;
    reg [35:0] _r_qa_p2;
    
    initial begin
        _r_qa_p0 = INIT_A;
        _r_qa_p1 = INIT_A;
        _r_qa_p2 = INIT_A;
    end
    
    always @(*) begin : PORTA_READ_LATCH
        reg [35:0] _v_tmp;
        
        _v_tmp = _r_mem[ADDRA[13:5]];
        case (DATA_WIDTH_A)
            1       : _r_qa_p0 = read_1_bit(ADDRA[4:0], _v_tmp);
            2       : _r_qa_p0 = read_2_bits(ADDRA[4:1], _v_tmp);
            4       : _r_qa_p0 = read_4_bits(ADDRA[4:2], _v_tmp);
            9       : _r_qa_p0 = read_9_bits(ADDRA[4:3], _v_tmp);
            18      : _r_qa_p0 = read_18_bits(ADDRA[4], _v_tmp);
            36      : _r_qa_p0 = _v_tmp;
            default : _r_qa_p0 = 36'b0;
        endcase // DATA_WIDTH_A
        
        // Read data override
        if ((WRITE_MODE_A == "WRITE_FIRST") && (ENA)) begin
            case (DATA_WIDTH_A)
                1 : if (WEA[0]) _r_qa_p0[  0] = DIA[   0];
                2 : if (WEA[0]) _r_qa_p0[1:0] = DIA[ 1:0];
                4 : if (WEA[0]) _r_qa_p0[3:0] = DIA[ 3:0];
                9 : begin
                    if (WEA[0]) begin
                        _r_qa_p0[   32] = DIPA[0];
                        _r_qa_p0[ 7: 0] = DIA[7:0];
                    end
                end
                18 : begin
                    if (WEA[1]) begin
                        _r_qa_p0[   33] = DIPA[1];
                        _r_qa_p0[15: 8] = DIA[15:8];
                    end
                    if (WEA[0]) begin
                        _r_qa_p0[   32] = DIPA[0];
                        _r_qa_p0[ 7: 0] = DIA[ 7:0];
                    end
                end
                36 : begin
                    if (WEA[3]) begin
                        _r_qa_p0[   35] = DIPA[3];
                        _r_qa_p0[31:24] = DIA[31:24];
                    end
                    if (WEA[2]) begin
                        _r_qa_p0[   34] = DIPA[2];
                        _r_qa_p0[23:16] = DIA[23:16];
                    end
                    if (WEA[1]) begin
                        _r_qa_p0[   33] = DIPA[1];
                        _r_qa_p0[15: 8] = DIA[15: 8];
                    end
                    if (WEA[0]) begin
                        _r_qa_p0[   32] = DIPA[0];
                        _r_qa_p0[ 7: 0] = DIA[ 7: 0];
                    end
                end
                default : ;
            endcase // DATA_WIDTH_A
        end // WRITE_MODE_A
    end // PORTA_READ_LATCH
    
    generate
        if (RSTTYPE == "SYNC") begin : GEN_SYNC_RESET
            always @(posedge CLKA) begin : PORTA_READ_P1
            
                if (_w_srst_a_p1) begin
                    _r_qa_p1 <= SRVAL_A;
                end
                else if (ENA) begin
                    _r_qa_p1 <= _r_qa_p0;
                end
            end // PORTA_READ_P1
            
            always @(posedge CLKA) begin : PORTA_READ_P2
            
                if (_w_srst_a_p2) begin
                    _r_qa_p2 <= SRVAL_A;
                end
                else if (_w_regcea_p2) begin
                    _r_qa_p2 <= _r_qa_p1;
                end
            end // PORTA_READ_P2
        end // GEN_SYNC_RESET
        else begin : GEN_ASYNC_RESET
            always @(posedge RSTA or posedge CLKA) begin : PORTA_READ_P1
            
                if (RSTA) begin
                    _r_qa_p1 <= SRVAL_A;
                end
                else if (ENA) begin
                    _r_qa_p1 <= _r_qa_p0;
                end
            end // PORTA_READ_P1
            
            always @(posedge RSTA or posedge CLKA) begin : PORTA_READ_P2
            
                if (RSTA) begin
                    _r_qa_p2 <= SRVAL_A;
                end
                else if (_w_regcea_p2) begin
                    _r_qa_p2 <= _r_qa_p1;
                end
            end // PORTA_READ_P2
        end // GEN_ASYNC_RESET
    endgenerate
    
    assign DOPA = (DOA_REG == 1) ? _r_qa_p2[35:32] : _r_qa_p1[35:32];
    assign DOA  = (DOA_REG == 1) ? _r_qa_p2[31: 0] : _r_qa_p1[31: 0];
    
    // ========================================================================
    // Port A write
    // ========================================================================
    
    always @(posedge CLKA) begin : PORTA_WRITE
        reg [35:0] _v_tmp_rd;
        reg [35:0] _v_tmp_wr;
        
        if (ENA) begin
            // Read memory array
            _v_tmp_rd = _r_mem[ADDRA[13:5]];
            // Insert bits
            case (DATA_WIDTH_A)
                // 16384 x 1-bit
                1 : _v_tmp_wr = write_1_bit(ADDRA[4:0], _v_tmp_rd, DIA);
                // 8192 x 2-bit
                2 : _v_tmp_wr = write_2_bits(ADDRA[4:1], _v_tmp_rd, DIA);
                // 4096 x 4-bit
                4 : _v_tmp_wr = write_4_bits(ADDRA[4:2], _v_tmp_rd, DIA);
                // 2048 x 9-bit
                9 : _v_tmp_wr = write_9_bits(ADDRA[4:3], _v_tmp_rd, { DIPA, DIA });
                // 1024 x 18-bit
                18 : _v_tmp_wr = write_18_bits(ADDRA[4], _v_tmp_rd, { DIPA, DIA });
                // 512 x 36-bit
                36 : _v_tmp_wr[35:0] = { DIPA, DIA };
                // Undefined (no write)
                default : _v_tmp_wr = _v_tmp_rd;
            endcase // DATA_WIDTH_A
            
            // Write back memory array
            if (DATA_WIDTH_A <= 9) begin
                if (WEA[0]) begin
                    _r_mem[ADDRA[13:5]] <= _v_tmp_wr;
                end
            end
            // 18-bit mode
            else if (DATA_WIDTH_A == 18) begin
                if (WEA[0]) begin
                    _r_mem[ADDRA[13:5]][   34] <= _v_tmp_wr[   34];
                    _r_mem[ADDRA[13:5]][   32] <= _v_tmp_wr[   32];
                    _r_mem[ADDRA[13:5]][23:16] <= _v_tmp_wr[23:16];
                    _r_mem[ADDRA[13:5]][ 7: 0] <= _v_tmp_wr[ 7: 0];
                end
                if (WEA[1]) begin
                    _r_mem[ADDRA[13:5]][   35] <= _v_tmp_wr[   35];
                    _r_mem[ADDRA[13:5]][   33] <= _v_tmp_wr[   33];
                    _r_mem[ADDRA[13:5]][31:24] <= _v_tmp_wr[31:24];
                    _r_mem[ADDRA[13:5]][15: 8] <= _v_tmp_wr[15: 8];
                end
            end
            // 36-bit mode
            else if (DATA_WIDTH_A == 36) begin
                if (WEA[3]) begin
                    _r_mem[ADDRA[13:5]][   35] <= _v_tmp_wr[   35];
                    _r_mem[ADDRA[13:5]][31:24] <= _v_tmp_wr[31:24];
                end
                if (WEA[2]) begin
                    _r_mem[ADDRA[13:5]][   34] <= _v_tmp_wr[   34];
                    _r_mem[ADDRA[13:5]][23:16] <= _v_tmp_wr[23:16];
                end
                if (WEA[1]) begin
                    _r_mem[ADDRA[13:5]][   33] <= _v_tmp_wr[   33];
                    _r_mem[ADDRA[13:5]][15: 8] <= _v_tmp_wr[15: 8];
                end
                if (WEA[0]) begin
                    _r_mem[ADDRA[13:5]][   32] <= _v_tmp_wr[   32];
                    _r_mem[ADDRA[13:5]][ 7: 0] <= _v_tmp_wr[ 7: 0];
                end
            end // DATA_WIDTH_A
        end
    end // PORTA_WRITE
    
    // ========================================================================
    // Port B read
    // ========================================================================
    
    reg [35:0] _r_qb_p0;
    reg [35:0] _r_qb_p1;
    reg [35:0] _r_qb_p2;
    
    initial begin
        _r_qb_p0 = INIT_B;
        _r_qb_p1 = INIT_B;
        _r_qb_p2 = INIT_B;
    end
    
    always @(*) begin : PORTB_READ_LATCH
        reg [35:0] _v_tmp;
        
        _v_tmp = _r_mem[ADDRB[13:5]];
        case (DATA_WIDTH_B)
            1       : _r_qb_p0 = read_1_bit(ADDRB[4:0], _v_tmp);
            2       : _r_qb_p0 = read_2_bits(ADDRB[4:1], _v_tmp);
            4       : _r_qb_p0 = read_4_bits(ADDRB[4:2], _v_tmp);
            9       : _r_qb_p0 = read_9_bits(ADDRB[4:3], _v_tmp);
            18      : _r_qb_p0 = read_18_bits(ADDRB[4], _v_tmp);
            36      : _r_qb_p0 = _v_tmp;
            default : _r_qb_p0 = 36'b0;
        endcase // DATA_WIDTH_B
        
        // Read data override
        if ((WRITE_MODE_B == "WRITE_FIRST") && (ENB)) begin
            case (DATA_WIDTH_B)
                1 : if (WEB[0]) _r_qb_p0[  0] = DIB[   0];
                2 : if (WEB[0]) _r_qb_p0[1:0] = DIB[ 1:0];
                4 : if (WEB[0]) _r_qb_p0[3:0] = DIB[ 3:0];
                9 : begin
                    if (WEB[0]) begin
                        _r_qb_p0[   32] = DIPB[0];
                        _r_qb_p0[ 7: 0] = DIB[7:0];
                    end
                end
                18 : begin
                    if (WEB[1]) begin
                        _r_qb_p0[   33] = DIPB[1];
                        _r_qb_p0[15: 8] = DIB[15:8];
                    end
                    if (WEB[0]) begin
                        _r_qb_p0[   32] = DIPB[0];
                        _r_qb_p0[ 7: 0] = DIB[ 7:0];
                    end
                end
                36 : begin
                    if (WEB[3]) begin
                        _r_qb_p0[   35] = DIPB[3];
                        _r_qb_p0[31:24] = DIB[31:24];
                    end
                    if (WEB[2]) begin
                        _r_qb_p0[   34] = DIPB[2];
                        _r_qb_p0[23:16] = DIB[23:16];
                    end
                    if (WEB[1]) begin
                        _r_qb_p0[   33] = DIPB[1];
                        _r_qb_p0[15: 8] = DIB[15: 8];
                    end
                    if (WEB[0]) begin
                        _r_qb_p0[   32] = DIPB[0];
                        _r_qb_p0[ 7: 0] = DIB[ 7: 0];
                    end
                end
                default : ;
            endcase // DATA_WIDTH_B
        end // WRITE_MODE_B
    end // PORTB_READ_LATCH
    
    generate
        if (RSTTYPE == "SYNC") begin : GEN_SYNC_RESET
            always @(posedge CLKB) begin : PORTB_READ_P1
            
                if (_w_srst_b_p1) begin
                    _r_qb_p1 <= SRVAL_B;
                end
                else if (ENB) begin
                    _r_qb_p1 <= _r_qb_p0;
                end
            end // PORTB_READ_P1
            
            always @(posedge CLKB) begin : PORTB_READ_P2
            
                if (_w_srst_b_p2) begin
                    _r_qb_p2 <= SRVAL_B;
                end
                else if (_w_regceb_p2) begin
                    _r_qb_p2 <= _r_qb_p1;
                end
            end // PORTB_READ_P2
        end // GEN_SYNC_RESET
        else begin : GEN_ASYNC_RESET
            always @(posedge RSTB or posedge CLKB) begin : PORTB_READ_P1
            
                if (RSTB) begin
                    _r_qb_p1 <= SRVAL_B;
                end
                else if (ENB) begin
                    _r_qb_p1 <= _r_qb_p0;
                end
            end // PORTB_READ_P1
            
            always @(posedge RSTB or posedge CLKB) begin : PORTB_READ_P2
            
                if (RSTB) begin
                    _r_qb_p2 <= SRVAL_B;
                end
                else if (_w_regceb_p2) begin
                    _r_qb_p2 <= _r_qb_p1;
                end
            end // PORTB_READ_P2
        end // GEN_ASYNC_RESET
    endgenerate
    
    assign DOPB = (DOB_REG == 1) ? _r_qb_p2[35:32] : _r_qb_p1[35:32];
    assign DOB  = (DOB_REG == 1) ? _r_qb_p2[31: 0] : _r_qb_p1[31: 0];
    
    // ========================================================================
    // Port B write
    // ========================================================================
    
    always @(posedge CLKB) begin : PORTB_WRITE
        reg [35:0] _v_tmp_rd;
        reg [35:0] _v_tmp_wr;
        
        if (ENB) begin
            // Read memory array
            _v_tmp_rd = _r_mem[ADDRB[13:5]];
            // Insert bits
            case (DATA_WIDTH_B)
                // 16384 x 1-bit
                1 : _v_tmp_wr = write_1_bit(ADDRB[4:0], _v_tmp_rd, DIB);
                // 8192 x 2-bit
                2 : _v_tmp_wr = write_2_bits(ADDRB[4:1], _v_tmp_rd, DIB);
                // 4096 x 4-bit
                4 : _v_tmp_wr = write_4_bits(ADDRB[4:2], _v_tmp_rd, DIB);
                // 2048 x 9-bit
                9 : _v_tmp_wr = write_9_bits(ADDRB[4:3], _v_tmp_rd, { DIPB, DIB });
                // 1024 x 18-bit
                18 : _v_tmp_wr = write_18_bits(ADDRB[4], _v_tmp_rd, { DIPB, DIB });
                // 512 x 36-bit
                36 : _v_tmp_wr[35:0] = { DIPB, DIB };
                // Undefined (no write)
                default : _v_tmp_wr = _v_tmp_rd;
            endcase // DATA_WIDTH_B
            
            // Write back memory array
            if (DATA_WIDTH_B <= 9) begin
                if (WEB[0]) begin
                    _r_mem[ADDRB[13:5]] <= _v_tmp_wr;
                end
            end
            // 18-bit mode
            else if (DATA_WIDTH_B == 18) begin
                if (WEB[0]) begin
                    _r_mem[ADDRB[13:5]][   34] <= _v_tmp_wr[   34];
                    _r_mem[ADDRB[13:5]][   32] <= _v_tmp_wr[   32];
                    _r_mem[ADDRB[13:5]][23:16] <= _v_tmp_wr[23:16];
                    _r_mem[ADDRB[13:5]][ 7: 0] <= _v_tmp_wr[ 7: 0];
                end
                if (WEB[1]) begin
                    _r_mem[ADDRB[13:5]][   35] <= _v_tmp_wr[   35];
                    _r_mem[ADDRB[13:5]][   33] <= _v_tmp_wr[   33];
                    _r_mem[ADDRB[13:5]][31:24] <= _v_tmp_wr[31:24];
                    _r_mem[ADDRB[13:5]][15: 8] <= _v_tmp_wr[15: 8];
                end
            end
            // 36-bit mode
            else if (DATA_WIDTH_B == 36) begin
                if (WEB[3]) begin
                    _r_mem[ADDRB[13:5]][   35] <= _v_tmp_wr[   35];
                    _r_mem[ADDRB[13:5]][31:24] <= _v_tmp_wr[31:24];
                end
                if (WEB[2]) begin
                    _r_mem[ADDRB[13:5]][   34] <= _v_tmp_wr[   34];
                    _r_mem[ADDRB[13:5]][23:16] <= _v_tmp_wr[23:16];
                end
                if (WEB[1]) begin
                    _r_mem[ADDRB[13:5]][   33] <= _v_tmp_wr[   33];
                    _r_mem[ADDRB[13:5]][15: 8] <= _v_tmp_wr[15: 8];
                end
                if (WEB[0]) begin
                    _r_mem[ADDRB[13:5]][   32] <= _v_tmp_wr[   32];
                    _r_mem[ADDRB[13:5]][ 7: 0] <= _v_tmp_wr[ 7: 0];
                end
            end // DATA_WIDTH_B
        end
    end // PORTB_WRITE
    
endmodule
/* verilator lint_on UNUSED */
/* verilator coverage_on */
