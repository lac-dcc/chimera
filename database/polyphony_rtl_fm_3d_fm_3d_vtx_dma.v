// This program was cloned from: https://github.com/Kenji-Ishimaru/polyphony
// License: MIT License

//=======================================================================
// Project Polyphony
//
// File:
//   fm_3d_vtx_dma.v
//
// Abstract:
//   dma controller for vertex injection
//
//  Created:
//    7 November 2008
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
//  2009/09/30 vertex interface is changed
//  2009/10/01 register mode added
//             0x7F88_adres (adrs = 32bits address)
//             data
//
//             register mode should be placed 
//             vertex
//             0x7F80_numtri (number of trignales)
//             vtx data
//               :
//             0x7Fc0_xxxx End data
//  2014/02/28 DMA bug fix. change fifo full check from fifo full to
//             counter

`include "fm_3d_def.v"
module fm_3d_vtx_dma (
    clk_core,
    rst_x,
    // system port
    i_dma_start,
    o_dma_end,
    i_vtx_top_address,
    i_total_size,
    i_num_of_tris,
    i_num_of_elements,
    i_attr0_en,
    i_attr0_size,
    i_attr1_en,
    i_attr1_size,
    // register control
    o_render_start,
    i_render_ack,
    i_render_idle,
    o_req_dma,
    o_adrs_dma,
    o_dbw_dma,
    // memory port
    o_req,
    o_adrs,
    o_len,
    i_ack,
    i_strr,
    i_dbr,
    // debug port
    o_error,
    i_idle_ru,
    i_idle_tu,
    i_idle_pu,
    o_ff,
    o_fe
);

`include "polyphony_params.v"
////////////////////////////
// Parameter definition
////////////////////////////
    // dma read state
    parameter P_DMA_IDLE         = 3'h0;
    parameter P_DMA_IN           = 3'h1;
    parameter P_DMA_NEXT         = 3'h2;
    parameter P_DMA_END          = 3'h3;
    parameter P_DMA_WAIT_EMPTY   = 3'h4;
    // vertex set state
    parameter P_VS_X            = 4'h0;
    parameter P_VS_Y            = 4'h1;
    parameter P_VS_Z            = 4'h2;
    parameter P_VS_IW           = 4'h3;
    parameter P_VS_P00          = 4'h4;
    parameter P_VS_P01          = 4'h5;
    parameter P_VS_P02          = 4'h6;
    parameter P_VS_P03          = 4'h7;
    parameter P_VS_P10          = 4'h8;
    parameter P_VS_P11          = 4'h9;
    parameter P_VS_P12          = 4'ha;
    parameter P_VS_P13          = 4'hb;

    parameter P_TRI_V0            = 2'h0;
    parameter P_TRI_V1            = 2'h1;
    parameter P_TRI_V2            = 2'h2;
    parameter P_TRI_OUTPUT        = 2'h3;

    parameter P_REG_IDLE          = 2'h0;
    parameter P_REG_WAIT          = 2'h1;
    parameter P_REG_OUT           = 2'h2;

//////////////////////////////////
// I/O port definition
//////////////////////////////////
    input           clk_core;
    input           rst_x;
    // system port
    input           i_dma_start;
    output          o_dma_end;
    input  [15:0]   i_vtx_top_address;
    input  [20:0]   i_total_size;
    input  [15:0]   i_num_of_tris;
    input  [4:0]    i_num_of_elements;
    input           i_attr0_en;
    input  [1:0]    i_attr0_size;
    input           i_attr1_en;
    input  [1:0]    i_attr1_size;
    // register control
    output          o_render_start;
    input           i_render_ack;
    input           i_render_idle;
    output          o_req_dma;
    output [21:0]   o_adrs_dma;
    output [31:0]   o_dbw_dma;
    // memory port
    output          o_req;
    output [P_IB_ADDR_WIDTH-1:0]
                    o_adrs;
    output [P_IB_LEN_WIDTH-1:0]
                    o_len;
    input           i_ack;
    input           i_strr;
    input  [P_IB_DATA_WIDTH-1:0]
                    i_dbr;
    // debug port
    output [1:0]    o_error;
    output [15:0]   o_ff;
    output [4:0]    o_fe;
   input 	    i_idle_ru;
   input 	    i_idle_tu;
   input 	    i_idle_pu;

//////////////////////////////////
// reg 
//////////////////////////////////
    reg    [2:0]   r_dma_state;
    reg    [15:0]  r_cnt_h;
    reg    [4:0]   r_cnt_l;

    reg    [1:0]   r_tri_state;
    reg    [3:0]   r_vtx_state;
    reg    [15:0]  r_num_of_tris;
    reg    [1:0]   r_reg_state;
    reg    [5:0]   r_reg_adrs;
    reg            r_vtx_injection_end;
    reg    [6:0]   r_current_req_size;
//////////////////////////////////
// wire 
//////////////////////////////////
    wire           w_cnt_l_init;
    wire   [5:0]   w_max_burst;
    wire           w_cnt_h_init;
    wire           w_cnt_h_inc;
    wire           w_dma_end;
    wire           w_32burst_accepted;
    wire           w_has_fifo_space;
    wire   [6:0]   w_fifo_num;
    wire           w_vtx_injection_end;
    wire           w_vtx_injection_end_pre;
    wire           w_size_init;
    wire           w_size_inc;
    wire           w_fifo_ren;
    wire           w_fifo_empty;
    wire           w_fifo_full;

    wire           w_next_vtx;
    wire           w_state_init;

    wire           w_register_mode;
    wire           w_set_reg_adrs;
    wire           w_req_vtx;
    wire           w_req_reg;
    wire           w_reg_cmd;
    wire [15:0]    w_adrs16;
    wire           w_data_out;
`ifdef PP_BUSWIDTH_64
    wire           w_discard_l32;
`endif
//////////////////////////////////
// assign
//////////////////////////////////
    assign w_data_out = !w_fifo_empty & w_fifo_ren;
    assign o_req = (r_dma_state == P_DMA_IN);
    // bit
    // i_vtx_top_address[31:16]
    // r_cnt_h[21:6]
    assign w_adrs16 = r_cnt_h + {i_vtx_top_address[6:2],11'b0};
    //              9 16 5     
`ifdef PP_BUSWIDTH_64
    assign o_adrs = {i_vtx_top_address[15:7], w_adrs16, 4'h0};
    assign w_discard_l32 = f_discard(r_cnt_h, i_total_size);
    assign o_len = f_len64(w_max_burst);
`else
    assign o_adrs = {i_vtx_top_address[15:7], w_adrs16, 5'h0};
    assign o_len = w_max_burst;
`endif

    assign w_cnt_l_init = (r_dma_state == P_DMA_IDLE) & i_dma_start;
    assign w_cnt_h_init = w_cnt_l_init;
    assign w_cnt_h_inc = w_32burst_accepted;

    assign w_max_burst = f_len(r_cnt_h, i_total_size);
    assign w_32burst_accepted = (o_req & i_ack); 
//    assign w_has_fifo_space = (w_fifo_num  <= 7'd32);
    assign w_has_fifo_space = (r_current_req_size  <= 7'd32);
    assign w_dma_end = (r_dma_state == P_DMA_NEXT) &
                       (i_total_size == {r_cnt_h, r_cnt_l});
    assign w_vtx_injection_end_pre = // w_fifo_empty &
                                (r_tri_state == P_TRI_OUTPUT) &
                                (r_num_of_tris == i_num_of_tris) &
                                i_render_ack;
    assign w_vtx_injection_end = w_vtx_injection_end_pre | r_vtx_injection_end;
    assign o_dma_end = (r_dma_state == P_DMA_END) & w_vtx_injection_end;

    assign w_next_vtx = !w_fifo_empty &
                        (
                         ((r_vtx_state == P_VS_IW)&!i_attr0_en&!i_attr1_en) |
                         ((r_vtx_state == P_VS_P01)&(i_attr0_size == 2'd1)&!i_attr1_en) |
                         ((r_vtx_state == P_VS_P02)&(i_attr0_size == 2'd2)&!i_attr1_en) |
                         ((r_vtx_state == P_VS_P03)&!i_attr1_en) |
                         ((r_vtx_state == P_VS_P11)&(i_attr1_size == 2'd1)) |
                         ((r_vtx_state == P_VS_P12)&(i_attr1_size == 2'd2)) |
                         (r_vtx_state == P_VS_P13));

    assign w_state_init = (r_tri_state == P_TRI_OUTPUT) & i_render_ack;

    assign o_req_dma = w_req_vtx | w_req_reg;
    assign w_req_vtx = !w_fifo_empty & (r_tri_state != P_TRI_OUTPUT) & !w_register_mode;
    assign w_req_reg = !w_fifo_empty & (r_reg_state == P_REG_OUT);

    assign o_adrs_dma = (r_reg_state == P_REG_OUT) ? {12'b0, 4'b10 ,r_reg_adrs,2'b00} :
                                                     f_vtx_adrs_enc(r_tri_state, r_vtx_state);
    assign o_render_start = (r_tri_state == P_TRI_OUTPUT);
    assign w_size_init = (r_dma_state == P_DMA_IDLE);
    assign w_size_inc = (r_tri_state == P_TRI_OUTPUT) & i_render_ack;
    assign w_fifo_ren = !((r_tri_state == P_TRI_OUTPUT)| (r_reg_state == P_REG_WAIT));

    assign w_reg_cmd = (o_dbw_dma[31:16] == 16'h7F88);
    assign w_set_reg_adrs = w_reg_cmd&!w_fifo_empty&(r_tri_state != P_TRI_OUTPUT);
    assign w_register_mode = !((r_reg_state == P_REG_IDLE) & !w_set_reg_adrs);

    // debug port
    //assign o_ff = w_fifo_full;
    //assign o_fe = w_fifo_empty; 
    assign o_ff = r_num_of_tris;
    assign o_fe = {w_vtx_injection_end,w_vtx_injection_end_pre,r_dma_state};
    assign o_error[0] = w_fifo_full & i_strr;
    assign o_error[1] = w_fifo_ren & w_fifo_empty;

//////////////////////////////////
// always
//////////////////////////////////
// fifo full detection
always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
      r_current_req_size <= 'd0;
    end else begin
      if (w_32burst_accepted) begin
        if (w_data_out) begin
          r_current_req_size <= r_current_req_size + w_max_burst - 1'b1;
        end else begin
          r_current_req_size <= r_current_req_size + w_max_burst;
	end
      end else if (w_data_out) begin
        r_current_req_size <= r_current_req_size - 1'b1;
      end
    end
end   
// vertex read state from system memory
always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_dma_state <= P_DMA_IDLE;
    end else begin
        case (r_dma_state)
            P_DMA_IDLE : begin
                if (i_dma_start) begin
                    r_dma_state <= P_DMA_IN;
                end
            end
            P_DMA_IN : begin
                if (w_32burst_accepted) r_dma_state <= P_DMA_NEXT;
            end
            P_DMA_NEXT : begin
                if (w_dma_end) begin
                    r_dma_state <= P_DMA_END;
                end else begin
                    if (w_has_fifo_space) r_dma_state <= P_DMA_IN;
                end
            end
            P_DMA_END : begin
                if (w_vtx_injection_end) r_dma_state <= P_DMA_WAIT_EMPTY;
            end
            P_DMA_WAIT_EMPTY: begin  // remained register configurations
                    if (w_fifo_empty) r_dma_state <= P_DMA_IDLE;
            end
        endcase
    end
end

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_cnt_l <= 5'd0;
    end else begin
        if (w_cnt_l_init) r_cnt_l <= 5'd0;
        else if (w_32burst_accepted) r_cnt_l <= w_max_burst[4:0];
    end
end

// upper 16-bit counter
always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_cnt_h <= 16'd0;
    end else begin
        if (w_cnt_h_init) r_cnt_h <= 16'd0;
        else if (w_32burst_accepted) r_cnt_h <= r_cnt_h + w_max_burst[5];
    end
end

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_num_of_tris <= 16'd1;
    end else begin
        if (w_size_init) r_num_of_tris <= 16'h1;
        else if (w_size_inc) r_num_of_tris <= r_num_of_tris + 1'b1;
    end
end


always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_vtx_state <= P_VS_X;
    end else begin
        if (w_state_init) begin
            r_vtx_state <= P_VS_X;
        end else begin
            case (r_vtx_state)
                P_VS_X: begin
                    if (w_req_vtx)r_vtx_state <= P_VS_Y;
                end
                P_VS_Y: begin
                    if (!w_fifo_empty) r_vtx_state <= P_VS_Z;
                end
                P_VS_Z: begin
                    if (!w_fifo_empty) r_vtx_state <= P_VS_IW;
                end
                P_VS_IW: begin
                    if (!w_fifo_empty) begin
                        if (i_attr0_en) begin
                            r_vtx_state <= P_VS_P00;
                        end else if (i_attr1_en) begin
                            r_vtx_state <= P_VS_P10;
                        end else begin
                            r_vtx_state <= P_VS_X;
                        end
                    end
                end
                P_VS_P00: begin
                    if (!w_fifo_empty) begin
                        r_vtx_state <= P_VS_P01;
                    end
                end
                P_VS_P01: begin
                    if (!w_fifo_empty) begin
                        if (i_attr0_size == 2'd1) begin
                            if (i_attr1_en) r_vtx_state <= P_VS_P10;
                            else r_vtx_state <= P_VS_X;
                        end else begin
                            r_vtx_state <= P_VS_P02;
                        end
                    end
                end
                P_VS_P02: begin
                    if (!w_fifo_empty) begin
                        if (i_attr0_size == 2'd2) begin
                            if (i_attr1_en) r_vtx_state <= P_VS_P10;
                            else r_vtx_state <= P_VS_X;
                        end else begin
                            r_vtx_state <= P_VS_P03;
                        end
                    end
                end
                P_VS_P03: begin
                    if (!w_fifo_empty) begin
                        if (i_attr1_en) r_vtx_state <= P_VS_P10;
                        else r_vtx_state <= P_VS_X;
                    end
                end
                P_VS_P10: begin
                    if (!w_fifo_empty) begin
                        r_vtx_state <= P_VS_P11;
                    end
                end
                P_VS_P11: begin
                    if (!w_fifo_empty) begin
                        if (i_attr1_size == 2'd1) begin
                            r_vtx_state <= P_VS_X;
                        end else begin
                            r_vtx_state <= P_VS_P12;
                        end
                    end
                end
                P_VS_P12: begin
                    if (!w_fifo_empty) begin
                        if (i_attr0_size == 2'd2) begin
                            r_vtx_state <= P_VS_X;
                        end else begin
                            r_vtx_state <= P_VS_P13;
                        end
                    end
                end
                P_VS_P13: begin
                    if (!w_fifo_empty) begin
                        r_vtx_state <= P_VS_X;
                    end
                end
            endcase
        end
    end
end    

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_tri_state <= P_TRI_V0;
    end else begin
        case (r_tri_state)
            P_TRI_V0: begin
                if (w_next_vtx) r_tri_state <= P_TRI_V1;
            end
            P_TRI_V1: begin
                if (w_next_vtx) r_tri_state <= P_TRI_V2;
            end
            P_TRI_V2: begin
                if (w_next_vtx) r_tri_state <= P_TRI_OUTPUT;
            end
            P_TRI_OUTPUT: begin
               if (i_render_ack) r_tri_state <= P_TRI_V0;
            end
        endcase
    end
end

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_reg_state <= P_REG_IDLE;
    end else begin
        case (r_reg_state)
            P_REG_IDLE: begin
                if (w_set_reg_adrs) r_reg_state <= P_REG_WAIT;
            end
            P_REG_WAIT: begin
                if (i_render_idle) r_reg_state <= P_REG_OUT;
            end
            P_REG_OUT: begin
                if (!w_fifo_empty) r_reg_state <= P_REG_IDLE;
            end
        endcase
    end
end

always @(posedge clk_core) begin
    if (w_set_reg_adrs) r_reg_adrs <= o_dbw_dma[7:2];  // 32bits address
end

always @(posedge clk_core or negedge rst_x) begin
    if (~rst_x) begin
        r_vtx_injection_end <= 1'b0;
    end else begin
        if (w_size_init) r_vtx_injection_end <= 1'b0;
        else if (w_vtx_injection_end_pre) r_vtx_injection_end <= 1'b1;
    end
end


//////////////////////////////////
// function
//////////////////////////////////
    function [5:0] f_len;
        input [15:0] cnt_h;
        input [20:0] total_size;
        reg cmp;
        reg [4:0] next_len;
        begin
            cmp = (cnt_h == total_size[20:5]);  // check length > 32
            next_len = {1'b0,total_size[4:0]};
            if (cmp) f_len = next_len;
            else f_len = 6'd32;
        end
    endfunction

`ifdef PP_BUSWIDTH_64
    function [5:0] f_len64;
        input [5:0] len32;  // 23bit burst size
        begin
            if (len32[0]) f_len64 = {1'b0,len32[5:1]} + len32[0];
            else f_len64 = {1'b0,len32[5:1]};
        end
    endfunction
`endif //  `ifdef PP_BUSWIDTH_64

    function f_discard;
        input [15:0] cnt_h;
        input [20:0] total_size;
        reg cmp;
        begin
            cmp = (cnt_h == total_size[20:5]);  // check length > 32
            if (cmp) f_discard = total_size[0];
            else f_discard = 1'b0;
        end
    endfunction

    function [21:0] f_vtx_adrs_enc;
        input [1:0] tri_state;
        input [3:0] vtx_state;
        reg [5:0] adrs;
        begin
            case (tri_state)
                P_TRI_V0: begin
                    case (vtx_state)
                        P_VS_X:   adrs = (`VTX0_X >> 2);
                        P_VS_Y:   adrs = (`VTX0_Y >> 2);
                        P_VS_Z:   adrs = (`VTX0_Z >> 2);
                        P_VS_IW:  adrs = (`VTX0_IW >> 2);
                        P_VS_P00: adrs = (`VTX0_P00 >> 2);
                        P_VS_P01: adrs = (`VTX0_P01 >> 2);
                        P_VS_P02: adrs = (`VTX0_P02 >> 2);
                        P_VS_P03: adrs = (`VTX0_P03 >> 2);
                        P_VS_P10: adrs = (`VTX0_P10 >> 2);
                        P_VS_P11: adrs = (`VTX0_P11 >> 2);
                        `ifdef VTX_PARAM1_REDUCE
                        `else
                        P_VS_P12: adrs = (`VTX0_P12 >> 2);
                        P_VS_P13: adrs = (`VTX0_P13 >> 2);
                        `endif
                        default: adrs = 6'b0;
                    endcase
                end
                P_TRI_V1: begin
                    case (vtx_state)
                        P_VS_X:   adrs = (`VTX1_X >> 2);
                        P_VS_Y:   adrs = (`VTX1_Y >> 2);
                        P_VS_Z:   adrs = (`VTX1_Z >> 2);
                        P_VS_IW:  adrs = (`VTX1_IW >> 2);
                        P_VS_P00: adrs = (`VTX1_P00 >> 2);
                        P_VS_P01: adrs = (`VTX1_P01 >> 2);
                        P_VS_P02: adrs = (`VTX1_P02 >> 2);
                        P_VS_P03: adrs = (`VTX1_P03 >> 2);
                        P_VS_P10: adrs = (`VTX1_P10 >> 2);
                        P_VS_P11: adrs = (`VTX1_P11 >> 2);
                        `ifdef VTX_PARAM1_REDUCE
                        `else
                        P_VS_P12: adrs = (`VTX1_P12 >> 2);
                        P_VS_P13: adrs = (`VTX1_P13 >> 2);
                        `endif
                        default: adrs = 6'b0;
                    endcase
                end
                P_TRI_V2: begin
                    case (vtx_state)
                        P_VS_X:   adrs = (`VTX2_X >> 2);
                        P_VS_Y:   adrs = (`VTX2_Y >> 2);
                        P_VS_Z:   adrs = (`VTX2_Z >> 2);
                        P_VS_IW:  adrs = (`VTX2_IW >> 2);
                        P_VS_P00: adrs = (`VTX2_P00 >> 2);
                        P_VS_P01: adrs = (`VTX2_P01 >> 2);
                        P_VS_P02: adrs = (`VTX2_P02 >> 2);
                        P_VS_P03: adrs = (`VTX2_P03 >> 2);
                        P_VS_P10: adrs = (`VTX2_P10 >> 2);
                        P_VS_P11: adrs = (`VTX2_P11 >> 2);
                        `ifdef VTX_PARAM1_REDUCE
                        `else
                        P_VS_P12: adrs = (`VTX2_P12 >> 2);
                        P_VS_P13: adrs = (`VTX2_P13 >> 2);
                        `endif
                        default: adrs = 6'b0;
                    endcase
                end
                default: adrs = 6'b0;
            endcase
            f_vtx_adrs_enc = {12'b0,4'b11,adrs,2'b00};
        end
    endfunction


//////////////////////////////////
// module instance
//////////////////////////////////
`ifdef PP_BUSWIDTH_64
    fm_3d_vtx_fifo #(5) u_fifo (  // 32 words
        .clk_core(clk_core),
        .rst_x(rst_x),
        .i_wstrobe(i_strr),
        .i_dt(i_dbr),
        .o_full(w_fifo_full),
        .i_renable(w_fifo_ren),
        .o_dt(o_dbw_dma),
        .o_empty(w_fifo_empty),
        .o_dnum(w_fifo_num),
        // 32bit discard flag
        .i_req(w_32burst_accepted),
        .i_len(o_len),
        .i_discard(w_discard_l32)
    );
`else
    fm_cmn_bfifo #(P_IB_DATA_WIDTH ,6) u_fifo (  // 64 words
        .clk_core(clk_core),
        .rst_x(rst_x),
        .i_wstrobe(i_strr),
        .i_dt(i_dbr),
        .o_full(w_fifo_full),
        .i_renable(w_fifo_ren),
        .o_dt(o_dbw_dma),
        .o_empty(w_fifo_empty),
        .o_dnum(w_fifo_num)
    );
`endif

 // debug code

`ifdef RTL_DEBUG
`else   
/*
ila_0 ila_pp (
.clk(clk_core),
.probe0(i_dma_start),
.probe1(i_vtx_top_address[15:0]),
.probe2(i_total_size[20:0]),
.probe3(i_num_of_tris[15:0]),
.probe4(o_req),
.probe5(o_adrs[28:0]),
.probe6(i_strr),
.probe7(i_dbr[63:0])

	      );
*/   

/*
wire [35:0] CONTROL0;
wire [239:0] TRIG0;
chipscope_icon_v1_06_a_0 u_icon (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);

chipscope_ila_v1_05_a_0 u_chipscope (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(clk_core), // IN
    .TRIG0(TRIG0) // IN BUS [255:0]
//    .DATA(DATA)
);

   assign TRIG0[0] = i_dma_start;
   assign TRIG0[1] = o_dma_end;
   assign TRIG0[17:2] = r_num_of_tris[15:0];
   assign TRIG0[22:18] = i_num_of_elements[4:0];
   assign TRIG0[23]   =  o_render_start;
   assign TRIG0[24]   =  i_render_ack;
   assign TRIG0[25]   =  i_render_idle;
   assign TRIG0[26]   =  o_req;
   assign TRIG0[56:27]   = {1'b0,o_adrs[28:0]};
   assign TRIG0[62:57]   = o_len[5:0];
   assign TRIG0[63]   = i_ack;
   assign TRIG0[64]   = i_strr;
   assign TRIG0[128:65]   = i_dbr[63:0];
   assign TRIG0[131:129]   = r_dma_state[2:0];
   assign TRIG0[133:132]   = r_tri_state[1:0];
   assign TRIG0[137:134]   = r_vtx_state[3:0]; 
   assign TRIG0[138] =     r_vtx_injection_end;
   assign TRIG0[139] =     w_vtx_injection_end;
   assign TRIG0[140] =     w_vtx_injection_end_pre;
   assign TRIG0[141] =    w_fifo_full;
   assign TRIG0[142] =    w_fifo_ren;
   assign TRIG0[174:143] =  o_dbw_dma[31:0];
   assign TRIG0[175] =  w_fifo_empty;
   assign TRIG0[176] =  w_32burst_accepted;
   assign TRIG0[182:177] =  o_len[5:0];
   assign TRIG0[183] =  w_discard_l32;
   assign TRIG0[184] =  i_idle_ru;
   assign TRIG0[185] =  i_idle_tu;
   assign TRIG0[186] =  i_idle_pu;
   assign TRIG0[202:187] =   i_vtx_top_address[15:0];
   assign TRIG0[223:203] =   i_total_size[20:0];
   assign TRIG0[239:224] =   i_num_of_tris[15:0];
*/
`endif

endmodule
