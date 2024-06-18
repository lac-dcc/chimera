// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_hvc_core.v
//
// Abstract:
//   HV counter core
//
//  Created:
//    8 August 2008
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

module fm_hvc_core (
    clk_vi,
    rst_x,
    // configuration registers
    i_video_start,
    // control out (only for internal use)
    o_vsync_i,
    o_hsync_i,
    // video out timing
    o_active,
    o_first_line,
    // video out
    o_r,
    o_g,
    o_b,
    o_vsync_x_neg,
    o_hsync_x_neg,
    o_vsync_x,
    o_hsync_x,
    o_blank_x
);

//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input          clk_vi;     // 25MHz
    input          rst_x;
    // configuration registers
    input          i_video_start;
    // control out (only for internal use)
    output         o_vsync_i;
    output         o_hsync_i;
    // video out timing
    output         o_active;
    output         o_first_line;

    output [7:0]   o_r;
    output [7:0]   o_g;
    output [7:0]   o_b;
    output         o_vsync_x_neg;
    output         o_hsync_x_neg;
    output         o_vsync_x;
    output         o_hsync_x;
    output         o_blank_x;
//////////////////////////////////
// reg
//////////////////////////////////
    reg    [9:0]   r_hcnt;
    reg    [9:0]   r_vcnt;
    reg            r_vsync_x;
    reg            r_hsync_x;
    reg            r_hsync_x_i; // internal use, vactive only

    reg            r_blank_x;

    reg            r_vsync_neg;
    reg            r_hsync_neg;


//////////////////////////////////
// wire
//////////////////////////////////
    wire           w_h_end;
    wire           w_v_end;

    wire           w_vsync;
    wire           w_hsync;
    wire           w_hsync_dma;
    wire           w_hactive;
    wire           w_vactive_first;  // for aa
    wire           w_vactive;
    wire           w_active;
    wire           w_active_first;  // for aa

    // color bar
    wire       w_r_test_en = ((r_hcnt >= 160) & (r_hcnt <= 251)) |
                             ((r_hcnt >= 252) & (r_hcnt <= 343)) |
                             ((r_hcnt >= 527) & (r_hcnt <= 617)) |
                             ((r_hcnt >= 618) & (r_hcnt <= 708));
    wire       w_g_test_en = ((r_hcnt >= 160) & (r_hcnt <= 251)) |
                             ((r_hcnt >= 252) & (r_hcnt <= 343)) |
                             ((r_hcnt >= 344) & (r_hcnt <= 435)) |
                             ((r_hcnt >= 436) & (r_hcnt <= 526));
    wire       w_b_test_en = ((r_hcnt >= 160) & (r_hcnt <= 251)) |
                             ((r_hcnt >= 344) & (r_hcnt <= 435)) |
                             ((r_hcnt >= 527) & (r_hcnt <= 617)) |
                             ((r_hcnt >= 709) & (r_hcnt <= 799));

    wire [7:0] w_r_test = {8{w_r_test_en}};
    wire [7:0] w_g_test = {8{w_g_test_en}};
    wire [7:0] w_b_test = {8{w_b_test_en}};

    wire       w_hsync_x_i;
//////////////////////////////////
// assign
//////////////////////////////////

    // VGA : 60Hz
    assign w_h_end = (r_hcnt == 'd799);  // 800 clock
    assign w_v_end = w_h_end & (r_vcnt == 'd524);  // 525 line

    assign w_vsync = ((r_vcnt == 10'd10) | (r_vcnt == 10'd11)) ? 1'b0 : 1'b1;
    assign w_hsync = ((r_hcnt >= 10'd16)&(r_hcnt <= 10'd111)) ? 1'b0 : 1'b1;
    assign w_hsync_dma = ((r_hcnt >= 10'd16)&(r_hcnt <= 10'd39)) ? 1'b0 : 1'b1;

    assign w_hactive = ((r_hcnt >= 10'd160)&(r_hcnt <= 10'd799)) ? 1'b1 : 1'b0;
    assign w_vactive = ((r_vcnt >= 10'd45)&(r_vcnt <= 10'd524))  ? 1'b1 : 1'b0;
    assign w_vactive_first = (r_vcnt == 10'd45);

    assign w_active = w_hactive & w_vactive;
    assign w_active_first = w_vactive_first;

    assign w_hsync_x_i = w_vactive & w_hsync_dma;
    // color should be black in blanking
    //assign w_r = (w_active) ? w_rgb[7:0]   : 8'h00;
    //assign w_g = (w_active) ? w_rgb[15:8]  : 8'h00;
    //assign w_b = (w_active) ? w_rgb[23:16] : 8'h00;

    assign o_vsync_x_neg = r_vsync_neg;
    assign o_hsync_x_neg = r_hsync_neg;
    assign o_vsync_x = r_vsync_x;
    assign o_hsync_x = r_hsync_x;
    assign o_blank_x = r_blank_x;

    assign o_r = w_r_test;
    assign o_g = w_g_test;
    assign o_b = w_b_test;

    assign o_vsync_i = r_vsync_x;
    assign o_hsync_i = r_hsync_x_i;
    assign o_active = w_active;
    assign o_first_line = w_active_first;
//////////////////////////////////
// always
//////////////////////////////////
    // H counter
    always @(posedge clk_vi or negedge rst_x) begin
        if (~rst_x) begin
            r_hcnt <= 11'b0;
        end else begin
            if (w_h_end) r_hcnt <= 11'b0;
            else r_hcnt <= r_hcnt + 1'b1;
        end
    end

    // V counter
    always @(posedge clk_vi or negedge rst_x) begin
        if (~rst_x) begin
//            r_vcnt <= 10'd0;
//            r_vcnt <= 10'd36;   // this is only for faster simulatin
            r_vcnt <= 10'd9;   // this is only for faster simulatin (v rise)
        end else begin
            if (w_v_end) r_vcnt <= 10'd0;
            else if (w_h_end) r_vcnt <= r_vcnt + 1'b1;
        end
    end

   // sync
    always @(posedge clk_vi or negedge rst_x) begin
        if (~rst_x) begin
            r_vsync_x <= 1'b1;
            r_hsync_x <= 1'b1;
            r_blank_x <= 1'b1;
        end else begin
            r_vsync_x <= w_vsync;
            r_hsync_x <= w_hsync;
            r_hsync_x_i <= w_hsync_x_i;
            r_blank_x <= w_active;
        end
    end



    // neg-edge registers for output timing adjustment
    always @(negedge clk_vi or negedge rst_x) begin
        if (~rst_x) begin
            r_vsync_neg <= 1'b1;
            r_hsync_neg <= 1'b1;
        end else begin
            r_vsync_neg <= r_vsync_x;
            r_hsync_neg <= r_hsync_x;
        end
    end


endmodule
