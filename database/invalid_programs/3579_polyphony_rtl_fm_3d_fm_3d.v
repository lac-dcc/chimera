// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d.v
//
// Abstract:
//   3D top module
//
//  Created:
//    25 August 2008
//
// Copyright (c) 2008  Kenji Ishimaru, All rights reserved.
//
//======================================================================
//
// Copyright (c) 2020, Kenji Ishimaru
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
//  -Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
//  -Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
// EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

`include "fm_3d_def.v"

module fm_3d (
  clk_core,
  rst_x,
  // debug
  o_idle,
  o_ff,
  o_fe,
  // configuration
  i_color_mode,
  // system bus
  i_req_s,
  i_wr_s,
  i_adrs_s,
  o_ack_s,
  i_len_s,
  i_be_s,
  i_dbw_s,
  o_strr_s,
  o_dbr_s,
  // vertex dma bus
  o_vtx_int,
  o_req_dma,
  o_adrs_dma,
  o_len_dma,
  i_ack_dma,
  i_strr_dma,
  i_dbr_dma,
  // memory bus
  o_req_m,
  o_wr_m,
  o_adrs_m,
  i_ack_m,
  o_len_m,
  o_be_m,
  o_strw_m,
  o_dbw_m,
  i_ackw_m,
  i_strr_m,
  i_dbr_m
);
`include "polyphony_params.v"
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // debug
    output         o_idle;
    output  [15:0] o_ff;
    output  [4:0]  o_fe;
    // configuration
    input  [1:0]  i_color_mode;
    // system bus
    input         i_req_s;
    input         i_wr_s;
    input  [21:0]  i_adrs_s;
    output        o_ack_s;
    input  [5:0]  i_len_s;
    input  [3:0]  i_be_s;
    input  [31:0] i_dbw_s;
    output        o_strr_s;
    output [31:0] o_dbr_s;
    // vertex dma bus
    output        o_vtx_int;
    output        o_req_dma;
    output [P_IB_ADDR_WIDTH-1:0]
                  o_adrs_dma;
    output [P_IB_LEN_WIDTH-1:0]
                  o_len_dma;
    input         i_ack_dma;
    input         i_strr_dma;
    input  [P_IB_DATA_WIDTH-1:0] 
                  i_dbr_dma;
    // memory bus
    output        o_req_m;
    output        o_wr_m;
    output [P_IB_ADDR_WIDTH-1:0]
                  o_adrs_m;
    input         i_ack_m;
    output [P_IB_LEN_WIDTH-1:0]
                  o_len_m;
    output [P_IB_BE_WIDTH-1:0]
                  o_be_m;
    output        o_strw_m;
    output [P_IB_DATA_WIDTH-1:0] 
                  o_dbw_m;
    input         i_ackw_m;
    input         i_strr_m;
    input  [P_IB_DATA_WIDTH-1:0] 
                  i_dbr_m;
////////////////////////////
// wire
////////////////////////////
    wire          w_valid;
    wire          w_ml;
    wire   [20:0] w_vtx0_x;
    wire   [20:0] w_vtx0_y;
    wire   [20:0] w_vtx0_z;
    wire   [20:0] w_vtx0_iw;
    wire   [20:0] w_vtx0_p00;
    wire   [20:0] w_vtx0_p01;
    wire   [20:0] w_vtx0_p02;
    wire   [20:0] w_vtx0_p03;
    wire   [20:0] w_vtx0_p10;
    wire   [20:0] w_vtx0_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    wire   [20:0] w_vtx0_p12;
    wire   [20:0] w_vtx0_p13;
`endif
    wire   [20:0] w_vtx1_x;
    wire   [20:0] w_vtx1_y;
    wire   [20:0] w_vtx1_z;
    wire   [20:0] w_vtx1_iw;
    wire   [20:0] w_vtx1_p00;
    wire   [20:0] w_vtx1_p01;
    wire   [20:0] w_vtx1_p02;
    wire   [20:0] w_vtx1_p03;
    wire   [20:0] w_vtx1_p10;
    wire   [20:0] w_vtx1_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    wire   [20:0] w_vtx1_p12;
    wire   [20:0] w_vtx1_p13;
`endif
    wire   [20:0] w_vtx2_x;
    wire   [20:0] w_vtx2_y;
    wire   [20:0] w_vtx2_z;
    wire   [20:0] w_vtx2_iw;
    wire   [20:0] w_vtx2_p00;
    wire   [20:0] w_vtx2_p01;
    wire   [20:0] w_vtx2_p02;
    wire   [20:0] w_vtx2_p03;
    wire   [20:0] w_vtx2_p10;
    wire   [20:0] w_vtx2_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    wire   [20:0] w_vtx2_p12;
    wire   [20:0] w_vtx2_p13;
`endif

    wire          w_aa_en;
    wire          w_attr0_en;
    wire   [1:0]  w_attr0_size;
    wire   [1:0]  w_attr0_kind;
    wire          w_attr1_en;
    wire   [1:0]  w_attr1_size;
    wire   [1:0]  w_attr1_kind;

    wire          w_tex_enable;
    wire   [2:0]  w_tex_format;
    wire   [11:0] w_tex_offset;
    wire   [21:0] w_tex_width_m1_f;
    wire   [21:0] w_tex_height_m1_f;
    wire   [11:0] w_tex_width_ui;
    wire          w_tex_blend_enable;
    wire          w_depth_test_en;
    wire   [2:0]  w_depth_func;
    wire          w_color_blend_en;
    wire   [2:0]  w_color_blend_eq;
    wire   [3:0]  w_color_blend_sf;
    wire   [3:0]  w_color_blend_df;
    wire   [3:0]  w_color_mask;
    wire   [11:0]
                  w_color_offset;
    wire   [11:0]
                  w_color_ms_offset;
    wire   [11:0]
                  w_depth_offset;
    wire   [11:0]
                  w_depth_ms_offset;
    wire          w_screen_flip;
    wire          w_ag_mode;
    wire          w_cache_init;
    wire          w_cache_flush;
    wire          w_flush_done;
    wire          w_ack;
    wire          w_idle_ru;
    wire          w_idle_tu;
    wire          w_idle_pu;
    // ru - pu
    wire          w_valid_rp;
    wire          w_aa_mode;
    wire   [9:0]  w_x;
    wire   [8:0]  w_y;
    wire   [15:0] w_z;
    wire   [7:0]  w_cr;
    wire   [7:0]  w_cg;
    wire   [7:0]  w_cb;
    wire   [7:0]  w_ca;
    wire          w_busy_pr;

    // ru - tu
    wire          w_valid_rt;
    wire   [21:0]  w_tu_rt;
    wire   [21:0]  w_tv_rt;
    wire          w_busy_tr;
    // tu - pu
    wire          w_valid_tp;
    wire   [7:0]  w_tr_tp;
    wire   [7:0]  w_tg_tp;
    wire   [7:0]  w_tb_tp;
    wire   [7:0]  w_ta_tp;
    wire          w_busy_pt;

   // memory unit
    // texture unit
    wire          w_req_tu;
    wire   [P_IB_ADDR_WIDTH-1:0]
                  w_adrs_tu;
    wire          w_ack_tu;
    wire   [P_IB_LEN_WIDTH-1:0]
                  w_len_tu;
    wire          w_strr_tu;
    wire   [P_IB_DATA_WIDTH-1:0]
                  w_dbr_tu;
    // color
    wire          w_req_cb;
    wire          w_wr_cb;
    wire   [P_IB_ADDR_WIDTH-1:0]
                  w_adrs_cb;
    wire          w_ack_cb;
    wire   [P_IB_LEN_WIDTH-1:0]
                  w_len_cb;
    wire   [P_IB_BE_WIDTH-1:0]
                  w_be_cb;
    wire          w_strw_cb;
    wire   [P_IB_DATA_WIDTH-1:0]
                  w_dbw_cb;
    wire          w_ackw_cb;
    wire          w_strr_cb;
    wire   [P_IB_DATA_WIDTH-1:0]
                  w_dbr_cb;
    // depth
    wire          w_req_db;
    wire          w_wr_db;
    wire   [P_IB_ADDR_WIDTH-1:0]
                  w_adrs_db;
    wire          w_ack_db;
    wire   [P_IB_LEN_WIDTH-1:0]
                  w_len_db;
    wire   [P_IB_BE_WIDTH-1:0]
                  w_be_db;
    wire          w_strw_db;
    wire   [P_IB_DATA_WIDTH-1:0]
                  w_dbw_db;
    wire          w_ackw_db;
    wire          w_strr_db;
    wire   [P_IB_DATA_WIDTH-1:0]
                  w_dbr_db;

////////////////////////////
// module instance
////////////////////////////
    // control unit
    fm_3d_cu u_3d_cu (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // system bus
        .i_req(i_req_s),
        .i_wr(i_wr_s),
        .i_adrs(i_adrs_s),
        .o_ack(o_ack_s),
        .i_len(i_len_s),
        .i_be(i_be_s),
        .i_dbw(i_dbw_s),
        .o_strr(o_strr_s),
        .o_dbr(o_dbr_s),
        // triangle data
        .o_valid(w_valid),
        .o_ml(w_ml),
        .o_vtx0_x(w_vtx0_x),
        .o_vtx0_y(w_vtx0_y),
        .o_vtx0_z(w_vtx0_z),
        .o_vtx0_iw(w_vtx0_iw),
        .o_vtx0_p00(w_vtx0_p00),
        .o_vtx0_p01(w_vtx0_p01),
        .o_vtx0_p02(w_vtx0_p02),
        .o_vtx0_p03(w_vtx0_p03),
        .o_vtx0_p10(w_vtx0_p10),
        .o_vtx0_p11(w_vtx0_p11),
`ifdef VTX_PARAM1_REDUCE
`else
        .o_vtx0_p12(w_vtx0_p12),
        .o_vtx0_p13(w_vtx0_p13),
`endif
        .o_vtx1_x(w_vtx1_x),
        .o_vtx1_y(w_vtx1_y),
        .o_vtx1_z(w_vtx1_z),
        .o_vtx1_iw(w_vtx1_iw),
        .o_vtx1_p00(w_vtx1_p00),
        .o_vtx1_p01(w_vtx1_p01),
        .o_vtx1_p02(w_vtx1_p02),
        .o_vtx1_p03(w_vtx1_p03),
        .o_vtx1_p10(w_vtx1_p10),
        .o_vtx1_p11(w_vtx1_p11),
`ifdef VTX_PARAM1_REDUCE
`else
        .o_vtx1_p12(w_vtx1_p12),
        .o_vtx1_p13(w_vtx1_p13),
`endif
        .o_vtx2_x(w_vtx2_x),
        .o_vtx2_y(w_vtx2_y),
        .o_vtx2_z(w_vtx2_z),
        .o_vtx2_iw(w_vtx2_iw),
        .o_vtx2_p00(w_vtx2_p00),
        .o_vtx2_p01(w_vtx2_p01),
        .o_vtx2_p02(w_vtx2_p02),
        .o_vtx2_p03(w_vtx2_p03),
        .o_vtx2_p10(w_vtx2_p10),
        .o_vtx2_p11(w_vtx2_p11),
`ifdef VTX_PARAM1_REDUCE
`else
        .o_vtx2_p12(w_vtx2_p12),
        .o_vtx2_p13(w_vtx2_p13),
`endif
        .i_ack(w_ack),
        // configuration registers
        .o_aa_en(w_aa_en),
        .o_attr0_en(w_attr0_en),
        .o_attr0_kind(w_attr0_kind),
        .o_attr0_size(w_attr0_size),
        .o_attr1_en(w_attr1_en),
        .o_attr1_kind(w_attr1_kind),
        .o_attr1_size(w_attr1_size),
        .o_tex_enable(w_tex_enable),
        .o_tex_format(w_tex_format),
        .o_tex_offset(w_tex_offset),
        .o_tex_width_m1_f(w_tex_width_m1_f),
        .o_tex_height_m1_f(w_tex_height_m1_f),
        .o_tex_width_ui(w_tex_width_ui),
        .o_tex_blend_enable(w_tex_blend_enable),
        .o_color_offset(w_color_offset),
        .o_color_ms_offset(w_color_ms_offset),
        .o_depth_offset(w_depth_offset),
        .o_depth_ms_offset(w_depth_ms_offset),
        .o_depth_test_en(w_depth_test_en),
        .o_depth_mask(),
        .o_depth_func(w_depth_func),
        .o_color_blend_en(w_color_blend_en),
        .o_color_blend_eq(w_color_blend_eq),
        .o_color_blend_sf(w_color_blend_sf),
        .o_color_blend_df(w_color_blend_df),
        .o_color_mask(w_color_mask),
        .o_screen_flip(w_screen_flip),
        .o_ag_mode(w_ag_mode),
        .o_cache_init(w_cache_init),
        .o_cache_flush(w_cache_flush),
        .i_flush_done(w_flush_done),
        // idle state indicator
        .i_idle_ru(w_idle_ru),
        .i_idle_tu(w_idle_tu),
        .i_idle_pu(w_idle_pu),
        // to system configuration
        .o_vtx_int(o_vtx_int),
        // dma access
        .o_req_dma(o_req_dma),
        .o_adrs_dma(o_adrs_dma),
        .o_len_dma(o_len_dma),
        .i_ack_dma(i_ack_dma),
        .i_strr_dma(i_strr_dma),
        .i_dbr_dma(i_dbr_dma),
        // debug
        .o_idle(o_idle),
        .o_ff(o_ff),
        .o_fe(o_fe)
    );

    // rasterizer unit
    fm_3d_ru u_3d_ru (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // triangle data
        .i_valid(w_valid),
        .o_ack(w_ack),
        .i_ml(w_ml),
        .i_vtx0_x(w_vtx0_x),
        .i_vtx0_y(w_vtx0_y),
        .i_vtx0_z(w_vtx0_z),
        .i_vtx0_iw(w_vtx0_iw),
        .i_vtx0_p00(w_vtx0_p00),
        .i_vtx0_p01(w_vtx0_p01),
        .i_vtx0_p02(w_vtx0_p02),
        .i_vtx0_p03(w_vtx0_p03),
        .i_vtx0_p10(w_vtx0_p10),
        .i_vtx0_p11(w_vtx0_p11),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_vtx0_p12(w_vtx0_p12),
        .i_vtx0_p13(w_vtx0_p13),
`endif
        .i_vtx1_x(w_vtx1_x),
        .i_vtx1_y(w_vtx1_y),
        .i_vtx1_z(w_vtx1_z),
        .i_vtx1_iw(w_vtx1_iw),
        .i_vtx1_p00(w_vtx1_p00),
        .i_vtx1_p01(w_vtx1_p01),
        .i_vtx1_p02(w_vtx1_p02),
        .i_vtx1_p03(w_vtx1_p03),
        .i_vtx1_p10(w_vtx1_p10),
        .i_vtx1_p11(w_vtx1_p11),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_vtx1_p12(w_vtx1_p12),
        .i_vtx1_p13(w_vtx1_p13),
`endif
        .i_vtx2_x(w_vtx2_x),
        .i_vtx2_y(w_vtx2_y),
        .i_vtx2_z(w_vtx2_z),
        .i_vtx2_iw(w_vtx2_iw),
        .i_vtx2_p00(w_vtx2_p00),
        .i_vtx2_p01(w_vtx2_p01),
        .i_vtx2_p02(w_vtx2_p02),
        .i_vtx2_p03(w_vtx2_p03),
        .i_vtx2_p10(w_vtx2_p10),
        .i_vtx2_p11(w_vtx2_p11),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_vtx2_p12(w_vtx2_p12),
        .i_vtx2_p13(w_vtx2_p13),
`endif
        // control registers
        .i_aa_en(w_aa_en),
        .i_attr0_en(w_attr0_en),
        .i_attr0_size(w_attr0_size),
        .i_attr0_kind(w_attr0_kind),
        .i_attr1_en(w_attr1_en),
        .i_attr1_size(w_attr1_size),
        .i_attr1_kind(w_attr1_kind),
        .o_idle(w_idle_ru),
        // pixel unit bus
        .o_valid_pu(w_valid_rp),
        .i_busy_pu(w_busy_pr),
        .o_aa_mode(w_aa_mode),
        .o_x(w_x),
        .o_y(w_y),
        .o_z(w_z),
        .o_cr(w_cr),
        .o_cg(w_cg),
        .o_cb(w_cb),
        .o_ca(w_ca),
        // texture unit bus
        .o_valid_tu(w_valid_rt),
        .i_busy_tu(w_busy_tr),
        .o_tu(w_tu_rt),
        .o_tv(w_tv_rt)
    );

    // texture unit
    fm_3d_tu u_3d_tu (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // register configuration
        .i_tex_enable(w_tex_enable),
        .i_tex_format(w_tex_format),
        .i_tex_offset(w_tex_offset),
        .i_tex_width_m1_f(w_tex_width_m1_f),
        .i_tex_height_m1_f(w_tex_height_m1_f),
        .i_tex_width_ui(w_tex_width_ui),
        .o_idle(w_idle_tu),
        // rasterizer bus
        .i_valid(w_valid_rt),
        .i_tu(w_tu_rt),
        .i_tv(w_tv_rt),
        .o_busy(w_busy_tr),
        // pixel unit bus
        .o_valid(w_valid_tp),
        .o_tr(w_tr_tp),
        .o_tg(w_tg_tp),
        .o_tb(w_tb_tp),
        .o_ta(w_ta_tp),
        .i_busy(w_busy_pt),
        // memory bus
        .o_req(w_req_tu),
        .o_adrs(w_adrs_tu),
        .i_ack(w_ack_tu),
        .o_len(w_len_tu),
        .i_strr(w_strr_tu),
        .i_dbr(w_dbr_tu)
    );

    // pixel unit
    fm_3d_pu pu (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // register configuration
        .i_tex_enable(w_tex_enable),
        .i_tex_blend_enable(w_tex_blend_enable),
        .i_color_offset(w_color_offset),
        .i_color_ms_offset(w_color_ms_offset),
        .i_depth_offset(w_depth_offset),
        .i_depth_ms_offset(w_depth_ms_offset),
        .i_depth_test_en(w_depth_test_en),
        .i_depth_func(w_depth_func),
        .i_color_blend_en(w_color_blend_en),
        .i_color_blend_eq(w_color_blend_eq),
        .i_color_blend_sf(w_color_blend_sf),
        .i_color_blend_df(w_color_blend_df),
        .i_color_mask(w_color_mask),
        .i_color_mode(i_color_mode),
        .i_screen_flip(w_screen_flip),
        .i_ag_mode(w_ag_mode),
        .o_idle(w_idle_pu),
        // rasterizer unit
        .i_valid_ru(w_valid_rp),
        .i_aa_mode(w_aa_mode),
        .i_x(w_x),
        .i_y(w_y),
        .i_z(w_z),
        .i_cr(w_cr),
        .i_cg(w_cg),
        .i_cb(w_cb),
        .i_ca(w_ca),
        .o_busy_ru(w_busy_pr),
        // texture unit
        .i_valid_tu(w_valid_tp),
        .i_tr(w_tr_tp),
        .i_tg(w_tg_tp),
        .i_tb(w_tb_tp),
        .i_ta(w_ta_tp),
        .o_busy_tu(w_busy_pt),
        // color
        .o_req_cb(w_req_cb),
        .o_wr_cb(w_wr_cb),
        .o_adrs_cb(w_adrs_cb),
        .i_ack_cb(w_ack_cb),
        .o_len_cb(w_len_cb),
        .o_be_cb(w_be_cb),
        .o_strw_cb(w_strw_cb),
        .o_dbw_cb(w_dbw_cb),
        .i_ackw_cb(w_ackw_cb),
        .i_strr_cb(w_strr_cb),
        .i_dbr_cb(w_dbr_cb),
        // depth
        .o_req_db(w_req_db),
        .o_wr_db(w_wr_db),
        .o_adrs_db(w_adrs_db),
        .i_ack_db(w_ack_db),
        .o_len_db(w_len_db),
        .o_be_db(w_be_db),
        .o_strw_db(w_strw_db),
        .o_dbw_db(w_dbw_db),
        .i_ackw_db(w_ackw_db),
        .i_strr_db(w_strr_db),
        .i_dbr_db(w_dbr_db)
    );

    // memory unit
    fm_3d_mu u_3d_mu (
        .clk_core(clk_core),
        .rst_x(rst_x),
         // configuration
        .i_cache_init(w_cache_init),
        .i_cache_flush(w_cache_flush),
        .o_flush_done(w_flush_done),
        // texture unit
        .i_req_tu(w_req_tu),
        .i_adrs_tu(w_adrs_tu),
        .o_ack_tu(w_ack_tu),
        .i_len_tu(w_len_tu),
        .o_strr_tu(w_strr_tu),
        .o_dbr_tu(w_dbr_tu),
        // color
        .i_req_cb(w_req_cb),
        .i_wr_cb(w_wr_cb),
        .i_adrs_cb(w_adrs_cb),
        .o_ack_cb(w_ack_cb),
        .i_len_cb(w_len_cb),
        .i_be_cb(w_be_cb),
        .i_strw_cb(w_strw_cb),
        .i_dbw_cb(w_dbw_cb),
        .o_ackw_cb(w_ackw_cb),
        .o_strr_cb(w_strr_cb),
        .o_dbr_cb(w_dbr_cb),
        // depth
        .i_req_db(w_req_db),
        .i_wr_db(w_wr_db),
        .i_adrs_db(w_adrs_db),
        .o_ack_db(w_ack_db),
        .i_len_db(w_len_db),
        .i_be_db(w_be_db),
        .i_strw_db(w_strw_db),
        .i_dbw_db(w_dbw_db),
        .o_ackw_db(w_ackw_db),
        .o_strr_db(w_strr_db),
        .o_dbr_db(w_dbr_db),
        // system memory interconnect
        .o_req_m(o_req_m),
        .o_wr_m(o_wr_m),
        .o_adrs_m(o_adrs_m),
        .i_ack_m(i_ack_m),
        .o_len_m(o_len_m),
        .o_be_m(o_be_m),
        .o_strw_m(o_strw_m),
        .o_dbw_m(o_dbw_m),
        .i_ackw_m(i_ackw_m),
        .i_strr_m(i_strr_m),
        .i_dbr_m(i_dbr_m)
    );

endmodule
