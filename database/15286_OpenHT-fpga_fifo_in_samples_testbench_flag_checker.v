// This program was cloned from: https://github.com/M17-Project/OpenHT-fpga
// License: GNU General Public License v3.0

// =============================================================================
// >>>>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
// -----------------------------------------------------------------------------
//   Copyright (c) 2017 by Lattice Semiconductor Corporation
//   ALL RIGHTS RESERVED
// -----------------------------------------------------------------------------
//
//   Permission:
//
//      Lattice SG Pte. Ltd. grants permission to use this code
//      pursuant to the terms of the Lattice Reference Design License Agreement.
//
//
//   Disclaimer:
//
//      This VHDL or Verilog source code is intended as a design reference
//      which illustrates how these types of functions can be implemented.
//      It is the user's responsibility to verify their design for
//      consistency and functionality through the use of formal
//      verification methods.  Lattice provides no warranty
//      regarding the use or functionality of this code.
//
// -----------------------------------------------------------------------------
//
//                  Lattice SG Pte. Ltd.
//                  101 Thomson Road, United Square #07-02
//                  Singapore 307591
//
//
//                  TEL: 1-800-Lattice (USA and Canada)
//                       +65-6631-2000 (Singapore)
//                       +1-503-268-8001 (other locations)
//
//                  web: http://www.latticesemi.com/
//                  email: techsupport@latticesemi.com
//
// -----------------------------------------------------------------------------
//
// =============================================================================
//                         FILE DETAILS
// Project               : Radiant Software 1.1
// File                  : flag_checker.v
// Title                 :
// Dependencies          :
// Description           : Checks the flag of the FIFO
// =============================================================================
//                        REVISION HISTORY
// Version               : 1.0.0.
// Author(s)             :
// Mod. Date             :
// Changes Made          : Initial release.
// =============================================================================

`ifndef FLAG_CHECKER
`define FLAG_CHECKER

`timescale 1 ns / 1 ns

module flag_checker #(
    parameter WADDR_DEPTH               = 512,
    parameter WADDR_WIDTH               = clog2(WADDR_DEPTH),
    parameter WDATA_WIDTH               = 36,
    parameter RADDR_DEPTH               = 512,
    parameter RADDR_WIDTH               = clog2(RADDR_DEPTH),
    parameter RDATA_WIDTH               = 36,
    parameter REGMODE                   = "reg",
    parameter RESETMODE                 = "async",
    parameter ENABLE_ALMOST_FULL_FLAG   = "TRUE",
    parameter ENABLE_ALMOST_EMPTY_FLAG  = "TRUE",
    parameter ALMOST_FULL_ASSERTION     = "static-dual",
    parameter ALMOST_FULL_ASSERT_LVL    = 511,
    parameter ALMOST_FULL_DEASSERT_LVL  = 510,
    parameter ALMOST_EMPTY_ASSERTION    = "static-dual",
    parameter ALMOST_EMPTY_ASSERT_LVL   = 1,
    parameter ALMOST_EMPTY_DEASSERT_LVL = 2,
    parameter ENABLE_DATA_COUNT_WR      = "FALSE",
    parameter ENABLE_DATA_COUNT_RD      = "FALSE",
    parameter LATENCY                   = 2,
    parameter DEASSERT_LATENCY          = 2
)(
//----------------------------
// Inputs
//----------------------------
    input wr_clk_i,
    input rd_clk_i,
    input wr_en_i,
    input rd_en_i,
    input rst_i,
    input rp_rst_i,
    
    input [WADDR_WIDTH-1:0] almost_full_th_i,
    input [WADDR_WIDTH-1:0] almost_full_clr_th_i,
    input [RADDR_WIDTH-1:0] almost_empty_th_i,
    input [RADDR_WIDTH-1:0] almost_empty_clr_th_i,
    
//----------------------------
// Outputs
//----------------------------
    
    output full_o,
    output empty_o,
    output almost_full_o,
    output almost_empty_o,
    output [WADDR_WIDTH:0] wr_data_cnt_o,
    output [RADDR_WIDTH:0] rd_data_cnt_o
);

//----------------------------
// Local Parameters
//----------------------------
localparam G_WADDR_WIDTH = WADDR_WIDTH+1;
localparam G_RADDR_WIDTH = RADDR_WIDTH+1;
localparam CMP_WIDTH     = (WADDR_WIDTH >= RADDR_WIDTH) ? (RADDR_WIDTH+1) : (WADDR_WIDTH+1);
localparam GEN_FACTOR    = (WDATA_WIDTH > RDATA_WIDTH) ? WDATA_WIDTH / RDATA_WIDTH : RDATA_WIDTH / WDATA_WIDTH;
localparam W_FACTOR      = (WADDR_WIDTH > RADDR_WIDTH) ? GEN_FACTOR : 1;
localparam R_FACTOR      = (WADDR_WIDTH > RADDR_WIDTH) ? 1 : GEN_FACTOR;

genvar i0, i1, ilat0;
generate
    //----------------------------
    // Wire and Registers
    //----------------------------

    // -- Write-Synced Signals --
    reg                        full_r;
    reg                        full_ext_r;
    reg                        full_q_r;

    reg  [WADDR_WIDTH:0]       wr_addr_r;
    reg  [WADDR_WIDTH:0]       wr_addr_arith_r;
    reg  [WADDR_WIDTH:0]       wr_addr_nxt_c;
    wire [WADDR_WIDTH-1:0]     wr_mem_addr_w      = wr_addr_r[WADDR_WIDTH-1:0];
    wire [WADDR_WIDTH:0]       wr_addr_p1_w       = wr_addr_r + 1'b1;
                                                  
    reg  [G_RADDR_WIDTH-1:0]   rp_sync1_r;
    reg  [G_RADDR_WIDTH-1:0]   rp_sync2_r;
                                                  
    wire [G_WADDR_WIDTH-1:0]   wr_buff_w;
    reg [G_WADDR_WIDTH-1:0]    wr_buff_sync_r;
    wire [RADDR_WIDTH:0]       rp_sync_w;
                                                  
    wire [CMP_WIDTH-1:0]       wr_cmp_wr_w        = wr_addr_p1_w[WADDR_WIDTH:WADDR_WIDTH-CMP_WIDTH+1];
    wire [CMP_WIDTH-1:0]       rd_cmp_wr_w        = rp_sync_w[RADDR_WIDTH:RADDR_WIDTH-CMP_WIDTH+1];
    wire [CMP_WIDTH-2:0]       wr_cmp_mem_wr_w    = wr_cmp_wr_w[CMP_WIDTH-2:0];
    wire [CMP_WIDTH-2:0]       rd_cmp_mem_wr_w    = rd_cmp_wr_w[CMP_WIDTH-2:0];
    wire [CMP_WIDTH-2:0]       wr_cur_mem_wr_w    = wr_mem_addr_w[WADDR_WIDTH-1:WADDR_WIDTH-CMP_WIDTH+1];

    wire [WADDR_WIDTH:0]       wr_sig_rd_w;
    wire [WADDR_WIDTH:0]       wr_sig_diff0_w     = wr_addr_arith_r - wr_sig_rd_w;

    reg                        full_nxt_c;

    // -- Read-Synced Signals --
    reg                        empty_r;
    reg                        empty_ext_r;
    reg                        empty_q_r;

    reg  [RADDR_WIDTH:0]       rd_addr_r;
    reg  [RADDR_WIDTH:0]       rd_addr_arith_r;
    reg  [RADDR_WIDTH:0]       rd_addr_nxt_c;
    wire [RADDR_WIDTH-1:0]     rd_mem_addr_w      = rd_addr_r[RADDR_WIDTH-1:0];
    wire [RADDR_WIDTH:0]       rd_addr_p1_w       = rd_addr_r + 1'b1;

    reg  [G_WADDR_WIDTH-1:0]   wp_sync1_r;
    reg  [G_WADDR_WIDTH-1:0]   wp_sync2_r;

    wire [G_RADDR_WIDTH-1:0]   rd_buff_w;
    reg [G_RADDR_WIDTH-1:0]    rd_buff_sync_r;
    wire [WADDR_WIDTH:0]       wp_sync_w;
                                                  
    wire [CMP_WIDTH-1:0]       rd_cmp_rd_w        = rd_addr_p1_w[RADDR_WIDTH:RADDR_WIDTH-CMP_WIDTH+1];
    wire [CMP_WIDTH-1:0]       wr_cmp_rd_w        = wp_sync_w[WADDR_WIDTH:WADDR_WIDTH-CMP_WIDTH+1];
    wire [CMP_WIDTH-2:0]       wr_cmp_mem_rd_w    = wr_cmp_rd_w[CMP_WIDTH-2:0];
    wire [CMP_WIDTH-2:0]       rd_cmp_mem_rd_w    = rd_cmp_rd_w[CMP_WIDTH-2:0];
    wire [CMP_WIDTH-2:0]       rd_cur_mem_rd_w    = rd_mem_addr_w[RADDR_WIDTH-1:RADDR_WIDTH-CMP_WIDTH+1];

    wire [RADDR_WIDTH:0]       rd_sig_wr_w;
    wire [RADDR_WIDTH:0]       rd_sig_diff0_w     = rd_sig_wr_w - rd_addr_arith_r;
 
    reg                        empty_nxt_c;

    wire [RADDR_WIDTH:0]       full_addr_w;

    // -- Top-Level Assignments --
    assign                     full_o             = full_ext_r;
    assign                     empty_o            = empty_ext_r;

    // -- Global Signals -- 
    wire                       wr_fifo_en_w       = wr_en_i & ~full_r;
    wire                       rd_fifo_en_w       = rd_en_i & ~empty_r;
    genvar gri0;
    //----------------------------
    // Behavioral Model
    //----------------------------

    // ----------------------
    // -- WRITE CONTROLLER --
    // ----------------------

    // -- wr_buff_encode --
    assign wr_buff_w = wr_addr_nxt_c;

    if(RESETMODE == "sync") begin : wr_encode_sync
        always @ (posedge wr_clk_i) begin
            if(rst_i) begin
                wr_buff_sync_r <= {G_WADDR_WIDTH{1'b0}};
            end
            else begin
                wr_buff_sync_r <= wr_buff_w;
            end
        end
    end
    else begin : wr_encode_async
        always @ (posedge wr_clk_i, posedge rst_i) begin
            if(rst_i) begin
                wr_buff_sync_r <= {G_WADDR_WIDTH{1'b0}};
            end
            else begin
                wr_buff_sync_r <= wr_buff_w;
            end
        end
    end

    // -- rd_buff_decode --  
    assign rp_sync_w = rp_sync2_r;

    // ---------------------------
    // -- Core Write Controller --
    // ---------------------------
    wire wr_sig_mv_w    = wr_en_i & ~full_r;
    wire full_cmp_w     = (wr_cmp_mem_wr_w == rd_cmp_mem_wr_w);
    wire full_rel_cmp_w = (wr_cur_mem_wr_w == rd_cmp_mem_wr_w);
    wire full_max_w     = (wr_cmp_wr_w[CMP_WIDTH-1] ^ rd_cmp_wr_w[CMP_WIDTH-1]);

    always @ (*) begin
        wr_addr_nxt_c = (wr_sig_mv_w & ~rp_rst_i) ? wr_addr_p1_w : wr_addr_r;
    end

    if(DEASSERT_LATENCY == 0) begin : _DEASSERT_LAT_FULL_0
       always @ (*) begin
           full_nxt_c = ~rp_rst_i & (wr_sig_mv_w ? (full_cmp_w & full_max_w) : (full_rel_cmp_w & full_r));
       end
    end
    else begin : _DEASSERT_LAT_FULL_N
        wire de_assert_w;
        assign de_assert_w = ~rp_rst_i & (wr_sig_mv_w ? (full_cmp_w & full_max_w) : (full_rel_cmp_w & full_r));
        reg [DEASSERT_LATENCY-1:0] de_assert_r;
        for(ilat0 = 0; ilat0 < DEASSERT_LATENCY; ilat0 = ilat0 + 1) begin
            if(ilat0 == 0) begin
                always @ (posedge wr_clk_i, posedge rst_i) begin
                    if(rst_i) begin
                        de_assert_r[0] <= 1'b1;
                    end
                    else begin
                        de_assert_r[0] <= de_assert_w;
                    end
                end
            end
            else begin
                always @ (posedge wr_clk_i, posedge rst_i) begin
                    if(rst_i) begin
                        de_assert_r[ilat0] <= 1'b1;
                    end
                    else begin
                        de_assert_r[ilat0] <= de_assert_r[ilat0-1];
                    end
                end
            end
        end 
        always @ (*) begin
            //full_nxt_c = full_r ? |de_assert_r : de_assert_w;
            full_nxt_c = ~full_r ? de_assert_w : 
                         (WADDR_WIDTH == 1 || 
                          RADDR_WIDTH == 1) ? de_assert_r[DEASSERT_LATENCY-1] | ~full_q_r : |de_assert_r;
        end
    end

    if(RESETMODE == "sync") begin : sync_wr_controller
        always @ (posedge wr_clk_i) begin
            if(rst_i) begin
                wr_addr_r <= {WADDR_WIDTH{1'b0}};
                wr_addr_arith_r <= {WADDR_WIDTH{1'b0}};
                full_r <= 1'b0;
                full_ext_r <= 1'b0;
                full_q_r <= 1'b0;
            end
            else begin
                wr_addr_r <= wr_addr_nxt_c;
                wr_addr_arith_r <= wr_addr_nxt_c;
                full_r <= full_nxt_c;
                full_ext_r <= full_nxt_c;
                full_q_r <= full_r;
            end
        end
    end // end sync_wr_controller
    else begin : async_wr_controller
        always @ (posedge wr_clk_i, posedge rst_i) begin
            if(rst_i) begin
                wr_addr_r <= {WADDR_WIDTH{1'b0}};
                wr_addr_arith_r <= {WADDR_WIDTH{1'b0}};
                full_r <= 1'b0;
                full_ext_r <= 1'b0;
                full_q_r <= 1'b0;
            end
            else begin
                wr_addr_r <= wr_addr_nxt_c;
                wr_addr_arith_r <= wr_addr_nxt_c;
                full_r <= full_nxt_c;
                full_ext_r <= full_nxt_c;
                full_q_r <= full_r;
            end
        end
    end // end async_wr_controller

    // -- Read to Write Synchronizer --
    if(LATENCY == 0) begin
        always @ (*) begin
            rp_sync2_r = rd_buff_w;
        end
    end
    else if(LATENCY == 1) begin
        if(RESETMODE == "sync") begin
            always @ (posedge wr_clk_i) begin
                if(rst_i) begin
                    rp_sync2_r <= {(G_RADDR_WIDTH){1'b0}};
                end
                else begin
                    rp_sync2_r <= rd_buff_sync_r;
                end
            end
        end
        else begin
            always @ (posedge wr_clk_i, posedge rst_i) begin
                if(rst_i) begin
                    rp_sync2_r <= {(G_RADDR_WIDTH){1'b0}};
                end
                else begin
                    rp_sync2_r <= rd_buff_sync_r;
                end
            end
        end
    end
    else begin
        reg [G_RADDR_WIDTH-1:0] sync_reg [LATENCY-2:0];
        for(ilat0 = 0; ilat0 < LATENCY; ilat0 = ilat0 + 1) begin
            if(ilat0 == 0) begin
                if(RESETMODE == "sync") begin
                    always @ (posedge wr_clk_i) begin
                        if(rst_i) begin
                            sync_reg[ilat0] <= {(G_RADDR_WIDTH){1'b0}};
                        end
                        else begin
                            sync_reg[ilat0] <= rd_buff_sync_r;
                        end
                    end
                end
                else begin
                    always @ (posedge wr_clk_i, posedge rst_i) begin
                        if(rst_i) begin
                            sync_reg[ilat0] <= {(G_RADDR_WIDTH){1'b0}};
                        end
                        else begin
                            sync_reg[ilat0] <= rd_buff_sync_r;
                        end
                    end
                end
            end
            else if(ilat0 == LATENCY-1) begin
                if(RESETMODE == "sync") begin
                    always @ (posedge wr_clk_i) begin
                        if(rst_i) begin
                            rp_sync2_r <= {(G_RADDR_WIDTH){1'b0}};
                        end
                        else begin
                            rp_sync2_r <= sync_reg[ilat0-1];
                        end
                    end
                end
                else begin
                    always @ (posedge wr_clk_i, posedge rst_i) begin
                        if(rst_i) begin
                            rp_sync2_r <= {(G_RADDR_WIDTH){1'b0}};
                        end
                        else begin
                            rp_sync2_r <= sync_reg[ilat0-1];
                        end
                    end
                end
            end
            else begin
                if(RESETMODE == "sync") begin
                    always @ (posedge wr_clk_i) begin
                        if(rst_i) begin
                            sync_reg[ilat0] <= {(G_RADDR_WIDTH){1'b0}};
                        end
                        else begin
                            sync_reg[ilat0] <= sync_reg[ilat0-1];
                        end
                    end
                end
                else begin
                    always @ (posedge wr_clk_i, posedge rst_i) begin
                        if(rst_i) begin
                            sync_reg[ilat0] <= {(G_RADDR_WIDTH){1'b0}};
                        end
                        else begin
                            sync_reg[ilat0] <= sync_reg[ilat0-1];
                        end
                    end
                end
            end
        end
    end

    // -- Routing for WR difference signals --
    if(WADDR_WIDTH > RADDR_WIDTH) begin
        assign wr_sig_rd_w = {rp_sync_w, {(WADDR_WIDTH-RADDR_WIDTH){1'b0}}};

    end // end WADDR_WIDTH > RADDR_WIDTH
    else begin
        assign wr_sig_rd_w = rp_sync_w[RADDR_WIDTH:RADDR_WIDTH-WADDR_WIDTH];
    end // end else

    // -- Almost Full Flag Controller --
    if(ENABLE_ALMOST_FULL_FLAG == "TRUE") begin : afull_flag_impl
        wire [WADDR_WIDTH-1:0] almost_full_tick_w = (ALMOST_FULL_ASSERTION == "static-single" || ALMOST_FULL_ASSERTION == "static-dual") ? (ALMOST_FULL_ASSERT_LVL) : (almost_full_th_i) ;
        wire [WADDR_WIDTH-1:0] almost_full_tock_w = ((ALMOST_FULL_ASSERTION == "static-single") ? ALMOST_FULL_ASSERT_LVL : 
                                                    (ALMOST_FULL_ASSERTION == "static-dual") ? ALMOST_FULL_DEASSERT_LVL :
                                                    (ALMOST_FULL_ASSERTION == "dynamic-single") ? almost_full_th_i : almost_full_clr_th_i);

        reg af_flag_r;
        reg af_flag_ext_r;

        wire af_flag_p_w = ~(wr_sig_diff0_w < almost_full_tick_w - wr_en_i);
        wire af_flag_n_w = (wr_sig_diff0_w > almost_full_tock_w);

        wire af_flag_nxt_w;

        assign almost_full_o = af_flag_ext_r;

        if(RESETMODE == "sync") begin : sync
            always @ (posedge wr_clk_i) begin
                if(rst_i == 1'b1) begin
                   af_flag_r <= 1'b0;
                   af_flag_ext_r <= 1'b0;
                end
                else begin
                   af_flag_r <= af_flag_nxt_w;
                   af_flag_ext_r <= af_flag_nxt_w;
                end
            end
        end // end sync
        else begin : async
            always @ (posedge wr_clk_i, posedge rst_i) begin
                if(rst_i == 1'b1) begin
                   af_flag_r <= 1'b0;
                   af_flag_ext_r <= 1'b0;
                end
                else begin
                   af_flag_r <= af_flag_nxt_w;
                   af_flag_ext_r <= af_flag_nxt_w;
                end
            end
        end // end async

        if(DEASSERT_LATENCY == 0) begin : _DEASSERT_LAT_AF_0
            assign af_flag_nxt_w = (af_flag_p_w) | (af_flag_n_w & af_flag_r);
        end
        else begin : _DEASSERT_LAT_AF_N
            wire de_assert_w;
            assign de_assert_w = (af_flag_p_w) | (af_flag_n_w & af_flag_r);
            reg [DEASSERT_LATENCY-1:0] de_assert_r;
            for(ilat0 = 0; ilat0 < DEASSERT_LATENCY; ilat0 = ilat0 + 1) begin
                if(ilat0 == 0) begin
                    always @ (posedge rd_clk_i, posedge rst_i) begin
                        if(rst_i) begin
                            de_assert_r[0] <= 1'b1;
                        end
                        else begin
                            de_assert_r[0] <= de_assert_w;
                        end
                    end
                end
                else begin
                    always @ (posedge rd_clk_i, posedge rst_i) begin
                        if(rst_i) begin
                            de_assert_r[ilat0] <= 1'b1;
                        end
                        else begin
                            de_assert_r[ilat0] <= de_assert_r[ilat0-1];
                        end
                    end
                end
            end 
            assign af_flag_nxt_w = af_flag_r ? |de_assert_r : de_assert_w;
        end

    end // end afull_flag_impl
    else begin
        assign almost_full_o = 1'b0;
    end

    // -- Enable WR Data Count Controller --
    if(ENABLE_DATA_COUNT_WR == "TRUE") begin : en_wr_cnt
        reg [WADDR_WIDTH:0] wr_counter_r;
        assign wr_data_cnt_o = wr_counter_r;

        // synthesis translate_off
        initial begin
            wr_counter_r = {(WADDR_WIDTH+1){1'b0}};
        end
        // synthesis translate_on

        if(RESETMODE == "sync") begin
            always @ (posedge wr_clk_i) begin
                if(rst_i) begin
                    wr_counter_r <= {(WADDR_WIDTH+1){1'b0}};
                end
                else begin
                    wr_counter_r <= wr_sig_diff0_w;
                end
            end
        end
        else begin
            always @ (posedge wr_clk_i, posedge rst_i) begin
                if(rst_i) begin
                    wr_counter_r <= {(WADDR_WIDTH+1){1'b0}};
                end
                else begin
                    wr_counter_r <= wr_sig_diff0_w;
                end
            end
        end
    end // end en_wr_cnt
    else begin
        assign wr_data_cnt_o = {(WADDR_WIDTH+1){1'b0}};
    end

    // ---------------------
    // -- READ CONTROLLER --
    // ---------------------

    // -- Full Address for rp_rst_i --
    if(WADDR_WIDTH >= RADDR_WIDTH) begin : full_addr_e
        assign full_addr_w  = {~wp_sync_w[WADDR_WIDTH], wp_sync_w[WADDR_WIDTH-1:WADDR_WIDTH-RADDR_WIDTH]};
    end // end full_addr_e
    else begin : full_addr_o
        assign full_addr_w = {~wp_sync_w[WADDR_WIDTH], wp_sync_w[WADDR_WIDTH-1:0], {(RADDR_WIDTH-WADDR_WIDTH){1'b0}}};
    end // end full_addr_o

    // -- rd_buff_encode --
    assign rd_buff_w = rd_addr_nxt_c;

    if(RESETMODE == "sync") begin : rd_encode_sync
        always @ (posedge rd_clk_i) begin
            if(rst_i) begin
                rd_buff_sync_r <= {G_RADDR_WIDTH{1'b0}};
            end
            else begin
                rd_buff_sync_r <= rd_buff_w;
            end
        end
    end
    else begin : rd_encode_async
        always @ (posedge rd_clk_i, posedge rst_i) begin
            if(rst_i) begin
                rd_buff_sync_r <= {G_RADDR_WIDTH{1'b0}};
            end
            else begin
                rd_buff_sync_r <= rd_buff_w;
            end
        end
    end

    // -- wr_buff_decode --
    assign wp_sync_w = wp_sync2_r;

    // ---------------------------
    // -- Core Read Controller --
    // ---------------------------

    wire empty_cmp_w     = (wr_cmp_rd_w == rd_cmp_rd_w);
    wire empty_rel_cmp_w = (rd_cur_mem_rd_w == wr_cmp_mem_rd_w);
    wire rd_sig_mv_w     = rd_en_i & ~empty_r;

    always @ (*) begin
        rd_addr_nxt_c = rp_rst_i ? (full_addr_w) : (rd_sig_mv_w ? rd_addr_p1_w : rd_addr_r);
    end

    if(DEASSERT_LATENCY == 0) begin : _DEASSERT_LAT_EMPTY_0
        always @ (*) begin
            empty_nxt_c = ~rp_rst_i & (rd_sig_mv_w ? empty_cmp_w : empty_rel_cmp_w & empty_r);
        end
    end
    else begin : _DEASSERT_LAT_EMPTY_N
        wire de_assert_w;
        assign de_assert_w = ~rp_rst_i & (rd_sig_mv_w ? empty_cmp_w : empty_rel_cmp_w & empty_r);
        reg [DEASSERT_LATENCY-1:0] de_assert_r;
        for(ilat0 = 0; ilat0 < DEASSERT_LATENCY; ilat0 = ilat0 + 1) begin
            if(ilat0 == 0) begin
                always @ (posedge rd_clk_i, posedge rst_i) begin
                    if(rst_i) begin
                        de_assert_r[0] <= 1'b1;
                    end
                    else begin
                        de_assert_r[0] <= de_assert_w;
                    end
                end
            end
            else begin
                always @ (posedge rd_clk_i, posedge rst_i) begin
                    if(rst_i) begin
                        de_assert_r[ilat0] <= 1'b1;
                    end
                    else begin
                        de_assert_r[ilat0] <= de_assert_r[ilat0-1];
                    end
                end
            end
        end 
        always @ (*) begin
            //empty_nxt_c = empty_r ? |de_assert_r : de_assert_w;
            empty_nxt_c = ~empty_r ? de_assert_w :
                          (WADDR_WIDTH == 1 || 
                           RADDR_WIDTH == 1) ? de_assert_r[DEASSERT_LATENCY-1] | ~empty_q_r : |de_assert_r;
        end
    end

    if(RESETMODE == "sync") begin : sync_rd_controller
        always @ (posedge rd_clk_i) begin
            if(rst_i) begin
                empty_r <= 1'b1;
                empty_ext_r <= 1'b1;
                empty_q_r <= 1'b1;
                rd_addr_r <= {(RADDR_WIDTH+1){1'b0}};
                rd_addr_arith_r <= {(RADDR_WIDTH+1){1'b0}};
            end
            else begin
                empty_r <= empty_nxt_c;
                empty_ext_r <= empty_nxt_c;
                empty_q_r <= empty_r;
                rd_addr_r <= rd_addr_nxt_c;
                rd_addr_arith_r <= rd_addr_nxt_c;
            end
        end
    end // end sync_rd_controller
    else begin : async_rd_controller
        always @ (posedge rd_clk_i, posedge rst_i) begin
            if(rst_i) begin
                empty_r <= 1'b1;
                empty_ext_r <= 1'b1;
                empty_q_r <= 1'b1;
                rd_addr_r <= {(RADDR_WIDTH+1){1'b0}};
                rd_addr_arith_r <= {(RADDR_WIDTH+1){1'b0}};
            end
            else begin
                empty_r <= empty_nxt_c;
                empty_ext_r <= empty_nxt_c;
                empty_q_r <= empty_r;
                rd_addr_r <= rd_addr_nxt_c;
                rd_addr_arith_r <= rd_addr_nxt_c;
            end
        end
    end // end async_rd_controller

    // -- Write to Read Synchronizer --
    if(LATENCY == 0) begin
        always @ (*) begin
            wp_sync2_r = wr_buff_w;
        end
    end
    else if(LATENCY == 1) begin
        if(RESETMODE == "sync") begin
            always @ (posedge rd_clk_i) begin
                if(rst_i) begin
                    wp_sync2_r <= {(G_WADDR_WIDTH){1'b0}};
                end
                else begin
                    wp_sync2_r <= wr_buff_sync_r;
                end
            end
        end
        else begin
            always @ (posedge rd_clk_i, posedge rst_i) begin
                if(rst_i) begin
                    wp_sync2_r <= {(G_WADDR_WIDTH){1'b0}};
                end
                else begin
                    wp_sync2_r <= wr_buff_sync_r;
                end
            end
        end
    end
    else begin
        reg [G_WADDR_WIDTH-1:0] sync_reg [LATENCY-2:0];
        for(ilat0 = 0; ilat0 < LATENCY; ilat0 = ilat0 + 1) begin
            if(ilat0 == 0) begin
                if(RESETMODE == "sync") begin
                    always @ (posedge rd_clk_i) begin
                        if(rst_i) begin
                            sync_reg[ilat0] <= {(G_WADDR_WIDTH){1'b0}};
                        end
                        else begin
                            sync_reg[ilat0] <= wr_buff_sync_r;
                        end
                    end
                end
                else begin
                    always @ (posedge rd_clk_i, posedge rst_i) begin
                        if(rst_i) begin
                            sync_reg[ilat0] <= {(G_WADDR_WIDTH){1'b0}};
                        end
                        else begin
                            sync_reg[ilat0] <= wr_buff_sync_r;
                        end
                    end
                end
            end
            else if(ilat0 == LATENCY-1) begin
                if(RESETMODE == "sync") begin
                    always @ (posedge rd_clk_i) begin
                        if(rst_i) begin
                            wp_sync2_r <= {(G_WADDR_WIDTH){1'b0}};
                        end
                        else begin
                            wp_sync2_r <= sync_reg[ilat0-1];
                        end
                    end
                end
                else begin
                    always @ (posedge rd_clk_i, posedge rst_i) begin
                        if(rst_i) begin
                            wp_sync2_r <= {(G_WADDR_WIDTH){1'b0}};
                        end
                        else begin
                            wp_sync2_r <= sync_reg[ilat0-1];
                        end
                    end
                end
            end
            else begin
                if(RESETMODE == "sync") begin
                    always @ (posedge rd_clk_i) begin
                        if(rst_i) begin
                            sync_reg[ilat0] <= {(G_WADDR_WIDTH){1'b0}};
                        end
                        else begin
                            sync_reg[ilat0] <= sync_reg[ilat0-1];
                        end
                    end
                end
                else begin
                    always @ (posedge rd_clk_i, posedge rst_i) begin
                        if(rst_i) begin
                            sync_reg[ilat0] <= {(G_WADDR_WIDTH){1'b0}};
                        end
                        else begin
                            sync_reg[ilat0] <= sync_reg[ilat0-1];
                        end
                    end
                end
            end
        end
    end

    // -- Routing for RD difference signals --
    if(RADDR_WIDTH > WADDR_WIDTH) begin
        assign rd_sig_wr_w = {wp_sync_w, {(RADDR_WIDTH-WADDR_WIDTH){1'b0}}};
    end // end RADDR_WIDTH > WADDR_WIDTH
    else begin
        assign rd_sig_wr_w = wp_sync_w[WADDR_WIDTH:WADDR_WIDTH-RADDR_WIDTH];
    end // end else

    // -- Almost Empty Flag Controller --
    if(ENABLE_ALMOST_EMPTY_FLAG == "TRUE") begin : aempty_flag_impl
        wire [RADDR_WIDTH-1:0] almost_empty_tick_w = (ALMOST_EMPTY_ASSERTION == "static-single" || ALMOST_EMPTY_ASSERTION == "static-dual") ? (ALMOST_EMPTY_ASSERT_LVL): (almost_empty_th_i);
        wire [RADDR_WIDTH-1:0] almost_empty_tock_w = ((ALMOST_EMPTY_ASSERTION == "static-single") ? ALMOST_EMPTY_ASSERT_LVL : 
                                                     (ALMOST_EMPTY_ASSERTION == "static-dual") ? ALMOST_EMPTY_DEASSERT_LVL :
                                                     (ALMOST_EMPTY_ASSERTION == "dynamic-single") ? almost_empty_th_i : almost_empty_clr_th_i);

        reg                    ae_flag_r;
        reg                    ae_flag_ext_r;

        wire                   ae_flag_pos_w = ~(rd_sig_diff0_w > almost_empty_tick_w + rd_en_i);
        wire                   ae_flag_neg_w = (rd_sig_diff0_w < almost_empty_tock_w);

        wire                   ae_flag_nxt_w;
        assign                 almost_empty_o = ae_flag_ext_r;


        if(RESETMODE == "sync") begin : sync
            always @ (posedge rd_clk_i, posedge rst_i) begin
                if(rst_i) begin
                    ae_flag_ext_r <= 1'b1;
                    ae_flag_r <= 1'b1;
                end
                else begin
                    ae_flag_ext_r <= ae_flag_nxt_w;
                    ae_flag_r <= ae_flag_nxt_w;
                end
            end
        end // end sync
        else begin : async
            always @ (posedge rd_clk_i, posedge rst_i) begin
                if(rst_i) begin
                    ae_flag_ext_r <= 1'b1;
                    ae_flag_r <= 1'b1;
                end
                else begin
                    ae_flag_ext_r <= ae_flag_nxt_w;
                    ae_flag_r <= ae_flag_nxt_w;
                end
            end
        end // end async

        if(DEASSERT_LATENCY == 0) begin : _DEASSERT_LAT_AE_0
            assign ae_flag_nxt_w = ae_flag_pos_w | ae_flag_neg_w & ae_flag_r;
        end
        else begin : _DEASSERT_LAT_AE_N
            wire de_assert_w;
            assign de_assert_w = ae_flag_pos_w | ae_flag_neg_w & ae_flag_r;
            reg [DEASSERT_LATENCY-1:0] de_assert_r;
            for(ilat0 = 0; ilat0 < DEASSERT_LATENCY; ilat0 = ilat0 + 1) begin
                if(ilat0 == 0) begin
                    always @ (posedge rd_clk_i, posedge rst_i) begin
                        if(rst_i) begin
                            de_assert_r[0] <= 1'b1;
                        end
                        else begin
                            de_assert_r[0] <= de_assert_w;
                        end
                    end
                end
                else begin
                    always @ (posedge rd_clk_i, posedge rst_i) begin
                        if(rst_i) begin
                            de_assert_r[ilat0] <= 1'b1;
                        end
                        else begin
                            de_assert_r[ilat0] <= de_assert_r[ilat0-1];
                        end
                    end
                end
            end 
            assign ae_flag_nxt_w = ae_flag_r ? |de_assert_r : de_assert_w;
        end
    end
    else begin
        assign almost_empty_o = 1'b0;
    end
    // -- Enable RD Data Count Controller --
    if(ENABLE_DATA_COUNT_RD == "TRUE") begin : en_rd_cnt
        reg [RADDR_WIDTH:0] rd_counter_r;
        assign rd_data_cnt_o = rd_counter_r;

        if(RESETMODE == "sync") begin
            always @ (posedge rd_clk_i) begin
                if(rst_i) begin
                    rd_counter_r <= {(RADDR_WIDTH+1){1'b0}};
                end
                else begin
                    rd_counter_r <= rd_sig_diff0_w;
                end
            end
        end
        else begin
            always @ (posedge rd_clk_i, posedge rst_i) begin
                if(rst_i) begin
                    rd_counter_r <= {(RADDR_WIDTH+1){1'b0}};
                end
                else begin
                    rd_counter_r <= rd_sig_diff0_w;
                end
            end
        end

    end // end en_rd_cnt
    else begin : dis_rd_cnt
        assign rd_data_cnt_o = {(RADDR_WIDTH+1){1'b0}};
    end
endgenerate

//------------------------------------------------------------------------------
// Function Definition
//------------------------------------------------------------------------------

function [31:0] clog2;
  input [31:0] value;
  reg   [31:0] num;
  begin
    num = value - 1;
    for (clog2=0; num>0; clog2=clog2+1) num = num>>1;
  end
endfunction

endmodule
`endif