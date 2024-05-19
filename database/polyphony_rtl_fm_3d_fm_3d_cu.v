// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_cu.v
//
// Abstract:
//   3D Control unit
//
//  Created:
//    27 August 2008
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
//  Revision History
//
// 2009/04/03 remove 32->24 float conversion
// 2014/03/17 dma request bugfix, fm_cmn_if_ff_out is required 

`include "fm_3d_def.v"

module fm_3d_cu (
    clk_core,
    rst_x,
    // system bus
    i_req,
    i_wr,
    i_adrs,
    o_ack,
    i_len,
    i_be,
    i_dbw,
    o_strr,
    o_dbr,
    // triangle data
    o_valid,
    o_ml,
    o_vtx0_x,
    o_vtx0_y,
    o_vtx0_z,
    o_vtx0_iw,
    o_vtx0_p00,
    o_vtx0_p01,
    o_vtx0_p02,
    o_vtx0_p03,
    o_vtx0_p10,
    o_vtx0_p11,
`ifdef VTX_PARAM1_REDUCE
`else
    o_vtx0_p12,
    o_vtx0_p13,
`endif
    o_vtx1_x,
    o_vtx1_y,
    o_vtx1_z,
    o_vtx1_iw,
    o_vtx1_p00,
    o_vtx1_p01,
    o_vtx1_p02,
    o_vtx1_p03,
    o_vtx1_p10,
    o_vtx1_p11,
`ifdef VTX_PARAM1_REDUCE
`else
    o_vtx1_p12,
    o_vtx1_p13,
`endif
    o_vtx2_x,
    o_vtx2_y,
    o_vtx2_z,
    o_vtx2_iw,
    o_vtx2_p00,
    o_vtx2_p01,
    o_vtx2_p02,
    o_vtx2_p03,
    o_vtx2_p10,
    o_vtx2_p11,
`ifdef VTX_PARAM1_REDUCE
`else
    o_vtx2_p12,
    o_vtx2_p13,
`endif
    i_ack,
    // configuration registers
    o_aa_en,
    o_attr0_en,
    o_attr0_kind,
    o_attr0_size,
    o_attr1_en,
    o_attr1_kind,
    o_attr1_size,
    o_tex_enable,
    o_tex_format,
    o_tex_offset,
    o_tex_width_m1_f,
    o_tex_height_m1_f,
    o_tex_width_ui,
    o_tex_blend_enable,
    o_color_offset,
    o_color_ms_offset,
    o_depth_offset,
    o_depth_ms_offset,
    o_depth_test_en,
    o_depth_mask,
    o_depth_func,
    o_color_blend_en,
    o_color_blend_eq,
    o_color_blend_sf,
    o_color_blend_df,
    o_color_mask,
    o_screen_flip,
    o_ag_mode,
    o_cache_init,
    o_cache_flush,
    i_flush_done,
    // idle state indicator
    i_idle_ru,
    i_idle_tu,
    i_idle_pu,
    // to system configuration
    o_vtx_int,
    // dma access
    o_req_dma,
    o_adrs_dma,
    o_len_dma,
    i_ack_dma,
    i_strr_dma,
    i_dbr_dma,
    // debug port
    o_idle,
    o_ff,
    o_fe
);
`include "polyphony_params.v"
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // system bus
    input         i_req;
    input         i_wr;
    input  [21:0] i_adrs;
    output        o_ack;
    input  [5:0]  i_len;
    input  [3:0]  i_be;
    input  [31:0] i_dbw;
    output        o_strr;
    output [31:0] o_dbr;
    // debug port
    output        o_idle;
    output [15:0] o_ff;
    output [4:0]  o_fe;

    // triangle data
    output        o_valid;
    output        o_ml;
    output [20:0] o_vtx0_x;  // 1.5.16
    output [20:0] o_vtx0_y;
    output [20:0] o_vtx0_z;
    output [20:0] o_vtx0_iw;
    output [20:0] o_vtx0_p00;
    output [20:0] o_vtx0_p01;
    output [20:0] o_vtx0_p02;
    output [20:0] o_vtx0_p03;
    output [20:0] o_vtx0_p10;
    output [20:0] o_vtx0_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_vtx0_p12;
    output [20:0] o_vtx0_p13;
`endif

    output [20:0] o_vtx1_x;
    output [20:0] o_vtx1_y;
    output [20:0] o_vtx1_z;
    output [20:0] o_vtx1_iw;
    output [20:0] o_vtx1_p00;
    output [20:0] o_vtx1_p01;
    output [20:0] o_vtx1_p02;
    output [20:0] o_vtx1_p03;
    output [20:0] o_vtx1_p10;
    output [20:0] o_vtx1_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_vtx1_p12;
    output [20:0] o_vtx1_p13;
`endif

    output [20:0] o_vtx2_x;
    output [20:0] o_vtx2_y;
    output [20:0] o_vtx2_z;
    output [20:0] o_vtx2_iw;
    output [20:0] o_vtx2_p00;
    output [20:0] o_vtx2_p01;
    output [20:0] o_vtx2_p02;
    output [20:0] o_vtx2_p03;
    output [20:0] o_vtx2_p10;
    output [20:0] o_vtx2_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_vtx2_p12;
    output [20:0] o_vtx2_p13;
`endif

    input         i_ack;
    // configuration registers
    output        o_aa_en;
    output        o_attr0_en;
    output [1:0]  o_attr0_kind;
    output [1:0]  o_attr0_size;
    output        o_attr1_en;
    output [1:0]  o_attr1_kind;
    output [1:0]  o_attr1_size;
    output        o_tex_enable;
    output [2:0]  o_tex_format;
    output [11:0]
                  o_tex_offset;
    output [21:0] o_tex_width_m1_f;
    output [21:0] o_tex_height_m1_f;
    output [11:0] o_tex_width_ui;
    output        o_tex_blend_enable;
    output        o_depth_test_en;
    output        o_depth_mask;
    output [2:0]  o_depth_func;
    output        o_color_blend_en;
    output [2:0]  o_color_blend_eq;
    output [3:0]  o_color_blend_sf;
    output [3:0]  o_color_blend_df;
    output [3:0]  o_color_mask;
    output [11:0]
                  o_color_offset;
    output [11:0]
                  o_color_ms_offset;
    output [11:0]
                  o_depth_offset;
    output [11:0]
                  o_depth_ms_offset;
    output        o_screen_flip;
    output        o_ag_mode;
    output        o_cache_init;
    output        o_cache_flush;
    input         i_flush_done;
    // idle state indicator
    input         i_idle_ru;
    input         i_idle_tu;
    input         i_idle_pu;
    // to system configuration
    output        o_vtx_int;
    // dma access
    output        o_req_dma;
    output [P_IB_ADDR_WIDTH-1:0]
                  o_adrs_dma;
    output [P_IB_LEN_WIDTH-1:0]
                  o_len_dma;
    input         i_ack_dma;
    input         i_strr_dma;
    input  [P_IB_DATA_WIDTH-1:0]
                  i_dbr_dma;

/////////////////////////
//  register definition
/////////////////////////
    reg           r_render_start;

    reg           r_ml;
    reg    [20:0] r_vtx0_x;  // 1.5.16
    reg    [20:0] r_vtx0_y;
    reg    [20:0] r_vtx0_z;
    reg    [20:0] r_vtx0_iw;
    reg    [20:0] r_vtx0_p00;
    reg    [20:0] r_vtx0_p01;
    reg    [20:0] r_vtx0_p02;
    reg    [20:0] r_vtx0_p03;
    reg    [20:0] r_vtx0_p10;
    reg    [20:0] r_vtx0_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    reg    [20:0] r_vtx0_p12;
    reg    [20:0] r_vtx0_p13;
`endif
    reg    [20:0] r_vtx1_x;
    reg    [20:0] r_vtx1_y;
    reg    [20:0] r_vtx1_z;
    reg    [20:0] r_vtx1_iw;
    reg    [20:0] r_vtx1_p00;
    reg    [20:0] r_vtx1_p01;
    reg    [20:0] r_vtx1_p02;
    reg    [20:0] r_vtx1_p03;
    reg    [20:0] r_vtx1_p10;
    reg    [20:0] r_vtx1_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    reg    [20:0] r_vtx1_p12;
    reg    [20:0] r_vtx1_p13;
`endif
    reg    [20:0] r_vtx2_x;
    reg    [20:0] r_vtx2_y;
    reg    [20:0] r_vtx2_z;
    reg    [20:0] r_vtx2_iw;
    reg    [20:0] r_vtx2_p00;
    reg    [20:0] r_vtx2_p01;
    reg    [20:0] r_vtx2_p02;
    reg    [20:0] r_vtx2_p03;
    reg    [20:0] r_vtx2_p10;
    reg    [20:0] r_vtx2_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    reg    [20:0] r_vtx2_p12;
    reg    [20:0] r_vtx2_p13;
`endif
    // configuration registers
    reg           r_aa_en;
    reg           r_tex_enable;
    reg    [2:0]  r_tex_format;
    reg    [11:0]
                  r_tex_offset;
    reg    [21:0] r_tex_width_m1_f;
    reg    [21:0] r_tex_height_m1_f;
    reg    [11:0] r_tex_width_ui;
    reg           r_tex_blend_enable;
    reg           r_depth_test_en;
    reg           r_depth_mask;
    reg    [2:0]  r_depth_func;
    reg           r_color_blend_en;
    reg    [2:0]  r_color_blend_eq;
    reg    [3:0]  r_color_blend_sf;
    reg    [3:0]  r_color_blend_df;
    reg    [3:0]  r_color_mask;
    reg    [11:0]
                  r_color_offset;
    reg    [11:0]
                  r_color_ms_offset;
    reg    [11:0]
                  r_depth_offset;
    reg    [11:0]
                  r_depth_ms_offset;
    reg           r_screen_flip;
    reg           r_ag_mode;
    reg           r_cache_init;
    reg           r_cache_flush;
    reg           r_attr0_en;
    reg    [1:0]  r_attr0_kind;
    reg    [1:0]  r_attr0_size;
    reg           r_attr1_en;
    reg    [1:0]  r_attr1_kind;
    reg    [1:0]  r_attr1_size;
    reg           r_strr;
    reg    [31:0] r_dbr;

    reg    [15:0] r_vtx_top_adrs;
    reg    [20:0] r_total_size;
    reg    [15:0] r_num_of_tris;
    reg    [4:0]  r_num_of_elements;
    reg           r_dma_start;
    reg           r_dma_int;

/////////////////////////
//  wire definition
/////////////////////////
    // system bus
    wire          w_req;
    wire          w_wr;
    wire   [21:0] w_adrs;
    wire          w_ack;
    wire   [3:0]  w_be;
    wire   [31:0] w_dbw;

    wire          w_req_dma;
    wire   [21:0] w_adrs_dma;
    wire   [31:0] w_dbw_dma;

    wire           w_hit_reg_00;
    wire           w_hit_reg_04;
    wire           w_hit_reg_08;
    wire           w_hit_reg_0c;
    wire           w_hit_reg_10;
    wire           w_hit_reg_14;
    wire           w_hit_reg_18;

    wire           w_hit_reg_20;
    wire           w_hit_reg_24;
    wire           w_hit_reg_28;
    wire           w_hit_reg_2c;
    wire           w_hit_reg_30;
    wire           w_hit_reg_34;
    wire           w_hit_reg_40;
    wire           w_hit_reg_44;
    wire           w_hit_reg_48;
    wire           w_hit_reg_4c;
    wire           w_hit_reg_50;
    wire           w_hit_reg_54;
    wire           w_hit_reg_58;

    wire           w_hit_reg_60;
    wire           w_hit_reg_64;
    wire           w_hit_reg_68;
    wire           w_hit_reg_6c;
    wire           w_hit_reg_70;
    wire           w_hit_reg_74;
    wire           w_hit_reg_78;

    wire           w_hit_reg_80;
    wire           w_hit_reg_84;
    wire           w_hit_reg_88;
    wire           w_hit_reg_8c;
    wire           w_hit_reg_90;
    wire           w_hit_reg_94;
    wire           w_hit_reg_98;
    wire           w_hit_reg_9c;
    wire           w_hit_reg_a0;
    wire           w_hit_reg_a4;
    wire           w_hit_reg_a8;
    wire           w_hit_reg_ac;
    wire           w_hit_reg_b0;
    wire           w_hit_reg_b4;


    wire           w_hit_reg_00_w;
    wire           w_hit_reg_04_w;
    wire           w_hit_reg_08_w;
    wire           w_hit_reg_0c_w;
    wire           w_hit_reg_10_w;
    wire           w_hit_reg_14_w;
    wire           w_hit_reg_18_w;

    wire           w_hit_reg_20_w;
    wire           w_hit_reg_24_w;
    wire           w_hit_reg_28_w;
    wire           w_hit_reg_2c_w;
    wire           w_hit_reg_30_w;
    wire           w_hit_reg_34_w;
    wire           w_hit_reg_40_w;
    wire           w_hit_reg_44_w;
    wire           w_hit_reg_48_w;
    wire           w_hit_reg_4c_w;
    wire           w_hit_reg_50_w;
    wire           w_hit_reg_54_w;
    wire           w_hit_reg_58_w;

    wire           w_hit_reg_60_w;
    wire           w_hit_reg_64_w;
    wire           w_hit_reg_68_w;
    wire           w_hit_reg_6c_w;
    wire           w_hit_reg_70_w;
    wire           w_hit_reg_74_w;
    wire           w_hit_reg_78_w;

    wire           w_hit_reg_80_w;
    wire           w_hit_reg_84_w;
    wire           w_hit_reg_88_w;
    wire           w_hit_reg_8c_w;
    wire           w_hit_reg_90_w;
    wire           w_hit_reg_94_w;
    wire           w_hit_reg_98_w;
    wire           w_hit_reg_9c_w;
    wire           w_hit_reg_a0_w;
    wire           w_hit_reg_a4_w;
    wire           w_hit_reg_a8_w;
    wire           w_hit_reg_ac_w;
    wire           w_hit_reg_b0_w;
    wire           w_hit_reg_b4_w;

    wire           w_hit_vtx_40;
    wire           w_hit_vtx_44;
    wire           w_hit_vtx_48;
    wire           w_hit_vtx_4c;
    wire           w_hit_vtx_50;
    wire           w_hit_vtx_54;
    wire           w_hit_vtx_58;
    wire           w_hit_vtx_5c;
    wire           w_hit_vtx_60;
    wire           w_hit_vtx_64;
`ifdef VTX_PARAM1_REDUCE
`else
    wire           w_hit_vtx_68;
    wire           w_hit_vtx_6c;
`endif

    wire           w_hit_vtx_80;
    wire           w_hit_vtx_84;
    wire           w_hit_vtx_88;
    wire           w_hit_vtx_8c;
    wire           w_hit_vtx_90;
    wire           w_hit_vtx_94;
    wire           w_hit_vtx_98;
    wire           w_hit_vtx_9c;
    wire           w_hit_vtx_a0;
    wire           w_hit_vtx_a4;
`ifdef VTX_PARAM1_REDUCE
`else
    wire           w_hit_vtx_a8;
    wire           w_hit_vtx_ac;
`endif

    wire           w_hit_vtx_c0;
    wire           w_hit_vtx_c4;
    wire           w_hit_vtx_c8;
    wire           w_hit_vtx_cc;
    wire           w_hit_vtx_d0;
    wire           w_hit_vtx_d4;
    wire           w_hit_vtx_d8;
    wire           w_hit_vtx_dc;
    wire           w_hit_vtx_e0;
    wire           w_hit_vtx_e4;
`ifdef VTX_PARAM1_REDUCE
`else
    wire           w_hit_vtx_e8;
    wire           w_hit_vtx_ec;
`endif

    wire           w_hit_vtx_40_w;
    wire           w_hit_vtx_44_w;
    wire           w_hit_vtx_48_w;
    wire           w_hit_vtx_4c_w;
    wire           w_hit_vtx_50_w;
    wire           w_hit_vtx_54_w;
    wire           w_hit_vtx_58_w;
    wire           w_hit_vtx_5c_w;
    wire           w_hit_vtx_60_w;
    wire           w_hit_vtx_64_w;
`ifdef VTX_PARAM1_REDUCE
`else
    wire           w_hit_vtx_68_w;
    wire           w_hit_vtx_6c_w;
`endif

    wire           w_hit_vtx_80_w;
    wire           w_hit_vtx_84_w;
    wire           w_hit_vtx_88_w;
    wire           w_hit_vtx_8c_w;
    wire           w_hit_vtx_90_w;
    wire           w_hit_vtx_94_w;
    wire           w_hit_vtx_98_w;
    wire           w_hit_vtx_9c_w;
    wire           w_hit_vtx_a0_w;
    wire           w_hit_vtx_a4_w;
`ifdef VTX_PARAM1_REDUCE
`else
    wire           w_hit_vtx_a8_w;
    wire           w_hit_vtx_ac_w;
`endif

    wire           w_hit_vtx_c0_w;
    wire           w_hit_vtx_c4_w;
    wire           w_hit_vtx_c8_w;
    wire           w_hit_vtx_cc_w;
    wire           w_hit_vtx_d0_w;
    wire           w_hit_vtx_d4_w;
    wire           w_hit_vtx_d8_w;
    wire           w_hit_vtx_dc_w;
    wire           w_hit_vtx_e0_w;
    wire           w_hit_vtx_e4_w;
`ifdef VTX_PARAM1_REDUCE
`else
    wire           w_hit_vtx_e8_w;
    wire           w_hit_vtx_ec_w;
`endif

    wire           w_base_vtx_hit;
    wire           w_base_reg_hit;
    wire   [21:0]  w_f22;

    wire           w_strr;
    wire   [31:0]  w_dbr;
    wire           w_ack_t;

    wire   [31:0]  w_f32;

    wire           w_dma_render_start;
    wire           w_dma_end;
    wire           w_render_idle;
    // fm_3d_vtx_dma - u_ff_out
    wire           w_req_mem;
    wire   [P_IB_ADDR_WIDTH-1:0]
                   w_adrs_mem;
    wire   [P_IB_LEN_WIDTH-1:0]
                   w_len_mem;
    wire           w_ack_mem;
    wire           w_strr_mem;
    wire   [P_IB_DATA_WIDTH-1:0]
                   w_dbr_mem;
/////////////////////////
//  assign statement
/////////////////////////
    assign w_render_idle = i_idle_ru & i_idle_tu & i_idle_pu;
    assign o_idle = w_render_idle;

    assign w_ack_t  = w_wr ? !r_render_start : 1'b1;
    assign w_ack = w_req & w_ack_t;
    assign o_valid = r_render_start | w_dma_render_start;
    assign w_base_reg_hit = (w_adrs[8] == 1'b0);
    assign w_base_vtx_hit = (w_adrs[8] == 1'b1);
    // registers
    assign w_hit_reg_00 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_START >> 2));
    assign w_hit_reg_04 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_CACHE_CONTROL >> 2));
    assign w_hit_reg_08 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_VTX_TOP_ADRS >> 2));
    assign w_hit_reg_0c = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TOTAL_SIZE >> 2));
    assign w_hit_reg_10 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_NUM_OF_TRIS >> 2));
    assign w_hit_reg_14 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_NUM_OF_ELEMENTS >> 2));
    assign w_hit_reg_18 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_DMA_CTRL >> 2));

    assign w_hit_reg_20 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TEX0_OFFSET >> 2));
    assign w_hit_reg_24 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TEX0_WIDTH_M1 >> 2));
    assign w_hit_reg_28 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TEX0_HEIGHT_M1 >> 2));
    assign w_hit_reg_2c = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TEX0_WIDTH_UI >> 2));
    assign w_hit_reg_30 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TEX0_BCOLOR >> 2));
    assign w_hit_reg_34 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TEX0_CONFIG >> 2));
    assign w_hit_reg_40 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TEX1_OFFSET >> 2));
    assign w_hit_reg_44 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TEX1_WIDTH_M1 >> 2));
    assign w_hit_reg_48 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TEX1_HEIGHT_M1 >> 2));
    assign w_hit_reg_4c = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TEX1_WIDTH_UI >> 2));
    assign w_hit_reg_50 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TEX1_BCOLOR >> 2));
    assign w_hit_reg_54 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TEX1_CONFIG >> 2));
    assign w_hit_reg_58 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TEX_CTRL >> 2));
    assign w_hit_reg_78 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_TBLEND_CTRL >> 2));

    assign w_hit_reg_80 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_SCREEN_MODE >> 2));
    assign w_hit_reg_84 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_COLOR_OFFSET >> 2));
    assign w_hit_reg_88 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_COLOR_MS_OFFSET >> 2));
    assign w_hit_reg_8c = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_DEPTH_OFFSET >> 2));
    assign w_hit_reg_90 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_DEPTH_MS_OFFSET >> 2));
    assign w_hit_reg_94 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_BLEND_OP >> 2));
    assign w_hit_reg_98 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_BLEND_CONST >> 2));
    assign w_hit_reg_9c = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_LOGIC_OP >> 2));
    assign w_hit_reg_a0 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_ALPHA_TEST >> 2));
    assign w_hit_reg_a4 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_STENCIL_TEST >> 2));
    assign w_hit_reg_a8 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_STENCIL_REF >> 2));
    assign w_hit_reg_ac = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_DEPTH_TEST >> 2));
    assign w_hit_reg_b0 = w_base_reg_hit & (w_adrs[7:2] == (`RENDER_COLOR_MASK >> 2));
    assign w_hit_reg_b4 = w_base_reg_hit & (w_adrs[7:2] == (`ATTR_CONFIG >> 2));

    // write strobes
    assign w_hit_reg_00_w = w_req & w_wr & w_hit_reg_00;
    assign w_hit_reg_04_w = w_req & w_wr & w_hit_reg_04;
    assign w_hit_reg_08_w = w_req & w_wr & w_hit_reg_08;
    assign w_hit_reg_0c_w = w_req & w_wr & w_hit_reg_0c;
    assign w_hit_reg_10_w = w_req & w_wr & w_hit_reg_10;
    assign w_hit_reg_14_w = w_req & w_wr & w_hit_reg_14;
    assign w_hit_reg_18_w = w_req & w_wr & w_hit_reg_18;
    assign w_hit_reg_20_w = w_req & w_wr & w_hit_reg_20;
    assign w_hit_reg_24_w = w_req & w_wr & w_hit_reg_24;
    assign w_hit_reg_28_w = w_req & w_wr & w_hit_reg_28;
    assign w_hit_reg_2c_w = w_req & w_wr & w_hit_reg_2c;
    assign w_hit_reg_30_w = w_req & w_wr & w_hit_reg_30;
    assign w_hit_reg_34_w = w_req & w_wr & w_hit_reg_34;
    assign w_hit_reg_40_w = w_req & w_wr & w_hit_reg_40;
    assign w_hit_reg_44_w = w_req & w_wr & w_hit_reg_44;
    assign w_hit_reg_48_w = w_req & w_wr & w_hit_reg_48;
    assign w_hit_reg_4c_w = w_req & w_wr & w_hit_reg_4c;
    assign w_hit_reg_50_w = w_req & w_wr & w_hit_reg_50;
    assign w_hit_reg_54_w = w_req & w_wr & w_hit_reg_54;
    assign w_hit_reg_58_w = w_req & w_wr & w_hit_reg_58;
    assign w_hit_reg_78_w = w_req & w_wr & w_hit_reg_78;
    assign w_hit_reg_80_w = w_req & w_wr & w_hit_reg_80;
    assign w_hit_reg_84_w = w_req & w_wr & w_hit_reg_84;
    assign w_hit_reg_88_w = w_req & w_wr & w_hit_reg_88;
    assign w_hit_reg_8c_w = w_req & w_wr & w_hit_reg_8c;
    assign w_hit_reg_90_w = w_req & w_wr & w_hit_reg_90;
    assign w_hit_reg_94_w = w_req & w_wr & w_hit_reg_94;
    assign w_hit_reg_98_w = w_req & w_wr & w_hit_reg_98;
    assign w_hit_reg_9c_w = w_req & w_wr & w_hit_reg_9c;
    assign w_hit_reg_a0_w = w_req & w_wr & w_hit_reg_a0;
    assign w_hit_reg_a4_w = w_req & w_wr & w_hit_reg_a4;
    assign w_hit_reg_a8_w = w_req & w_wr & w_hit_reg_a8;
    assign w_hit_reg_ac_w = w_req & w_wr & w_hit_reg_ac;
    assign w_hit_reg_b0_w = w_req & w_wr & w_hit_reg_b0;
    assign w_hit_reg_b4_w = w_req & w_wr & w_hit_reg_b4;

    // vertex0
    assign w_hit_vtx_40 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX0_X >> 2));
    assign w_hit_vtx_44 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX0_Y >> 2));
    assign w_hit_vtx_48 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX0_Z >> 2));
    assign w_hit_vtx_4c = w_base_vtx_hit & (w_adrs[7:2] == (`VTX0_IW >> 2));
    assign w_hit_vtx_50 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX0_P00 >> 2));
    assign w_hit_vtx_54 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX0_P01 >> 2));
    assign w_hit_vtx_58 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX0_P02 >> 2));
    assign w_hit_vtx_5c = w_base_vtx_hit & (w_adrs[7:2] == (`VTX0_P03 >> 2));
    assign w_hit_vtx_60 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX0_P10 >> 2));
    assign w_hit_vtx_64 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX0_P11 >> 2));
`ifdef VTX_PARAM1_REDUCE
`else
    assign w_hit_vtx_68 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX0_P12 >> 2));
    assign w_hit_vtx_6c = w_base_vtx_hit & (w_adrs[7:2] == (`VTX0_P13 >> 2));
`endif

    // vertex1
    assign w_hit_vtx_80 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX1_X >> 2));
    assign w_hit_vtx_84 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX1_Y >> 2));
    assign w_hit_vtx_88 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX1_Z >> 2));
    assign w_hit_vtx_8c = w_base_vtx_hit & (w_adrs[7:2] == (`VTX1_IW >> 2));
    assign w_hit_vtx_90 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX1_P00 >> 2));
    assign w_hit_vtx_94 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX1_P01 >> 2));
    assign w_hit_vtx_98 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX1_P02 >> 2));
    assign w_hit_vtx_9c = w_base_vtx_hit & (w_adrs[7:2] == (`VTX1_P03 >> 2));
    assign w_hit_vtx_a0 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX1_P10 >> 2));
    assign w_hit_vtx_a4 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX1_P11 >> 2));
`ifdef VTX_PARAM1_REDUCE
`else
    assign w_hit_vtx_a8 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX1_P12 >> 2));
    assign w_hit_vtx_ac = w_base_vtx_hit & (w_adrs[7:2] == (`VTX1_P13 >> 2));
`endif

    // vertex2
    assign w_hit_vtx_c0 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX2_X >> 2));
    assign w_hit_vtx_c4 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX2_Y >> 2));
    assign w_hit_vtx_c8 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX2_Z >> 2));
    assign w_hit_vtx_cc = w_base_vtx_hit & (w_adrs[7:2] == (`VTX2_IW >> 2));
    assign w_hit_vtx_d0 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX2_P00 >> 2));
    assign w_hit_vtx_d4 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX2_P01 >> 2));
    assign w_hit_vtx_d8 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX2_P02 >> 2));
    assign w_hit_vtx_dc = w_base_vtx_hit & (w_adrs[7:2] == (`VTX2_P03 >> 2));
    assign w_hit_vtx_e0 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX2_P10 >> 2));
    assign w_hit_vtx_e4 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX2_P11 >> 2));
`ifdef VTX_PARAM1_REDUCE
`else
    assign w_hit_vtx_e8 = w_base_vtx_hit & (w_adrs[7:2] == (`VTX2_P12 >> 2));
    assign w_hit_vtx_ec = w_base_vtx_hit & (w_adrs[7:2] == (`VTX2_P13 >> 2));
`endif

    // write strobes
    assign w_hit_vtx_40_w = w_req & w_wr & w_hit_vtx_40;
    assign w_hit_vtx_44_w = w_req & w_wr & w_hit_vtx_44;
    assign w_hit_vtx_48_w = w_req & w_wr & w_hit_vtx_48;
    assign w_hit_vtx_4c_w = w_req & w_wr & w_hit_vtx_4c;
    assign w_hit_vtx_50_w = w_req & w_wr & w_hit_vtx_50;
    assign w_hit_vtx_54_w = w_req & w_wr & w_hit_vtx_54;
    assign w_hit_vtx_58_w = w_req & w_wr & w_hit_vtx_58;
    assign w_hit_vtx_5c_w = w_req & w_wr & w_hit_vtx_5c;
    assign w_hit_vtx_60_w = w_req & w_wr & w_hit_vtx_60;
    assign w_hit_vtx_64_w = w_req & w_wr & w_hit_vtx_64;
`ifdef VTX_PARAM1_REDUCE
`else
    assign w_hit_vtx_68_w = w_req & w_wr & w_hit_vtx_68;
    assign w_hit_vtx_6c_w = w_req & w_wr & w_hit_vtx_6c;
`endif

    assign w_hit_vtx_80_w = w_req & w_wr & w_hit_vtx_80;
    assign w_hit_vtx_84_w = w_req & w_wr & w_hit_vtx_84;
    assign w_hit_vtx_88_w = w_req & w_wr & w_hit_vtx_88;
    assign w_hit_vtx_8c_w = w_req & w_wr & w_hit_vtx_8c;
    assign w_hit_vtx_90_w = w_req & w_wr & w_hit_vtx_90;
    assign w_hit_vtx_94_w = w_req & w_wr & w_hit_vtx_94;
    assign w_hit_vtx_98_w = w_req & w_wr & w_hit_vtx_98;
    assign w_hit_vtx_9c_w = w_req & w_wr & w_hit_vtx_9c;
    assign w_hit_vtx_a0_w = w_req & w_wr & w_hit_vtx_a0;
    assign w_hit_vtx_a4_w = w_req & w_wr & w_hit_vtx_a4;
`ifdef VTX_PARAM1_REDUCE
`else
    assign w_hit_vtx_a8_w = w_req & w_wr & w_hit_vtx_a8;
    assign w_hit_vtx_ac_w = w_req & w_wr & w_hit_vtx_ac;
`endif

    assign w_hit_vtx_c0_w = w_req & w_wr & w_hit_vtx_c0;
    assign w_hit_vtx_c4_w = w_req & w_wr & w_hit_vtx_c4;
    assign w_hit_vtx_c8_w = w_req & w_wr & w_hit_vtx_c8;
    assign w_hit_vtx_cc_w = w_req & w_wr & w_hit_vtx_cc;
    assign w_hit_vtx_d0_w = w_req & w_wr & w_hit_vtx_d0;
    assign w_hit_vtx_d4_w = w_req & w_wr & w_hit_vtx_d4;
    assign w_hit_vtx_d8_w = w_req & w_wr & w_hit_vtx_d8;
    assign w_hit_vtx_dc_w = w_req & w_wr & w_hit_vtx_dc;
    assign w_hit_vtx_e0_w = w_req & w_wr & w_hit_vtx_e0;
    assign w_hit_vtx_e4_w = w_req & w_wr & w_hit_vtx_e4;
`ifdef VTX_PARAM1_REDUCE
`else
    assign w_hit_vtx_e8_w = w_req & w_wr & w_hit_vtx_e8;
    assign w_hit_vtx_ec_w = w_req & w_wr & w_hit_vtx_ec;
`endif

//    assign w_f32 = (r_dma_start) ?  w_dbw_dma : w_dbw;
    assign w_f32 = w_dbw;

    assign w_strr = w_req & !w_wr;
    assign w_dbr = (w_hit_reg_00) ? {13'b0,i_idle_pu,i_idle_tu,i_idle_ru,
                                     7'b0,r_aa_en,7'b0, r_render_start} :
                   (w_hit_reg_04) ? {23'b0,r_cache_flush,7'b0, r_cache_init} :
                   (w_hit_reg_08) ? {r_vtx_top_adrs,16'b0} :
                   (w_hit_reg_0c) ? {11'b0, r_total_size} :
                   (w_hit_reg_10) ? {16'b0, r_num_of_tris} :
                   (w_hit_reg_14) ? {27'b0, r_num_of_elements} :
                   (w_hit_reg_18) ? {23'b0, r_dma_int,7'b0,r_dma_start} :
                   (w_hit_reg_20) ? {r_tex_offset,20'd0} :
                   (w_hit_reg_24) ? {10'd0,r_tex_width_m1_f} :
                   (w_hit_reg_28) ? {10'd0,r_tex_height_m1_f} :
                   (w_hit_reg_2c) ? {20'd0,r_tex_width_ui} :
                   (w_hit_reg_34) ? {21'b0,r_tex_format,8'b0} :
                   (w_hit_reg_58) ? {31'b0,r_tex_enable} :
                   (w_hit_reg_78) ? {31'b0,r_tex_blend_enable} :
                   (w_hit_reg_80) ? {23'd0, r_ag_mode,7'b0,r_screen_flip} :
                   (w_hit_reg_84) ? {r_color_offset,20'd0} :
                   (w_hit_reg_88) ? {r_color_ms_offset,20'd0} :
                   (w_hit_reg_8c) ? {r_depth_offset,20'd0} :
                   (w_hit_reg_90) ? {r_depth_ms_offset,20'd0} :
                   (w_hit_reg_94) ? {4'b0, r_color_blend_df, 4'b0, r_color_blend_sf,
                                     5'b0,r_color_blend_eq, 7'b0, r_color_blend_en} :
                   (w_hit_reg_ac) ? {13'd0, r_depth_func,7'd0,r_depth_mask,7'd0,r_depth_test_en} :
                   (w_hit_reg_b0) ? {24'd0, 1'b0,
                                     r_color_mask[0],r_color_mask[1],r_color_mask[2],
                                     3'b0,r_color_mask[3]} :
                   (w_hit_reg_b4)  ? {2'd0,r_attr1_size,2'd0, r_attr1_kind,7'd0,r_attr1_en,
                                      2'd0,r_attr0_size,2'd0, r_attr0_kind,7'd0,r_attr0_en} :
                   (w_hit_vtx_40)  ? {r_ml,10'd0,r_vtx0_x} :
                   (w_hit_vtx_44)  ? {11'd0,r_vtx0_y} :
                   (w_hit_vtx_48)  ? {11'd0,r_vtx0_z} :
                   (w_hit_vtx_4c)  ? {11'd0,r_vtx0_iw} :
                   (w_hit_vtx_50)  ? {11'd0,r_vtx0_p00} :
                   (w_hit_vtx_54)  ? {11'd0,r_vtx0_p01} :
                   (w_hit_vtx_58)  ? {11'd0,r_vtx0_p02} :
                   (w_hit_vtx_5c)  ? {11'd0,r_vtx0_p03} :
                   (w_hit_vtx_60)  ? {11'd0,r_vtx0_p10} :
                   (w_hit_vtx_64)  ? {11'd0,r_vtx0_p11} :
`ifdef VTX_PARAM1_REDUCE
`else
                   (w_hit_vtx_68)  ? {11'd0,r_vtx0_p12} :
                   (w_hit_vtx_6c)  ? {11'd0,r_vtx0_p13} :
`endif
                   (w_hit_vtx_80)  ? {r_ml,10'd0,r_vtx1_x} :
                   (w_hit_vtx_84)  ? {11'd0,r_vtx1_y} :
                   (w_hit_vtx_88)  ? {11'd0,r_vtx1_z} :
                   (w_hit_vtx_8c)  ? {11'd0,r_vtx1_iw} :
                   (w_hit_vtx_90)  ? {11'd0,r_vtx1_p00} :
                   (w_hit_vtx_94)  ? {11'd0,r_vtx1_p01} :
                   (w_hit_vtx_98)  ? {11'd0,r_vtx1_p02} :
                   (w_hit_vtx_9c)  ? {11'd0,r_vtx1_p03} :
                   (w_hit_vtx_a0)  ? {11'd0,r_vtx1_p10} :
                   (w_hit_vtx_a4)  ? {11'd0,r_vtx1_p11} :
`ifdef VTX_PARAM1_REDUCE
`else
                   (w_hit_vtx_a8)  ? {11'd0,r_vtx1_p12} :
                   (w_hit_vtx_ac)  ? {11'd0,r_vtx1_p13} :
`endif
                   (w_hit_vtx_c0)  ? {r_ml,10'd0,r_vtx2_x} :
                   (w_hit_vtx_c4)  ? {11'd0,r_vtx2_y} :
                   (w_hit_vtx_c8)  ? {11'd0,r_vtx2_z} :
                   (w_hit_vtx_cc)  ? {11'd0,r_vtx2_iw} :
                   (w_hit_vtx_d0)  ? {11'd0,r_vtx2_p00} :
                   (w_hit_vtx_d4)  ? {11'd0,r_vtx2_p01} :
                   (w_hit_vtx_d8)  ? {11'd0,r_vtx2_p02} :
                   (w_hit_vtx_dc)  ? {11'd0,r_vtx2_p03} :
                   (w_hit_vtx_e0)  ? {11'd0,r_vtx2_p10} :
                   (w_hit_vtx_e4)  ? {11'd0,r_vtx2_p11} :
`ifdef VTX_PARAM1_REDUCE
`else
                   (w_hit_vtx_e8)  ? {11'd0,r_vtx2_p12} :
                   (w_hit_vtx_ec)  ? {11'd0,r_vtx2_p13} :
`endif
                                    32'h0;
    // port connection
    assign o_vtx0_x = r_vtx0_x;
    assign o_vtx0_y = r_vtx0_y;
    assign o_vtx0_z = r_vtx0_z;
    assign o_vtx0_iw = r_vtx0_iw;
    assign o_vtx0_p00 = r_vtx0_p00;
    assign o_vtx0_p01 = r_vtx0_p01;
    assign o_vtx0_p02 = r_vtx0_p02;
    assign o_vtx0_p03 = r_vtx0_p03;
    assign o_vtx0_p10 = r_vtx0_p10;
    assign o_vtx0_p11 = r_vtx0_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    assign o_vtx0_p12 = r_vtx0_p12;
    assign o_vtx0_p13 = r_vtx0_p13;
`endif
    assign o_vtx1_x = r_vtx1_x;
    assign o_vtx1_y = r_vtx1_y;
    assign o_vtx1_z = r_vtx1_z;
    assign o_vtx1_iw = r_vtx1_iw;
    assign o_vtx1_p00 = r_vtx1_p00;
    assign o_vtx1_p01 = r_vtx1_p01;
    assign o_vtx1_p02 = r_vtx1_p02;
    assign o_vtx1_p03 = r_vtx1_p03;
    assign o_vtx1_p10 = r_vtx1_p10;
    assign o_vtx1_p11 = r_vtx1_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    assign o_vtx1_p12 = r_vtx1_p12;
    assign o_vtx1_p13 = r_vtx1_p13;
`endif
    assign o_vtx2_x = r_vtx2_x;
    assign o_vtx2_y = r_vtx2_y;
    assign o_vtx2_z = r_vtx2_z;
    assign o_vtx2_iw = r_vtx2_iw;
    assign o_vtx2_p00 = r_vtx2_p00;
    assign o_vtx2_p01 = r_vtx2_p01;
    assign o_vtx2_p02 = r_vtx2_p02;
    assign o_vtx2_p03 = r_vtx2_p03;
    assign o_vtx2_p10 = r_vtx2_p10;
    assign o_vtx2_p11 = r_vtx2_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    assign o_vtx2_p12 = r_vtx2_p12;
    assign o_vtx2_p13 = r_vtx2_p13;
`endif

    assign o_aa_en = r_aa_en;
    assign o_attr0_en = r_attr0_en;
    assign o_attr0_kind = r_attr0_kind;
    assign o_attr0_size = r_attr0_size;
    assign o_attr1_en = r_attr1_en;
    assign o_attr1_kind = r_attr1_kind;
    assign o_attr1_size = r_attr1_size;
    assign o_tex_enable = r_tex_enable;
    assign o_tex_format = r_tex_format;
    assign o_tex_offset = r_tex_offset;
    assign o_tex_width_m1_f = r_tex_width_m1_f;
    assign o_tex_height_m1_f = r_tex_height_m1_f;
    assign o_tex_width_ui = r_tex_width_ui;
    assign o_tex_blend_enable = r_tex_blend_enable;
    assign o_depth_test_en = r_depth_test_en;
    assign o_depth_mask = r_depth_mask;
    assign o_depth_func = r_depth_func;
    assign o_color_blend_en = r_color_blend_en;
    assign o_color_blend_eq = r_color_blend_eq;
    assign o_color_blend_sf = r_color_blend_sf;
    assign o_color_blend_df = r_color_blend_df;
    assign o_color_mask = r_color_mask;
    assign o_color_offset = r_color_offset;
    assign o_color_ms_offset = r_color_ms_offset;
    assign o_depth_offset = r_depth_offset;
    assign o_depth_ms_offset = r_depth_ms_offset;
    assign o_screen_flip = r_screen_flip;
    assign o_ag_mode = r_ag_mode;
    assign o_cache_init = r_cache_init;
    assign o_cache_flush = r_cache_flush;
    assign o_vtx_int = r_dma_int;
    assign o_ml = r_ml;

/////////////////////////
//  always statement
/////////////////////////

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_render_start <= 1'b0;
            r_aa_en <= 1'b0;
        end else begin
            if (w_hit_reg_00_w) begin
                if (w_be[0]) r_render_start   <= w_dbw[0];
            end else if (i_ack) begin
                r_render_start <= 1'b0;
            end
            if (w_hit_reg_00_w) begin
                if (w_be[1]) r_aa_en   <= w_dbw[8];
            end
        end
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_cache_init <= 1'b0;
        end else begin
            if (w_hit_reg_04_w) begin
                if (w_be[0]) r_cache_init <= w_dbw[0];
            end else if (r_cache_init) begin
                r_cache_init <= 1'b0;
            end
        end
    end


    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_cache_flush <= 1'b0;
        end else begin
            if (i_flush_done) begin
                r_cache_flush <= 1'b0;
            end else if (w_hit_reg_04_w) begin
                if (w_be[1]) r_cache_flush <= w_dbw[8];
            end
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_reg_08_w) begin
            r_vtx_top_adrs[7:0]  <= w_dbw[23:16];
            r_vtx_top_adrs[15:8] <= w_dbw[31:24];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_reg_0c_w) begin
            r_total_size[7:0]   <= w_dbw[7:0];
            r_total_size[15:8]  <= w_dbw[15:8];
            r_total_size[20:16]  <= w_dbw[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_reg_10_w) begin
            r_num_of_tris[7:0]   <= w_dbw[7:0];
            r_num_of_tris[15:8]  <= w_dbw[15:8];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_reg_14_w) begin
            r_num_of_elements   <= w_dbw[4:0];
        end
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_dma_start <= 1'b0;
            r_dma_int   <= 1'b0;
        end else begin
            if (w_hit_reg_18_w) begin
                if (w_be[0]) r_dma_start   <= w_dbw[0];
                if (w_be[1]) r_dma_int   <= w_dbw[8];
            end  else begin
                if (w_dma_end) begin
                    r_dma_start <= 1'b0;
                    r_dma_int <= 1'b1;
                end
            end
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_reg_20_w) begin
            r_tex_offset   <= w_dbw[31:20];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_reg_24_w) begin
            r_tex_width_m1_f[7:0]   <= w_f22[7:0];
            r_tex_width_m1_f[15:8]  <= w_f22[15:8];
            r_tex_width_m1_f[21:16] <= w_f22[21:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_reg_28_w) begin
            r_tex_height_m1_f[7:0]   <= w_f22[7:0];
            r_tex_height_m1_f[15:8]  <= w_f22[15:8];
            r_tex_height_m1_f[21:16] <= w_f22[21:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_reg_2c_w) begin
            r_tex_width_ui[7:0]   <= w_dbw[7:0];
            r_tex_width_ui[11:8]  <= w_dbw[11:8];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_reg_34_w) begin
                r_tex_format   <= w_dbw[10:8];
        end
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_tex_enable <= 1'b0;
        end else begin
            if (w_hit_reg_58_w) begin
                if (w_be[0]) r_tex_enable   <= w_dbw[0];
            end
        end
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_tex_blend_enable <= 1'b0;
        end else begin
            if (w_hit_reg_78_w) begin
                if (w_be[0]) r_tex_blend_enable   <= w_dbw[0];
            end
        end
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_screen_flip <= 1'b0;
            r_ag_mode <= 1'b0;
        end else begin
            if (w_hit_reg_80_w) begin
                if (w_be[0]) r_screen_flip   <= w_dbw[0];
                if (w_be[1]) r_ag_mode   <= w_dbw[8];
            end
        end
    end


    always @(posedge clk_core) begin
        if (w_hit_reg_84_w) begin
            r_color_offset   <= w_dbw[31:20];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_reg_88_w) begin
            r_color_ms_offset   <= w_dbw[31:20];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_reg_8c_w) begin
            r_depth_offset   <= w_dbw[31:20];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_reg_90_w) begin
            r_depth_ms_offset   <= w_dbw[31:20];
        end
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_color_blend_en <= 1'b0;
        end else begin
            if (w_hit_reg_94_w) begin
                if (w_be[0]) r_color_blend_en <= w_dbw[0];
                if (w_be[1]) r_color_blend_eq <= w_dbw[10:8];
                if (w_be[2]) r_color_blend_sf <= w_dbw[19:16];
                if (w_be[3]) r_color_blend_df <= w_dbw[27:24];
            end
        end
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_depth_test_en <= 1'b0;
            r_depth_mask <= 1'b0;
            r_depth_func <= 3'd0;  // LESS
        end else begin
            if (w_hit_reg_ac_w) begin
                if (w_be[0]) r_depth_test_en   <= w_dbw[0];
                if (w_be[1]) r_depth_mask      <= w_dbw[8];
                if (w_be[2]) r_depth_func     <= w_dbw[18:16];
            end
        end
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_color_mask <= 4'hf;  // all enable
        end else begin
            if (w_hit_reg_b0_w) begin
                if (w_be[0]) begin
                    r_color_mask[0]   <= w_dbw[6];  // red
                    r_color_mask[1]   <= w_dbw[5];  // green
                    r_color_mask[2]   <= w_dbw[4];  // blue
                    r_color_mask[3]   <= w_dbw[0];  // alpha
                end
            end
        end
    end

    // Vertex configuration
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_attr0_en <= 1'b0;
            r_attr1_en <= 1'b0;
        end else begin
            if (w_hit_reg_b4_w) begin
                if (w_be[0]) r_attr0_en   <= w_dbw[0];
                if (w_be[2]) r_attr1_en   <= w_dbw[16];
            end
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_reg_b4_w) begin
                if (w_be[1]) r_attr0_kind   <= w_dbw[9:8];
                if (w_be[1]) r_attr0_size   <= w_dbw[13:12];
                if (w_be[3]) r_attr1_kind   <= w_dbw[25:24];
                if (w_be[3]) r_attr1_size   <= w_dbw[29:28];
        end
    end

    // Vertex0
    always @(posedge clk_core) begin
        if (w_hit_vtx_40_w) begin
            r_vtx0_x[7:0]   <= w_f22[7:0];
            r_vtx0_x[15:8]  <= w_f22[15:8];
            r_vtx0_x[20:16] <= w_f22[20:16];  // ignore sign bit
         end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_40_w) begin
            r_ml <= w_f32[31];     // ml=1 : middle point is left, ml=0: middle point is right
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_44_w) begin
            r_vtx0_y[7:0]   <= w_f22[7:0];
            r_vtx0_y[15:8]  <= w_f22[15:8];
            r_vtx0_y[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_48_w) begin
            r_vtx0_z[7:0]   <= w_f22[7:0];
            r_vtx0_z[15:8]  <= w_f22[15:8];
            r_vtx0_z[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_4c_w) begin
            r_vtx0_iw[7:0]   <= w_f22[7:0];
            r_vtx0_iw[15:8]  <= w_f22[15:8];
            r_vtx0_iw[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_50_w) begin
            r_vtx0_p00[7:0]   <= w_f22[7:0];
            r_vtx0_p00[15:8]  <= w_f22[15:8];
            r_vtx0_p00[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_54_w) begin
            r_vtx0_p01[7:0]   <= w_f22[7:0];
            r_vtx0_p01[15:8]  <= w_f22[15:8];
            r_vtx0_p01[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_58_w) begin
            r_vtx0_p02[7:0]   <= w_f22[7:0];
            r_vtx0_p02[15:8]  <= w_f22[15:8];
            r_vtx0_p02[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_5c_w) begin
            r_vtx0_p03[7:0]   <= w_f22[7:0];
            r_vtx0_p03[15:8]  <= w_f22[15:8];
            r_vtx0_p03[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_60_w) begin
            r_vtx0_p10[7:0]   <= w_f22[7:0];
            r_vtx0_p10[15:8]  <= w_f22[15:8];
            r_vtx0_p10[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_64_w) begin
            r_vtx0_p11[7:0]   <= w_f22[7:0];
            r_vtx0_p11[15:8]  <= w_f22[15:8];
            r_vtx0_p11[20:16] <= w_f22[20:16];
        end
    end

`ifdef VTX_PARAM1_REDUCE
`else
    always @(posedge clk_core) begin
        if (w_hit_vtx_68_w) begin
            r_vtx0_p12[7:0]   <= w_f22[7:0];
            r_vtx0_p12[15:8]  <= w_f22[15:8];
            r_vtx0_p12[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_6c_w) begin
            r_vtx0_p13[7:0]   <= w_f22[7:0];
            r_vtx0_p13[15:8]  <= w_f22[15:8];
            r_vtx0_p13[20:16] <= w_f22[20:16];
        end
    end
`endif
    // Vertex1
    always @(posedge clk_core) begin
        if (w_hit_vtx_80_w) begin
            r_vtx1_x[7:0]   <= w_f22[7:0];
            r_vtx1_x[15:8]  <= w_f22[15:8];
            r_vtx1_x[20:16] <= w_f22[20:16];  // ignore sign bit
         end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_84_w) begin
            r_vtx1_y[7:0]   <= w_f22[7:0];
            r_vtx1_y[15:8]  <= w_f22[15:8];
            r_vtx1_y[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_88_w) begin
            r_vtx1_z[7:0]   <= w_f22[7:0];
            r_vtx1_z[15:8]  <= w_f22[15:8];
            r_vtx1_z[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_8c_w) begin
            r_vtx1_iw[7:0]   <= w_f22[7:0];
            r_vtx1_iw[15:8]  <= w_f22[15:8];
            r_vtx1_iw[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_90_w) begin
            r_vtx1_p00[7:0]   <= w_f22[7:0];
            r_vtx1_p00[15:8]  <= w_f22[15:8];
            r_vtx1_p00[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_94_w) begin
            r_vtx1_p01[7:0]   <= w_f22[7:0];
            r_vtx1_p01[15:8]  <= w_f22[15:8];
            r_vtx1_p01[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_98_w) begin
            r_vtx1_p02[7:0]   <= w_f22[7:0];
            r_vtx1_p02[15:8]  <= w_f22[15:8];
            r_vtx1_p02[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_9c_w) begin
            r_vtx1_p03[7:0]   <= w_f22[7:0];
            r_vtx1_p03[15:8]  <= w_f22[15:8];
            r_vtx1_p03[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_a0_w) begin
            r_vtx1_p10[7:0]   <= w_f22[7:0];
            r_vtx1_p10[15:8]  <= w_f22[15:8];
            r_vtx1_p10[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_a4_w) begin
            r_vtx1_p11[7:0]   <= w_f22[7:0];
            r_vtx1_p11[15:8]  <= w_f22[15:8];
            r_vtx1_p11[20:16] <= w_f22[20:16];
        end
    end

`ifdef VTX_PARAM1_REDUCE
`else
    always @(posedge clk_core) begin
        if (w_hit_vtx_a8_w) begin
            r_vtx1_p12[7:0]   <= w_f22[7:0];
            r_vtx1_p12[15:8]  <= w_f22[15:8];
            r_vtx1_p12[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_ac_w) begin
            r_vtx1_p13[7:0]   <= w_f22[7:0];
            r_vtx1_p13[15:8]  <= w_f22[15:8];
            r_vtx1_p13[20:16] <= w_f22[20:16];
        end
    end
`endif
    // Vertex2
    always @(posedge clk_core) begin
        if (w_hit_vtx_c0_w) begin
            r_vtx2_x[7:0]   <= w_f22[7:0];
            r_vtx2_x[15:8]  <= w_f22[15:8];
            r_vtx2_x[20:16] <= w_f22[20:16];  // ignore sign bit
         end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_c4_w) begin
            r_vtx2_y[7:0]   <= w_f22[7:0];
            r_vtx2_y[15:8]  <= w_f22[15:8];
            r_vtx2_y[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_c8_w) begin
            r_vtx2_z[7:0]   <= w_f22[7:0];
            r_vtx2_z[15:8]  <= w_f22[15:8];
            r_vtx2_z[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_cc_w) begin
            r_vtx2_iw[7:0]   <= w_f22[7:0];
            r_vtx2_iw[15:8]  <= w_f22[15:8];
            r_vtx2_iw[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_d0_w) begin
            r_vtx2_p00[7:0]   <= w_f22[7:0];
            r_vtx2_p00[15:8]  <= w_f22[15:8];
            r_vtx2_p00[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_d4_w) begin
            r_vtx2_p01[7:0]   <= w_f22[7:0];
            r_vtx2_p01[15:8]  <= w_f22[15:8];
            r_vtx2_p01[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_d8_w) begin
            r_vtx2_p02[7:0]   <= w_f22[7:0];
            r_vtx2_p02[15:8]  <= w_f22[15:8];
            r_vtx2_p02[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_dc_w) begin
            r_vtx2_p03[7:0]   <= w_f22[7:0];
            r_vtx2_p03[15:8]  <= w_f22[15:8];
            r_vtx2_p03[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_e0_w) begin
            r_vtx2_p10[7:0]   <= w_f22[7:0];
            r_vtx2_p10[15:8]  <= w_f22[15:8];
            r_vtx2_p10[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_e4_w) begin
            r_vtx2_p11[7:0]   <= w_f22[7:0];
            r_vtx2_p11[15:8]  <= w_f22[15:8];
            r_vtx2_p11[20:16] <= w_f22[20:16];
        end
    end

`ifdef VTX_PARAM1_REDUCE
`else
    always @(posedge clk_core) begin
        if (w_hit_vtx_e8_w) begin
            r_vtx2_p12[7:0]   <= w_f22[7:0];
            r_vtx2_p12[15:8]  <= w_f22[15:8];
            r_vtx2_p12[20:16] <= w_f22[20:16];
        end
    end

    always @(posedge clk_core) begin
        if (w_hit_vtx_ec_w) begin
            r_vtx2_p13[7:0]   <= w_f22[7:0];
            r_vtx2_p13[15:8]  <= w_f22[15:8];
            r_vtx2_p13[20:16] <= w_f22[20:16];
        end
    end
`endif

    always @(posedge clk_core) begin
        r_dbr <= w_dbr;
    end

    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_strr <= 1'b0;
        end else begin
            r_strr <= w_strr;
        end
    end

/////////////////////////
//  module instance
/////////////////////////
    // Bus selecter
    fm_3d_cu_bselect fm_3d_cu_bselect (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // system bus
        .i_req_sys(i_req),
        .i_wr_sys(i_wr),
        .i_adrs_sys(i_adrs),
        .o_ack_sys(o_ack),
        .i_be_sys(i_be),
        .i_dbw_sys(i_dbw),
        .o_strr_sys(o_strr),
        .o_dbr_sys(o_dbr),
        // DMA bus
        .i_req_dma(w_req_dma),
        .i_adrs_dma(w_adrs_dma),
        .i_dbw_dma(w_dbw_dma),
        // internal bus side
        .o_req(w_req),
        .o_wr(w_wr),
        .o_adrs(w_adrs),
        .i_ack(w_ack),
        .o_be(w_be),
        .o_dbw(w_dbw),
        .i_strr(r_strr),
        .i_dbr(r_dbr)
    );


`ifdef USE_FLOAT32_IN
    fm_3d_fcnv fm_3d_fcnv (
        .i_f32(w_f32),
        .o_f22(w_f22)
    );
`else
    assign w_f22 = w_f32[21:0];
`endif

`ifdef PP_BUSWIDTH_64
`else
  wire w_req_sp;
  wire [P_IB_ADDR_WIDTH-1:0]
       w_adrs_sp;
  wire [P_IB_LEN_WIDTH-1:0]
       w_len_sp;
  wire w_ack_sp;
fm_rd_split fm_rd_split (
    .clk_core(clk_core),
    .rst_x(rst_x),
    .i_req(w_req_mem),
    .i_adrs(w_adrs_mem),
    .i_len(w_len_mem),
    .o_ack(w_ack_mem),
    // dram if
    .o_req(w_req_sp),
    .o_adrs(w_adrs_sp),
    .o_len(w_len_sp),
    .i_ack(w_ack_sp)
);

`endif
   
    wire [1:0] w_error;
    fm_3d_vtx_dma fm_3d_vtx_dma (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // system port
        .i_dma_start(r_dma_start),
        .o_dma_end(w_dma_end),
        .i_vtx_top_address(r_vtx_top_adrs),
        .i_total_size(r_total_size),
        .i_num_of_tris(r_num_of_tris),
        .i_num_of_elements(r_num_of_elements),
        .i_attr0_en(r_attr0_en),
        .i_attr0_size(r_attr0_size),
        .i_attr1_en(r_attr1_en),
        .i_attr1_size(r_attr1_size),
        // register control
        .o_render_start(w_dma_render_start),
        .i_render_ack(i_ack),
        .i_render_idle(w_render_idle),
        .o_req_dma(w_req_dma),
        .o_adrs_dma(w_adrs_dma),
        .o_dbw_dma(w_dbw_dma),
        // memory port
        .o_req(w_req_mem),
        .o_adrs(w_adrs_mem),
        .o_len(w_len_mem),
        .i_ack(w_ack_mem),
        .i_strr(w_strr_mem),
        .i_dbr(w_dbr_mem),
        // debug port
        .i_idle_ru(i_idle_ru),
        .i_idle_tu(i_idle_tu),
        .i_idle_pu(i_idle_pu),
        .o_error(w_error),
        .o_ff(o_ff),
        .o_fe(o_fe)
  );

  fm_cmn_if_ff_out #(P_IB_ADDR_WIDTH,
                     P_IB_DATA_WIDTH,
                     P_IB_LEN_WIDTH) u_ff_out (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // local interface
`ifdef PP_BUSWIDTH_64
        .i_req(w_req_mem),
        .i_wr(1'b0),
        .i_adrs(w_adrs_mem),
        .i_len(w_len_mem),
        .o_ack(w_ack_mem),
`else
        .i_req(w_req_sp),
        .i_wr(1'b0),
        .i_adrs(w_adrs_sp),
        .i_len(w_len_sp),
        .o_ack(w_ack_sp),
`endif
        .i_strw(1'b0),
        .i_be(4'd0),
        .i_dbw(32'h0),
        .o_ackw(),
        .o_strr(w_strr_mem),
        .o_dbr(w_dbr_mem),
        // F/F interface
        .o_req(o_req_dma),
        .o_wr(),
        .o_adrs(o_adrs_dma),
        .o_len(o_len_dma),
        .i_ack(i_ack_dma),
        .o_strw(),
        .o_be(),
        .o_dbw(),
        .i_ackw(1'b1),
        .i_strr(i_strr_dma),
        .i_dbr(i_dbr_dma)
  );


endmodule
