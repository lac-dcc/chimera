//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_pu.v
//
// Abstract:
//   Pixel unit
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
// 2009/02/10 discard fragment if x is same as screen width
// 2009/10/12 add buffer offset select for anaglyph
// 2014/03/28 64-bit data bus support

module fm_3d_pu (
    clk_core,
    rst_x,
    // register configuration
    i_tex_enable,
    i_tex_blend_enable,
    i_color_offset,
    i_color_ms_offset,
    i_depth_offset,
    i_depth_ms_offset,
    i_depth_test_en,
    i_depth_func,
    i_color_blend_en,
    i_color_blend_eq,
    i_color_blend_sf,
    i_color_blend_df,
    i_color_mask,
    i_color_mode,
    i_screen_flip,
    i_ag_mode,
    o_idle,
    // rasterizer unit
    i_valid_ru,
    i_aa_mode,
    i_x,
    i_y,
    i_z,
    i_cr,
    i_cg,
    i_cb,
    i_ca,
    o_busy_ru,
    // texture unit
    i_valid_tu,
    i_tr,
    i_tg,
    i_tb,
    i_ta,
    o_busy_tu,
    // color
    o_req_cb,
    o_wr_cb,
    o_adrs_cb,
    i_ack_cb,
    o_len_cb,
    o_be_cb,
    o_strw_cb,
    o_dbw_cb,
    i_ackw_cb,
    i_strr_cb,
    i_dbr_cb,
    // depth
    o_req_db,
    o_wr_db,
    o_adrs_db,
    i_ack_db,
    o_len_db,
    o_be_db,
    o_strw_db,
    o_dbw_db,
    i_ackw_db,
    i_strr_db,
    i_dbr_db
);
`include "polyphony_params.v"
////////////////////////////
// Parameter definition
////////////////////////////
    localparam P_WIDTH  = 10'd640;
    localparam P_HEIGHT = 9'd480;
    // main state
    localparam P_IDLE       = 2'd0;
    localparam P_DEPTH_PROC = 2'd1;
    localparam P_COLOR_PROC = 2'd2;
    // depth state
    localparam P_DEPTH_IDLE       = 3'd0;
    localparam P_DEPTH_RREQ       = 3'd1;
    localparam P_DEPTH_WAIT_RDATA = 3'd2;
    localparam P_DEPTH_TEST       = 3'd3;
    localparam P_DEPTH_WREQ       = 3'd4;
    // color state
    localparam P_COLOR_IDLE       = 3'd0;
    localparam P_COLOR_RREQ       = 3'd1;
    localparam P_COLOR_WAIT_RDATA = 3'd2;
    localparam P_COLOR_BLEND      = 3'd3;
    localparam P_COLOR_WREQ       = 3'd4;
    // depth test
    localparam P_DF_NEVER         = 3'd2;
    localparam P_DF_ALWAYS        = 3'd1;
    localparam P_DF_LESS          = 3'd0;
    localparam P_DF_LEQUAL        = 3'd3;
    localparam P_DF_EQUAL         = 3'd4;
    localparam P_DF_GREATER       = 3'd5;
    localparam P_DF_GEQUAL        = 3'd6;
    localparam P_DF_NOTEQUAL      = 3'd7;
    // blend equation
    localparam P_BEQ_ADD          = 3'd0;
    localparam P_BEQ_SUB          = 3'd1;
    localparam P_BEQ_REV_SUB      = 3'd2;
    localparam P_BEQ_MIN          = 3'd3;
    localparam P_BEQ_MAX          = 3'd4;
    localparam P_BEQ_ADD_SCREEN   = 3'd5;
    // blend factor
    localparam P_BF_ZERO          = 4'd0;
    localparam P_BF_ONE           = 4'd1;
    localparam P_BF_SRC_COLOR           = 4'd2;
    localparam P_BF_ONE_MINUS_SRC_COLOR = 4'd3;
    localparam P_BF_DST_COLOR           = 4'd4;
    localparam P_BF_ONE_MINUS_DST_COLOR = 4'd5;
    localparam P_BF_SRC_ALPHA           = 4'd6;
    localparam P_BF_ONE_MINUS_SRC_ALPHA = 4'd7;
    localparam P_BF_DST_ALPHA           = 4'd8;
    localparam P_BF_ONE_MINUS_DST_ALPHA = 4'd9;
    localparam P_BF_SRC_CONSTANT_COLOR  = 4'd10;
    localparam P_BF_ONE_MINUS_CONSTANT_COLOR = 4'd11;
    localparam P_BF_SRC_CONSTANT_ALPHA  = 4'd12;
    localparam P_BF_ONE_MINUS_CONSTANT_ALPHA = 4'd13;
    localparam P_BF_SRC_ALPHA_SATURATE  = 4'd14;

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // register configuration
    input         i_tex_enable;
    input         i_tex_blend_enable;
    input         i_depth_test_en;
    input  [2:0]  i_depth_func;
    input         i_color_blend_en;
    input  [2:0]  i_color_blend_eq;
    input  [3:0]  i_color_blend_sf;
    input  [3:0]  i_color_blend_df;
    input  [3:0]  i_color_mask;
    input  [11:0] i_color_offset;
    input  [11:0] i_color_ms_offset;
    input  [11:0] i_depth_offset;
    input  [11:0] i_depth_ms_offset;
    input  [1:0]  i_color_mode;
    input         i_screen_flip;
    input         i_ag_mode;
    output        o_idle;
    // rasterizer unit
    input         i_valid_ru;
    input         i_aa_mode;
    input  [9:0]  i_x;
    input  [8:0]  i_y;
    input  [15:0] i_z;
    input  [7:0]  i_cr;
    input  [7:0]  i_cg;
    input  [7:0]  i_cb;
    input  [7:0]  i_ca;
    output        o_busy_ru;
    // texture unit
    input         i_valid_tu;
    input  [7:0]  i_tr;
    input  [7:0]  i_tg;
    input  [7:0]  i_tb;
    input  [7:0]  i_ta;
    output        o_busy_tu;
    // color
    output        o_req_cb;
    output        o_wr_cb;
    output [P_IB_ADDR_WIDTH-1:0]
                  o_adrs_cb;
    input         i_ack_cb;
    output [P_IB_LEN_WIDTH-1:0]
                  o_len_cb;
    output [P_IB_BE_WIDTH-1:0]
                  o_be_cb;
    output        o_strw_cb;
    output [P_IB_DATA_WIDTH-1:0]
                  o_dbw_cb;
    input         i_ackw_cb;
    input         i_strr_cb;
    input  [P_IB_DATA_WIDTH-1:0]
                  i_dbr_cb;
    // depth
    output        o_req_db;
    output        o_wr_db;
    output [P_IB_ADDR_WIDTH-1:0]
                  o_adrs_db;
    input         i_ack_db;
    output [P_IB_LEN_WIDTH-1:0]
                  o_len_db;
    output [P_IB_BE_WIDTH-1:0]
                  o_be_db;
    output        o_strw_db;
    output [P_IB_DATA_WIDTH-1:0] 
                  o_dbw_db;
    input         i_ackw_db;
    input         i_strr_db;
    input  [P_IB_DATA_WIDTH-1:0]
                  i_dbr_db;

////////////////////////////
// reg
////////////////////////////

    reg    [1:0]  r_state;
    reg    [2:0]  r_depth_state;
    reg    [2:0]  r_color_state;
    reg    [15:0] r_dst_db;
`ifdef PP_BUSWIDTH_64
    reg    [16:0] r_linear_adrs;
    reg    [1:0]  r_linear_adrs_lsb;
`else
    reg    [17:0] r_linear_adrs;
    reg           r_linear_adrs_lsb;
`endif
////////////////////////////
// wire
////////////////////////////
    // texture blender out
    wire          w_valid_tb;
    wire          w_aa_mode_tb;
    wire   [9:0]  w_x_tb;
    wire   [8:0]  w_y_tb;
    wire   [15:0] w_z_tb;
    wire   [7:0]  w_cr_tb;
    wire   [7:0]  w_cg_tb;
    wire   [7:0]  w_cb_tb;
    wire   [7:0]  w_ca_tb;
    wire          w_busy_tb;
    // fifo out
    wire          w_aa_mode;
    wire   [9:0]  w_x;
    wire   [8:0]  w_y;
    wire   [15:0] w_z;
    wire   [7:0]  w_cr;
    wire   [7:0]  w_cg;
    wire   [7:0]  w_cb;
    wire   [7:0]  w_ca;

    wire   [7:0]  w_sr;
    wire   [7:0]  w_sg;
    wire   [7:0]  w_sb;
    wire   [7:0]  w_sa;

    wire   [7:0]  w_br;
    wire   [7:0]  w_bg;
    wire   [7:0]  w_bb;
    wire   [7:0]  w_ba;

    wire   [7:0]  w_fr;
    wire   [7:0]  w_fg;
    wire   [7:0]  w_fb;
    wire   [7:0]  w_fa;

    wire   [18:0] w_height_mul;     // 16bit address
    wire   [18:0] w_linear_adrs;    // 16bit address
    wire          w_depth_proc_end;
    wire          w_color_update;
    wire          w_color_proc_end;
    wire          w_depth_proc_start;
    wire          w_depth_update;
    wire          w_color_write_start;
    wire   [15:0] w_dst_db;
    wire   [15:0] w_dst_cb;
    wire   [15:0] w_new_cb;
    wire          w_set_dst_db;
    wire   [8:0]  w_y_t;

    wire   [67:0] w_fifo_in;
    wire   [67:0] w_fifo_out;
    wire          w_fifo_ren;
    wire          w_fifo_empty;
    wire          w_start;
    wire          w_start_idle;
    wire          w_finish_blend;

    wire   [11:0] w_color_offset;
    wire   [11:0] w_depth_offset;
    wire          w_invalid_x;
    wire          w_discard;
////////////////////////////
// assign
////////////////////////////
    assign o_idle = (r_state == P_IDLE)&w_fifo_empty;

    assign w_fifo_in = {w_aa_mode_tb,w_x_tb,w_y_tb,w_z_tb,w_cr_tb,w_cg_tb,w_cb_tb,w_ca_tb};
    assign {w_aa_mode,
            w_x,
            w_y,
            w_z,
            w_cr,
            w_cg,
            w_cb,
            w_ca } = w_fifo_out;

    //assign w_color_offset = (w_aa_mode) ? i_color_ms_offset : i_color_offset;
    assign w_color_offset = (w_aa_mode|i_ag_mode) ? i_color_ms_offset :
                                                    i_color_offset;
    //assign w_depth_offset = (w_aa_mode) ? i_depth_ms_offset : i_depth_offset;
    assign w_depth_offset = (w_aa_mode|i_ag_mode) ? i_depth_ms_offset :
                                                    i_depth_offset;

    assign w_sr = w_cr;
    assign w_sg = w_cg;
    assign w_sb = w_cb;
    assign w_sa = w_ca;
    assign w_y_t = (i_screen_flip) ? (9'd479 - w_y): w_y;
    assign w_height_mul = w_y_t * P_WIDTH;
    assign w_linear_adrs = w_height_mul + w_x;  // 0 - 4afff
    assign w_fifo_ren = ((r_state == P_DEPTH_PROC) & w_depth_proc_end & !w_color_update)|
                        ((r_state == P_COLOR_PROC) & w_color_proc_end) | w_discard;

    assign w_start =  !w_fifo_empty & !w_invalid_x;
    assign w_invalid_x = (w_x >= 10'd640);
    assign w_discard = w_invalid_x & !w_fifo_empty;
    assign w_start_idle = w_start & (r_state == P_IDLE);
    assign w_depth_proc_start = w_start_idle & i_depth_test_en;
    assign w_depth_proc_end = ((r_depth_state == P_DEPTH_TEST) & !w_depth_update)|
                              ((r_depth_state == P_DEPTH_WREQ)&i_ack_db);
    assign o_req_db = (r_depth_state == P_DEPTH_RREQ) |
                      (r_depth_state == P_DEPTH_WREQ);
    assign o_adrs_db = {w_depth_offset, r_linear_adrs};
    assign o_len_db = 6'h1;
    assign o_wr_db = (r_depth_state == P_DEPTH_WREQ);
    assign o_strw_db = (r_depth_state == P_DEPTH_WREQ);
`ifdef PP_BUSWIDTH_64
    assign o_be_db = (r_linear_adrs_lsb == 2'd1 ) ? 8'h0c :
		     (r_linear_adrs_lsb == 2'd2 ) ? 8'h30 :
		     (r_linear_adrs_lsb == 2'd3 ) ? 8'hc0 :
                                                     8'h3;
    assign o_dbw_db = {'d4{w_z}};
    assign w_dst_db = (r_linear_adrs_lsb == 2'd1) ? i_dbr_db[31:16]:
                      (r_linear_adrs_lsb == 2'd2) ? i_dbr_db[47:32]:
		      (r_linear_adrs_lsb == 2'd3) ? i_dbr_db[63:48]:
                                                    i_dbr_db[15:0];
`else
    assign o_be_db = (r_linear_adrs_lsb) ? 4'hc : 4'h3;
    assign o_dbw_db = {w_z, w_z};
    assign w_dst_db = (r_linear_adrs_lsb) ? i_dbr_db[31:16] : i_dbr_db[15:0];
`endif

    assign w_set_dst_db = (r_depth_state == P_DEPTH_WAIT_RDATA) & i_strr_db;
    assign w_depth_update = f_depth_test(r_dst_db,w_z, i_depth_func);

    assign w_color_update = w_depth_update;
    assign o_req_cb = (r_color_state == P_COLOR_RREQ) |
                      (r_color_state == P_COLOR_WREQ);
    assign o_adrs_cb = {w_color_offset, r_linear_adrs};
    assign o_len_cb = 6'h1;
    assign o_wr_cb = (r_color_state == P_COLOR_WREQ);
    assign o_strw_cb = (r_color_state == P_COLOR_WREQ);
`ifdef PP_BUSWIDTH_64
    assign o_be_cb = (r_linear_adrs_lsb == 2'd1 ) ? 8'h0c :
		     (r_linear_adrs_lsb == 2'd2 ) ? 8'h30 :
		     (r_linear_adrs_lsb == 2'd3 ) ? 8'hc0 :
                                                     8'h3;
    assign o_dbw_cb = {'d4{w_new_cb}};
    assign w_dst_cb = (r_linear_adrs_lsb == 2'd1) ? i_dbr_cb[31:16]:
                      (r_linear_adrs_lsb == 2'd2) ? i_dbr_cb[47:32]:
		      (r_linear_adrs_lsb == 2'd3) ? i_dbr_cb[63:48]:
                                                    i_dbr_cb[15:0];
`else
    assign o_be_cb = (r_linear_adrs_lsb) ? 4'hc : 4'h3;
    assign o_dbw_cb = {w_new_cb, w_new_cb};
    assign w_dst_cb = (r_linear_adrs_lsb) ? i_dbr_cb[31:16] : i_dbr_cb[15:0];
`endif
    assign w_fr = (!i_color_mask[0]) ? 8'h00 :
                  (i_color_blend_en) ? w_br : w_sr;
    assign w_fg = (!i_color_mask[1]) ? 8'h00 :
                  (i_color_blend_en) ? w_bg : w_sg;
    assign w_fb = (!i_color_mask[2]) ? 8'h00 :
                  (i_color_blend_en) ? w_bb : w_sb;
    assign w_fa = (!i_color_mask[3]) ? 8'h00 :
                  (i_color_blend_en) ? w_ba : w_sa;
    assign w_new_cb = f_set_color(w_fr,w_fg,w_fb,w_fa, i_color_mode);
    assign w_color_write_start = ((r_state == P_DEPTH_PROC) &
                                  w_depth_proc_end & w_color_update) |
                                 (w_start_idle &!i_depth_test_en)  ;
    assign w_color_proc_end = ((r_color_state == P_COLOR_WREQ)&i_ack_cb);

////////////////////////////
// always
////////////////////////////

    // main sequence
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state <= P_IDLE;
        end else begin
            case (r_state)
                P_IDLE: begin
                    if (w_start) begin
                        if (i_depth_test_en) r_state <= P_DEPTH_PROC;
                        else r_state <= P_COLOR_PROC;
                    end
                end
                P_DEPTH_PROC: begin
                    if (w_depth_proc_end) begin
                        if (w_color_update) begin
                            r_state <= P_COLOR_PROC;
                        end else begin
                            r_state <= P_IDLE;
                        end
                    end
                end
                P_COLOR_PROC: begin
                    if (w_color_proc_end) r_state <= P_IDLE;
                end
            endcase
        end
    end

    // depth sequence
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_depth_state <= P_DEPTH_IDLE;
        end else begin
            case (r_depth_state)
                P_DEPTH_IDLE: begin
                    if (w_depth_proc_start) r_depth_state <= P_DEPTH_RREQ;
                end
                P_DEPTH_RREQ: begin
                    if (i_ack_db) r_depth_state <= P_DEPTH_WAIT_RDATA;
                end
                P_DEPTH_WAIT_RDATA: begin
                    if (i_strr_db) r_depth_state <= P_DEPTH_TEST;
                end
                P_DEPTH_TEST: begin
                    if (w_depth_update) r_depth_state <= P_DEPTH_WREQ;
                    else r_depth_state <= P_IDLE;
                end
                P_DEPTH_WREQ: begin
                    if (i_ack_db) r_depth_state <= P_DEPTH_IDLE;
                end
            endcase
        end
    end

    // color sequence
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_color_state <= P_COLOR_IDLE;
        end else begin
            case (r_color_state)
                P_COLOR_IDLE: begin
                     if (w_color_write_start) begin
                         if (!i_color_blend_en)  r_color_state <= P_COLOR_WREQ;
                         else r_color_state <= P_COLOR_RREQ;
                     end
                end
                P_COLOR_RREQ: begin
                    if (i_ack_cb) r_color_state <= P_COLOR_WAIT_RDATA;
                end
                P_COLOR_WAIT_RDATA: begin
                    if (i_strr_cb)r_color_state <= P_COLOR_BLEND;
                end
                P_COLOR_BLEND: begin
                    if (w_finish_blend) r_color_state <= P_COLOR_WREQ;
                end
                P_COLOR_WREQ: begin
                    if (i_ack_cb) r_color_state <= P_COLOR_IDLE;
                end
            endcase
        end
    end


    always @(posedge clk_core) begin
        if (w_set_dst_db) r_dst_db <= w_dst_db;
    end

    always @(posedge clk_core) begin
`ifdef PP_BUSWIDTH_64
        r_linear_adrs <= w_linear_adrs[18:2];
        r_linear_adrs_lsb <= w_linear_adrs[1:0];
`else
        r_linear_adrs <= w_linear_adrs[18:1];
        r_linear_adrs_lsb <= w_linear_adrs[0];
`endif
    end
////////////////////////////
// function
////////////////////////////
    function f_depth_test;
        input [15:0] dst;
        input [15:0] src;
        input [2:0]  func;
        begin
            case (func)
                P_DF_NEVER:   f_depth_test = 1'b0;
                P_DF_ALWAYS:  f_depth_test = 1'b1;
                P_DF_LESS:    f_depth_test = (src < dst) ? 1'b1 : 1'b0;
                P_DF_LEQUAL:  f_depth_test = (src <= dst) ? 1'b1 : 1'b0;
                P_DF_EQUAL:   f_depth_test = (src == dst) ? 1'b1 : 1'b0;
                P_DF_GREATER: f_depth_test = (src > dst) ? 1'b1 : 1'b0;
                P_DF_GEQUAL:  f_depth_test = (src >= dst) ? 1'b1 : 1'b0;
                P_DF_NOTEQUAL:f_depth_test = (src != dst) ? 1'b1 : 1'b0;
                default: f_depth_test = 1'b1;
            endcase
        end
    endfunction

    function [15:0] f_set_color;
        input [7:0]  cr;
        input [7:0]  cg;
        input [7:0]  cb;
        input [7:0]  ca;
        input [1:0]  mode;
        begin
            case (mode)
                2'b00 : begin
                    // color mode 5:6:5
                    f_set_color = {cr[7:3],cg[7:2],cb[7:3]};
                end
                2'b01 : begin
                    // color mode 5:5:5:1
                    f_set_color = {cr[7:3],cg[7:3],cb[7:3], ca[7]};
                end
                2'b10 : begin
                    // color mode 4:4:4:4
                    f_set_color = {cr[7:4],cg[7:4],cb[7:4], ca[7:4]};
                end
                default : begin
                    // color mode 4:4:4:4
                    f_set_color = {cr[7:4],cg[7:4],cb[7:4], ca[7:4]};
                end
            endcase
        end
    endfunction




////////////////////////////
// module instance
////////////////////////////
    fm_cmn_bfifo #(68, 4) fifo (  // aa_mode,x,y,z,cr,cg,cb,ca
        .clk_core(clk_core),
        .rst_x(rst_x),
        .i_wstrobe(w_valid_tb),
        .i_dt(w_fifo_in),
        .o_full(w_busy_tb),
        .i_renable(w_fifo_ren),
        .o_dt(w_fifo_out),
        .o_empty(w_fifo_empty),
        .o_dnum()
    );

    fm_3d_color_blend color_blend (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // register configuration
        .i_color_mode(i_color_mode),
        .i_color_blend_en(i_color_blend_en),
        .i_color_blend_eq(i_color_blend_eq),
        .i_color_blend_sr(i_color_blend_sf),
        .i_color_blend_sd(i_color_blend_df),
        // source input
        .i_src_valid(w_start_idle),
        .i_sr(w_sr),
        .i_sg(w_sg),
        .i_sb(w_sb),
        .i_sa(w_sa),
        // destination input
        .i_dst_valid(i_strr_cb),
        .i_dst(w_dst_cb),
        // memory bus
        .o_valid(w_finish_blend),
        .o_fr(w_br),
        .o_fg(w_bg),
        .o_fb(w_bb),
        .o_fa(w_ba)
    );


    fm_3d_tex_blend tex_blend (
        .clk_core(clk_core),
        .rst_x(rst_x),
        // ru interface
        .i_valid_ru(i_valid_ru),
        .i_aa_mode(i_aa_mode),
        .i_x(i_x),
        .i_y(i_y),
        .i_z(i_z),
        .i_cr(i_cr),
        .i_cg(i_cg),
        .i_cb(i_cb),
        .i_ca(i_ca),
        .o_busy_ru(o_busy_ru),
        // texture unit
        .i_valid_tu(i_valid_tu),
        .i_tr(i_tr),
        .i_tg(i_tg),
        .i_tb(i_tb),
        .i_ta(i_ta),
        .o_busy_tu(o_busy_tu),
        // configurations
        .i_tex_enable(i_tex_enable),
        .i_tex_blend_enable(i_tex_blend_enable),
        // blend out
        .o_valid(w_valid_tb),
        .o_aa_mode(w_aa_mode_tb),
        .o_x(w_x_tb),
        .o_y(w_y_tb),
        .o_z(w_z_tb),
        .o_br(w_cr_tb),
        .o_bg(w_cg_tb),
        .o_bb(w_cb_tb),
        .o_ba(w_ca_tb),
        .i_busy(w_busy_tb)
    );

// debug
`ifdef RTL_DEBUG
reg [31:0] r_cnt_ru;
reg [31:0] r_cnt_tu;
initial begin
  r_cnt_ru = 0;
  r_cnt_tu = 0;
end

always @(posedge clk_core) begin
  if (i_valid_tu & !o_busy_tu) r_cnt_tu = r_cnt_tu + 1;
  if (i_valid_ru & !o_busy_ru) r_cnt_ru = r_cnt_ru + 1;
end

`endif

  
endmodule
