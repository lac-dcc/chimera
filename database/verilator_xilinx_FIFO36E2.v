// This program was cloned from: https://github.com/fredrequin/verilator_xilinx
// License: BSD 2-Clause "Simplified" License

`ifdef verilator3
`else
`timescale 1 ps / 1 ps
`endif
//
// FIFO36E2 primitive for Xilinx FPGAs
// Compatible with Verilator tool (www.veripool.org)
// Copyright (c) 2019-2022 Frédéric REQUIN
// License : BSD
//

/* verilator coverage_off */
module FIFO36E2
#(
    // "NONE", "FIRST", "LAST", "MIDDLE", "PARALLEL"
    parameter  [64:1] CASCADE_ORDER           = "NONE",
    // "INDEPENDENT", "COMMON"
    parameter         CLOCK_DOMAINS           = "INDEPENDENT",
    // "FALSE", "TRUE"
    parameter         EN_ECC_PIPE             = "FALSE",
    // "FALSE", "TRUE"
    parameter         EN_ECC_READ             = "FALSE",
    // "FALSE", "TRUE"
    parameter         EN_ECC_WRITE            = "FALSE",
    // "FALSE", "TRUE"
    parameter         FIRST_WORD_FALL_THROUGH = "FALSE",
    // Data registers init value (power-up or GSR)
    parameter  [71:0] INIT                    = 72'h0,
    // Signals polarities
    parameter   [0:0] IS_RSTREG_INVERTED      = 1'b0,
    parameter   [0:0] IS_RST_INVERTED         = 1'b0,
    parameter   [0:0] IS_RDCLK_INVERTED       = 1'b0,
    parameter   [0:0] IS_RDEN_INVERTED        = 1'b0,
    parameter   [0:0] IS_WRCLK_INVERTED       = 1'b0,
    parameter   [0:0] IS_WREN_INVERTED        = 1'b0,
    // Empty threshold
    parameter integer PROG_EMPTY_THRESH       = 256,
    // Full threshold
    parameter integer PROG_FULL_THRESH        = 256,
    // "RAW_PNTR", "EXTENDED_DATACOUNT", "SIMPLE_DATACOUNT", "SYNC_PNTR"
    parameter         RDCOUNT_TYPE            = "RAW_PNTR",
    // 4, 9, 18, 36, 72
    parameter integer READ_WIDTH              = 4,
    // "UNREGISTERED", "DO_PIPELINED", "REGISTERED"
    parameter         REGISTER_MODE           = "UNREGISTERED",
    // "RSTREG", "REGCE"
    parameter         RSTREG_PRIORITY         = "RSTREG",
    // "FALSE", "TRUE" (not used)
    parameter         SLEEP_ASYNC             = "FALSE",
    // Data registers reset value
    parameter  [71:0] SRVAL                   = 72'h0,
    // "RAW_PNTR", "EXTENDED_DATACOUNT", "SIMPLE_DATACOUNT", "SYNC_PNTR"
    parameter         WRCOUNT_TYPE            = "RAW_PNTR",
    // 4, 9, 18, 36, 72
    parameter integer WRITE_WIDTH             = 4
)
(
    // Cascade signals
    input  [63:0] CASDIN,        // Cascade data input
    input   [7:0] CASDINP,       // Cascade parity input
    input         CASDOMUX,      //
    input         CASDOMUXEN,    // NOT USED ?
    output [63:0] CASDOUT,       // Cascade data output
    output  [7:0] CASDOUTP,      // Cascade parity output
    output        CASNXTEMPTY,   // Cascade next empty
    input         CASNXTRDEN,    // Cascade next read enable
    input         CASOREGIMUX,   //
    input         CASOREGIMUXEN, // NOT USED ?
    input         CASPRVEMPTY,   // Cascade previous empty
    output        CASPRVRDEN,    // Cascade previous read enable
    // ECC signals
    input         INJECTDBITERR, // Inject double bit errors
    input         INJECTSBITERR, // Inject single bit error
    output  [7:0] ECCPARITY,
    output        DBITERR,
    output        SBITERR,
    // Reset and power-down
    input         RST,
    input         RSTREG,
    input         SLEEP,
    // Read control signals
    input         RDCLK,
    input         RDEN,
    input         REGCE,
    // Read data
    output [63:0] DOUT,
    output  [7:0] DOUTP,
    // Status
    output        EMPTY,
    output        FULL,
    output        PROGEMPTY,
    output        PROGFULL,
    output [13:0] RDCOUNT,
    output        RDERR,
    output        RDRSTBUSY,
    output [13:0] WRCOUNT,
    output        WRERR,
    output        WRRSTBUSY,
    // Write control signals
    input         WRCLK,
    input         WREN,
    // Write data
    input  [63:0] DIN,
    input   [7:0] DINP
);
    // ========================================================================
    // Local parameters
    // ========================================================================

    /* verilator lint_off WIDTH */
    localparam [0:0] _CLOCK_DOMAINS   = (CLOCK_DOMAINS == "COMMON" ) ? 1'b1 : 1'b0;
    localparam [0:0] _EN_ECC_PIPE     = (EN_ECC_PIPE   == "TRUE"   ) ? 1'b1 : 1'b0;
    localparam [0:0] _EN_ECC_READ     = (EN_ECC_READ   == "TRUE"   ) ? 1'b1 : 1'b0;
    localparam [0:0] _EN_ECC_WRITE    = (EN_ECC_WRITE  == "TRUE"   ) ? 1'b1 : 1'b0;
    localparam [0:0] _RSTREG_PRIORITY = (RSTREG_PRIORITY == "REGCE") ? 1'b1 : 1'b0;
    localparam [0:0] _FWFT_MODE       = (FIRST_WORD_FALL_THROUGH == "TRUE") ? 1'b1 : 1'b0;


    localparam [4:0] _CASCADE_ORDER   = (CASCADE_ORDER == "PARALLEL") ? 5'b10001
                                      : (CASCADE_ORDER == "FIRST"   ) ? 5'b00010
                                      : (CASCADE_ORDER == "MIDDLE"  ) ? 5'b00100
                                      : (CASCADE_ORDER == "LAST"    ) ? 5'b01000
                                      : 5'b00000;

    localparam [1:0] _REGISTER_MODE   = (REGISTER_MODE == "UNREGISTERED") ? 2'b00
                                      : (REGISTER_MODE == "DO_PIPELINED") ? 2'b01
                                      : (REGISTER_MODE == "REGISTERED"  ) ? 2'b10
                                      : 2'b00;

    localparam [2:0] _RDCOUNT_TYPE    = (RDCOUNT_TYPE == "SYNC_PNTR"         ) ? 3'b001
                                      : (RDCOUNT_TYPE == "SIMPLE_DATACOUNT"  ) ? 3'b010
                                      : (RDCOUNT_TYPE == "EXTENDED_DATACOUNT") ? 3'b100
                                      : 3'b000;

    localparam [2:0] _WRCOUNT_TYPE    = (WRCOUNT_TYPE == "SYNC_PNTR"         ) ? 3'b001
                                      : (WRCOUNT_TYPE == "SIMPLE_DATACOUNT"  ) ? 3'b010
                                      : (WRCOUNT_TYPE == "EXTENDED_DATACOUNT") ? 3'b100
                                      : 3'b000;
    /* verilator lint_on WIDTH */

    // FIFO read address increment
    localparam        _RD_ADDR_INC    = (READ_WIDTH ==  4) ? 2
                                      : (READ_WIDTH ==  9) ? 4
                                      : (READ_WIDTH == 18) ? 8
                                      : (READ_WIDTH == 36) ? 16
                                      : (READ_WIDTH == 72) ? 32
                                      : 2;
    // FIFO write address increment
    localparam        _WR_ADDR_INC    = (WRITE_WIDTH ==  4) ? 2
                                      : (WRITE_WIDTH ==  9) ? 4
                                      : (WRITE_WIDTH == 18) ? 8
                                      : (WRITE_WIDTH == 36) ? 16
                                      : (WRITE_WIDTH == 72) ? 32
                                      : 2;
    // FIFO write address mask
    localparam [13:0] _WR_ADDR_MSK    = (WRITE_WIDTH ==  4) ? 14'b11111111111110
                                      : (WRITE_WIDTH ==  9) ? 14'b11111111111100
                                      : (WRITE_WIDTH == 18) ? 14'b11111111111000
                                      : (WRITE_WIDTH == 36) ? 14'b11111111110000
                                      : (WRITE_WIDTH == 72) ? 14'b11111111100000
                                      : 14'b11111111111110;
    // Init value, ECC part (power-up or GSR = 1)
    localparam  [7:0] _INITP          = (READ_WIDTH <= 9)  ? {8{INIT[    8]}}
                                      : (READ_WIDTH == 18) ? {4{INIT[17:16]}}
                                      : (READ_WIDTH == 36) ? {2{INIT[35:32]}}
                                      :                      {1{INIT[71:64]}};
    // Init value, Data part (power-up or GSR = 1)
    localparam [63:0] _INIT           = (READ_WIDTH <= 9)  ? {8{INIT[ 7: 0]}}
                                      : (READ_WIDTH == 18) ? {4{INIT[15: 0]}}
                                      : (READ_WIDTH == 36) ? {2{INIT[31: 0]}}
                                      :                      {1{INIT[63: 0]}};
    // Reset value, ECC part (RST = 1)
    localparam  [7:0] _SRVALP         = (READ_WIDTH <= 9)  ? {8{SRVAL[    8]}}
                                      : (READ_WIDTH == 18) ? {4{SRVAL[17:16]}}
                                      : (READ_WIDTH == 36) ? {2{SRVAL[35:32]}}
                                      :                      {1{SRVAL[71:64]}};
    // Reset value, Data part (RST = 1)
    localparam [63:0] _SRVAL          = (READ_WIDTH <= 9)  ? {8{SRVAL[ 7: 0]}}
                                      : (READ_WIDTH == 18) ? {4{SRVAL[15: 0]}}
                                      : (READ_WIDTH == 36) ? {2{SRVAL[31: 0]}}
                                      :                      {1{SRVAL[63: 0]}};

    localparam        pipe_dly        = { 31'b0, _EN_ECC_PIPE }
                                      + { 31'b0, _REGISTER_MODE[1] }
                                      + { 31'b0, _FWFT_MODE };
    
    localparam wr_adj      = (_RD_ADDR_INC >= _WR_ADDR_INC) ? _RD_ADDR_INC / _WR_ADDR_INC
                           : 1;

    localparam rdcount_adj = (_RDCOUNT_TYPE[2]) ? pipe_dly
                           : 0;

    localparam wrcount_adj = (((_WR_ADDR_INC >= _RD_ADDR_INC) && (pipe_dly == 0)) ||
                              ((_WR_ADDR_INC >= pipe_dly * _RD_ADDR_INC) && (pipe_dly > 0))) ? 1
                           : ((pipe_dly > 1) || (_FWFT_MODE)) ? pipe_dly * wr_adj
                           : 0;
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
    // Global Set / Reset (GSR)
    // ========================================================================

    `ifdef TOP_LEVEL
    wire        _w_GSR = `TOP_LEVEL.GSR;
    `else
    wire        _w_GSR = 1'b0;
    `endif /* TOP_LEVEL */

    // ========================================================================
    // Read and Write clocks
    // ========================================================================

    wire        _w_RDCLK /* verilator clocker */;
    wire        _w_WRCLK /* verilator clocker */;

    assign _w_RDCLK = (IS_RDCLK_INVERTED[0]) ? ~RDCLK : RDCLK;
    assign _w_WRCLK = (IS_WRCLK_INVERTED[0]) ? ~WRCLK : WRCLK;

    // ========================================================================
    // Read and Write resets
    // ========================================================================

    wire        _w_RST    = RST ^ IS_RST_INVERTED[0];
    wire        _w_RSTREG = (!_REGISTER_MODE[0]) ? _w_RDRST
                          : (!_RSTREG_PRIORITY) ? RSTREG ^ IS_RSTREG_INVERTED[0]
                          : (RSTREG ^ IS_RSTREG_INVERTED[0]) & REGCE;

    reg         _r_WRRST;
    reg   [1:0] _r_WRRST_busy;
    reg   [2:0] _r_WRRST_done;

    wire        _w_RDRST;
    reg   [1:0] _r_RDRST_cdc;
    reg   [2:0] _r_RDRST_busy;
    reg   [2:0] _r_RDRST_done;

    always @ (posedge _w_WRCLK) begin : P_WR_RESET

        if (_w_RST & ~WRRSTBUSY) begin
            _r_WRRST <= 1'b1;
        end
        else begin
            // (CLOCK_DOMAINS == "COMMON")
            if (_CLOCK_DOMAINS) begin
                if (_r_WRRST) _r_WRRST <= 1'b0;
            end
            // (CLOCK_DOMAINS == "INDEPENDENT")
            else begin
                if (_r_WRRST_done[2]) _r_WRRST <= 1'b0;
            end
        end
    end

generate
    // (CLOCK_DOMAINS == "COMMON")
    if (_CLOCK_DOMAINS) begin
        // CDC mechanisms disabled
        initial begin
            _r_RDRST_cdc  = 2'b00;
            _r_RDRST_busy = 3'b000;
            _r_RDRST_done = 3'b000;
            _r_WRRST_busy = 2'b00;
            _r_WRRST_done = 3'b000;
        end

        assign _w_RDRST  = _r_WRRST;
        assign RDRSTBUSY = _r_WRRST;
        assign WRRSTBUSY = _r_WRRST;

    end
    // (CLOCK_DOMAINS == "INDEPENDENT")
    else begin
        // RDRST_cdc : WRCLK to RDCLK domain crossing
        always @ (posedge _w_RDCLK) begin : P_RD_RESET_CDC

            if (_w_GSR) begin
                _r_RDRST_cdc <= 2'b00;
            end
            else begin
                _r_RDRST_cdc <= { _r_RDRST_cdc[0], _r_WRRST };
            end
        end
        // RDRST_done : (2 + 3) x RDCLK cycles after WRRST
        always @ (posedge _w_RDCLK) begin : P_RD_RESET_DONE

            if (_w_GSR | ~_r_RDRST_cdc[1]) begin
                _r_RDRST_done <= 3'b000;
            end
            else begin
                _r_RDRST_done <= { _r_RDRST_done[1:0], _r_RDRST_cdc[1] };
            end
        end
        // RDRST_busy : 5 x RDCLK cycles after WRRST
        always @ (posedge _w_RDCLK) begin : P_RD_RESET_BUSY

            if (_w_GSR) begin
                _r_RDRST_busy <= 3'b000;
            end
            else begin
                _r_RDRST_busy <= { _r_RDRST_busy[1:0], _r_RDRST_cdc[1] };
            end
        end
        // WRRST_done : 3 x WRCLK cycles after RDRST_done
        always @ (posedge _w_WRCLK) begin : P_WR_RESET_DONE

            if (_w_GSR | _r_WRRST_done[2]) begin
                _r_WRRST_done <= 3'b000;
            end
            else if (_r_WRRST) begin
                _r_WRRST_done <= { _r_WRRST_done[1:0], _r_RDRST_done[2] };
            end
        end
        // WRRST_busy : 5 x RDCLK + 2 x WRCLK cycles after WRRST
        always @ (posedge _w_WRCLK) begin : P_WR_RESET_BUSY

            if (_w_GSR) begin
                _r_WRRST_busy <= 2'b00;
            end
            else begin
                _r_WRRST_busy <= { _r_WRRST_busy[0], _r_RDRST_busy[2] };
            end
        end

        assign _w_RDRST  = _r_RDRST_cdc[1];
        assign RDRSTBUSY = _r_RDRST_cdc[1];
        assign WRRSTBUSY = _r_WRRST | _r_WRRST_busy[1];

    end
endgenerate

    // ========================================================================
    // Sleep mode
    // ========================================================================

    // Clock domain crossing
    reg   [1:0] _r_SLEEP_RD; // to read clock
    wire        _w_SLEEP_RD;

    reg   [1:0] _r_SLEEP_WR; // to write clock
    wire        _w_SLEEP_WR;

    always @ (posedge _w_GSR or posedge _w_RDCLK) begin : P_SLEEP_RD_CLK

        if (_w_GSR) begin
            _r_SLEEP_RD <= 2'b0;
        end
        else begin
            _r_SLEEP_RD <= { _r_SLEEP_RD[0], SLEEP };
        end
    end

    assign _w_SLEEP_RD = |{ _r_SLEEP_RD, SLEEP };

    always @ (posedge _w_GSR or posedge _w_WRCLK) begin : P_SLEEP_WR_CLK

        if (_w_GSR) begin
            _r_SLEEP_WR <= 2'b0;
        end
        else begin
            _r_SLEEP_WR <= { _r_SLEEP_WR[0], SLEEP };
        end
    end

    assign _w_SLEEP_WR = |{ _r_SLEEP_WR, SLEEP };

    // ========================================================================
    // FIFO cascading
    // ========================================================================

    wire        _w_RDEN = (|_CASCADE_ORDER[2:1])              // FIRST or MIDDLE
                        ? CASNXTRDEN & ~_w_SLEEP_RD           // Cascading mode
                        : RDEN ^ IS_RDEN_INVERTED[0];         // Regular mode

    wire        _w_WREN = (|_CASCADE_ORDER[3:2])              // MIDDLE or LAST
                        ? ~(CASPRVEMPTY | FULL | _w_SLEEP_WR) // Cascading mode
                        : WREN ^ IS_WREN_INVERTED[0];         // Regular mode

    wire  [7:0] _w_DINP = (|_CASCADE_ORDER[3:2])              // MIDDLE or LAST
                        ? CASDINP                             // Cascading mode
                        : DINP;                               // Regular mode

    wire [63:0] _w_DIN  = (|_CASCADE_ORDER[3:2])              // MIDDLE or LAST
                        ? CASDIN                              // Cascading mode
                        : DIN;                                // Regular mode

    assign CASDOUT      = (|_CASCADE_ORDER[2:0])              // PARALLEL, FIRST or MIDDLE
                        ? DOUT                                // Cascading mode
                        : 64'b0;                              // Regular mode

    assign CASDOUTP     = (|_CASCADE_ORDER[2:0])              // PARALLEL, FIRST or MIDDLE
                        ? DOUTP                               // Cascading mode
                        : 8'b0;                               // Regular mode

    assign CASNXTEMPTY  = (|_CASCADE_ORDER[2:1])              // FIRST or MIDDLE
                        ? EMPTY | _w_SLEEP_RD                 // Cascading mode
                        : 1'b0;                               // Regular mode

    assign CASPRVRDEN   = (|_CASCADE_ORDER[3:2])              // MIDDLE or LAST
                        ? ~(CASPRVEMPTY | FULL | _w_SLEEP_WR) // Cascading mode
                        : 1'b0;                               // Regular mode

    reg         _r_CASDOMUX;
    reg         _r_CASOREGIMUX;

    initial begin
        _r_CASDOMUX    = 1'b0;
        _r_CASOREGIMUX = 1'b0;
    end

    always @ (posedge _w_RDCLK) begin

        if (_w_GSR) begin
            _r_CASDOMUX    <= 1'b0;
            _r_CASOREGIMUX <= 1'b0;
        end
        else begin
            // LAST, PARALLEL or MIDDLE
            _r_CASDOMUX    <= (|_CASCADE_ORDER[4:2]) ? CASDOMUX    : 1'b0;
            _r_CASOREGIMUX <= (|_CASCADE_ORDER[4:2]) ? CASOREGIMUX : 1'b0;
        end
    end

    // ========================================================================
    // Memory block (512 x 64-bit + 512 x 8-bit)
    // ========================================================================

    /* verilator lint_off MULTIDRIVEN */
    reg   [7:0] _mem_blk_p [0:511]; // Parity bits
    reg  [63:0] _mem_blk   [0:511]; // Data bits
    /* verilator lint_on MULTIDRIVEN */

    initial begin : MEM_BLK_INIT
        int i;

        for (i = 0; i < 512; i = i + 1) begin
            _mem_blk_p[i] = 8'h00;
            _mem_blk[i]   = 64'h0000000000000000;
        end
    end

    // ========================================================================
    // FIFO write side
    // ========================================================================

    // FIFO write enable
    wire        _w_wr_ena = _w_WREN & ~FULL & ~WRRSTBUSY;
    // ECC bits
    reg   [7:0] _r_ecc_reg_p1;
    // FIFO write address
    reg  [13:0] _r_wr_addr_p0;
    reg  [13:0] _r_wr_addr_p1;
    // FIFO next write address
    wire [13:0] _w_wr_addr_nxt_p0;
    // Clock domain crossing
    reg  [13:0] _r_rd_addr_cc1;
    reg  [13:0] _r_rd_addr_cc2;
    reg  [13:0] _r_rd_addr_cc3;
    wire [13:0] _w_rd_addr_cc;

    initial begin
        _r_ecc_reg_p1 = 8'h00;
    end

    always @ (posedge _w_WRCLK or posedge _w_GSR) begin : P_FIFO_WRITE
        reg [63:0] _v_data; // Data
        reg  [7:0] _v_ecc;  // ECC data
        reg  [8:0] _v_word; // Word select (0 - 511)
        reg  [5:0] _v_bit;  // Bit select (0 - 63)

        if (_w_GSR) begin
            _r_ecc_reg_p1  <= 8'h00;
            _r_wr_addr_p0  <= 14'd0;
            _r_wr_addr_p1  <= 14'd0;
            _r_rd_addr_cc1 <= 14'd0;
            _r_rd_addr_cc2 <= 14'd0;
            _r_rd_addr_cc3 <= 14'd0;
        end
        else if (WRRSTBUSY) begin
            _r_wr_addr_p0  <= 14'd0;
            _r_wr_addr_p1  <= 14'd0;
            _r_rd_addr_cc1 <= 14'd0;
            _r_rd_addr_cc2 <= 14'd0;
            _r_rd_addr_cc3 <= 14'd0;
        end
        else begin
            if (_w_wr_ena) begin
                if (_w_SLEEP_WR) begin
                    $display("Error: WRITE on port B attempted while in SLEEP mode");
                    _r_ecc_reg_p1 <= 8'h00;
                end
                else begin
                    // ECC management
                    if (_EN_ECC_WRITE) begin
                        // Errors injections
                        if (INJECTDBITERR) begin
                            _v_data = _w_DIN ^ 64'h4000000040000000;
                        end
                        else if (INJECTSBITERR) begin
                            _v_data = _w_DIN ^ 64'h0000000040000000;
                        end
                        else begin
                            _v_data = _w_DIN;
                        end
                        _v_ecc         = fn_ecc(1'b1, _w_DIN, _w_DINP);
                        _r_ecc_reg_p1 <= _v_ecc;
                    end
                    else begin
                        _v_data        = _w_DIN;
                        _v_ecc         = _w_DINP;
                        _r_ecc_reg_p1 <= 8'h00;
                    end
                    // Write to memory
                    _v_word = _r_wr_addr_p0[13:5];
                    _v_bit  = { _r_wr_addr_p0[4:0], 1'b0 };
                    if (WRITE_WIDTH == 4) begin
                        // 4-bit write port
                        _mem_blk  [_v_word][_v_bit+:4]      <= _v_data[3:0];
                    end
                    else if (WRITE_WIDTH == 9) begin
                        // 9-bit write port
                        _mem_blk_p[_v_word][_v_bit[5:3]]    <= _v_ecc[0];
                        _mem_blk  [_v_word][_v_bit+:8]      <= _v_data[7:0];
                    end
                    else if (WRITE_WIDTH == 18) begin
                        // 18-bit write port
                        _mem_blk_p[_v_word][_v_bit[5:3]+:2] <= _v_ecc[1:0];
                        _mem_blk  [_v_word][_v_bit+:16]     <= _v_data[15:0];
                    end
                    else if (WRITE_WIDTH == 36) begin
                        // 36-bit write port
                        _mem_blk_p[_v_word][_v_bit[5:3]+:4] <= _v_ecc[3:0];
                        _mem_blk  [_v_word][_v_bit+:32]     <= _v_data[31:0];
                    end
                    else if (WRITE_WIDTH == 72) begin
                        // 72-bit write port
                        _mem_blk_p[_v_word]                 <= _v_ecc;
                        _mem_blk  [_v_word]                 <= _v_data;
                    end
                    wr_b_event <= ~wr_b_event;
                end
            end
            // Address managament
            _r_wr_addr_p0 <= _w_wr_addr_nxt_p0;
            // Clock domain crossing
            if (!_CLOCK_DOMAINS) begin
                // WRCLK => RDCLK
                _r_wr_addr_p1  <= _r_wr_addr_p0;
                // RDCLK => WRCLK
                _r_rd_addr_cc1 <= _r_rd_addr_p1;
                _r_rd_addr_cc2 <= _r_rd_addr_cc1;
                _r_rd_addr_cc3 <= _r_rd_addr_cc2;
            end
        end
    end

    assign _w_wr_addr_nxt_p0 = (_w_wr_ena) ? _r_wr_addr_p0 + _WR_ADDR_INC[13:0] : _r_wr_addr_p0;

    assign _w_rd_addr_cc     = (_CLOCK_DOMAINS) ? _r_rd_addr_p0 : _r_rd_addr_cc3;

    assign ECCPARITY         = _r_ecc_reg_p1;

    // ========================================================================
    // Write count
    // ========================================================================

    reg  [13:0] _r_wr_count;
    
    always @ (posedge _w_WRCLK or posedge _w_GSR) begin
        reg [13:0] v_wr_count;

        if (_w_GSR || WRRSTBUSY) begin
            _r_wr_count <= 14'd0;
        end
        else begin
            v_wr_count = (_r_wr_addr_p0 - _w_rd_addr_cc) / _WR_ADDR_INC;
            if (_WRCOUNT_TYPE[2])
                _r_wr_count <= v_wr_count + wrcount_adj[13:0];
            else
                _r_wr_count <= v_wr_count;
        end
    end

    assign WRCOUNT = (_WRCOUNT_TYPE[0]) ? _w_wr_addr_cc / _WR_ADDR_INC
                   : (|_WRCOUNT_TYPE[2:1]) ? _r_wr_count
                   : _r_wr_addr_p0 / _WR_ADDR_INC;

    // ========================================================================
    // FIFO read side
    // ========================================================================
    
    // FIFO read enable
    wire        _w_rd_ena;
  assign _w_rd_ena = (_w_RDEN ||
                        ((fill_lat || fill_reg || fill_ecc) && ~_w_SLEEP_RD)) &&
                        ~ram_empty && ~_w_RDRST;
    // FIFO read address
    reg  [13:0] _r_rd_addr_p0;
    reg  [13:0] _r_rd_addr_p1;
    // FIFO next read address
    wire [13:0] _w_rd_addr_nxt_p0;
    // Clock domain crossing
    reg  [13:0] _r_wr_addr_cc1;
    reg  [13:0] _r_wr_addr_cc2;
    reg  [13:0] _r_wr_addr_cc3;
    wire [13:0] _w_wr_addr_cc;
    // FIFO read data
    reg   [7:0] _r_rd_ecc_p1;
    reg  [63:0] _r_rd_data_p1;
    // ECC related data
    reg         _r_sbiterr_p1;
    reg         _r_dbiterr_p1;

    initial begin
        _r_rd_ecc_p1  = _INITP;
        _r_rd_data_p1 = _INIT;
        _r_sbiterr_p1 = 1'b0;
        _r_dbiterr_p1 = 1'b0;
        first_read    = 1'b0;
        rdcount_en    = 1'b0;
    end

    always @ (posedge _w_RDCLK or posedge _w_GSR) begin : P_FIFO_READ_P1
        reg [63:0] _v_data; // Data
        reg  [7:0] _v_ecc;  // ECC data
        reg  [7:0] _v_synd; // ECC syndrome
        reg        _v_sbit; // Single bit error
        reg        _v_dbit; // Double bit error
        reg  [8:0] _v_word; // Word select (0 - 511)
        reg  [5:0] _v_bit;  // Bit select (0 - 63)

        if (_w_GSR) begin
            _r_rd_addr_p0  <= 14'd0;
            _r_rd_addr_p1  <= 14'd0;
            _r_wr_addr_cc1 <= 14'd0;
            _r_wr_addr_cc2 <= 14'd0;
            _r_wr_addr_cc3 <= 14'd0;
            _r_rd_ecc_p1   <= _INITP;
            _r_rd_data_p1  <= _INIT;
            first_read     <= 1'b0;
            rdcount_en     <= 1'b0;
        end
        else if (_w_RDRST) begin
            _r_rd_addr_p0  <= 14'd0;
            _r_rd_addr_p1  <= 14'd0;
            _r_wr_addr_cc1 <= 14'd0;
            _r_wr_addr_cc2 <= 14'd0;
            _r_wr_addr_cc3 <= 14'd0;
            _r_rd_ecc_p1   <= _SRVALP;
            _r_rd_data_p1  <= _SRVAL;
            _r_sbiterr_p1  <= 1'b0;
            _r_dbiterr_p1  <= 1'b0;
        end
        else begin
            if (_w_rd_ena) begin
                if (_w_SLEEP_RD) begin
                    $display("Error: READ on port A attempted while in SLEEP mode");
                    _r_rd_ecc_p1  <= 8'h00;
                    _r_rd_data_p1 <= 64'hDEADDEAD;
                end
                else begin
                    // Read from memory
                    _v_word = _r_rd_addr_p0[13:5];
                    _v_bit  = { _r_rd_addr_p0[4:0], 1'b0 };
                    // 4-bit read port
                    if (READ_WIDTH == 4) begin
                        _v_ecc  =   8'b0;
                        _v_data = { 60'b0, _mem_blk  [_v_word][_v_bit+:4] };
                    end
                    // 9-bit read port
                    else if (READ_WIDTH == 9) begin
                        _v_ecc  = { 7'b0,  _mem_blk_p[_v_word][_v_bit[5:3]] };
                        _v_data = { 56'b0, _mem_blk  [_v_word][_v_bit+:8] };
                    end
                    // 18-bit read port
                    else if (READ_WIDTH == 18) begin
                        _v_ecc  = { 6'b0,  _mem_blk_p[_v_word][_v_bit[5:3]+:2] };
                        _v_data = { 48'b0, _mem_blk  [_v_word][_v_bit+:16] };
                    end
                    // 36-bit read port
                    else if (READ_WIDTH == 36) begin
                        _v_ecc  = { 4'b0,  _mem_blk_p[_v_word][_v_bit[5:3]+:4] };
                        _v_data = { 32'b0, _mem_blk  [_v_word][_v_bit+:32] };
                    end
                    // 72-bit read port
                    else if (READ_WIDTH == 72) begin
                        _v_ecc  =          _mem_blk_p[_v_word];
                        _v_data =          _mem_blk  [_v_word];
                    end
                    // ECC correction / detection
                    if (_EN_ECC_READ) begin
                        // ECC syndrome computation
                        _v_synd = fn_ecc(1'b0, _v_data, _v_ecc);
                        _v_sbit = (|_v_synd) &  _v_synd[7];
                        _v_dbit = (|_v_synd) & ~_v_synd[7];
                        if (_v_sbit) begin
                            // Correctable error
                            { _r_rd_ecc_p1, _r_rd_data_p1 } <= fn_cor_bit(_v_synd[6:0], _v_data, _v_ecc);
                        end
                        else begin
                            // Uncorrectable error or no error at all
                            { _r_rd_ecc_p1, _r_rd_data_p1 } <= { _v_ecc, _v_data };
                        end
                        // ECC status
                        _r_sbiterr_p1 <= _v_sbit;
                        _r_dbiterr_p1 <= _v_dbit;
                    end
                    else begin
                        // ECC not activated
                        _r_rd_ecc_p1  <= _v_ecc;
                        _r_rd_data_p1 <= _v_data;
                        _r_sbiterr_p1 <= 1'b0;
                        _r_dbiterr_p1 <= 1'b0;
                    end
                    first_read <= 1'b1;
                    rdcount_en <= 1'b1;
                end
            end
            else if (_w_RDEN) begin
                rdcount_en <= 1'b1;
            end
            // Address managament
            _r_rd_addr_p0 <= _w_rd_addr_nxt_p0;
            // Clock domain crossing
            if (!_CLOCK_DOMAINS) begin
                // RDCLK => WRCLK
                _r_rd_addr_p1  <= _r_rd_addr_p0;
                // WRCLK => RDCLK
                _r_wr_addr_cc1 <= _r_wr_addr_p1;
                _r_wr_addr_cc2 <= _r_wr_addr_cc1;
                _r_wr_addr_cc3 <= _r_wr_addr_cc2;
            end
        end
    end

    assign _w_rd_addr_nxt_p0 = (_w_rd_ena) ? _r_rd_addr_p0 + _RD_ADDR_INC[13:0] : _r_rd_addr_p0;

    assign _w_wr_addr_cc     = (_CLOCK_DOMAINS) ? _r_wr_addr_p0 : _r_wr_addr_cc3;

    // ========================================================================
    // Data pipeline
    // ========================================================================


    // ---- 2nd stage ---------------------------------------------------------

    // FIFO read data
    reg   [7:0] _r_rd_ecc_p2;
    reg  [63:0] _r_rd_data_p2;
    // ECC related data
    reg         _r_sbiterr_p2;
    reg         _r_dbiterr_p2;

    initial begin
        _r_rd_ecc_p2  = _INITP;
        _r_rd_data_p2 = _INIT;
        _r_sbiterr_p2 = 1'b0;
        _r_dbiterr_p2 = 1'b0;
    end

    always @ (posedge _w_RDCLK or posedge _w_GSR) begin : P_DATA_PIPE_P2

        if (_w_GSR) begin
            _r_rd_ecc_p2  <= _INITP;
            _r_rd_data_p2 <= _INIT;
            _r_sbiterr_p2 <= 1'b0;
            _r_dbiterr_p2 <= 1'b0;
        end
        else if (_w_RDRST) begin
            _r_rd_ecc_p2  <= _SRVALP;
            _r_rd_data_p2 <= _SRVAL;
            _r_sbiterr_p2 <= 1'b0;
            _r_dbiterr_p2 <= 1'b0;
        end
        else if (WREN_ecc) begin
            _r_rd_ecc_p2  <= _r_rd_ecc_p1;
            _r_rd_data_p2 <= _r_rd_data_p1;
            _r_sbiterr_p2 <= _r_sbiterr_p1;
            _r_dbiterr_p2 <= _r_dbiterr_p1;
        end
    end

    // ---- 3rd stage ---------------------------------------------------------

    // FIFO read data
    reg   [7:0] _r_rd_ecc_p3;
    reg  [63:0] _r_rd_data_p3;
    // ECC related data
    reg         _r_sbiterr_p3;
    reg         _r_dbiterr_p3;

    initial begin
        _r_rd_ecc_p3  = _INITP;
        _r_rd_data_p3 = _INIT;
        _r_sbiterr_p3 = 1'b0;
        _r_dbiterr_p3 = 1'b0;
    end

    always @ (posedge _w_RDCLK or posedge _w_GSR) begin : P_DATA_PIPE_P3

        if (_w_GSR) begin
            _r_rd_ecc_p3  <= _INITP;
            _r_rd_data_p3 <= _INIT;
        end
        else if (_w_RSTREG) begin
            _r_rd_ecc_p3  <= _SRVALP;
            _r_rd_data_p3 <= _SRVAL;
        end
        else if (REGCE_A_int) begin
            // Cascading mode (MIDDLE, LAST, PARALLEL)
            if (_r_CASOREGIMUX) begin
                _r_rd_ecc_p3  <= CASDINP;
                _r_rd_data_p3 <= CASDIN;
            end
            // Regular mode
            else begin
                _r_rd_ecc_p3  <= (_EN_ECC_PIPE) ? _r_rd_ecc_p2  : _r_rd_ecc_p1;
                _r_rd_data_p3 <= (_EN_ECC_PIPE) ? _r_rd_data_p2 : _r_rd_data_p1;
            end
        end
    end

    assign DOUTP = (_r_CASDOMUX) ? CASDINP
                 : (|_REGISTER_MODE) ? _r_rd_ecc_p3
                 : (_EN_ECC_PIPE) ? _r_rd_ecc_p2
                 : _r_rd_ecc_p1;

    assign DOUT  = (_r_CASDOMUX) ? CASDIN
                 : (|_REGISTER_MODE) ? _r_rd_data_p3
                 : (_EN_ECC_PIPE) ? _r_rd_data_p2
                 : _r_rd_data_p1;

    always @ (posedge _w_RDCLK or posedge _w_GSR) begin : P_ECC_PIPE_P3

        if (_w_GSR) begin
            _r_sbiterr_p3 <= 1'b0;
            _r_dbiterr_p3 <= 1'b0;
        end
        else if (_w_RDRST) begin
            _r_sbiterr_p3 <= 1'b0;
            _r_dbiterr_p3 <= 1'b0;
        end
        else if (REGCE_A_int) begin
            _r_sbiterr_p3 <= (_EN_ECC_PIPE) ? _r_sbiterr_p2 : _r_sbiterr_p1;
            _r_dbiterr_p3 <= (_EN_ECC_PIPE) ? _r_dbiterr_p2 : _r_dbiterr_p1;
        end
    end

    assign SBITERR = (|_REGISTER_MODE) ? _r_sbiterr_p3
                   : (_EN_ECC_PIPE) ? _r_sbiterr_p2
                   : _r_sbiterr_p1;

    assign DBITERR = (|_REGISTER_MODE) ? _r_dbiterr_p3
                   : (_EN_ECC_PIPE) ? _r_dbiterr_p2
                   : _r_dbiterr_p1;

    // ========================================================================
    // Read count
    // ========================================================================

    reg  [13:0] _r_rd_count;
    
    initial begin
        _r_rd_count = 14'd0;
    end

generate
    if ((_WR_ADDR_INC == _RD_ADDR_INC) && (_CLOCK_DOMAINS) && (_RDCOUNT_TYPE[2])) begin : EXT_RD_COUNT
        always @ (posedge _w_RDCLK or posedge _w_GSR) begin

            if (_w_GSR) begin
                _r_rd_count <= 14'd0;
            end
            else if (_w_RDRST) begin
                _r_rd_count <= 14'd0;
            end
            else begin
                case ({ EMPTY, _w_RDEN, _w_wr_ena })
                    3'b000 : _r_rd_count <= _r_rd_count;
                    3'b001 : _r_rd_count <= _r_rd_count + 14'd1;
                    3'b010 : _r_rd_count <= _r_rd_count - 14'd1;
                    3'b011 : _r_rd_count <= _r_rd_count;
                    3'b100 : _r_rd_count <= _r_rd_count;
                    3'b101 : _r_rd_count <= _r_rd_count + 14'd1;
                    3'b110 : _r_rd_count <= _r_rd_count;
                    3'b111 : _r_rd_count <= _r_rd_count;
                endcase
            end
        end
    end
    else begin
        always @ (posedge _w_RDCLK or posedge _w_GSR) begin
            reg [13:0] v_rd_count;

            if (_w_GSR) begin
                _r_rd_count <= 14'd0;
            end
            else if (_w_RDRST) begin
                _r_rd_count <= 14'd0;
            end
            else if (rdcount_en) begin
                v_rd_count = _w_wr_addr_cc - _r_rd_addr_p0;
                if (v_rd_count == 14'b0) v_rd_count[13] = FULL;
                v_rd_count = v_rd_count / _RD_ADDR_INC;
                _r_rd_count <= v_rd_count + rdcount_adj[13:0];
            end
        end
    end
endgenerate

assign RDCOUNT = (_RDCOUNT_TYPE[0]) ? _w_rd_addr_cc / _RD_ADDR_INC
               : (|_RDCOUNT_TYPE[2:1]) ? _r_rd_count
               : _r_rd_addr_p0 / _RD_ADDR_INC;


// internal variables, signals, busses
  wire RDEN_lat;
  wire WREN_lat;
  wire RDEN_reg;
  reg  fill_lat=0;
  reg  fill_reg=0;
  wire WREN_ecc;
  wire RDEN_ecc;
  reg  fill_ecc=0;
  wire REGCE_A_int;
  wire prog_empty;
  reg prog_empty_cc = 1;
  reg  ram_full_c = 0;
  wire ram_empty;
  reg  ram_empty_i = 1;
  reg  ram_empty_c = 1;
  reg  o_lat_empty = 1;
  reg  o_reg_empty = 1;
  reg  o_ecc_empty = 1;
  wire o_stages_empty;
  wire prog_full;
  reg  prog_full_reg = 1'b0;
  reg  r_RDERR;
  reg  r_WRERR;

  reg first_read = 1'b0;
  reg rdcount_en = 1'b0;

    reg         wr_b_event = 1'b0;




// full/empty variables
  wire [13:0] full_count;
  wire [13:0] next_full_count;
  wire [13:0] full_count_masked;
  wire [14:0] m_full;
  wire [14:0] m_full_raw;
  wire [14:0] prog_full_val;
  wire [13:0] prog_empty_val;

  reg ram_full_i;
  wire ram_one_from_full_i;
  wire ram_two_from_full_i;
  wire ram_one_from_full;
  wire ram_two_from_full;
  wire ram_one_read_from_not_full;

  wire [13:0] empty_count;
  wire [13:0] next_empty_count;
  wire ram_one_read_from_empty_i;
  wire ram_one_read_from_empty;
  wire ram_one_write_from_not_empty;
  wire ram_one_write_from_not_empty_i;
  
   assign REGCE_A_int = (_REGISTER_MODE[0]) ? RDEN_reg : REGCE;
   assign RDEN_lat = _w_RDEN || ((fill_reg || fill_ecc || fill_lat) && ~_w_SLEEP_RD);
   assign WREN_lat = _w_rd_ena;
   assign RDEN_ecc = (_w_RDEN || fill_reg) && (_EN_ECC_PIPE);
   assign WREN_ecc = (_w_RDEN || fill_reg || fill_ecc) && ~o_lat_empty &&
                       (_EN_ECC_PIPE) && first_read;
   assign RDEN_reg = _w_RDEN || fill_reg ;

    assign o_stages_empty =
         (pipe_dly == 0) ? ram_empty :
         (pipe_dly == 1) ? o_lat_empty :
         (pipe_dly == 3) ? o_reg_empty : //3 FWFT + ECC + REG
        ((pipe_dly == 2) && (!_EN_ECC_PIPE)) ?
          o_reg_empty : // 2 FWFT + REG
          o_ecc_empty ; // 2 FWFT + ECC // 2 REG + ECC


// with any output stage or FWFT fill the ouptut latch
// when ram not empty and o_latch empty
   always @ (posedge _w_RDCLK or posedge _w_GSR) begin
      if (_w_GSR || _w_RDRST) begin
         o_lat_empty <= 1'b1;
         end
      else if (RDEN_lat) begin
         o_lat_empty <= ram_empty;
      end
      else if (WREN_lat == 1) begin
         o_lat_empty <= 1'b0;
         end
      end

   always @ (negedge _w_RDCLK or posedge _w_GSR) begin
      if (_w_GSR || _w_RDRST || _w_SLEEP_RD) begin
         fill_lat  <= 0;
         end
      else if (o_lat_empty) begin
         if (pipe_dly>0) begin
            fill_lat  <= ~ram_empty;
         end
      end
      else begin
         fill_lat  <= 0;
         end
      end

// FWFT and
// REGISTERED not ECC_PIPE fill the ouptut register when o_latch not empty.
// REGISTERED and ECC_PIPE fill the ouptut register when o_ecc not empty.
// Empty on external read and prev stage also empty
    always @ (posedge _w_RDCLK or posedge _w_GSR) begin
    
        if (_w_GSR) begin
            o_reg_empty <= 1'b1;
        end
        else if (_w_RDRST) begin
            o_reg_empty <= 1'b1;
        end
        else if (RDEN_reg) begin
            o_reg_empty <= (_EN_ECC_PIPE) ? o_ecc_empty : o_lat_empty;
        end
    end

   always @ (negedge _w_RDCLK or posedge _w_GSR) begin
      if (_w_GSR || _w_RDRST || _w_SLEEP_RD) begin
          fill_reg <= 0;
          end
      else if ((o_lat_empty == 0) && (o_reg_empty == 1) &&
               (!_EN_ECC_PIPE) &&
               (pipe_dly==2)) begin
          fill_reg <= 1;
          end
      else if ((o_ecc_empty == 0) && (o_reg_empty == 1) &&
               (pipe_dly==3)) begin
          fill_reg <= first_read;
          end
      else begin
          fill_reg <= 0;
          end
      end

   always @ (posedge _w_RDCLK or posedge _w_GSR) begin
      if (_w_GSR || _w_RDRST) begin
          o_ecc_empty <= 1;
         end
      else if (RDEN_ecc || WREN_ecc) begin
          o_ecc_empty <= o_lat_empty;
         end
      end

   always @ (negedge _w_RDCLK or posedge _w_GSR) begin
      if (_w_GSR || _w_RDRST || _w_SLEEP_RD) begin
          fill_ecc <= 0;
      end
      else if ((o_lat_empty == 0) && (o_ecc_empty == 1) && first_read &&
               (_EN_ECC_PIPE & (_REGISTER_MODE[1] | _FWFT_MODE))) begin
          fill_ecc <= 1;
      end
      else begin
          fill_ecc <= 0;
      end
   end

    always @ (posedge _w_RDCLK or posedge _w_GSR) begin : READ_ERROR

        if (_w_GSR)
            r_RDERR <= 1'b0;
        else
            r_RDERR <= _w_RDEN & (EMPTY | _w_RDRST);
    end

    assign RDERR = r_RDERR;

    always @ (posedge _w_WRCLK or posedge _w_GSR) begin : WRITE_ERROR

        if (_w_GSR)
            r_WRERR <= 1'b0;
        else
            r_WRERR <= _w_WREN & (FULL | WRRSTBUSY);
    end

    assign WRERR = r_WRERR;

// full flag
   assign prog_full = ((full_count_masked <= prog_full_val[13:0]) && ((full_count > 14'd0) || FULL));
   assign prog_full_val = 15'd16384 - (PROG_FULL_THRESH[14:0] * _WR_ADDR_INC) + m_full;
   assign m_full = (pipe_dly == 0) ? 15'd0 : (((m_full_raw - 15'd1) / _WR_ADDR_INC) + 15'd1) * _WR_ADDR_INC;
   assign m_full_raw = pipe_dly[14:0] * _RD_ADDR_INC;
   assign prog_empty_val = (PROG_EMPTY_THRESH[13:0] - pipe_dly[13:0] + 14'd1) * _RD_ADDR_INC;

   assign full_count_masked = full_count & _WR_ADDR_MSK;
   assign full_count        = _w_rd_addr_cc - _r_wr_addr_p0;
   assign next_full_count   = _w_rd_addr_nxt_p0 - _w_wr_addr_nxt_p0;

   assign FULL = (_CLOCK_DOMAINS) ? ram_full_c : ram_full_i;
// ram_full independent clocks is one_from_full common clocks
   assign ram_one_from_full_i = ((full_count < 2*_WR_ADDR_INC) && (full_count > 14'd0));
   assign ram_two_from_full_i = ((full_count < 3*_WR_ADDR_INC) && (full_count > 14'd0));
   assign ram_one_from_full = (next_full_count < _WR_ADDR_INC) && ~ram_full_c;
   assign ram_two_from_full = (next_full_count < 2*_WR_ADDR_INC) && ~ram_full_c;
// when full common clocks, next read makes it not full
//   assign ram_one_read_from_not_full = ((full_count + _RD_ADDR_INC >= _WR_ADDR_INC) && ram_full_c);
   assign ram_one_read_from_not_full = (next_full_count >= _WR_ADDR_INC) && ram_full_c;

   always @ (posedge _w_WRCLK or posedge _w_GSR) begin
      if (_w_GSR || WRRSTBUSY) begin
         ram_full_c <= 1'b0;
         end
      else if (_w_wr_ena &&
               (_w_rd_ena && (_RD_ADDR_INC < _WR_ADDR_INC)) &&
               ram_one_from_full) begin
         ram_full_c <= 1'b1;
         end
      else if (_w_wr_ena && ~_w_rd_ena && ram_one_from_full) begin
         ram_full_c <= 1'b1;
         end
      else if (_w_rd_ena && ram_one_read_from_not_full) begin
         ram_full_c <= 1'b0;
         end
      else begin
         ram_full_c <= ram_full_c;
         end
      end

   always @ (posedge _w_WRCLK or posedge _w_GSR) begin
      if (_w_GSR || WRRSTBUSY) begin
         ram_full_i <= 1'b0;
         end
      else if (_w_wr_ena && ram_two_from_full_i && ~ram_full_i) begin
         ram_full_i <= 1'b1;
         end
      else if (~ram_one_from_full_i) begin
         ram_full_i <= 1'b0;
         end
      else begin
         ram_full_i <= ram_full_i;
         end
      end

   assign PROGFULL = prog_full_reg;
   always @ (posedge _w_WRCLK or posedge _w_GSR) begin
      if (_w_GSR || WRRSTBUSY) begin
         prog_full_reg <= 1'b0;
         end
      else begin
         prog_full_reg <= prog_full;
         end
      end

// empty flag
   assign empty_count      = _w_wr_addr_cc - _r_rd_addr_p0;
   assign next_empty_count = _w_wr_addr_nxt_p0 - _w_rd_addr_nxt_p0;
   assign EMPTY = o_stages_empty;
   assign ram_empty = (_CLOCK_DOMAINS) ? ram_empty_c : ram_empty_i;
   assign ram_one_read_from_empty_i = (empty_count < 2*_RD_ADDR_INC) && (empty_count >= _RD_ADDR_INC) && ~ram_empty;
   assign ram_one_read_from_empty = (next_empty_count < _RD_ADDR_INC) && ~ram_empty;
   assign ram_one_write_from_not_empty = (next_empty_count >= _RD_ADDR_INC) && ram_empty;
   assign ram_one_write_from_not_empty_i = (_RD_ADDR_INC < _WR_ADDR_INC) ? EMPTY : ((empty_count + _WR_ADDR_INC) >= _RD_ADDR_INC);
   assign prog_empty = ((empty_count < prog_empty_val) || (_CLOCK_DOMAINS && ram_empty)) && (~FULL | ~_CLOCK_DOMAINS);

   always @ (posedge _w_RDCLK or posedge _w_GSR) begin
      if (_w_GSR || _w_RDRST)
         ram_empty_c <= 1'b1;
// RD only makes empty
      else if (~_w_wr_ena &&
               _w_rd_ena  &&
               (ram_one_read_from_empty || ram_empty_c))
         ram_empty_c <= 1'b1;
// RD and WR when one read from empty and RD more than WR makes empty
      else if (_w_wr_ena &&
              (_w_rd_ena && (_RD_ADDR_INC > _WR_ADDR_INC)) &&
              (ram_one_read_from_empty || ram_empty_c))
         ram_empty_c <= 1'b1;
// CR701309 CC WR when empty always makes not empty. simultaneous RD gets ERR
      else if ( _w_wr_ena && (ram_one_write_from_not_empty && ram_empty_c))
         ram_empty_c <= 1'b0;
      else
         ram_empty_c <= ram_empty_c;
      end

   always @ (posedge _w_RDCLK or posedge _w_GSR) begin
      if (_w_GSR || _w_RDRST)
         ram_empty_i <= 1'b1;
      else if (_w_rd_ena && ram_one_read_from_empty_i) // _w_RDEN ?
         ram_empty_i <= 1'b1;
      else if (empty_count < _RD_ADDR_INC)
         ram_empty_i <= 1'b1;
      else
         ram_empty_i <= 1'b0;
      end

//   assign PROGEMPTY = (_CLOCK_DOMAINS) ? prog_empty_cc : prog_empty;
   assign PROGEMPTY = prog_empty_cc;
   always @ (posedge _w_RDCLK or posedge _w_GSR) begin
      if (_w_GSR || _w_RDRST)
         prog_empty_cc <= 1'b1;
      else
         prog_empty_cc <= prog_empty;
      end

endmodule
/* verilator coverage_on */
