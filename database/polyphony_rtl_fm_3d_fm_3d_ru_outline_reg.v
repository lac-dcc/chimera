//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_ru_outline_reg.v
//
// Abstract:
//   output register module
//
//  Created:
//    15 December 2008
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

module fm_3d_ru_outline_reg (
    clk_core,
    // parameter init
    i_coord_valid,
    i_start_x,
    i_start_y,
    i_init_valid,
    i_init_kind,
    i_init_val,
    // parameter update
    i_update_valid,
    i_update_kind,
    i_update_edge_val,
    // parameter output
    o_edge_x,
    o_edge_y,
    o_edge_y_float,
    o_edge_z,
    o_edge_iw,
    o_edge_param00,
    o_edge_param01,
    o_edge_param02,
    o_edge_param03,
    o_edge_param10,
    o_edge_param11
`ifdef VTX_PARAM1_REDUCE
`else
    ,o_edge_param12,
    o_edge_param13
`endif
);
////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    // x,y init
    input         i_coord_valid;
    input  [20:0] i_start_x;
    input  [20:0] i_start_y;
    input         i_init_valid;
    input  [3:0]  i_init_kind;
    input  [20:0] i_init_val;
    // parameter update
    input         i_update_valid;
    input  [3:0]  i_update_kind;
    input  [21:0] i_update_edge_val;
    // parameter output
    output [20:0] o_edge_x;  //round
    output [20:0] o_edge_y_float;  // for end check
    output [8:0]  o_edge_y;  // int
    output [20:0] o_edge_z;
    output [20:0] o_edge_iw;
    output [20:0] o_edge_param00;
    output [20:0] o_edge_param01;
    output [20:0] o_edge_param02;
    output [20:0] o_edge_param03;
    output [20:0] o_edge_param10;
    output [20:0] o_edge_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    output [20:0] o_edge_param12;
    output [20:0] o_edge_param13;
`endif
////////////////////////////
// reg
////////////////////////////
    reg    [20:0] r_edge_x;
    reg    [20:0] r_edge_y;
    reg    [20:0] r_edge_z;
    reg    [20:0] r_edge_iw;
    reg    [20:0] r_edge_param00;
    reg    [20:0] r_edge_param01;
    reg    [20:0] r_edge_param02;
    reg    [20:0] r_edge_param03;
    reg    [20:0] r_edge_param10;
    reg    [20:0] r_edge_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    reg    [20:0] r_edge_param12;
    reg    [20:0] r_edge_param13;
`endif

////////////////////////////
// wire
////////////////////////////
    wire          w_set_init_z;
    wire          w_set_init_iw;
    wire          w_set_init_param00;
    wire          w_set_init_param01;
    wire          w_set_init_param02;
    wire          w_set_init_param03;
    wire          w_set_init_param10;
    wire          w_set_init_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    wire          w_set_init_param12;
    wire          w_set_init_param13;
`endif

    wire          w_set_update_x;
    wire          w_set_update_y;
    wire          w_set_update_z;
    wire          w_set_update_iw;
    wire          w_set_update_param00;
    wire          w_set_update_param01;
    wire          w_set_update_param02;
    wire          w_set_update_param03;
    wire          w_set_update_param10;
    wire          w_set_update_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    wire          w_set_update_param12;
    wire          w_set_update_param13;
`endif

    wire  [21:0]  w_round_x;
    wire  [20:0]  w_floor_x;
    wire  [15:0]  w_iy;
////////////////////////////
// assign
////////////////////////////
    assign w_set_update_x = i_update_valid & (i_update_kind == `FPARAM_X);
    assign w_set_update_y = i_update_valid & (i_update_kind == `FPARAM_Y);
    assign w_set_update_z = i_update_valid & (i_update_kind == `FPARAM_Z);
    assign w_set_update_iw = i_update_valid & 
                              (i_update_kind == `FPARAM_IW);
    assign w_set_update_param00 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P00);
    assign w_set_update_param01 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P01);
    assign w_set_update_param02 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P02);
    assign w_set_update_param03 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P03);
    assign w_set_update_param10 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P10);
    assign w_set_update_param11 = i_update_valid & 
                                  (i_update_kind == `FPARAM_P11);


`ifdef VTX_PARAM1_REDUCE
`else
    assign w_set_update_param12 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P12);
    assign w_set_update_param13 = i_update_valid & 
                                   (i_update_kind == `FPARAM_P13);
`endif



    assign w_set_init_z = i_init_valid & (i_init_kind == `FPARAM_Z);
    assign w_set_init_iw = i_init_valid & 
                              (i_init_kind == `FPARAM_IW);
    assign w_set_init_param00 = i_init_valid & 
                                   (i_init_kind == `FPARAM_P00);
    assign w_set_init_param01 = i_init_valid & 
                                   (i_init_kind == `FPARAM_P01);
    assign w_set_init_param02 = i_init_valid & 
                                   (i_init_kind == `FPARAM_P02);
    assign w_set_init_param03 = i_init_valid & 
                                   (i_init_kind == `FPARAM_P03);
    assign w_set_init_param10 = i_init_valid & 
                                   (i_init_kind == `FPARAM_P10);
    assign w_set_init_param11 = i_init_valid & 
                                  (i_init_kind == `FPARAM_P11);
`ifdef VTX_PARAM1_REDUCE
`else
    assign w_set_init_param12 = i_init_valid & 
                                   (i_init_kind == `FPARAM_P12);
    assign w_set_init_param13 = i_init_valid & 
                                   (i_init_kind == `FPARAM_P13);
`endif
    assign o_edge_x = w_floor_x;
    assign o_edge_y  = w_iy[8:0];
    assign o_edge_y_float = r_edge_y;
    assign o_edge_z = r_edge_z;
    assign o_edge_iw = r_edge_iw;
    assign o_edge_param00 = r_edge_param00;
    assign o_edge_param01 = r_edge_param01;
    assign o_edge_param02 = r_edge_param02;
    assign o_edge_param03 = r_edge_param03;
    assign o_edge_param10 = r_edge_param10;
    assign o_edge_param11 = r_edge_param11;
`ifdef VTX_PARAM1_REDUCE
`else
    assign o_edge_param12 = r_edge_param12;
    assign o_edge_param13 = r_edge_param13;
`endif

////////////////////////////
// always
////////////////////////////

    always @(posedge clk_core) begin
        if (w_set_update_x) r_edge_x <= i_update_edge_val[20:0];
        else if (i_coord_valid) r_edge_x <= i_start_x;

        if (w_set_update_y) r_edge_y <= i_update_edge_val[20:0];
        else if (i_coord_valid) r_edge_y <= i_start_y;

        if (w_set_update_z) r_edge_z <= i_update_edge_val[20:0];
        else if (w_set_init_z) r_edge_z <= i_init_val[20:0];

        if (w_set_update_iw) r_edge_iw <= i_update_edge_val[20:0];
        else if (w_set_init_iw) r_edge_iw <= i_init_val[20:0];

        if (w_set_update_param00) r_edge_param00 <= i_update_edge_val[20:0];
        else if (w_set_init_param00) r_edge_param00 <= i_init_val[20:0];

        if (w_set_update_param01) r_edge_param01 <= i_update_edge_val[20:0];
        else if (w_set_init_param01) r_edge_param01 <= i_init_val[20:0];

        if (w_set_update_param02) r_edge_param02 <= i_update_edge_val[20:0];
        else if (w_set_init_param02) r_edge_param02 <= i_init_val[20:0];

        if (w_set_update_param03) r_edge_param03 <= i_update_edge_val[20:0];
        else if (w_set_init_param03) r_edge_param03 <= i_init_val[20:0];

        if (w_set_update_param10) r_edge_param10 <= i_update_edge_val[20:0];
        else if (w_set_init_param10) r_edge_param10 <= i_init_val[20:0];

        if (w_set_update_param11) r_edge_param11 <= i_update_edge_val[20:0];
        else if (w_set_init_param11) r_edge_param11 <= i_init_val[20:0];
`ifdef VTX_PARAM1_REDUCE
`else
        if (w_set_update_param12) r_edge_param12 <= i_update_edge_val[20:0];
        else if (w_set_init_param12) r_edge_param12 <= i_init_val[20:0];

        if (w_set_update_param13) r_edge_param13 <= i_update_edge_val[20:0];
        else if (w_set_init_param13) r_edge_param13 <= i_init_val[20:0];
`endif
    end
////////////////////////////
// module instance
////////////////////////////


    fm_3d_f22_floor f22_floor (
        .i_a(r_edge_x),
        .o_b(w_floor_x)
    );

    // ftoi for y
    fm_3d_f22_to_ui ftoi_y (
        .i_a({1'b0,r_edge_y}),
        .o_b(w_iy)
    );

endmodule
