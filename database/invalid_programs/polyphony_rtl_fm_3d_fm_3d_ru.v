//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru.v
//
// Abstract:
//   Rasterize unit
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

module fm_3d_ru (
    clk_core,
    rst_x,
    // triangle data
    i_valid,
    o_ack,
    i_ml,
    i_vtx0_x,
    i_vtx0_y,
    i_vtx0_z,
    i_vtx0_iw,
    i_vtx0_p00,
    i_vtx0_p01,
    i_vtx0_p02,
    i_vtx0_p03,
    i_vtx0_p10,
    i_vtx0_p11,
`ifdef VTX_PARAM1_REDUCE
`else
    i_vtx0_p12,
    i_vtx0_p13,
`endif
    i_vtx1_x,
    i_vtx1_y,
    i_vtx1_z,
    i_vtx1_iw,
    i_vtx1_p00,
    i_vtx1_p01,
    i_vtx1_p02,
    i_vtx1_p03,
    i_vtx1_p10,
    i_vtx1_p11,
`ifdef VTX_PARAM1_REDUCE
`else
    i_vtx1_p12,
    i_vtx1_p13,
`endif
    i_vtx2_x,
    i_vtx2_y,
    i_vtx2_z,
    i_vtx2_iw,
    i_vtx2_p00,
    i_vtx2_p01,
    i_vtx2_p02,
    i_vtx2_p03,
    i_vtx2_p10,
    i_vtx2_p11,
`ifdef VTX_PARAM1_REDUCE
`else
    i_vtx2_p12,
    i_vtx2_p13,
`endif
    // control registers
    i_aa_en,
    i_attr0_en,
    i_attr0_size,
    i_attr0_kind,
    i_attr1_en,
    i_attr1_size,
    i_attr1_kind,
    o_idle,
    // pixel unit bus
    o_valid_pu,
    i_busy_pu,
    o_aa_mode,
    o_x,
    o_y,
    o_z,
    o_cr,
    o_cg,
    o_cb,
    o_ca,
    // texture unit bus
    o_valid_tu,
    i_busy_tu,
    o_tu,
    o_tv
);

////////////////////////////
// Parameter definition
////////////////////////////
////////////////////////////
// I/O definition
////////////////////////////
////////////////////////////
    input         clk_core;
    input         rst_x;
    // triangle data
    input         i_valid;
    output        o_ack;
    input         i_ml;
    input  [20:0] i_vtx0_x;  // 0.5.16
    input  [20:0] i_vtx0_y;
    input  [20:0] i_vtx0_z;
    input  [20:0] i_vtx0_iw;
    input  [20:0] i_vtx0_p00;
    input  [20:0] i_vtx0_p01;
    input  [20:0] i_vtx0_p02;
    input  [20:0] i_vtx0_p03;
    input  [20:0] i_vtx0_p10;
    input  [20:0] i_vtx0_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    input  [20:0] i_vtx0_p12;
    input  [20:0] i_vtx0_p13;
`endif
    input  [20:0] i_vtx1_x;
    input  [20:0] i_vtx1_y;
    input  [20:0] i_vtx1_z;
    input  [20:0] i_vtx1_iw;
    input  [20:0] i_vtx1_p00;
    input  [20:0] i_vtx1_p01;
    input  [20:0] i_vtx1_p02;
    input  [20:0] i_vtx1_p03;
    input  [20:0] i_vtx1_p10;
    input  [20:0] i_vtx1_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    input  [20:0] i_vtx1_p12;
    input  [20:0] i_vtx1_p13;
`endif
    input  [20:0] i_vtx2_x;
    input  [20:0] i_vtx2_y;
    input  [20:0] i_vtx2_z;
    input  [20:0] i_vtx2_iw;
    input  [20:0] i_vtx2_p00;
    input  [20:0] i_vtx2_p01;
    input  [20:0] i_vtx2_p02;
    input  [20:0] i_vtx2_p03;
    input  [20:0] i_vtx2_p10;
    input  [20:0] i_vtx2_p11;
`ifdef VTX_PARAM1_REDUCE
`else
    input  [20:0] i_vtx2_p12;
    input  [20:0] i_vtx2_p13;
`endif
    // control registers
    input         i_aa_en;
    input         i_attr0_en;
    input  [1:0]  i_attr0_size;
    input  [1:0]  i_attr0_kind;
    input         i_attr1_en;
    input  [1:0]  i_attr1_size;
    input  [1:0]  i_attr1_kind;
    output        o_idle;
    // pixel unit bus
    output        o_valid_pu;
    input         i_busy_pu;
    output        o_aa_mode;
    output [9:0]  o_x;
    output [8:0]  o_y;
    output [15:0] o_z;
    output [7:0]  o_cr;
    output [7:0]  o_cg;
    output [7:0]  o_cb;
    output [7:0]  o_ca;
    // texture unit bus
    output        o_valid_tu;
    input         i_busy_tu;
    output [21:0] o_tu;
    output [21:0] o_tv;

/////////////////////////
//  register definition
/////////////////////////

/////////////////////////
//  wire
/////////////////////////
    wire          w_valid;
    wire          w_aa_mode;

    wire   [20:0] w_x_l;
    wire   [8:0]  w_y_l;
    wire   [20:0] w_z_l;
    wire   [20:0] w_iw_l;
    wire   [20:0] w_param00_l;
    wire   [20:0] w_param01_l;
    wire   [20:0] w_param02_l;
    wire   [20:0] w_param03_l;
    wire   [20:0] w_param10_l;
    wire   [20:0] w_param11_l;
`ifdef VTX_PARAM1_REDUCE
`else
    wire   [20:0] w_param12_l;
    wire   [20:0] w_param13_l;
`endif
    wire   [20:0] w_x_r;
    wire   [8:0]  w_y_r;
    wire   [20:0] w_z_r;
    wire   [20:0] w_iw_r;
    wire   [20:0] w_param00_r;
    wire   [20:0] w_param01_r;
    wire   [20:0] w_param02_r;
    wire   [20:0] w_param03_r;
    wire   [20:0] w_param10_r;
    wire   [20:0] w_param11_r;
`ifdef VTX_PARAM1_REDUCE
`else
    wire   [20:0] w_param12_r;
    wire   [20:0] w_param13_r;
`endif

    wire          w_ack;

    wire          w_idle_outline;
    wire          w_idle_span;
////////////////////////////
// assign
////////////////////////////
    assign o_idle = w_idle_outline & w_idle_span;
/////////////////////////
//  module instance
/////////////////////////
    // outline
    fm_3d_ru_outline outline (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // triangle data
        .i_valid(i_valid),
        .i_ml(i_ml),
        .o_ack(o_ack),
        .i_vtx0_x(i_vtx0_x),
        .i_vtx0_y(i_vtx0_y),
        .i_vtx0_z(i_vtx0_z),
        .i_vtx0_iw(i_vtx0_iw),
        .i_vtx0_p00(i_vtx0_p00),
        .i_vtx0_p01(i_vtx0_p01),
        .i_vtx0_p02(i_vtx0_p02),
        .i_vtx0_p03(i_vtx0_p03),
        .i_vtx0_p10(i_vtx0_p10),
        .i_vtx0_p11(i_vtx0_p11),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_vtx0_p12(i_vtx0_p12),
        .i_vtx0_p13(i_vtx0_p13),
`endif
        .i_vtx1_x(i_vtx1_x),
        .i_vtx1_y(i_vtx1_y),
        .i_vtx1_z(i_vtx1_z),
        .i_vtx1_iw(i_vtx1_iw),
        .i_vtx1_p00(i_vtx1_p00),
        .i_vtx1_p01(i_vtx1_p01),
        .i_vtx1_p02(i_vtx1_p02),
        .i_vtx1_p03(i_vtx1_p03),
        .i_vtx1_p10(i_vtx1_p10),
        .i_vtx1_p11(i_vtx1_p11),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_vtx1_p12(i_vtx1_p12),
        .i_vtx1_p13(i_vtx1_p13),
`endif
        .i_vtx2_x(i_vtx2_x),
        .i_vtx2_y(i_vtx2_y),
        .i_vtx2_z(i_vtx2_z),
        .i_vtx2_iw(i_vtx2_iw),
        .i_vtx2_p00(i_vtx2_p00),
        .i_vtx2_p01(i_vtx2_p01),
        .i_vtx2_p02(i_vtx2_p02),
        .i_vtx2_p03(i_vtx2_p03),
        .i_vtx2_p10(i_vtx2_p10),
        .i_vtx2_p11(i_vtx2_p11),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_vtx2_p12(i_vtx2_p12),
        .i_vtx2_p13(i_vtx2_p13),
`endif
         // control registers
        .i_aa_en(i_aa_en),
        .i_attr0_en(i_attr0_en),
        .i_attr0_size(i_attr0_size),
        .i_attr0_kind(i_attr0_kind),
        .i_attr1_en(i_attr1_en),
        .i_attr1_size(i_attr1_size),
        .i_attr1_kind(i_attr1_kind),
        .o_idle(w_idle_outline),
       // edge data
        .o_valid(w_valid),
        .o_aa_mode(w_aa_mode),
        .i_ack(w_ack),
        // edge data left
        .o_x_l(w_x_l),
        .o_y_l(w_y_l),
        .o_z_l(w_z_l),
        .o_iw_l(w_iw_l),
        .o_param00_l(w_param00_l),
        .o_param01_l(w_param01_l),
        .o_param02_l(w_param02_l),
        .o_param03_l(w_param03_l),
        .o_param10_l(w_param10_l),
        .o_param11_l(w_param11_l),
`ifdef VTX_PARAM1_REDUCE
`else
        .o_param12_l(w_param12_l),
        .o_param13_l(w_param13_l),
`endif
        // edge data right
        .o_x_r(w_x_r),
        .o_y_r(w_y_r),
        .o_z_r(w_z_r),
        .o_iw_r(w_iw_r),
        .o_param00_r(w_param00_r),
        .o_param01_r(w_param01_r),
        .o_param02_r(w_param02_r),
        .o_param03_r(w_param03_r),
        .o_param10_r(w_param10_r),
        .o_param11_r(w_param11_r)
`ifdef VTX_PARAM1_REDUCE
`else
        ,.o_param12_r(w_param12_r),
        .o_param13_r(w_param13_r)
`endif
    );

    // span
    fm_3d_ru_span span (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // span parameters
        .i_valid(w_valid),
        .i_aa_mode(w_aa_mode),
        .i_x_l(w_x_l),
        .i_y_l(w_y_l),
        .i_z_l(w_z_l),
        .i_iw_l(w_iw_l),
        .i_param00_l(w_param00_l),
        .i_param01_l(w_param01_l),
        .i_param02_l(w_param02_l),
        .i_param03_l(w_param03_l),
        .i_param10_l(w_param10_l),
        .i_param11_l(w_param11_l),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_param12_l(w_param12_l),
        .i_param13_l(w_param13_l),
`endif
        .i_x_r(w_x_r),
        .i_y_r(w_y_r),
        .i_z_r(w_z_r),
        .i_iw_r(w_iw_r),
        .i_param00_r(w_param00_r),
        .i_param01_r(w_param01_r),
        .i_param02_r(w_param02_r),
        .i_param03_r(w_param03_r),
        .i_param10_r(w_param10_r),
        .i_param11_r(w_param11_r),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_param12_r(w_param12_r),
        .i_param13_r(w_param13_r),
`endif
        .o_ack(w_ack),
        // control registers
        .i_param0_en(i_attr0_en),
        .i_param1_en(i_attr1_en),
        .i_param0_size(i_attr0_size),
        .i_param1_size(i_attr1_size),
        .i_param0_kind(i_attr0_kind),
        .i_param1_kind(i_attr1_kind),
        // idle state indicator
        .o_idle(w_idle_span),
        // pixel unit bus
        .o_valid_pu(o_valid_pu),
        .i_busy_pu(i_busy_pu),
        .o_aa_mode(o_aa_mode),
        .o_x(o_x),
        .o_y(o_y),
        .o_z(o_z),
        .o_cr(o_cr),
        .o_cg(o_cg),
        .o_cb(o_cb),
        .o_ca(o_ca),
        // texture unit bus
        .o_valid_tu(o_valid_tu),
        .i_busy_tu(i_busy_tu),
        .o_tu(o_tu),
        .o_tv(o_tv)
    );

// debug
`ifdef RTL_DEBUG
reg [31:0] r_cnt_pu;
reg [31:0] r_cnt_tu;
initial begin
  r_cnt_pu = 0;
  r_cnt_tu = 0;
end

always @(posedge clk_core) begin
  if (o_valid_tu & !i_busy_tu) r_cnt_tu = r_cnt_tu + 1;
  if (o_valid_pu & !i_busy_pu) r_cnt_pu = r_cnt_pu + 1;
end

`endif


endmodule
