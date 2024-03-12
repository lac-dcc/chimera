//=======================================================================
// Project Polyphony
//
// File:
//   fm_hvc_data.v
//
// Abstract:
//   Color data construction
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

module fm_hvc_data (
    clk_core,
    clk_vi,
    rst_x,
    // debug
    o_debug,
    // sdram interface
    i_rstr,
    i_rd,
    // timing input
    i_h_active,
    i_first_line,
    i_hsync,
    i_vsync,
    o_fifo_available,
    i_fifo_available_ack,
    // configuration
    i_video_start,
    i_color_mode,
    i_aa_en,
    i_fb_blend_en,
    // test color input
    i_test_r,
    i_test_g,
    i_test_b,
    // color out
    o_r_neg,
    o_g_neg,
    o_b_neg,
    o_r,
    o_g,
    o_b,
    o_a
);
`include "polyphony_params.v"
//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input          clk_core;
    input          clk_vi;     // 25MHz
    input          rst_x;
    // debug
    output [1:0]   o_debug;
    // sdram interface
    input          i_rstr;
    input  [P_IB_DATA_WIDTH-1:0]
                   i_rd;
    // timing input
    input          i_h_active;
    input          i_first_line;
    input          i_hsync;
    input          i_vsync;
    output         o_fifo_available;
    input          i_fifo_available_ack;
    // configuration
    input          i_video_start;
    input  [1:0]   i_color_mode;
    input  [2:0]   i_aa_en;
    input          i_fb_blend_en;
    // test color input
    input  [7:0]  i_test_r;
    input  [7:0]  i_test_g;
    input  [7:0]  i_test_b;

    output [7:0]   o_r_neg;
    output [7:0]   o_g_neg;
    output [7:0]   o_b_neg;
    output [7:0]   o_r;
    output [7:0]   o_g;
    output [7:0]   o_b;
    output [7:0]   o_a;
 
//////////////////////////////////
// reg
//////////////////////////////////
    reg            r_rkind;
    reg    [4:0]   r_rd_cnt;
    reg    [5:0]   r_pix_cnt;
    reg            r_fifo_available;

    reg    [7:0]   r_r;
    reg    [7:0]   r_g;
    reg    [7:0]   r_b;

    reg    [7:0]   r_r_neg;
    reg    [7:0]   r_g_neg;
    reg    [7:0]   r_b_neg;

    reg            r_fifo_available_ack_1z;
    reg            r_fifo_available_ack_2z;
    reg            r_fifo_available_ack_3z;

//////////////////////////////////
// wire
//////////////////////////////////
    wire           w_switch_fifo_ren;
    wire           w_rstr_base;
    wire           w_rstr_upper;
    wire   [15:0]  w_di;
    wire   [15:0]  w_di_upper;
    wire   [15:0]  w_di_lower;
    wire   [31:0]  w_do;
    wire   [31:0]  w_do_normal;
    wire   [7:0]   w_r_aa;
    wire   [7:0]   w_g_aa;
    wire   [7:0]   w_b_aa;
    wire   [7:0]   w_r_f;
    wire   [7:0]   w_g_f;
    wire   [7:0]   w_b_f;

    wire   [7:0]   w_r;
    wire   [7:0]   w_g;
    wire   [7:0]   w_b;

    wire           w_ren;
    wire           w_fifo_reset_x;
    wire           w_fifo_available_ack_rise;
    wire           w_full;
    wire           w_empty;
    wire           w_full_u;
    wire           w_empty_u;
   
//////////////////////////////////
// assign
//////////////////////////////////
    assign w_fifo_available_ack_rise = r_fifo_available_ack_2z &
                                       !r_fifo_available_ack_3z;
    assign w_fifo_reset_x = i_vsync & rst_x;
`ifdef PP_BUSWIDTH_64
    assign w_switch_fifo_ren = (r_rd_cnt == 5'd15) & i_rstr;
`else
    assign w_switch_fifo_ren = (r_rd_cnt == 5'd31) & i_rstr;
`endif
    assign w_rstr_base = (i_aa_en[0]) ? !r_rkind & i_rstr : i_rstr;
    assign w_rstr_upper = (i_aa_en[0]) ? r_rkind & i_rstr : i_rstr;
    assign w_ren = i_h_active;

    assign w_r_f = (i_aa_en[1]) ? w_r_aa : w_do_normal[31:24];
    assign w_g_f = (i_aa_en[1]) ? w_g_aa : w_do_normal[23:16];
    assign w_b_f = (i_aa_en[1]) ? w_b_aa : w_do_normal[15:8];
    assign w_do_normal = f_get_color(w_di,i_color_mode);

    assign w_b = (!i_video_start) ? i_test_b :
                 (i_h_active )?     w_b_f :
                                    8'h00;
    assign w_g = (!i_video_start) ? i_test_g :
                  (i_h_active )?    w_g_f :
                                    8'h00;
    assign w_r = (!i_video_start) ? i_test_r :
                  (i_h_active )?    w_r_f :
                                    8'h00;
    assign o_b_neg = r_b_neg;
    assign o_g_neg = r_g_neg;
    assign o_r_neg = r_r_neg;
    assign o_b = r_b;
    assign o_g = r_g;
    assign o_r = r_r;

    assign o_fifo_available = r_fifo_available;

    // debug port
`ifdef PP_COREGEN_FIFO
   reg 		   r_error_1z;
   reg 		   r_error_2z;
   
    assign o_debug[0] = w_full & w_rstr_base;
    assign o_debug[1] = r_error_2z;

    always @(posedge clk_vi or negedge rst_x) begin
        if (~rst_x) begin
          r_error_1z <= 1'b0;
          r_error_2z <= 1'b0;
        end else begin
          r_error_1z <= w_empty & w_ren;
          r_error_2z <= r_error_1z;
        end
    end
`else
    assign o_debug = 2'd0;
`endif
//////////////////////////////////
// always
//////////////////////////////////
    always @(posedge clk_core or negedge w_fifo_reset_x) begin
        if (~w_fifo_reset_x) begin
            r_rkind <= 1'b0;
        end else begin
            if (w_switch_fifo_ren) r_rkind <= ~r_rkind;
        end
    end

    always @(posedge clk_core or negedge w_fifo_reset_x) begin
        if (~w_fifo_reset_x) begin
            r_rd_cnt <= 5'd0;
        end else begin
            if (i_rstr) r_rd_cnt <= r_rd_cnt + 1'b1;
        end
    end

    always @(posedge clk_vi or negedge rst_x) begin
        if (~rst_x) begin
            r_pix_cnt <= 6'd0;
        end else begin
            if (~i_hsync) r_pix_cnt <= 6'd0;
            else if (w_ren) r_pix_cnt <= r_pix_cnt + 1'b1;
        end
    end

    always @(posedge clk_vi or negedge rst_x) begin
        if (~rst_x) begin
            r_fifo_available <= 1'b0;
        end else begin
            if (r_pix_cnt == 6'd63) r_fifo_available <= 1'b1;
            else if (~i_hsync | w_fifo_available_ack_rise) r_fifo_available <= 1'b0;
        end
    end


    always @(posedge clk_vi or negedge rst_x) begin
        if (~rst_x) begin
            r_fifo_available_ack_1z <= 1'b0;
            r_fifo_available_ack_2z <= 1'b0;
            r_fifo_available_ack_3z <= 1'b0;
        end else begin
            r_fifo_available_ack_1z <= i_fifo_available_ack;
            r_fifo_available_ack_2z <= r_fifo_available_ack_1z;
            r_fifo_available_ack_3z <= r_fifo_available_ack_2z;
        end
    end

    always @(posedge clk_vi) begin
        r_r <= w_r;
        r_g <= w_g;
        r_b <= w_b;
    end

    // neg-edge registers for output timing adjustment
    always @(negedge clk_vi or negedge rst_x) begin
        if (~rst_x) begin
            r_r_neg <= 8'h0;
            r_g_neg <= 8'h0;
            r_b_neg <= 8'h0;
        end else begin
            r_r_neg <= r_r;
            r_g_neg <= r_g;
            r_b_neg <= r_b;
        end
    end


//////////////////////////////////
// function
//////////////////////////////////
    function [31:0] f_get_color;
        input [15:0] idata;
        input [1:0]  mode;
        reg [7:0] r;
        reg [7:0] g;
        reg [7:0] b;
        reg [7:0] a;
        begin
            case (mode)
                2'b00 : begin
                    // color mode 5:6:5
                    r = {idata[15:11],idata[15:13]};
                    g = {idata[10:5],idata[10:9]};
                    b = {idata[4:0],idata[4:2]};
                    a = 8'h0;
                end
                2'b01 : begin
                    // color mode 5:5:5:1
                    r = {idata[15:11],idata[15:13]};
                    g = {idata[10:6],idata[10:8]};
                    b = {idata[5:1],idata[5:3]};
                    a = {idata[0],7'b0};
                end
                2'b10 : begin
                    // color mode 4:4:4:4
                    r = {idata[15:12],idata[15:12]};
                    g = {idata[11:8],idata[11:8]};
                    b = {idata[7:4],idata[7:4]};
                    a = {idata[3:0],idata[3:0]};
                end
                default : begin
                    // color mode 4:4:4:4
                    r = {idata[15:12],idata[15:12]};
                    g = {idata[11:8],idata[11:8]};
                    b = {idata[7:4],idata[7:4]};
                    a = {idata[3:0],idata[3:0]};
                end
            endcase
            f_get_color = {r,g,b,a};
        end
    endfunction


//////////////////////////////////
// module instance
//////////////////////////////////
// Anti-aliasing filter module

    fm_hvc_aa_filter aa_filter (
        .clk_vi(clk_vi),
        .rst_x(rst_x),
        // configuration
        .i_fb_blend_en(i_fb_blend_en),
        // incoming color
        .i_h_active(i_h_active),
        .i_first_line(i_first_line),
        .i_r_base(w_do_normal[31:24]),
        .i_g_base(w_do_normal[23:16]),
        .i_b_base(w_do_normal[15:8]),
        .i_upper(w_di_upper),
        .i_lower(w_di_lower),
        // outgoing color
        .o_r(w_r_aa),
        .o_g(w_g_aa),
        .o_b(w_b_aa)
    );

`ifdef PP_COREGEN_FIFO
// 32bit x 128 entry fifo for current line
// (16bit output)
fifo_generator_v9_3_0 u_afifo_c (
  .rst(~w_fifo_reset_x), // input rst
  .wr_clk(clk_core), // input wr_clk
  .rd_clk(clk_vi), // input rd_clk
  .din({i_rd[15:0],i_rd[31:16]}), // input [31 : 0] din
  .wr_en(w_rstr_base), // input wr_en
  .rd_en(w_ren), // input rd_en
  .dout(w_di), // output [31 : 0] dout
  .full(w_full), // output full
  .empty(w_empty) // output empty
);

// 32bit x 128 entry fifo for upper line
fifo_generator_v9_3_0 u_afifo_upper (
  .rst(~w_fifo_reset_x),
  .wr_clk(clk_core),
  .rd_clk(clk_vi),
  .wr_en(w_rstr_upper),
  .din({i_rd[15:0],i_rd[31:16]}),
  .full(w_full_u),
  .rd_en(w_ren),
  .dout(w_di_upper),
  .empty(w_empty_u)
);
`else
// 32bit x 128 entry fifo for current line
fm_afifo fm_afifo_c (
  .clk_core(clk_core),
  .clk_vi(clk_vi),
  .rst_x(w_fifo_reset_x),
  .i_wstrobe(w_rstr_base),
  .i_dt(i_rd),
  .o_full(),
  .i_renable(w_ren),
  .o_dt(w_di),
  .o_empty(),
  .o_dnum()
);


// 32bit x 128 entry fifo for upper line
fm_afifo fm_afifo_upper (
  .clk_core(clk_core),
  .clk_vi(clk_vi),
  .rst_x(w_fifo_reset_x),
  .i_wstrobe(w_rstr_upper),
  .i_dt(i_rd),
  .o_full(),
  .i_renable(w_ren),
  .o_dt(w_di_upper),
  .o_empty(),
  .o_dnum()
);
`endif
 
// 32bit x 640 entry fifo for lower line
fm_line_mem fm_line_lower (
  .clk_vi(clk_vi),
  .rst_x(w_fifo_reset_x),
  .i_clear(~i_hsync),
  .i_dt(w_di_upper),
  .i_renable(w_ren),
  .o_dt(w_di_lower)
);

/*
wire [35:0] CONTROL0;
wire [35:0] TRIG0;
chipscope_icon_v1_06_a_0 u_icon (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);

chipscope_ila_v1_05_a_0 u_chipscope (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(clk_vi), // IN
    .TRIG0(TRIG0) // IN BUS [255:0]
//    .DATA(DATA)
);

   assign TRIG0[0] = w_fifo_reset_x;
   assign TRIG0[1] = w_ren;
   assign TRIG0[2] = w_empty;
   assign TRIG0[3] = w_empty_u;
   assign TRIG0[35:4] = w_di;
*/
endmodule
