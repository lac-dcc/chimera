// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_outline_edge.v
//
// Abstract:
//   generate edges
//
//  Created:
//    3 September 2008
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


module fm_3d_ru_outline_edge (
    clk_core,
    rst_x,
    // outline parameters
    i_ml,
    i_is_first,
    i_is_second,
    i_valid,
    i_aa_mode,
    // idle state indicator
    o_idle,
    //   edge0
    i_start_x_e0,
    i_start_x_05_e0,
    i_start_y_e0,
    i_end_y_e0,
    i_delta_e0,
    i_delta_t_e0,
    i_delta_a_e0,
    //   edge1
    i_start_x_e1,
    i_start_x_05_e1,
    i_start_y_e1,
    i_end_y_e1,
    i_delta_e1,
    i_delta_t_e1,
    i_delta_a_e1,
    //   edge2
    i_start_x_e2,
    i_start_x_05_e2,
    i_start_y_e2,
    i_end_y_e2,
    i_delta_e2,
    i_delta_t_e2,
    i_delta_a_e2,
    o_ack,
    // triangle data
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
    i_param0_en,
    i_param1_en,
    i_param0_size,
    i_param1_size,
    // output left
    o_valid_l,
    i_busy_l,
    o_x_l,
    o_y_l,
    o_z_l,
    o_iw_l,
    o_param00_l,
    o_param01_l,
    o_param02_l,
    o_param03_l,
    o_param10_l,
    o_param11_l,
`ifdef VTX_PARAM1_REDUCE
`else
    o_param12_l,
    o_param13_l,
`endif
    // output right
    o_valid_r,
    i_busy_r,
    o_x_r,
    o_y_r,
    o_z_r,
    o_iw_r,
    o_param00_r,
    o_param01_r,
    o_param02_r,
    o_param03_r,
    o_param10_r,
    o_param11_r
`ifdef VTX_PARAM1_REDUCE
`else
    ,o_param12_r,
    o_param13_r
`endif
);

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // outline parameters
    input         i_ml;
    input         i_is_first;
    input         i_is_second;
    input         i_valid;
    input         i_aa_mode;
    // idle state indicator
    output        o_idle;
    //   edge0
    input  [20:0] i_start_x_e0;
    input  [20:0] i_start_x_05_e0;
    input  [20:0] i_start_y_e0;
    input  [20:0] i_end_y_e0;
    input  [21:0] i_delta_e0;
    input  [21:0] i_delta_t_e0;
    input  [21:0] i_delta_a_e0;
    //   edge1
    input  [20:0] i_start_x_e1;
    input  [20:0] i_start_x_05_e1;
    input  [20:0] i_start_y_e1;
    input  [20:0] i_end_y_e1;
    input  [21:0] i_delta_e1;
    input  [21:0] i_delta_t_e1;
    input  [21:0] i_delta_a_e1;
    //   edge2
    input  [20:0] i_start_x_e2;
    input  [20:0] i_start_x_05_e2;
    input  [20:0] i_start_y_e2;
    input  [20:0] i_end_y_e2;
    input  [21:0] i_delta_e2;
    input  [21:0] i_delta_t_e2;
    input  [21:0] i_delta_a_e2;
    output        o_ack;
    // triangle data
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
    input         i_param0_en;
    input         i_param1_en;
    input  [1:0]  i_param0_size;
    input  [1:0]  i_param1_size;
    // output left
    output        o_valid_l;
    input         i_busy_l;
    output [20:0] o_x_l;
    output [8:0]  o_y_l;
    output [20:0] o_z_l;
    output [20:0] o_iw_l;
    output [20:0] o_param00_l;
    output [20:0] o_param01_l;
    output [20:0] o_param02_l;
    output [20:0] o_param03_l;
    output [20:0] o_param10_l;
    output [20:0] o_param11_l;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_param12_l;
    output [20:0] o_param13_l;
`endif
    // output right
    output        o_valid_r;
    input         i_busy_r;
    output [20:0] o_x_r;
    output [8:0]  o_y_r;
    output [20:0] o_z_r;
    output [20:0] o_iw_r;
    output [20:0] o_param00_r;
    output [20:0] o_param01_r;
    output [20:0] o_param02_r;
    output [20:0] o_param03_r;
    output [20:0] o_param10_r;
    output [20:0] o_param11_r;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_param12_r;
    output [20:0] o_param13_r;
`endif

////////////////////////////
// wire
////////////////////////////
    wire          w_valid_l;
    wire   [20:0] w_start_x_l;
    wire   [20:0] w_start_x_05_l;
    wire   [20:0] w_start_y_l;
    wire   [20:0] w_end_y_l;
    wire   [21:0] w_delta_x_l;
    wire   [21:0] w_delta_t_l;
    wire   [21:0] w_delta_a_l;
    wire   [20:0] w_z_s_l;
    wire   [20:0] w_iw_s_l;
    wire   [20:0] w_p00_s_l;
    wire   [20:0] w_p01_s_l;
    wire   [20:0] w_p02_s_l;
    wire   [20:0] w_p03_s_l;
    wire   [20:0] w_p10_s_l;
    wire   [20:0] w_p11_s_l;
`ifdef VTX_PARAM1_REDUCE
`else
    wire   [20:0] w_p12_s_l;
    wire   [20:0] w_p13_s_l;
`endif
    wire   [20:0] w_z_e_l;
    wire   [20:0] w_iw_e_l;
    wire   [20:0] w_p00_e_l;
    wire   [20:0] w_p01_e_l;
    wire   [20:0] w_p02_e_l;
    wire   [20:0] w_p03_e_l;
    wire   [20:0] w_p10_e_l;
    wire   [20:0] w_p11_e_l;
`ifdef VTX_PARAM1_REDUCE
`else
    wire   [20:0] w_p12_e_l;
    wire   [20:0] w_p13_e_l;
`endif

    wire          w_valid_r;
    wire   [20:0] w_start_x_r;
    wire   [20:0] w_start_x_05_r;
    wire   [20:0] w_start_y_r;
    wire   [20:0] w_end_y_r;
    wire   [21:0] w_delta_x_r;
    wire   [21:0] w_delta_t_r;
    wire   [21:0] w_delta_a_r;
    wire   [20:0] w_z_s_r;
    wire   [20:0] w_iw_s_r;
    wire   [20:0] w_p00_s_r;
    wire   [20:0] w_p01_s_r;
    wire   [20:0] w_p02_s_r;
    wire   [20:0] w_p03_s_r;
    wire   [20:0] w_p10_s_r;
    wire   [20:0] w_p11_s_r;
`ifdef VTX_PARAM1_REDUCE
`else
    wire   [20:0] w_p12_s_r;
    wire   [20:0] w_p13_s_r;
`endif
    wire   [20:0] w_z_e_r;
    wire   [20:0] w_iw_e_r;
    wire   [20:0] w_p00_e_r;
    wire   [20:0] w_p01_e_r;
    wire   [20:0] w_p02_e_r;
    wire   [20:0] w_p03_e_r;
    wire   [20:0] w_p10_e_r;
    wire   [20:0] w_p11_e_r;
`ifdef VTX_PARAM1_REDUCE
`else
    wire   [20:0] w_p12_e_r;
    wire   [20:0] w_p13_e_r;
`endif

    wire          w_ack_l;
    wire          w_ack_r;
    wire          w_has_bottom;

    wire          w_idle_ctrl;
    wire          w_idle_edge_l;
    wire          w_idle_edge_r;
/////////////////////////
//  assign statement
/////////////////////////
    assign o_idle = w_idle_ctrl & w_idle_edge_l * w_idle_edge_r;
////////////////////////////
// module instance
////////////////////////////
    // edge select control
    fm_3d_ru_outline_edge_ctrl edge_ctrl (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // outline parameters
        .i_valid(i_valid),
        .i_ml(i_ml),
        .i_is_first(i_is_first),
        .i_is_second(i_is_second),
        // idle state indicator
        .o_idle(w_idle_ctrl),
        //   edge0
        .i_start_x_e0(i_start_x_e0),
        .i_start_x_05_e0(i_start_x_05_e0),
        .i_start_y_e0(i_start_y_e0),
        .i_end_y_e0(i_end_y_e0),
        .i_delta_e0(i_delta_e0),
        .i_delta_t_e0(i_delta_t_e0),
        .i_delta_a_e0(i_delta_a_e0),
        //   edge1
        .i_start_x_e1(i_start_x_e1),
        .i_start_x_05_e1(i_start_x_05_e1),
        .i_start_y_e1(i_start_y_e1),
        .i_end_y_e1(i_end_y_e1),
        .i_delta_e1(i_delta_e1),
        .i_delta_t_e1(i_delta_t_e1),
        .i_delta_a_e1(i_delta_a_e1),
        //   edge2
        .i_start_x_e2(i_start_x_e2),
        .i_start_x_05_e2(i_start_x_05_e2),
        .i_start_y_e2(i_start_y_e2),
        .i_end_y_e2(i_end_y_e2),
        .i_delta_e2(i_delta_e2),
        .i_delta_t_e2(i_delta_t_e2),
        .i_delta_a_e2(i_delta_a_e2),
        .o_ack(o_ack),
        // triangle data
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
        // control flag
        .o_has_bottom(w_has_bottom),
        // left edge data out
        .o_valid_l(w_valid_l),
        .o_start_x_l(w_start_x_l),
        .o_start_x_05_l(w_start_x_05_l),
        .o_start_y_l(w_start_y_l),
        .o_end_y_l(w_end_y_l),
        .o_delta_l(w_delta_x_l),
        .o_delta_t_l(w_delta_t_l),
        .o_delta_a_l(w_delta_a_l),
        .i_ack_l(w_ack_l),
        // left vertex parameters
        .o_z_s_l(w_z_s_l),
        .o_iw_s_l(w_iw_s_l),
        .o_p00_s_l(w_p00_s_l),
        .o_p01_s_l(w_p01_s_l),
        .o_p02_s_l(w_p02_s_l),
        .o_p03_s_l(w_p03_s_l),
        .o_p10_s_l(w_p10_s_l),
        .o_p11_s_l(w_p11_s_l),
`ifdef VTX_PARAM1_REDUCE
`else
        .o_p12_s_l(w_p12_s_l),
        .o_p13_s_l(w_p13_s_l),
`endif
        .o_z_e_l(w_z_e_l),
        .o_iw_e_l(w_iw_e_l),
        .o_p00_e_l(w_p00_e_l),
        .o_p01_e_l(w_p01_e_l),
        .o_p02_e_l(w_p02_e_l),
        .o_p03_e_l(w_p03_e_l),
        .o_p10_e_l(w_p10_e_l),
        .o_p11_e_l(w_p11_e_l),
`ifdef VTX_PARAM1_REDUCE
`else
        .o_p12_e_l(w_p12_e_l),
        .o_p13_e_l(w_p13_e_l),
`endif
        // right edge data out
        .o_valid_r(w_valid_r),
        .o_start_x_r(w_start_x_r),
        .o_start_x_05_r(w_start_x_05_r),
        .o_start_y_r(w_start_y_r),
        .o_end_y_r(w_end_y_r),
        .o_delta_r(w_delta_x_r),
        .o_delta_t_r(w_delta_t_r),
        .o_delta_a_r(w_delta_a_r),
        .i_ack_r(w_ack_r),
        // right vertex parameters
        .o_z_s_r(w_z_s_r),
        .o_iw_s_r(w_iw_s_r),
        .o_p00_s_r(w_p00_s_r),
        .o_p01_s_r(w_p01_s_r),
        .o_p02_s_r(w_p02_s_r),
        .o_p03_s_r(w_p03_s_r),
        .o_p10_s_r(w_p10_s_r),
        .o_p11_s_r(w_p11_s_r),
`ifdef VTX_PARAM1_REDUCE
`else
        .o_p12_s_r(w_p12_s_r),
        .o_p13_s_r(w_p13_s_r),
`endif
        .o_z_e_r(w_z_e_r),
        .o_iw_e_r(w_iw_e_r),
        .o_p00_e_r(w_p00_e_r),
        .o_p01_e_r(w_p01_e_r),
        .o_p02_e_r(w_p02_e_r),
        .o_p03_e_r(w_p03_e_r),
        .o_p10_e_r(w_p10_e_r),
        .o_p11_e_r(w_p11_e_r)
`ifdef VTX_PARAM1_REDUCE
`else
        ,.o_p12_e_r(w_p12_e_r),
        .o_p13_e_r(w_p13_e_r)
`endif
    );

    // left edge
    fm_3d_ru_outline_edge_core edge_left (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // idle state indicator
        .o_idle(w_idle_edge_l),
        // outline parameters
        .i_valid(w_valid_l),
        .i_has_bottom(w_has_bottom),
        .i_start_x(w_start_x_l),
        .i_start_x_05(w_start_x_05_l),
        .i_start_y(w_start_y_l),
        .i_end_y(w_end_y_l),
        .i_delta_x(w_delta_x_l),
        .i_delta_t(w_delta_t_l),
        .i_delta_a(w_delta_a_l),
        .o_ack(w_ack_l),
        // vertex parameters
        .i_z_s(w_z_s_l),
        .i_iw_s(w_iw_s_l),
        .i_param00_s(w_p00_s_l),
        .i_param01_s(w_p01_s_l),
        .i_param02_s(w_p02_s_l),
        .i_param03_s(w_p03_s_l),
        .i_param10_s(w_p10_s_l),
        .i_param11_s(w_p11_s_l),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_param12_s(w_p12_s_l),
        .i_param13_s(w_p13_s_l),
`endif
        .i_z_e(w_z_e_l),
        .i_iw_e(w_iw_e_l),
        .i_param00_e(w_p00_e_l),
        .i_param01_e(w_p01_e_l),
        .i_param02_e(w_p02_e_l),
        .i_param03_e(w_p03_e_l),
        .i_param10_e(w_p10_e_l),
        .i_param11_e(w_p11_e_l),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_param12_e(w_p12_e_l),
        .i_param13_e(w_p13_e_l),
`endif
        // control registers
        .i_aa_mode(i_aa_mode),
        .i_param0_en(i_param0_en),
        .i_param1_en(i_param1_en),
        .i_param0_size(i_param0_size),
        .i_param1_size(i_param1_size),
        // output
        .o_valid(o_valid_l),
        .i_busy(i_busy_l),
        .o_x(o_x_l),
        .o_y(o_y_l),
        .o_z(o_z_l),
        .o_iw(o_iw_l),
        .o_param00(o_param00_l),
        .o_param01(o_param01_l),
        .o_param02(o_param02_l),
        .o_param03(o_param03_l),
        .o_param10(o_param10_l),
        .o_param11(o_param11_l)
`ifdef VTX_PARAM1_REDUCE
`else
        ,.o_param12(o_param12_l),
        .o_param13(o_param13_l)
`endif
    );


    // right edge
    fm_3d_ru_outline_edge_core edge_right (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // idle state indicator
        .o_idle(w_idle_edge_r),
        // outline parameters
        .i_valid(w_valid_r),
        .i_has_bottom(w_has_bottom),
        .i_start_x(w_start_x_r),
        .i_start_x_05(w_start_x_05_r),
        .i_start_y(w_start_y_r),
        .i_end_y(w_end_y_r),
        .i_delta_x(w_delta_x_r),
        .i_delta_t(w_delta_t_r),
        .i_delta_a(w_delta_a_r),
        .o_ack(w_ack_r),
        // vertex parameters
        .i_z_s(w_z_s_r),
        .i_iw_s(w_iw_s_r),
        .i_param00_s(w_p00_s_r),
        .i_param01_s(w_p01_s_r),
        .i_param02_s(w_p02_s_r),
        .i_param03_s(w_p03_s_r),
        .i_param10_s(w_p10_s_r),
        .i_param11_s(w_p11_s_r),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_param12_s(w_p12_s_r),
        .i_param13_s(w_p13_s_r),
`endif
        .i_z_e(w_z_e_r),
        .i_iw_e(w_iw_e_r),
        .i_param00_e(w_p00_e_r),
        .i_param01_e(w_p01_e_r),
        .i_param02_e(w_p02_e_r),
        .i_param03_e(w_p03_e_r),
        .i_param10_e(w_p10_e_r),
        .i_param11_e(w_p11_e_r),
`ifdef VTX_PARAM1_REDUCE
`else
        .i_param12_e(w_p12_e_r),
        .i_param13_e(w_p13_e_r),
`endif
        // control registers
        .i_aa_mode(i_aa_mode),
        .i_param0_en(i_param0_en),
        .i_param1_en(i_param1_en),
        .i_param0_size(i_param0_size),
        .i_param1_size(i_param1_size),
        // output
        .o_valid(o_valid_r),
        .i_busy(i_busy_r),
        .o_x(o_x_r),
        .o_y(o_y_r),
        .o_z(o_z_r),
        .o_iw(o_iw_r),
        .o_param00(o_param00_r),
        .o_param01(o_param01_r),
        .o_param02(o_param02_r),
        .o_param03(o_param03_r),
        .o_param10(o_param10_r),
        .o_param11(o_param11_r)
`ifdef VTX_PARAM1_REDUCE
`else
        ,.o_param12(o_param12_r),
        .o_param13(o_param13_r)
`endif
    );

endmodule
