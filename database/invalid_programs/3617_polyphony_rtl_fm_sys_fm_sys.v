// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_sys.v
//
// Abstract:
//   System control module
//
//  Created:
//    13 August 2008
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
//  2009/01/02 address mapping modified
//  2009/04/09 dual DMA mode is implemented,
//             DMA top address is reduced from 22bits to 12bits
//  2014/02/07 buffer address bitwidth changed from 4 to 12

`include "polyphony_def.v"
module fm_sys (
    clk_core,
    rst_x,
    // internal interface
    i_req,
    i_wr,
    i_adrs,
    o_ack,
    i_be,
    i_wd,
    o_rstr,
    o_rd,
    // configuration output
    //   Video controller
    o_video_start,
    o_aa_en,
    o_fb0_offset,
    o_fb0_ms_offset,
    o_fb1_offset,
    o_fb1_ms_offset,
    o_color_mode,
    o_front_buffer,
    o_fb_blend_en,
    // status from Video controller
    i_vint_x,
    i_vint_edge,
    // status from 3D core
    i_vtx_int,
    // int out to sh4
    o_int_x,
`ifdef PSOC_IN
    i_psoc,
`endif
    // DMA
    o_dma_start,
    o_dma_mode,
    i_dma_end,
    o_dma_top_address0,
    o_dma_top_address1,
    o_dma_top_address2,
    o_dma_top_address3,
    o_dma_length,
    o_dma_be,
    o_dma_wd0,
    o_dma_wd1,
    // AXI Configuration
    o_conf_arcache_m,
    o_conf_aruser_m,
    o_conf_awcache_m,
    o_conf_awuser_m
`ifdef USE_AXI_MONITOR
// result out
  ,
  o_stop_trigger,
  i_bukets_no_wait_aw,
  i_bukets_0_aw,
  i_bukets_1_aw,
  i_bukets_2_aw,
  i_bukets_3_aw,
  i_bukets_more_aw,
  i_max_count_aw,
  i_min_count_aw,
  i_bukets_len_0_aw,
  i_bukets_len_1_aw,
  i_bukets_len_2_aw,
  i_bukets_len_3_aw,
  i_total_bytes_w,
  i_cont_w,
  i_discont_w,
  i_bukets_nrdy_0_w,
  i_bukets_nrdy_1_w,
  i_bukets_nrdy_2_w,
  i_bukets_nrdy_3_w,
  i_bukets_no_wait_ar,
  i_bukets_0_ar,
  i_bukets_1_ar,
  i_bukets_2_ar,
  i_bukets_3_ar,
  i_bukets_more_ar,
  i_max_count_ar,
  i_min_count_ar,
  i_bukets_len_0_ar,
  i_bukets_len_1_ar,
  i_bukets_len_2_ar,
  i_bukets_len_3_ar,
  i_cont_ar,
  i_discont_ar,
  i_bukets_no_wait_b,
  i_bukets_0_b,
  i_bukets_1_b,
  i_bukets_2_b,
  i_bukets_3_b,
  i_bukets_more_b,
  i_num_of_cmd_b,
  i_num_of_b,
  i_bukets_no_wait_r,
  i_bukets_0_r,
  i_bukets_1_r,
  i_bukets_2_r,
  i_bukets_3_r,
  i_bukets_more_r,
  i_total_bytes_r,
  i_rd_cont,
  i_rd_discont,
  i_bukets_nrdy_0_r,
  i_bukets_nrdy_1_r,
  i_bukets_nrdy_2_r,
  i_bukets_nrdy_3_r
`endif
);
//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input          clk_core;
    input          rst_x;
    // internal interface
    input          i_req;
    input          i_wr;
    input  [21:0]  i_adrs;
    output         o_ack;
    input  [3:0]   i_be;
    input  [31:0]  i_wd;
    output         o_rstr;
    output [31:0]  o_rd;
    // configuration output
    //   Video controller
    output [1:0]   o_video_start;
    output [2:0]   o_aa_en;
    output [11:0]  o_fb0_offset;
    output [11:0]  o_fb0_ms_offset;
    output [11:0]  o_fb1_offset;
    output [11:0]  o_fb1_ms_offset;
    output [1:0]   o_color_mode;
    output         o_front_buffer;
    output         o_fb_blend_en;
    // status from Video controller
    input          i_vint_x;
    input          i_vint_edge;
    // status from 3D core
    input          i_vtx_int;
    // int out to sh4
    output         o_int_x;
`ifdef PSOC_IN
    input  [1:0]   i_psoc;
`endif
    // DMA
    output         o_dma_start;
    output [3:0]   o_dma_mode;
    input          i_dma_end;
    output [19:0]  o_dma_top_address0;
    output [19:0]  o_dma_top_address1;
    output [19:0]  o_dma_top_address2;
    output [19:0]  o_dma_top_address3;
    output [17:0]  o_dma_length;
    output [3:0]   o_dma_be;
    output [31:0]  o_dma_wd0;
    output [31:0]  o_dma_wd1;
    // AXI Configuration
    output [3:0]   o_conf_arcache_m;
    output [4:0]   o_conf_aruser_m;
    output [3:0]   o_conf_awcache_m;
    output [4:0]   o_conf_awuser_m;
`ifdef USE_AXI_MONITOR
localparam P_BUCKET_SIZE     = 'd32;
  output o_stop_trigger;
// result out
  input [P_BUCKET_SIZE-1:0]   i_bukets_no_wait_aw;
  input [P_BUCKET_SIZE-1:0]   i_bukets_0_aw;
  input [P_BUCKET_SIZE-1:0]   i_bukets_1_aw;
  input [P_BUCKET_SIZE-1:0]   i_bukets_2_aw;
  input [P_BUCKET_SIZE-1:0]   i_bukets_3_aw;
  input [P_BUCKET_SIZE-1:0]   i_bukets_more_aw;
  input [P_BUCKET_SIZE-1:0]   i_max_count_aw;
  input [P_BUCKET_SIZE-1:0]   i_min_count_aw;
  input [P_BUCKET_SIZE-1:0]   i_bukets_len_0_aw;
  input [P_BUCKET_SIZE-1:0]   i_bukets_len_1_aw;
  input [P_BUCKET_SIZE-1:0]   i_bukets_len_2_aw;
  input [P_BUCKET_SIZE-1:0]   i_bukets_len_3_aw;
  input [P_BUCKET_SIZE-1:0]   i_total_bytes_w;
  input [P_BUCKET_SIZE-1:0]   i_cont_w;
  input [P_BUCKET_SIZE-1:0]   i_discont_w;
  input [P_BUCKET_SIZE-1:0]   i_bukets_nrdy_0_w;
  input [P_BUCKET_SIZE-1:0]   i_bukets_nrdy_1_w;
  input [P_BUCKET_SIZE-1:0]   i_bukets_nrdy_2_w;
  input [P_BUCKET_SIZE-1:0]   i_bukets_nrdy_3_w;
  input [P_BUCKET_SIZE-1:0]   i_bukets_no_wait_ar;
  input [P_BUCKET_SIZE-1:0]   i_bukets_0_ar;
  input [P_BUCKET_SIZE-1:0]   i_bukets_1_ar;
  input [P_BUCKET_SIZE-1:0]   i_bukets_2_ar;
  input [P_BUCKET_SIZE-1:0]   i_bukets_3_ar;
  input [P_BUCKET_SIZE-1:0]   i_bukets_more_ar;
  input [P_BUCKET_SIZE-1:0]   i_max_count_ar;
  input [P_BUCKET_SIZE-1:0]   i_min_count_ar;
  input [P_BUCKET_SIZE-1:0]   i_bukets_len_0_ar;
  input [P_BUCKET_SIZE-1:0]   i_bukets_len_1_ar;
  input [P_BUCKET_SIZE-1:0]   i_bukets_len_2_ar;
  input [P_BUCKET_SIZE-1:0]   i_bukets_len_3_ar;
  input [P_BUCKET_SIZE-1:0]   i_cont_ar;
  input [P_BUCKET_SIZE-1:0]   i_discont_ar;
  input [P_BUCKET_SIZE-1:0]   i_bukets_no_wait_b;
  input [P_BUCKET_SIZE-1:0]   i_bukets_0_b;
  input [P_BUCKET_SIZE-1:0]   i_bukets_1_b;
  input [P_BUCKET_SIZE-1:0]   i_bukets_2_b;
  input [P_BUCKET_SIZE-1:0]   i_bukets_3_b;
  input [P_BUCKET_SIZE-1:0]   i_bukets_more_b;
  input [P_BUCKET_SIZE-1:0]   i_num_of_cmd_b;
  input [P_BUCKET_SIZE-1:0]   i_num_of_b;
  input [P_BUCKET_SIZE-1:0]   i_bukets_no_wait_r;
  input [P_BUCKET_SIZE-1:0]   i_bukets_0_r;
  input [P_BUCKET_SIZE-1:0]   i_bukets_1_r;
  input [P_BUCKET_SIZE-1:0]   i_bukets_2_r;
  input [P_BUCKET_SIZE-1:0]   i_bukets_3_r;
  input [P_BUCKET_SIZE-1:0]   i_bukets_more_r;
  input [P_BUCKET_SIZE-1:0]   i_total_bytes_r;
  input [P_BUCKET_SIZE-1:0]   i_rd_cont;
  input [P_BUCKET_SIZE-1:0]   i_rd_discont;
  input [P_BUCKET_SIZE-1:0]   i_bukets_nrdy_0_r;
  input [P_BUCKET_SIZE-1:0]   i_bukets_nrdy_1_r;
  input [P_BUCKET_SIZE-1:0]   i_bukets_nrdy_2_r;
  input [P_BUCKET_SIZE-1:0]   i_bukets_nrdy_3_r;
`endif
//////////////////////////////////
// regs 
//////////////////////////////////
    reg    [1:0]   r_video_start;
    reg    [2:0]   r_aa_en;
    reg    [11:0]  r_fb0_offset;
    reg    [11:0]  r_fb0_ms_offset;
    reg    [11:0]  r_fb1_offset;
    reg    [11:0]  r_fb1_ms_offset;
    reg    [1:0]   r_color_mode;
    reg            r_fb_blend_en;

    reg            r_rstr;
    reg    [31:0]  r_rd;

    reg            r_vint_x;
    reg    [2:0]   r_mask;
    reg            r_front_buffer;
    reg            r_dma_start;
    reg    [3:0]   r_dma_mode;
    reg            r_dma_int;
    reg    [19:0]  r_dma_top_address0;
    reg    [19:0]  r_dma_top_address1;
    reg    [19:0]  r_dma_top_address2;
    reg    [19:0]  r_dma_top_address3;
    reg    [17:0]  r_dma_length;
    reg    [3:0]   r_dma_be;
    reg    [31:0]  r_dma_wd0;
    reg    [31:0]  r_dma_wd1;

    reg            r_vint_clear;

    reg    [3:0]   r_conf_arcache_m;
    reg    [4:0]   r_conf_aruser_m;
    reg    [3:0]   r_conf_awcache_m;
    reg    [4:0]   r_conf_awuser_m;
`ifdef USE_AXI_MONITOR
    reg    r_stop_trigger;
    reg    r_rw_select;
`endif
//////////////////////////////////
// wire
//////////////////////////////////
    wire           w_hit0;
    wire           w_hit1;
    wire           w_hit2;
    wire           w_hit3;
    wire           w_hit4;
    wire           w_hit5;
    wire           w_hit8;
    wire           w_hit9;
    wire           w_hitA;
    wire           w_hitB;
    wire           w_hitC;
    wire           w_hitD;
    wire           w_hitE;
    wire           w_hitF;
    wire           w_hit10;
    wire           w_hit11;
    wire           w_hit12;
    wire           w_hit13;
    wire           w_hit14;
    wire           w_hit15;
    wire           w_hit16;

    wire           w_hit0_w;
    wire           w_hit1_w;
    wire           w_hit2_w;
    wire           w_hit3_w;
    wire           w_hit4_w;
    wire           w_hit5_w;
    wire           w_hit6_w;
    wire           w_hit9_w;
    wire           w_hitA_w;
    wire           w_hitB_w;
    wire           w_hitC_w;
    wire           w_hitD_w;
    wire           w_hitE_w;
    wire           w_hitF_w;
    wire           w_hit10_w;
    wire           w_hit11_w;
    wire           w_hit12_w;
    wire           w_hit13_w;
`ifdef USE_AXI_MONITOR
    wire           w_hit16_w;
`endif
    wire   [31:0]  w_rd;
    wire           w_rstr;
    wire           w_vint_x;
    wire           w_vint_on;
    wire   [2:0]   w_int;
`ifdef USE_AXI_MONITOR
    wire           w_hit32;
    wire           w_hit33;
    wire           w_hit34;
    wire           w_hit35;
    wire           w_hit36;
    wire           w_hit37;
    wire           w_hit38;
    wire           w_hit39;
    wire           w_hit40;
    wire           w_hit41;
    wire           w_hit42;
    wire           w_hit43;
    wire           w_hit44;
    wire           w_hit45;
    wire           w_hit46;
    wire           w_hit47;
    wire           w_hit48;
    wire           w_hit49;
    wire           w_hit50;
    wire           w_hit51;
    wire           w_hit52;
    wire           w_hit53;
    wire           w_hit54;
    wire           w_hit55;
    wire           w_hit56;
    wire           w_hit57;
    wire           w_hit58;
    wire           w_hit59;
    wire           w_hit60;
    wire           w_hit61;
    wire           w_hit62;
    wire           w_hit63;
    wire           w_hit64;
    wire           w_hit65;
    wire           w_hit66;
    wire           w_hit67;
    wire           w_hit68;
    wire           w_hit69;

    wire [31:0]    w_hit32_dat;
    wire [31:0]    w_hit33_dat;
    wire [31:0]    w_hit34_dat;
    wire [31:0]    w_hit35_dat;
    wire [31:0]    w_hit36_dat;
    wire [31:0]    w_hit37_dat;
    wire [31:0]    w_hit38_dat;
    wire [31:0]    w_hit39_dat;
    wire [31:0]    w_hit40_dat;
    wire [31:0]    w_hit41_dat;
    wire [31:0]    w_hit42_dat;
    wire [31:0]    w_hit43_dat;
    wire [31:0]    w_hit44_dat;
    wire [31:0]    w_hit45_dat;
    wire [31:0]    w_hit46_dat;
    wire [31:0]    w_hit47_dat;
    wire [31:0]    w_hit48_dat;
    wire [31:0]    w_hit49_dat;
    wire [31:0]    w_hit50_dat;
    wire [31:0]    w_hit51_dat;
    wire [31:0]    w_hit52_dat;
    wire [31:0]    w_hit53_dat;
    wire [31:0]    w_hit54_dat;
    wire [31:0]    w_hit55_dat;
    wire [31:0]    w_hit56_dat;
    wire [31:0]    w_hit57_dat;
    wire [31:0]    w_hit58_dat;
    wire [31:0]    w_hit59_dat;
    wire [31:0]    w_hit60_dat;

`endif
//////////////////////////////////
// assign
//////////////////////////////////
assign w_hit0 = (i_adrs[7:2] == 6'h00);  // 0
assign w_hit1 = (i_adrs[7:2] == 6'h01);  // 4
assign w_hit2 = (i_adrs[7:2] == 6'h02);  // 8
assign w_hit3 = (i_adrs[7:2] == 6'h03);  // c
assign w_hit4 = (i_adrs[7:2] == 6'h04);  // 10
assign w_hit5 = (i_adrs[7:2] == 6'h05);  // 14
assign w_hit6 = (i_adrs[7:2] == 6'h06);  // 18
assign w_hit8 = (i_adrs[7:2] == 6'h08);  // 20
assign w_hit9 = (i_adrs[7:2] == 6'h09);  // 24
assign w_hitA = (i_adrs[7:2] == 6'h0a);  // 28
assign w_hitB = (i_adrs[7:2] == 6'h0b);  // 2c
assign w_hitC = (i_adrs[7:2] == 6'h0c);  // 30
assign w_hitD = (i_adrs[7:2] == 6'h0d);  // 34
assign w_hitE = (i_adrs[7:2] == 6'h0e);  // 38
assign w_hitF = (i_adrs[7:2] == 6'h0f);  // 3c
assign w_hit10 = (i_adrs[7:2] == 6'h10);  // 40
assign w_hit11 = (i_adrs[7:2] == 6'h11);  // 44
assign w_hit12 = (i_adrs[7:2] == 6'h12);  // 48
assign w_hit13 = (i_adrs[7:2] == 6'h13);  // 4c
assign w_hit14 = (i_adrs[7:2] == 6'h14);  // 50
assign w_hit15 = (i_adrs[7:2] == 6'h15);  // 54

`ifdef USE_AXI_MONITOR
assign w_hit16 = (i_adrs[7:2] == 6'h16);  // 58
assign w_hit32 = (i_adrs[7:2] == 6'h20);  // 80
assign w_hit33 = (i_adrs[7:2] == 6'h21);  // 84
assign w_hit34 = (i_adrs[7:2] == 6'h22);  // 88
assign w_hit35 = (i_adrs[7:2] == 6'h23);  // 8c
assign w_hit36 = (i_adrs[7:2] == 6'h24);  // 90
assign w_hit37 = (i_adrs[7:2] == 6'h25);  // 94
assign w_hit38 = (i_adrs[7:2] == 6'h26);  // 98
assign w_hit39 = (i_adrs[7:2] == 6'h27);  // 9c
assign w_hit40 = (i_adrs[7:2] == 6'h28);  // a0
assign w_hit41 = (i_adrs[7:2] == 6'h29);  // a4
assign w_hit42 = (i_adrs[7:2] == 6'h2a);  // a8
assign w_hit43 = (i_adrs[7:2] == 6'h2b);  // ac
assign w_hit44 = (i_adrs[7:2] == 6'h2c);  // b0
assign w_hit45 = (i_adrs[7:2] == 6'h2d);  // b4
assign w_hit46 = (i_adrs[7:2] == 6'h2e);  // b8
assign w_hit47 = (i_adrs[7:2] == 6'h2f);  // bc
assign w_hit48 = (i_adrs[7:2] == 6'h30);  // c0
assign w_hit49 = (i_adrs[7:2] == 6'h31);  // c4
assign w_hit50 = (i_adrs[7:2] == 6'h32);  // c8
assign w_hit51 = (i_adrs[7:2] == 6'h33);  // cc
assign w_hit52 = (i_adrs[7:2] == 6'h34);  // d0
assign w_hit53 = (i_adrs[7:2] == 6'h35);  // d4
assign w_hit54 = (i_adrs[7:2] == 6'h36);  // d8
assign w_hit55 = (i_adrs[7:2] == 6'h37);  // dc
assign w_hit56 = (i_adrs[7:2] == 6'h38);  // e0
assign w_hit57 = (i_adrs[7:2] == 6'h39);  // e4
assign w_hit58 = (i_adrs[7:2] == 6'h3a);  // e8
assign w_hit59 = (i_adrs[7:2] == 6'h3b);  // ec
assign w_hit60 = (i_adrs[7:2] == 6'h3c);  // f0
assign w_hit61 = (i_adrs[7:2] == 6'h3d);  // f4
assign w_hit62 = (i_adrs[7:2] == 6'h3e);  // f8
assign w_hit63 = (i_adrs[7:2] == 6'h3f);  // fc
`endif

assign w_hit0_w = w_hit0 & i_wr & i_req;
assign w_hit1_w = w_hit1 & i_wr & i_req;
assign w_hit2_w = w_hit2 & i_wr & i_req;
assign w_hit3_w = w_hit3 & i_wr & i_req;
assign w_hit4_w = w_hit4 & i_wr & i_req;
assign w_hit5_w = w_hit5 & i_wr & i_req;
assign w_hit6_w = w_hit6 & i_wr & i_req;
assign w_hit9_w = w_hit9 & i_wr & i_req;
assign w_hitA_w = w_hitA & i_wr & i_req;
assign w_hitB_w = w_hitB & i_wr & i_req;
assign w_hitC_w = w_hitC & i_wr & i_req;
assign w_hitD_w = w_hitD & i_wr & i_req;
assign w_hitE_w = w_hitE & i_wr & i_req;
assign w_hitF_w = w_hitF & i_wr & i_req;
assign w_hit10_w = w_hit10 & i_wr & i_req;
assign w_hit11_w = w_hit11 & i_wr & i_req;
assign w_hit12_w = w_hit12 & i_wr & i_req;
assign w_hit13_w = w_hit13 & i_wr & i_req;
`ifdef USE_AXI_MONITOR
assign w_hit16_w = w_hit16 & i_wr & i_req;


assign w_hit32_dat = (r_rw_select) ? i_bukets_no_wait_ar : i_bukets_no_wait_aw;
assign w_hit33_dat = (r_rw_select) ? i_bukets_0_ar : i_bukets_0_aw;
assign w_hit34_dat = (r_rw_select) ?   i_bukets_1_ar : i_bukets_1_aw;
assign w_hit35_dat = (r_rw_select) ?   i_bukets_2_ar : i_bukets_2_aw;
assign w_hit36_dat = (r_rw_select) ?   i_bukets_3_ar : i_bukets_3_aw;
assign w_hit37_dat = (r_rw_select) ?   i_bukets_more_ar : i_bukets_more_aw;
assign w_hit38_dat = (r_rw_select) ?   i_max_count_ar : i_max_count_aw;
assign w_hit39_dat = (r_rw_select) ?   i_min_count_ar : i_min_count_aw;
assign w_hit40_dat = (r_rw_select) ?   i_bukets_len_0_ar : i_bukets_len_0_aw;
assign w_hit41_dat = (r_rw_select) ?   i_bukets_len_1_ar : i_bukets_len_1_aw;
assign w_hit42_dat = (r_rw_select) ?   i_bukets_len_2_ar : i_bukets_len_2_aw;
assign w_hit43_dat = (r_rw_select) ?   i_bukets_len_3_ar : i_bukets_len_3_aw;
assign w_hit44_dat = (r_rw_select) ?   i_cont_ar : i_total_bytes_w;
assign w_hit45_dat = (r_rw_select) ?   i_discont_ar : i_cont_w;
assign w_hit46_dat = (r_rw_select) ?   i_bukets_no_wait_r : i_discont_w;
assign w_hit47_dat = (r_rw_select) ?   i_bukets_0_r : i_bukets_no_wait_b;
assign w_hit48_dat = (r_rw_select) ?   i_bukets_1_r : i_bukets_0_b;
assign w_hit49_dat = (r_rw_select) ?   i_bukets_2_r : i_bukets_1_b;
assign w_hit50_dat = (r_rw_select) ?   i_bukets_3_r : i_bukets_2_b;
assign w_hit51_dat = (r_rw_select) ?   i_bukets_more_r : i_bukets_3_b;
assign w_hit52_dat = (r_rw_select) ?   i_total_bytes_r : i_bukets_more_b;
assign w_hit53_dat = (r_rw_select) ?   i_rd_cont : i_num_of_cmd_b;
assign w_hit54_dat = (r_rw_select) ?   i_rd_discont : i_num_of_b;
assign w_hit55_dat = (r_rw_select) ?   i_bukets_nrdy_0_r : i_bukets_nrdy_0_w;
assign w_hit56_dat = (r_rw_select) ?   i_bukets_nrdy_1_r : i_bukets_nrdy_1_w;
assign w_hit57_dat = (r_rw_select) ?   i_bukets_nrdy_2_r : i_bukets_nrdy_2_w;
assign w_hit58_dat = (r_rw_select) ?   i_bukets_nrdy_3_r : i_bukets_nrdy_3_w;


`endif   
assign w_rstr = i_req & !i_wr;
assign w_rd = (w_hit0) ? {15'b0,r_fb_blend_en,5'b0,r_aa_en,6'b0,r_video_start} :
              (w_hit1) ? {r_fb0_offset,20'b0} :
              (w_hit2) ? {r_fb1_offset,20'b0} :
              (w_hit3) ? {r_fb0_ms_offset,20'b0} :
              (w_hit4) ? {r_fb1_ms_offset,20'b0} :
              (w_hit5) ? {30'b0,r_color_mode} :
              (w_hit6) ? {
                            3'b0,
                            r_conf_awuser_m,
                            4'b0,
                            r_conf_awcache_m,
                            3'b0,
                            r_conf_aruser_m,
                            4'b0,
                            r_conf_arcache_m
                          } :
`ifdef PSOC_IN
              (w_hit8) ? {27'b0,i_psoc,i_vtx_int,r_dma_int,!r_vint_x} :
`else
              (w_hit8) ? {29'b0,i_vtx_int,r_dma_int,!r_vint_x} :
`endif
              (w_hit9) ? {31'b0,r_vint_clear} :
              (w_hitA) ? {29'b0,r_mask} :
              (w_hitB) ? {31'b0,r_front_buffer} :
              (w_hitC) ? {r_dma_top_address0,12'b0} :
              (w_hitD) ? {r_dma_top_address1,12'b0} :
              (w_hitE) ? {r_dma_top_address2,12'b0} :
              (w_hitF) ? {r_dma_top_address3,12'b0} :
              (w_hit10) ? {4'b0,r_dma_be,6'b0,r_dma_length} :
              (w_hit11) ?  r_dma_wd0 :
              (w_hit12) ? r_dma_wd1 :
              (w_hit14) ? 32'h50475055 :  // PGPU
              (w_hit15) ? 32'h76415849 :  // vAXI
`ifdef USE_AXI_MONITOR
              (w_hit16) ? {16'b0,7'b0,r_rw_select,7'b0,r_stop_trigger} :
`endif
`ifdef USE_AXI_MONITOR
              (w_hit32) ? w_hit32_dat:
              (w_hit33) ? w_hit33_dat:
              (w_hit34) ? w_hit34_dat:
              (w_hit35) ? w_hit35_dat:
              (w_hit36) ? w_hit36_dat:
              (w_hit37) ? w_hit37_dat:
              (w_hit38) ? w_hit38_dat:
              (w_hit39) ? w_hit39_dat:
              (w_hit40) ? w_hit40_dat:
              (w_hit41) ? w_hit41_dat:
              (w_hit42) ? w_hit42_dat:
              (w_hit43) ? w_hit43_dat:
              (w_hit44) ? w_hit44_dat:
              (w_hit45) ? w_hit45_dat:
              (w_hit46) ? w_hit46_dat:
              (w_hit47) ? w_hit47_dat:
              (w_hit48) ? w_hit48_dat:
              (w_hit49) ? w_hit49_dat:
              (w_hit50) ? w_hit50_dat:
              (w_hit51) ? w_hit51_dat:
              (w_hit52) ? w_hit52_dat:
              (w_hit53) ? w_hit53_dat:
              (w_hit54) ? w_hit54_dat:
              (w_hit55) ? w_hit55_dat:
              (w_hit56) ? w_hit56_dat:
              (w_hit57) ? w_hit57_dat:
              (w_hit58) ? w_hit58_dat:
`endif
                         {23'b0,r_dma_int, r_dma_mode,3'b0,r_dma_start};  // w_hit13

             
assign w_vint_on = i_vint_edge;  // falling edge detect
assign w_vint_x = ~r_vint_clear | i_vint_x;

assign w_int[0] = (r_mask[0]) ? 1'b0 : ~r_vint_x;
assign w_int[1] = (r_mask[1]) ? 1'b0 : r_dma_int;
assign w_int[2] = (r_mask[2]) ? 1'b0 : i_vtx_int;


assign o_int_x = !(|w_int);

assign o_rstr  = r_rstr;
assign o_rd = r_rd;
assign o_ack = i_req;

assign o_video_start = r_video_start;
assign o_aa_en = r_aa_en;
assign o_fb0_offset = r_fb0_offset;
assign o_fb0_ms_offset = r_fb0_ms_offset;
assign o_fb1_offset = r_fb1_offset;
assign o_fb1_ms_offset = r_fb1_ms_offset;
assign o_color_mode = r_color_mode;
assign o_front_buffer = r_front_buffer;
assign o_fb_blend_en = r_fb_blend_en;
assign o_dma_start = r_dma_start;
assign o_dma_mode = r_dma_mode;
assign o_dma_top_address0 = r_dma_top_address0;
assign o_dma_top_address1 = r_dma_top_address1;
assign o_dma_top_address2 = r_dma_top_address2;
assign o_dma_top_address3 = r_dma_top_address3;
assign o_dma_length = r_dma_length;
assign o_dma_be = r_dma_be;
assign o_dma_wd0 = r_dma_wd0;
assign o_dma_wd1 = r_dma_wd1;
assign o_conf_arcache_m = r_conf_arcache_m;
assign o_conf_aruser_m = r_conf_aruser_m;
assign o_conf_awcache_m = r_conf_awcache_m;
assign o_conf_awuser_m = r_conf_awuser_m;
`ifdef USE_AXI_MONITOR
assign o_stop_trigger = r_stop_trigger;
`endif

//////////////////////////////////
// always
//////////////////////////////////

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_video_start <= 2'b0;
    end else begin
        if (w_hit0_w) begin
            if (i_be[0]) r_video_start   <= i_wd[1:0];
            if (i_be[1]) r_aa_en         <= i_wd[10:8];
            if (i_be[2]) r_fb_blend_en   <= i_wd[16];
        end
    end
end

// register holds 32-bit address
always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_fb0_offset <= 12'b0;
        r_fb0_ms_offset <= 12'b0;
    end else begin
        if (w_hit1_w) begin
            if (i_be[2]) r_fb0_offset[3:0] <= i_wd[23:20];
            if (i_be[3]) r_fb0_offset[11:4] <= i_wd[31:24];
        end
        if (w_hit3_w) begin
            if (i_be[2]) r_fb0_ms_offset[3:0] <= i_wd[23:20];
            if (i_be[3]) r_fb0_ms_offset[11:4] <= i_wd[31:24];
        end
    end
end

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_fb1_offset <= 12'b0;
        r_fb1_ms_offset <= 12'b0;
    end else begin
        if (w_hit2_w) begin
            if (i_be[2]) r_fb1_offset[3:0] <= i_wd[23:20];
            if (i_be[3]) r_fb1_offset[11:4] <= i_wd[31:24];
        end
        if (w_hit4_w) begin
            if (i_be[2]) r_fb1_ms_offset[3:0] <= i_wd[23:20];
            if (i_be[3]) r_fb1_ms_offset[11:4] <= i_wd[31:24];
        end
    end
end

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_color_mode <= 2'b0;
    end else begin
        if (w_hit5_w) begin
            if (i_be[0]) r_color_mode   <= i_wd[1:0];
        end
    end
end

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_conf_arcache_m <= 4'h0;
      r_conf_aruser_m <= 5'h0;
      r_conf_awcache_m <= 4'h0;
      r_conf_awuser_m <= 5'h0;
    end else begin
        if (w_hit6_w) begin
            if (i_be[0]) r_conf_arcache_m   <= i_wd[3:0];
            if (i_be[1]) r_conf_aruser_m    <= i_wd[12:8];
            if (i_be[2]) r_conf_awcache_m   <= i_wd[19:16];
            if (i_be[3]) r_conf_awuser_m    <= i_wd[29:24];
        end
    end
end

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_vint_clear <= 1'b0;
    end else begin
        if (w_hit9_w) begin
            if (i_be[0]) r_vint_clear <= i_wd[0];
        end else if (w_vint_on) begin
            r_vint_clear <= 1'b1;
        end
    end
end

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_mask <= 2'b11;
    end else begin
        if (w_hitA_w) begin
            if (i_be[0]) r_mask   <= i_wd[1:0];
        end
    end
end

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_front_buffer <= 1'b0;
    end else begin
        if (w_hitB_w) begin
            if (i_be[0]) r_front_buffer   <= i_wd[0];
        end
    end
end

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_dma_top_address0 <= 20'b0;
        r_dma_top_address1 <= 20'b0;
        r_dma_top_address2 <= 20'b0;
        r_dma_top_address3 <= 20'b0;
    end else begin
        if (w_hitC_w) begin
            r_dma_top_address0[11:0]  <= i_wd[23:12];
            r_dma_top_address0[19:12] <= i_wd[31:24];
        end
        if (w_hitD_w) begin
            r_dma_top_address1[11:0]  <= i_wd[23:12];
            r_dma_top_address1[19:12] <= i_wd[31:24];
        end
        if (w_hitE_w) begin
            r_dma_top_address2[11:0]  <= i_wd[23:12];
            r_dma_top_address2[19:12] <= i_wd[31:24];
        end
        if (w_hitF_w) begin
            r_dma_top_address3[11:0]  <= i_wd[23:12];
            r_dma_top_address3[19:12] <= i_wd[31:24];
        end
    end
end

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_dma_length <= 18'b0;
        r_dma_be <= 4'hf;
    end else begin
        if (w_hit10_w) begin
            if (i_be[0]) r_dma_length[7:0]   <= i_wd[7:0];
            if (i_be[1]) r_dma_length[15:8]  <= i_wd[15:8];
            if (i_be[2]) r_dma_length[17:16]  <= i_wd[17:16];
            if (i_be[3]) r_dma_be <= i_wd[27:24];
        end
    end
end

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_dma_wd0 <= 32'b0;
        r_dma_wd1 <= 32'b0;
    end else begin
        if (w_hit11_w) begin
            r_dma_wd0   <= i_wd;
        end
        if (w_hit12_w) begin
            r_dma_wd1   <= i_wd;
        end
    end
end

`ifdef USE_AXI_MONITOR
always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_stop_trigger <= 1'b0;
        r_rw_select <= 1'b0;
    end else begin
        if (w_hit16_w) begin
            if (i_be[0]) r_stop_trigger   <= i_wd[0];
            if (i_be[1]) r_rw_select   <= i_wd[8];
        end
    end
end
`endif
   
always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_dma_start <= 1'b0;
        r_dma_mode <= 4'b0;
        r_dma_int <= 1'b0;
    end else begin
        if (w_hit13_w) begin
            if (i_be[0]) r_dma_start   <= i_wd[0];
            if (i_be[0]) r_dma_mode    <= i_wd[7:4];
            if (i_be[1]) r_dma_int <= i_wd[8];
        end else begin
            if (i_dma_end) begin
                r_dma_start <= 1'b0;
                r_dma_mode  <= 1'b0;
                r_dma_int   <= 1'b1;
            end
        end
    end
end

always @(posedge clk_core) begin
    r_rd <= w_rd;
end

always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_rstr <= 1'b0;
  end else begin
    r_rstr <= w_rstr;
  end
end


always @(posedge clk_core or negedge rst_x) begin
  if (~rst_x) begin
    r_vint_x <= 1'b1;
  end else begin
    r_vint_x <= w_vint_x;
  end
end

endmodule
