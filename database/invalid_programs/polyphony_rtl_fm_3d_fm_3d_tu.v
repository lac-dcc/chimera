// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_tu.v
//
// Abstract:
//   Texture
//
//  Created:
//    1 September 2008
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

module fm_3d_tu (
    clk_core,
    rst_x,
    // register configuration
    i_tex_enable,
    i_tex_format,
    i_tex_offset,
    i_tex_width_m1_f,  // texture width -1
    i_tex_height_m1_f, // texture height -1
    i_tex_width_ui,
    o_idle,
    // rasterizer bus
    i_valid,
    i_tu,
    i_tv,
    o_busy,
    // pixel unit bus
    o_valid,
    o_tr,
    o_tg,
    o_tb,
    o_ta,
    i_busy,
    // memory bus
    o_req,
    o_adrs,
    i_ack,
    o_len,
    i_strr,
    i_dbr
);
`include "polyphony_params.v"
////////////////////////////
// Parameter definition
////////////////////////////
    // main state
    parameter P_IDLE       = 3'd0;
    parameter P_ADRS_GEN   = 3'd1;
    parameter P_REQ        = 3'd2;
    parameter P_WAIT_RDATA0 = 3'd3;
    parameter P_WAIT_RDATA1 = 3'd4;
    parameter P_ETC0   = 3'd5;
    parameter P_ETC1   = 3'd6;
    parameter P_OUT        = 3'd7;
    // address generation state
    parameter P_AGEN_IDLE   = 3'd0;
    parameter P_AGEN_WAIT   = 3'd1;
    parameter P_AGEN_FMUL_U = 3'd2;
    parameter P_AGEN_FMUL_V = 3'd3;
    parameter P_AGEN_SET    = 3'd4;
    // texture format
    parameter P_R5G6B5      = 3'd0;
    parameter P_R5G5B5A1    = 3'd1;
    parameter P_R4G4B4A4    = 3'd2;
    parameter P_R8G8B8A8    = 3'd3;
    parameter P_ETC         = 3'd4;

////////////////////////////
// I/O definition
////////////////////////////
    input         clk_core;
    input         rst_x;
    // register configuration
    input         i_tex_enable;
    input  [2:0]  i_tex_format;
    input  [11:0]
                  i_tex_offset;
    input  [21:0] i_tex_width_m1_f;
    input  [21:0] i_tex_height_m1_f;
    input  [11:0] i_tex_width_ui;
    output        o_idle;
    // rasterizer bus
    input         i_valid;
    input  [21:0] i_tu;
    input  [21:0] i_tv;
    output        o_busy;
    // pixel unit bus
    output        o_valid;
    output [7:0]  o_tr;
    output [7:0]  o_tg;
    output [7:0]  o_tb;
    output [7:0]  o_ta;
    input         i_busy;
    // memory bus
    output        o_req;
    output [P_IB_ADDR_WIDTH-1:0]
                  o_adrs;
    input         i_ack;
    output [P_IB_LEN_WIDTH-1:0]  o_len;
    input         i_strr;
    input  [P_IB_DATA_WIDTH-1:0] i_dbr;

////////////////////////////
// reg
////////////////////////////
    reg    [2:0]  r_state;
    reg    [2:0]  r_agen_state;
    reg    [P_IB_ADDR_WIDTH-1:0]
                  r_adrs;
`ifdef PP_BUSWIDTH_64
    reg    [1:0]  r_adrs_lsb0;
`else
    reg           r_adrs_lsb0;
`endif
    reg    [1:0]  r_u_sub;
    reg    [1:0]  r_v_sub;
    reg    [7:0]  r_tr;
    reg    [7:0]  r_tg;
    reg    [7:0]  r_tb;
    reg    [7:0]  r_ta;
    reg    [P_IB_DATA_WIDTH-1:0] r_dbr;
    reg    [21:0] r_tv;
    reg    [15:0] r_tu_ui;
////////////////////////////
// wire
////////////////////////////
    wire   [18:0] w_mul_tmp;
    wire   [18:0] w_mul_tmp_a;
    wire   [P_IB_ADDR_WIDTH-1:0]
                  w_linear_address;
    wire          w_set_address;
    wire          w_agen_start;
    wire          w_agen_proc_end;
    wire          w_set_color;

    wire   [21:0] w_fmul_a;
    wire   [21:0] w_fmul_b;

    wire   [21:0] w_tuv_f;
    wire   [15:0] w_tuv_ui;
    wire          w_set_tu_ui;

    wire   [7:0]  w_tr_etc;
    wire   [7:0]  w_tg_etc;
    wire   [7:0]  w_tb_etc;
    wire          w_set_rd;
////////////////////////////
// assign
////////////////////////////
    assign o_idle = (r_state == P_IDLE);
    assign o_busy = (r_state != P_IDLE);
    assign w_mul_tmp =  (i_tex_format == P_ETC) ? w_tuv_ui[9:2] * i_tex_width_ui[9:2]:
                                                  w_tuv_ui[9:0] * i_tex_width_ui[9:0];
    assign w_mul_tmp_a = (i_tex_format == P_ETC) ? w_mul_tmp + r_tu_ui[9:2]:        // 15bits +8bits
                                                   w_mul_tmp + r_tu_ui[9:0];        //19bits+10bits
    assign w_linear_address = (i_tex_format == P_R8G8B8A8) ? {i_tex_offset,w_mul_tmp_a[17:0]} :
                              (i_tex_format == P_ETC)      ? {i_tex_offset,w_mul_tmp_a[16:0],1'b0} :
                                                             {i_tex_offset,w_mul_tmp_a[18:1]};
    assign w_set_address = (r_agen_state == P_AGEN_SET);
    assign w_set_rd = (r_state == P_WAIT_RDATA0) & i_strr;
    assign w_agen_start = (r_state == P_IDLE) & i_valid;
    assign w_agen_proc_end = (r_agen_state == P_AGEN_SET);

    assign w_fmul_a = (r_agen_state == P_AGEN_IDLE) ? i_tu : r_tv;
    assign w_fmul_b = (r_agen_state == P_AGEN_IDLE) ? i_tex_width_m1_f : i_tex_height_m1_f;
    assign w_set_tu_ui = (r_agen_state == P_AGEN_FMUL_V);

    assign o_req = (r_state == P_REQ);
    assign o_adrs = r_adrs;
`ifdef PP_BUSWIDTH_64
   assign o_len = 6'd1;
`else
   assign o_len = (i_tex_format == P_ETC) ? 6'd2: 6'd1;
`endif
    assign w_set_color = (i_tex_format == P_ETC) ? (r_state == P_ETC0) : i_strr;
    assign o_tr = r_tr;
    assign o_tg = r_tg;
    assign o_tb = r_tb;
    assign o_ta = r_ta;
    assign o_valid = (r_state == P_OUT);
////////////////////////////
// always
////////////////////////////
    // main sequence
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_state <= P_IDLE;
        end else begin
            case (r_state)
                P_IDLE:begin
                    if (i_valid) r_state <= P_ADRS_GEN;
                end
                P_ADRS_GEN:begin
                    if (w_agen_proc_end) r_state <= P_REQ;
                end
                P_REQ:begin
                    if (i_ack) r_state <= P_WAIT_RDATA0;
                end
                P_WAIT_RDATA0:begin
                    if (i_strr) begin
`ifdef PP_BUSWIDTH_64
                        if (i_tex_format == P_ETC) r_state <= P_ETC0;
                        else r_state <= P_OUT;
`else
                        if (i_tex_format == P_ETC) r_state <= P_WAIT_RDATA1;
                        else r_state <= P_OUT;
`endif
                    end
                end
                P_WAIT_RDATA1:begin
                    if (i_strr) r_state <= P_ETC0;
                end
                P_ETC0:begin
                    r_state <= P_OUT;
                end
                //P_ETC1:begin
                //    r_state <= P_OUT;
                //end
                P_OUT:begin
                    if (!i_busy) r_state <= P_IDLE;
                end
            endcase
        end
    end


    // address generation sequence
    always @(posedge clk_core or negedge rst_x) begin
        if (~rst_x) begin
            r_agen_state <= P_AGEN_IDLE;
        end else begin
            case (r_agen_state)
                P_AGEN_IDLE: begin
                    if (w_agen_start) r_agen_state <= P_AGEN_WAIT;
                end
                P_AGEN_WAIT: begin
                    r_agen_state <= P_AGEN_FMUL_U;
                end
                P_AGEN_FMUL_U: begin
                    r_agen_state <= P_AGEN_FMUL_V;
                end
                P_AGEN_FMUL_V: begin
                    r_agen_state <= P_AGEN_SET;
                end
                P_AGEN_SET: begin
                    r_agen_state <= P_AGEN_IDLE;
                end
            endcase
        end
    end


    always @(posedge clk_core) begin
        if (w_agen_start) r_tv <= i_tv;
    end

    always @(posedge clk_core) begin
        if (w_set_tu_ui) r_tu_ui <= w_tuv_ui;
    end

    always @(posedge clk_core) begin
        if (w_set_address) begin
`ifdef PP_BUSWIDTH_64
            r_adrs <= w_linear_address[P_IB_ADDR_WIDTH-1:1];
            r_adrs_lsb0 <= w_mul_tmp_a[1:0];
`else
            r_adrs <= w_linear_address;
            r_adrs_lsb0 <= w_mul_tmp_a[0];
`endif
            r_u_sub <= r_tu_ui[1:0];
            r_v_sub <= w_tuv_ui[1:0];
        end
    end

    always @(posedge clk_core) begin
        if (w_set_rd) begin
            r_dbr <= i_dbr;
        end
    end

    always @(posedge clk_core) begin
        if (w_set_color) begin
            r_tr <= (i_tex_format == P_ETC) ? w_tr_etc :
                                              f_set_color_r(i_dbr, r_adrs_lsb0,i_tex_format);
            r_tg <= (i_tex_format == P_ETC) ? w_tg_etc :
                                              f_set_color_g(i_dbr, r_adrs_lsb0,i_tex_format);
            r_tb <= (i_tex_format == P_ETC) ? w_tb_etc :
                                              f_set_color_b(i_dbr, r_adrs_lsb0,i_tex_format);
            r_ta <= (i_tex_format == P_ETC) ? 8'hff :
                                              f_set_color_a(i_dbr, r_adrs_lsb0,i_tex_format);
        end
    end

////////////////////////////
// function
////////////////////////////
    function [7:0] f_set_color_r;
        input [P_IB_DATA_WIDTH-1:0] dbr;
`ifdef PP_BUSWIDTH_64
        input [1:0]  adr_lsb;
`else
        input        adr_lsb;
`endif
        input [2:0]  mode;
        reg [15:0]   sdbr;
        begin
`ifdef PP_BUSWIDTH_64
        sdbr = (adr_lsb == 'd1) ? dbr[31:16] :
              (adr_lsb == 'd2) ? dbr[47:32] :
              (adr_lsb == 'd3) ? dbr[63:48] :
                                 dbr[15:0];
`else
        sdbr = (adr_lsb) ? dbr[31:16] : dbr[15:0];
`endif
            case (mode)
                P_R8G8B8A8 : begin
                    // R8G8B8A8
                    f_set_color_r = dbr[31:24];
                end
                P_R5G5B5A1 : begin
                    // R5G5B5A1
                    f_set_color_r = {sdbr[15:11],sdbr[15:13]};
                end
                P_R5G6B5 : begin
                    // R5G6B5
                    f_set_color_r = {sdbr[15:11],sdbr[15:13]};
                end
                P_R4G4B4A4 : begin
                    // R4G4B4A4
                    f_set_color_r = {sdbr[15:12],sdbr[15:12]};
                end
                default : begin
                    f_set_color_r = dbr[31:24];
                end
            endcase
        end
    endfunction

    function [7:0] f_set_color_g;
        input [P_IB_DATA_WIDTH-1:0] dbr;
`ifdef PP_BUSWIDTH_64
        input [1:0]  adr_lsb;
`else
        input        adr_lsb;
`endif
        input [2:0]  mode;
        reg [15:0]   sdbr;
        begin
`ifdef PP_BUSWIDTH_64
        sdbr = (adr_lsb == 'd1) ? dbr[31:16] :
              (adr_lsb == 'd2) ? dbr[47:32] :
              (adr_lsb == 'd3) ? dbr[63:48] :
                                 dbr[15:0];
`else
        sdbr = (adr_lsb) ? dbr[31:16] : dbr[15:0];
`endif
            case (mode)
                P_R8G8B8A8 : begin
                    // R8G8B8A8
                    f_set_color_g = dbr[23:16];
                end
                P_R5G5B5A1 : begin
                    // R5G5B5A1
                    f_set_color_g = {sdbr[10:6],sdbr[10:8]};
                end
                P_R5G6B5 : begin
                    // R5G6B5
                    f_set_color_g = {sdbr[10:5],sdbr[10:9]};
                end
                P_R4G4B4A4 : begin
                    // R4G4B4A4
                    f_set_color_g = {sdbr[11:8],sdbr[11:8]};
                end
                default : begin
                    f_set_color_g = dbr[23:16];
                end
            endcase
        end
    endfunction

    function [7:0] f_set_color_b;
        input [P_IB_DATA_WIDTH-1:0] dbr;
`ifdef PP_BUSWIDTH_64
        input [1:0]  adr_lsb;
`else
        input        adr_lsb;
`endif
        input [2:0]  mode;
        reg [15:0]   sdbr;
        begin
`ifdef PP_BUSWIDTH_64
        sdbr = (adr_lsb == 'd1) ? dbr[31:16] :
              (adr_lsb == 'd2) ? dbr[47:32] :
              (adr_lsb == 'd3) ? dbr[63:48] :
                                 dbr[15:0];
`else
        sdbr = (adr_lsb) ? dbr[31:16] : dbr[15:0];
`endif
            case (mode)
                P_R8G8B8A8 : begin
                    // R8G8B8A8
                    f_set_color_b = dbr[15:8];
                end
                P_R5G5B5A1 : begin
                    // R5G5B5A1
                    f_set_color_b = {sdbr[5:1],sdbr[5:3]};
                end
                P_R5G6B5 : begin
                    // R5G6B5
                    f_set_color_b = {sdbr[4:0],sdbr[4:2]};
                end
                P_R4G4B4A4 : begin
                    // R4G4B4A4
                    f_set_color_b = {sdbr[7:4],sdbr[7:4]};
                end
                default : begin
                    f_set_color_b = dbr[15:8];
                end
            endcase
        end
    endfunction

    function [7:0] f_set_color_a;
        input [P_IB_DATA_WIDTH-1:0] dbr;
`ifdef PP_BUSWIDTH_64
        input [1:0]  adr_lsb;
`else
        input        adr_lsb;
`endif
        input [2:0]  mode;
        reg [15:0]   sdbr;
        begin
`ifdef PP_BUSWIDTH_64
        sdbr = (adr_lsb == 'd1) ? dbr[31:16] :
              (adr_lsb == 'd2) ? dbr[47:32] :
              (adr_lsb == 'd3) ? dbr[63:48] :
                                 dbr[15:0];
`else
        sdbr = (adr_lsb) ? dbr[31:16] : dbr[15:0];
`endif
            case (mode)
                P_R8G8B8A8 : begin
                    // R8G8B8A8
                    f_set_color_a = dbr[7:0];
                end
                P_R5G5B5A1 : begin
                    // R5G5B5A1
                    f_set_color_a = {8{sdbr[0]}};
                end
                P_R4G4B4A4 : begin
                    // R4G4B4A4
                    f_set_color_a = {sdbr[3:0],sdbr[3:0]};
                end
                default : begin
                    f_set_color_a = 8'hff;
                end
            endcase
        end
    endfunction

////////////////////////////
// module instance
////////////////////////////
    // ETC decoder
    fm_3d_tu_etc tu_etc (
        .clk_core(clk_core),
        .i_u_sub(r_u_sub),
        .i_v_sub(r_v_sub),
`ifdef PP_BUSWIDTH_64
        .i_code_l32(i_dbr[63:32]),
        .i_code_u32(i_dbr[31:0]),
`else
        .i_code_l32(i_dbr),
        .i_code_u32(r_dbr),
`endif
        .o_r(w_tr_etc),
        .o_g(w_tg_etc),
        .o_b(w_tb_etc)
    );

    // tu/tv
    fm_3d_fmul fmul_tuv (
        .clk_core(clk_core),
        .i_en(1'b1),
        .i_a(w_fmul_a),
        .i_b(w_fmul_b),
        .o_c(w_tuv_f)
    );

    fm_3d_f22_to_ui_b ftoui_tuv (
        .i_a(w_tuv_f),
        .o_b(w_tuv_ui)
    );


endmodule
