// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// RAMB8BWER primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator lint_off UNUSED */
/* verilator coverage_off */
module RAMB8BWER
#(
    // Memory initialization
    parameter [255:0] INITP_00    = 256'h0,
    parameter [255:0] INITP_01    = 256'h0,
    parameter [255:0] INITP_02    = 256'h0,
    parameter [255:0] INITP_03    = 256'h0,
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
    parameter         INIT_FILE   = "NONE",
    // Output registers reset values
    parameter  [17:0] INIT_A      = 18'h0,
    parameter  [17:0] INIT_B      = 18'h0,
    parameter  [17:0] SRVAL_A     = 18'h0,
    parameter  [17:0] SRVAL_B     = 18'h0,
    // Collision check (not implemented)
    parameter SETUP_ALL           = 1000,
    parameter SETUP_READ_FIRST    = 3000,
    parameter SIM_COLLISION_CHECK = "ALL",
    // Reset configuration
    parameter RSTTYPE             = "SYNC",        // "SYNC", "ASYNC"
    parameter EN_RSTRAM_A         = "TRUE",        // "TRUE", "FALSE"
    parameter EN_RSTRAM_B         = "TRUE",        // "TRUE", "FALSE"
    parameter RST_PRIORITY_A      = "CE",          // "CE", "SR"
    parameter RST_PRIORITY_B      = "CE",          // "CE", "SR"
    // Block RAM mode
    parameter DATA_WIDTH_A        = 0,             // 0, 1, 2, 4, 9, 18, 36
    parameter DATA_WIDTH_B        = 0,             // 0, 1, 2, 4, 9, 18, 36
    parameter DOA_REG             = 0,             // 0, 1
    parameter DOB_REG             = 0,             // 0, 1
    parameter RAM_MODE            = "TDP",         // "TDP", "SDP"
    parameter WRITE_MODE_A        = "WRITE_FIRST", // "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
    parameter WRITE_MODE_B        = "WRITE_FIRST"  // "WRITE_FIRST", "READ_FIRST", "NO_CHANGE"
)
(
    // Port A (TDP) / Write port (SDP)
    input  wire        RSTA,        // Reset
    input  wire        CLKAWRCLK,   // Clock
    input  wire        ENAWREN,     // Enable
    input  wire        REGCEA,      // Output register clock enable
    input  wire  [1:0] WEAWEL,      // Byte write enable
    input  wire [12:0] ADDRAWRADDR, // Address
    input  wire  [1:0] DIPADIP,     // Parity in
    input  wire [15:0] DIADI,       // Data in
    output wire  [1:0] DOPADOP,     // Parity out
    output wire [15:0] DOADO,       // Data out
    // Port B (TDP) / Read port (SDP)
    input  wire        RSTBRST,     // Reset
    input  wire        CLKBRDCLK,   // Clock
    input  wire        ENBRDEN,     // Enable
    input  wire        REGCEBREGCE, // Output register clock enable
    input  wire  [1:0] WEBWEU,      // Byte write enable
    input  wire [12:0] ADDRBRDADDR, // Address
    input  wire  [1:0] DIPBDIP,     // Parity in
    input  wire [15:0] DIBDI,       // Data in
    output wire  [1:0] DOPBDOP,     // Parity out
    output wire [15:0] DOBDO        // Data out
);
    
    // ========================================================================
    // Synchronous resets
    // ========================================================================
    
    /* verilator lint_off WIDTH */
    wire _w_srst_a_p1 = (EN_RSTRAM_A == "FALSE") ? 1'b0
                      : (RST_PRIORITY_A == "CE") ? ENAWREN & RSTA
                      : (RST_PRIORITY_A == "SR") ? RSTA : 1'b0;
    
    wire _w_srst_a_p2 = (EN_RSTRAM_A == "FALSE") ? 1'b0
                      : (RST_PRIORITY_A == "CE") ? REGCEA & RSTA
                      : (RST_PRIORITY_A == "SR") ? RSTA : 1'b0;
    
    wire _w_srst_b_p1 = (EN_RSTRAM_B == "FALSE") ? 1'b0
                      : (RST_PRIORITY_B == "CE") ? ENBRDEN & RSTBRST
                      : (RST_PRIORITY_B == "SR") ? RSTBRST : 1'b0;
    
    wire _w_srst_b_p2 = (EN_RSTRAM_B == "FALSE") ? 1'b0
                      : (RST_PRIORITY_B == "CE") ? REGCEBREGCE & RSTBRST
                      : (RST_PRIORITY_B == "SR") ? RSTBRST : 1'b0;
    /* verilator lint_on WIDTH */
    
    // ========================================================================
    // 256 x 36-bit block RAM
    // ========================================================================
    
    /* verilator lint_off MULTIDRIVEN */
    reg [35:0] _r_mem [0:255];
    /* verilator lint_on MULTIDRIVEN */
    
    // ========================================================================
    // Block RAM initialization
    // ========================================================================
    
    generate
        if (INIT_FILE == "NONE") begin : GEN_XILINX_INIT
            initial begin : XILINX_INIT
                reg [255:0] _v_init  [0:31];
                reg  [31:0] _v_data;
                reg  [31:0] _v_initp [0:31];
                reg   [3:0] _v_datap;
                reg   [7:0] _v_addr;
                integer _i, _j;
                
                // Initialization vectors (data & parity)
                _v_init[5'h00] = INIT_00; _v_initp[5'h00] = INITP_00['h00 +: 32];
                _v_init[5'h01] = INIT_01; _v_initp[5'h01] = INITP_00['h20 +: 32];
                _v_init[5'h02] = INIT_02; _v_initp[5'h02] = INITP_00['h40 +: 32];
                _v_init[5'h03] = INIT_03; _v_initp[5'h03] = INITP_00['h60 +: 32];
                _v_init[5'h04] = INIT_04; _v_initp[5'h04] = INITP_00['h80 +: 32];
                _v_init[5'h05] = INIT_05; _v_initp[5'h05] = INITP_00['hA0 +: 32];
                _v_init[5'h06] = INIT_06; _v_initp[5'h06] = INITP_00['hC0 +: 32];
                _v_init[5'h07] = INIT_07; _v_initp[5'h07] = INITP_00['hE0 +: 32];
                _v_init[5'h08] = INIT_08; _v_initp[5'h08] = INITP_01['h00 +: 32];
                _v_init[5'h09] = INIT_09; _v_initp[5'h09] = INITP_01['h20 +: 32];
                _v_init[5'h0A] = INIT_0A; _v_initp[5'h0A] = INITP_01['h40 +: 32];
                _v_init[5'h0B] = INIT_0B; _v_initp[5'h0B] = INITP_01['h60 +: 32];
                _v_init[5'h0C] = INIT_0C; _v_initp[5'h0C] = INITP_01['h80 +: 32];
                _v_init[5'h0D] = INIT_0D; _v_initp[5'h0D] = INITP_01['hA0 +: 32];
                _v_init[5'h0E] = INIT_0E; _v_initp[5'h0E] = INITP_01['hC0 +: 32];
                _v_init[5'h0F] = INIT_0F; _v_initp[5'h0F] = INITP_01['hE0 +: 32];
                _v_init[5'h10] = INIT_10; _v_initp[5'h10] = INITP_02['h00 +: 32];
                _v_init[5'h11] = INIT_11; _v_initp[5'h11] = INITP_02['h20 +: 32];
                _v_init[5'h12] = INIT_12; _v_initp[5'h12] = INITP_02['h40 +: 32];
                _v_init[5'h13] = INIT_13; _v_initp[5'h13] = INITP_02['h60 +: 32];
                _v_init[5'h14] = INIT_14; _v_initp[5'h14] = INITP_02['h80 +: 32];
                _v_init[5'h15] = INIT_15; _v_initp[5'h15] = INITP_02['hA0 +: 32];
                _v_init[5'h16] = INIT_16; _v_initp[5'h16] = INITP_02['hC0 +: 32];
                _v_init[5'h17] = INIT_17; _v_initp[5'h17] = INITP_02['hE0 +: 32];
                _v_init[5'h18] = INIT_18; _v_initp[5'h18] = INITP_03['h00 +: 32];
                _v_init[5'h19] = INIT_19; _v_initp[5'h19] = INITP_03['h20 +: 32];
                _v_init[5'h1A] = INIT_1A; _v_initp[5'h1A] = INITP_03['h40 +: 32];
                _v_init[5'h1B] = INIT_1B; _v_initp[5'h1B] = INITP_03['h60 +: 32];
                _v_init[5'h1C] = INIT_1C; _v_initp[5'h1C] = INITP_03['h80 +: 32];
                _v_init[5'h1D] = INIT_1D; _v_initp[5'h1D] = INITP_03['hA0 +: 32];
                _v_init[5'h1E] = INIT_1E; _v_initp[5'h1E] = INITP_03['hC0 +: 32];
                _v_init[5'h1F] = INIT_1F; _v_initp[5'h1F] = INITP_03['hE0 +: 32];
                
                // Loop over the 32 initialization vectors
                for (_j = 0; _j < 32; _j = _j + 1) begin
                    // Map them to the 256 x 36-bit block RAM
                    for (_i = 0; _i < 8; _i = _i + 1) begin
                        _v_addr         = { _j[4:0], _i[2:0] };
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
                for (_i = 0; _i < 256; _i = _i + 1) begin
                    _r_mem[_i] = { 4'b0, 32'h00000000 };
                end
                // Simple .mem file (always mapped as a 256 x 36-bit hexadecimal dump)
                $readmemh(INIT_FILE, _r_mem);
            end
        end
    endgenerate

    // ========================================================================
    // Read / write utility functions
    // ========================================================================
    
    function [17:0] read_1_bit;
        input  [4:0] addr;
        input [35:0] data;
        begin
            read_1_bit = { 17'b0, data[{ 1'b0, addr }] };
        end
    endfunction
    
    function [35:0] write_1_bit;
        input  [4:0] addr;
        input [35:0] data_old;
        input [15:0] data_new;
        begin
            write_1_bit = data_old;
            write_1_bit[{ 1'b0, addr }] = data_new[0];
        end
    endfunction
    
    function [17:0] read_2_bits;
        input  [3:0] addr;
        input [35:0] data;
        begin
            read_2_bits = { 16'b0, data[{ 1'b0, addr, 1'b1 }], data[{ 1'b0, addr, 1'b0 }] };
        end
    endfunction
    
    function [35:0] write_2_bits;
        input  [3:0] addr;
        input [35:0] data_old;
        input [15:0] data_new;
        begin
            write_2_bits = data_old;
            write_2_bits[{ 1'b0, addr, 1'b1 }] = data_new[1];
            write_2_bits[{ 1'b0, addr, 1'b0 }] = data_new[0];
        end
    endfunction
    
    function [17:0] read_4_bits;
        input  [2:0] addr;
        input [35:0] data;
        begin
            case (addr)
                3'd0 : read_4_bits = { 14'b0, data[ 3: 0] };
                3'd1 : read_4_bits = { 14'b0, data[ 7: 4] };
                3'd2 : read_4_bits = { 14'b0, data[11: 8] };
                3'd3 : read_4_bits = { 14'b0, data[15:12] };
                3'd4 : read_4_bits = { 14'b0, data[19:16] };
                3'd5 : read_4_bits = { 14'b0, data[23:20] };
                3'd6 : read_4_bits = { 14'b0, data[27:24] };
                3'd7 : read_4_bits = { 14'b0, data[31:28] };
            endcase
        end
    endfunction
    
    function [35:0] write_4_bits;
        input  [2:0] addr;
        input [35:0] data_old;
        input [15:0] data_new;
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
    
    function [17:0] read_9_bits;
        input  [1:0] addr;
        input [35:0] data;
        begin
            case (addr)
                2'd0 : read_9_bits = { 1'b0, data[32], 8'b0, data[ 7: 0] };
                2'd1 : read_9_bits = { 1'b0, data[33], 8'b0, data[15: 8] };
                2'd2 : read_9_bits = { 1'b0, data[34], 8'b0, data[23:16] };
                2'd3 : read_9_bits = { 1'b0, data[35], 8'b0, data[31:24] };
            endcase
        end
    endfunction
    
    function [35:0] write_9_bits;
        input  [1:0] addr;
        input [35:0] data_old;
        input [17:0] data_new;
        begin
            write_9_bits = data_old;
            case (addr)
                2'd0 : begin write_9_bits[32] = data_new[16]; write_9_bits[ 7: 0] = data_new[7:0]; end
                2'd1 : begin write_9_bits[33] = data_new[16]; write_9_bits[15: 8] = data_new[7:0]; end
                2'd2 : begin write_9_bits[34] = data_new[16]; write_9_bits[23:16] = data_new[7:0]; end
                2'd3 : begin write_9_bits[35] = data_new[16]; write_9_bits[31:24] = data_new[7:0]; end
            endcase
        end
    endfunction
    
    function [17:0] read_18_bits;
        input        addr;
        input [35:0] data;
        begin
            if (addr) begin
                read_18_bits = { data[35:34], data[31:16] };
            end
            else begin
                read_18_bits = { data[33:32], data[15: 0] };
            end
        end
    endfunction
    
    function [35:0] write_18_bits;
        input        addr;
        input [35:0] data_old;
        input [17:0] data_new;
        begin
            write_18_bits = data_old;
            if (addr) begin
                write_18_bits[35:34] = data_new[17:16];
                write_18_bits[31:16] = data_new[15: 0];
            end
            else begin
                write_18_bits[33:32] = data_new[17:16];
                write_18_bits[15: 0] = data_new[15: 0];
            end
        end
    endfunction
    
    // ========================================================================
    // Port A read
    // ========================================================================
    
    reg [17:0] _r_qa_p0;
    reg [17:0] _r_qa_p1;
    reg [17:0] _r_qa_p2;
    
    initial begin
        _r_qa_p0 = INIT_A;
        _r_qa_p1 = INIT_A;
        _r_qa_p2 = INIT_A;
    end
    
    generate
        // True dual port mode
        if (RAM_MODE == "TDP") begin : GEN_TDP_A
            always @(*) begin : PORTA_READ_LATCH
                reg [35:0] _v_tmp;
                
                _v_tmp = _r_mem[ADDRAWRADDR[12:5]];
                case (DATA_WIDTH_A)
                    1       : _r_qa_p0 = read_1_bit(ADDRAWRADDR[4:0], _v_tmp);
                    2       : _r_qa_p0 = read_2_bits(ADDRAWRADDR[4:1], _v_tmp);
                    4       : _r_qa_p0 = read_4_bits(ADDRAWRADDR[4:2], _v_tmp);
                    9       : _r_qa_p0 = read_9_bits(ADDRAWRADDR[4:3], _v_tmp);
                    18      : _r_qa_p0 = read_18_bits(ADDRAWRADDR[4], _v_tmp);
                    default : _r_qa_p0 = 18'b0;
                endcase // DATA_WIDTH_A
                
                // Read data override
                if ((WRITE_MODE_A == "WRITE_FIRST") && (ENAWREN)) begin
                    case (DATA_WIDTH_A)
                        1 : if (WEAWEL[0]) _r_qa_p0[   0] = DIADI[   0];
                        2 : if (WEAWEL[0]) _r_qa_p0[ 1:0] = DIADI[ 1:0];
                        4 : if (WEAWEL[0]) _r_qa_p0[ 3:0] = DIADI[ 3:0];
                        9 : begin
                            if (WEAWEL[0]) begin
                                _r_qa_p0[  16] = DIPADIP[0];
                                _r_qa_p0[ 7:0] = DIADI[7:0];
                            end
                        end
                        18 : begin
                            if (WEAWEL[1]) begin
                                _r_qa_p0[  17] = DIPADIP[1];
                                _r_qa_p0[15:8] = DIADI[15:8];
                            end
                            if (WEAWEL[0]) begin
                                _r_qa_p0[  16] = DIPADIP[0];
                                _r_qa_p0[ 7:0] = DIADI[ 7:0];
                            end
                        end
                        default : ;
                    endcase // DATA_WIDTH_A
                end // WRITE_MODE_A
            end // PORTA_READ_LATCH
            
            if (RSTTYPE == "SYNC") begin : GEN_SYNC_RESET
                always @(posedge CLKAWRCLK) begin : PORTA_READ_P1
                
                    if (_w_srst_a_p1) begin
                        _r_qa_p1 <= SRVAL_A;
                    end
                    else if (ENAWREN) begin
                        _r_qa_p1 <= _r_qa_p0;
                    end
                end // PORTA_READ_P1
                
                always @(posedge CLKAWRCLK) begin : PORTA_READ_P2
                
                    if (_w_srst_a_p2) begin
                        _r_qa_p2 <= SRVAL_A;
                    end
                    else if (REGCEA) begin
                        _r_qa_p2 <= _r_qa_p1;
                    end
                end // PORTA_READ_P2
            end // GEN_SYNC_RESET
            else begin : GEN_ASYNC_RESET
                always @(posedge RSTA or posedge CLKAWRCLK) begin : PORTA_READ_P1
                
                    if (RSTA) begin
                        _r_qa_p1 <= SRVAL_A;
                    end
                    else if (ENAWREN) begin
                        _r_qa_p1 <= _r_qa_p0;
                    end
                end // PORTA_READ_P1
                
                always @(posedge RSTA or posedge CLKAWRCLK) begin : PORTA_READ_P2
                
                    if (RSTA) begin
                        _r_qa_p2 <= SRVAL_A;
                    end
                    else if (REGCEA) begin
                        _r_qa_p2 <= _r_qa_p1;
                    end
                end // PORTA_READ_P2
            end // GEN_ASYNC_RESET
        end // GEN_TDP_A
    endgenerate
    
    assign DOPADOP = (DOA_REG == 1) ? _r_qa_p2[17:16] : _r_qa_p1[17:16];
    assign DOADO   = (DOA_REG == 1) ? _r_qa_p2[15: 0] : _r_qa_p1[15: 0];
    
    // ========================================================================
    // Port A write
    // ========================================================================
    
    always @(posedge CLKAWRCLK) begin : PORTA_WRITE
        reg [35:0] _v_tmp_rd;
        reg [35:0] _v_tmp_wr;
        
        if (ENAWREN) begin
            // Read memory array
            _v_tmp_rd = _r_mem[ADDRAWRADDR[12:5]];
            // Insert bits
            case (DATA_WIDTH_A)
                // 8192 x 1-bit
                1 : _v_tmp_wr = write_1_bit(ADDRAWRADDR[4:0], _v_tmp_rd, DIADI);
                // 4096 x 2-bit
                2 : _v_tmp_wr = write_2_bits(ADDRAWRADDR[4:1], _v_tmp_rd, DIADI);
                // 2048 x 4-bit
                4 : _v_tmp_wr = write_4_bits(ADDRAWRADDR[4:2], _v_tmp_rd, DIADI);
                // 1024 x 9-bit
                9 : _v_tmp_wr = write_9_bits(ADDRAWRADDR[4:3], _v_tmp_rd, { DIPADIP, DIADI });
                // 512 x 18-bit
                18 : _v_tmp_wr = write_18_bits(ADDRAWRADDR[4], _v_tmp_rd, { DIPADIP, DIADI });
                // 256 x 36-bit
                36 : _v_tmp_wr[35:0] = { DIPBDIP, DIPADIP, DIBDI, DIADI };
                // Undefined (no write)
                default : _v_tmp_wr = _v_tmp_rd;
            endcase // DATA_WIDTH_A
            
            // Write back memory array
            if (DATA_WIDTH_A <= 9) begin
                if (WEAWEL[0]) begin
                    _r_mem[ADDRAWRADDR[12:5]] <= _v_tmp_wr;
                end
            end
            // 18-bit mode
            else if (DATA_WIDTH_A == 18) begin
                if (WEAWEL[0]) begin
                    _r_mem[ADDRAWRADDR[12:5]][   34] <= _v_tmp_wr[   34];
                    _r_mem[ADDRAWRADDR[12:5]][   32] <= _v_tmp_wr[   32];
                    _r_mem[ADDRAWRADDR[12:5]][23:16] <= _v_tmp_wr[23:16];
                    _r_mem[ADDRAWRADDR[12:5]][ 7: 0] <= _v_tmp_wr[ 7: 0];
                end
                if (WEAWEL[1]) begin
                    _r_mem[ADDRAWRADDR[12:5]][   35] <= _v_tmp_wr[   35];
                    _r_mem[ADDRAWRADDR[12:5]][   33] <= _v_tmp_wr[   33];
                    _r_mem[ADDRAWRADDR[12:5]][31:24] <= _v_tmp_wr[31:24];
                    _r_mem[ADDRAWRADDR[12:5]][15: 8] <= _v_tmp_wr[15: 8];
                end
            end
            // 36-bit mode
            else if (RAM_MODE == "SDP") begin
                if (WEAWEL[0]) begin
                    _r_mem[ADDRAWRADDR[12:5]][   32] <= _v_tmp_wr[   32];
                    _r_mem[ADDRAWRADDR[12:5]][ 7: 0] <= _v_tmp_wr[ 7: 0];
                end
                if (WEAWEL[1]) begin
                    _r_mem[ADDRAWRADDR[12:5]][   33] <= _v_tmp_wr[   33];
                    _r_mem[ADDRAWRADDR[12:5]][15: 8] <= _v_tmp_wr[15: 8];
                end
                if (WEBWEU[0]) begin
                    _r_mem[ADDRAWRADDR[12:5]][   34] <= _v_tmp_wr[   34];
                    _r_mem[ADDRAWRADDR[12:5]][23:16] <= _v_tmp_wr[23:16];
                end
                if (WEBWEU[1]) begin
                    _r_mem[ADDRAWRADDR[12:5]][   35] <= _v_tmp_wr[   35];
                    _r_mem[ADDRAWRADDR[12:5]][31:24] <= _v_tmp_wr[31:24];
                end
            end // DATA_WIDTH_A
        end
    end // PORTA_WRITE
    
    // ========================================================================
    // Port B read
    // ========================================================================
    
    reg [17:0] _r_qb_p0;
    reg [17:0] _r_qb_p1;
    reg [17:0] _r_qb_p2;
    
    initial begin
        _r_qb_p0 = INIT_B;
        _r_qb_p1 = INIT_B;
        _r_qb_p2 = INIT_B;
    end
    
    generate
        // True dual port mode
        if (RAM_MODE == "TDP") begin : GEN_TDP_B
            always @(*) begin : PORTB_READ_LATCH
                reg [35:0] _v_tmp;
                
                _v_tmp = _r_mem[ADDRBRDADDR[12:5]];
                case (DATA_WIDTH_B)
                    1       : _r_qb_p0 = read_1_bit(ADDRBRDADDR[4:0], _v_tmp);
                    2       : _r_qb_p0 = read_2_bits(ADDRBRDADDR[4:1], _v_tmp);
                    4       : _r_qb_p0 = read_4_bits(ADDRBRDADDR[4:2], _v_tmp);
                    9       : _r_qb_p0 = read_9_bits(ADDRBRDADDR[4:3], _v_tmp);
                    18      : _r_qb_p0 = read_18_bits(ADDRBRDADDR[4], _v_tmp);
                    default : _r_qb_p0 = 18'b0;
                endcase // DATA_WIDTH_B
                
                // Read data override
                if ((WRITE_MODE_B == "WRITE_FIRST") && (ENBRDEN)) begin
                    case (DATA_WIDTH_B)
                        1 : if (WEBWEU[0]) _r_qb_p0[   0] = DIBDI[   0];
                        2 : if (WEBWEU[0]) _r_qb_p0[ 1:0] = DIBDI[ 1:0];
                        4 : if (WEBWEU[0]) _r_qb_p0[ 3:0] = DIBDI[ 3:0];
                        9 : begin
                            if (WEBWEU[0]) begin
                                _r_qb_p0[  16] = DIPBDIP[0];
                                _r_qb_p0[ 7:0] = DIBDI[7:0];
                            end
                        end
                        18 : begin
                            if (WEBWEU[1]) begin
                                _r_qb_p0[  17] = DIPBDIP[1];
                                _r_qb_p0[15:8] = DIBDI[15:8];
                            end
                            if (WEBWEU[0]) begin
                                _r_qb_p0[  16] = DIPBDIP[0];
                                _r_qb_p0[ 7:0] = DIBDI[ 7:0];
                            end
                        end
                        default : ;
                    endcase // DATA_WIDTH_B
                end // WRITE_MODE_B
            end // PORTB_READ_LATCH
            
            if (RSTTYPE == "SYNC") begin : GEN_SYNC_RESET
                always @(posedge CLKBRDCLK) begin : PORTB_READ_P1
                
                    if (_w_srst_b_p1) begin
                        _r_qb_p1 <= SRVAL_B;
                    end
                    else if (ENBRDEN) begin
                        _r_qb_p1 <= _r_qb_p0;
                    end
                end // PORTB_READ_P1
                
                always @(posedge CLKBRDCLK) begin : PORTB_READ_P2
                
                    if (_w_srst_b_p2) begin
                        _r_qb_p2 <= SRVAL_B;
                    end
                    else if (REGCEBREGCE) begin
                        _r_qb_p2 <= _r_qb_p1;
                    end
                end // PORTB_READ_P2
            end // GEN_SYNC_RESET
            else begin : GEN_ASYNC_RESET
                always @(posedge RSTBRST or posedge CLKBRDCLK) begin : PORTB_READ_P1
                
                    if (RSTBRST) begin
                        _r_qb_p1 <= SRVAL_B;
                    end
                    else if (ENBRDEN) begin
                        _r_qb_p1 <= _r_qb_p0;
                    end
                end // PORTB_READ_P1
                
                always @(posedge RSTBRST or posedge CLKBRDCLK) begin : PORTB_READ_P2
                
                    if (RSTBRST) begin
                        _r_qb_p2 <= SRVAL_B;
                    end
                    else if (REGCEBREGCE) begin
                        _r_qb_p2 <= _r_qb_p1;
                    end
                end // PORTB_READ_P2
            end // GEN_ASYNC_RESET
        end // GEN_TDP_B
        // Simple dual port mode
        else if (RAM_MODE == "SDP") begin : GEN_SDP_B
            always @(*) begin : PORTB_READ_LATCH
                reg [35:0] _v_tmp;
                
                _v_tmp = _r_mem[ADDRBRDADDR[12:5]];
                case (DATA_WIDTH_B)
                    1 : begin
                        _r_qa_p0 = 18'b0;
                        _r_qb_p0 = read_1_bit(ADDRBRDADDR[4:0], _v_tmp);
                    end
                    2 : begin
                        _r_qa_p0 = 18'b0;
                        _r_qb_p0 = read_2_bits(ADDRBRDADDR[4:1], _v_tmp);
                    end
                    4 : begin
                        _r_qa_p0 = 18'b0;
                        _r_qb_p0 = read_4_bits(ADDRBRDADDR[4:2], _v_tmp);
                    end
                    9  : begin
                        _r_qa_p0 = 18'b0;
                        _r_qb_p0 = read_9_bits(ADDRBRDADDR[4:3], _v_tmp);
                    end
                    18 : begin
                        _r_qa_p0 = 18'b0;
                        _r_qb_p0 = read_18_bits(ADDRBRDADDR[4], _v_tmp);
                    end
                    36 : begin
                        _r_qa_p0 = { _v_tmp[33:32], _v_tmp[15: 0] };
                        _r_qb_p0 = { _v_tmp[35:34], _v_tmp[31:16] };
                    end
                    default : begin
                        _r_qa_p0 = 18'b0;
                        _r_qb_p0 = 18'b0;
                    end
                endcase // DATA_WIDTH_B
                
                // Read data override
                if ((WRITE_MODE_B == "WRITE_FIRST") && (ENBRDEN)) begin
                    case (DATA_WIDTH_B)
                        1 : if (WEBWEU[0]) _r_qb_p0[   0] = DIBDI[   0];
                        2 : if (WEBWEU[0]) _r_qb_p0[ 1:0] = DIBDI[ 1:0];
                        4 : if (WEBWEU[0]) _r_qb_p0[ 3:0] = DIBDI[ 3:0];
                        9 : begin
                            if (WEBWEU[0]) begin
                                _r_qb_p0[  16] = DIPBDIP[0];
                                _r_qb_p0[ 7:0] = DIBDI[7:0];
                            end
                        end
                        18 : begin
                            if (WEBWEU[1]) begin
                                _r_qb_p0[  17] = DIPBDIP[1];
                                _r_qb_p0[15:8] = DIBDI[15:8];
                            end
                            if (WEBWEU[0]) begin
                                _r_qb_p0[  16] = DIPBDIP[0];
                                _r_qb_p0[ 7:0] = DIBDI[ 7:0];
                            end
                        end
                        36 : begin
                            if (WEBWEU[1]) begin
                                _r_qb_p0[  17] = DIPBDIP[1];
                                _r_qb_p0[15:8] = DIBDI[15:8];
                            end
                            if (WEBWEU[0]) begin
                                _r_qb_p0[  16] = DIPBDIP[0];
                                _r_qb_p0[ 7:0] = DIBDI[ 7:0];
                            end
                            if (WEAWEL[1]) begin
                                _r_qa_p0[  17] = DIPADIP[1];
                                _r_qa_p0[15:8] = DIADI[15:8];
                            end
                            if (WEAWEL[0]) begin
                                _r_qa_p0[  16] = DIPADIP[0];
                                _r_qa_p0[ 7:0] = DIADI[ 7:0];
                            end
                        end
                        default : ;
                    endcase // DATA_WIDTH_B
                end // WRITE_MODE_B
            end // PORTB_READ_LATCH
            
            if (RSTTYPE == "SYNC") begin : GEN_SYNC_RESET
                always @(posedge CLKBRDCLK) begin : PORTB_READ_P1
                
                    if (_w_srst_b_p1) begin
                        _r_qa_p1 <= SRVAL_A;
                        _r_qb_p1 <= SRVAL_B;
                    end
                    else if (ENBRDEN) begin
                        _r_qa_p1 <= _r_qa_p0;
                        _r_qb_p1 <= _r_qb_p0;
                    end
                end // PORTB_READ_P1
                
                always @(posedge CLKBRDCLK) begin : PORTB_READ_P2
                
                    if (_w_srst_b_p2) begin
                        _r_qa_p2 <= SRVAL_A;
                        _r_qb_p2 <= SRVAL_B;
                    end
                    else if (REGCEBREGCE) begin
                        _r_qa_p2 <= _r_qa_p1;
                        _r_qb_p2 <= _r_qb_p1;
                    end
                end // PORTB_READ_P2
            end // GEN_SYNC_RESET
            else begin : GEN_ASYNC_RESET
                always @(posedge RSTBRST or posedge CLKBRDCLK) begin : PORTB_READ_P1
                
                    if (RSTBRST) begin
                        _r_qa_p1 <= SRVAL_A;
                        _r_qb_p1 <= SRVAL_B;
                    end
                    else if (ENBRDEN) begin
                        _r_qa_p1 <= _r_qa_p0;
                        _r_qb_p1 <= _r_qb_p0;
                    end
                end // PORTB_READ_P1
                
                always @(posedge RSTBRST or posedge CLKBRDCLK) begin : PORTB_READ_P2
                
                    if (RSTBRST) begin
                        _r_qa_p2 <= SRVAL_A;
                        _r_qb_p2 <= SRVAL_B;
                    end
                    else if (REGCEBREGCE) begin
                        _r_qa_p2 <= _r_qa_p1;
                        _r_qb_p2 <= _r_qb_p1;
                    end
                end // PORTB_READ_P2
            end // GEN_ASYNC_RESET
        end // GEN_SDP_B
    endgenerate
    
    assign DOPBDOP = (DOB_REG == 1) ? _r_qb_p2[17:16] : _r_qb_p1[17:16];
    assign DOBDO   = (DOB_REG == 1) ? _r_qb_p2[15: 0] : _r_qb_p1[15: 0];
    
    // ========================================================================
    // Port B write
    // ========================================================================
    
    generate
        // True dual port mode
        if (RAM_MODE == "TDP") begin : GEN_TDP_B
            always @(posedge CLKBRDCLK) begin : PORTB_WRITE
                reg [35:0] _v_tmp_rd;
                reg [35:0] _v_tmp_wr;
                
                if (ENBRDEN) begin
                    // Read memory array
                    _v_tmp_rd = _r_mem[ADDRBRDADDR[12:5]];
                    // Insert bits
                    case (DATA_WIDTH_B)
                        // 8192 x 1-bit
                        1 : _v_tmp_wr = write_1_bit(ADDRBRDADDR[4:0], _v_tmp_rd, DIBDI);
                        // 4096 x 2-bit
                        2 : _v_tmp_wr = write_2_bits(ADDRBRDADDR[4:1], _v_tmp_rd, DIBDI);
                        // 2048 x 4-bit
                        4 : _v_tmp_wr = write_4_bits(ADDRBRDADDR[4:2], _v_tmp_rd, DIBDI);
                        // 1024 x 9-bit
                        9 : _v_tmp_wr = write_9_bits(ADDRBRDADDR[4:3], _v_tmp_rd, { DIPBDIP, DIBDI });
                        // 512 x 18-bit
                        18 : _v_tmp_wr = write_18_bits(ADDRBRDADDR[4], _v_tmp_rd, { DIPBDIP, DIBDI });
                        // Undefined (no write)
                        default : _v_tmp_wr = _v_tmp_rd;
                    endcase // DATA_WIDTH_B
                    
                    // Write back memory array
                    if (DATA_WIDTH_B <= 9) begin
                        if (WEBWEU[0]) begin
                            _r_mem[ADDRBRDADDR[12:5]] <= _v_tmp_wr;
                        end
                    end
                    // 18-bit mode
                    else if (DATA_WIDTH_B == 18) begin
                        if (WEBWEU[0]) begin
                            _r_mem[ADDRBRDADDR[12:5]][   34] <= _v_tmp_wr[   34];
                            _r_mem[ADDRBRDADDR[12:5]][   32] <= _v_tmp_wr[   32];
                            _r_mem[ADDRBRDADDR[12:5]][23:16] <= _v_tmp_wr[23:16];
                            _r_mem[ADDRBRDADDR[12:5]][ 7: 0] <= _v_tmp_wr[ 7: 0];
                        end
                        if (WEBWEU[1]) begin
                            _r_mem[ADDRBRDADDR[12:5]][   35] <= _v_tmp_wr[   35];
                            _r_mem[ADDRBRDADDR[12:5]][   33] <= _v_tmp_wr[   33];
                            _r_mem[ADDRBRDADDR[12:5]][31:24] <= _v_tmp_wr[31:24];
                            _r_mem[ADDRBRDADDR[12:5]][15: 8] <= _v_tmp_wr[15: 8];
                        end
                    end // DATA_WIDTH_B
                end
            end // PORTB_WRITE
        end // GEN_TDP_B
    endgenerate
    
endmodule
/* verilator lint_on UNUSED */
/* verilator coverage_on */
