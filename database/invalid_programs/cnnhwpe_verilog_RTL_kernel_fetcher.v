// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  kernel_fetcher.v
// Module  name  :  kernel_fetcher
// Created Time  :  2018/5/14 10:06:05
// Last Modified :  2018/5/29 10:42:39
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/14  chenhaoc
//
// ********************************************************
`include "hwpe_define.vh"
`define DLY 1
`timescale 1ns/10ps

module kernel_fetcher(
    input  wire          clk,
    input  wire          rst,
    input  wire          matrixmac_st,
    // input  wire          hwpe_conv_st,

    //fetcher_ctrl
    input  wire          Kernel_333,
    input  wire  [3:0]   Kernel_size,
    input  wire  [15:0]  Conv_CH_count,
    input  wire  [9:0]   K_count,
    input  wire  [15:0]  W_count,
    input  wire  [15:0]  H_count,

    // kernel_sram
    input  wire  [63:0]  kernel_rd1,
    input  wire  [63:0]  kernel_rd2,
    output wire  [`KMEM_ADDR_WIDTH-1:0] kernel_ra1,
    output wire  [`KMEM_ADDR_WIDTH-1:0] kernel_ra2,
    output wire          kernel_ren1,
    output wire          kernel_ren2,

    // fifo
    input  wire         fifo_empty,

    output wire [64*16-1:0] rm

);


//right matrix pingpong buffer;
reg [63:0] rm0[0:15];
reg [63:0] rm1[0:15];
reg [`KMEM_ADDR_WIDTH-4:0] KernelSramAddr;
reg [`KMEM_ADDR_WIDTH-4:0] KernelSramAddr2;

// -------------------------------------------------------------------------
//                  K E R N E L    S R A M     A D D R
// -------------------------------------------------------------------------

reg [9:0]  countK;
reg [15:0] countW;
reg [15:0] countH;
reg [15:0] conv_countW;
reg [15:0] conv_countCH;
reg [1:0]  round;//kernel_333 round=0~3
wire lastH;
wire lastW;
wire lastK;
wire fetch_lastrow;
wire conv_W_lastCH;
wire conv_countCH_lastrow;
wire conv_lastW;
wire conv_lastrow;
wire fetch_firstrow;
wire conv_W_firstCH;
wire conv_countCH_firstrow;
wire conv_firstW;
wire conv_firstrow;
wire countH_lastrow;
wire countW_lastrow;
wire countK_lastrow;
wire [9:0]  countK_w;
wire [15:0] countW_w;
wire [15:0] countH_w;
wire [15:0] conv_countW_w;
wire [15:0] conv_countCH_w;
wire [1:0]  round_w;

reg pingpong_sw; //0->rm0; 1->rm1
reg fifo_empty_d1;
reg [2:0] cnt;
reg kernel_fetch_en;
reg kernel_fetch_en_d1;
wire pingpong_sw_w;
wire [2:0] cnt_w;
wire kernel_fetch_en_w;
reg cnt_en;
wire cnt_en_w;
assign conv_pe_st = ~fifo_empty&fifo_empty_d1;
assign conv_pe_ed = fifo_empty&~fifo_empty_d1;
// assign kernel_fetch_en_w = matrixmac_st | conv_pe_st ? 1'b1 : (conv_lastrow ? 1'b0 : kernel_fetch_en);
assign kernel_fetch_en_w = cnt_en_w;
assign cnt_en_w = matrixmac_st | conv_pe_st ? 1'b1 : (conv_pe_ed ? 1'b0 : cnt_en);
assign cnt_w = cnt_en ? cnt + 1'b1 : cnt;
assign pingpong_sw_w = cnt==3'b111 ? ~pingpong_sw : pingpong_sw;

always @(posedge clk) begin
    if(rst) begin
        fifo_empty_d1 <= #`DLY 1'b0;
        pingpong_sw <= #`DLY 1'b0;
        cnt <= #`DLY 3'b000;
        cnt_en <= #`DLY 1'b0;
        kernel_fetch_en <= #`DLY 1'b0;
        kernel_fetch_en_d1 <= #`DLY 1'b0;
    end
    else begin
        fifo_empty_d1 <= #`DLY fifo_empty;
        pingpong_sw <= #`DLY pingpong_sw_w;
        cnt <= #`DLY cnt_w;
        cnt_en <= #`DLY cnt_en_w;
        kernel_fetch_en <= #`DLY kernel_fetch_en_w;
        kernel_fetch_en_d1 <= #`DLY kernel_fetch_en;
    end
end


assign conv_W_lastCH = conv_countCH==16'd1;
assign conv_W_firstCH = conv_countCH==Conv_CH_count;
assign conv_lastW = conv_countW==16'd1;
assign conv_firstW = conv_countW==Kernel_size;

assign lastH = countH==16'd1;
assign lastW = countW==16'd1;
assign lastK = countK==10'd1;

assign fetch_lastrow = kernel_fetch_en & (cnt==3'd7);
assign fetch_firstrow= kernel_fetch_en & (cnt==3'd0);
assign conv_countCH_lastrow = conv_W_lastCH & fetch_lastrow ;
assign conv_countCH_firstrow = conv_W_firstCH & fetch_firstrow;
assign conv_lastrow = Kernel_333 ? (round==3'b00 & fetch_lastrow) : conv_lastW & conv_countCH_lastrow;
assign conv_firstrow= Kernel_333 ? (round==3'b11 & fetch_firstrow) : conv_firstW& conv_countCH_firstrow;

assign countH_lastrow = lastH & conv_lastrow;
assign countW_lastrow = lastW & countH_lastrow;
assign countK_lastrow = lastK & countW_lastrow;

assign conv_countCH_w = !Kernel_333 ? (matrixmac_st ? Conv_CH_count :
                        (fetch_lastrow ?  (conv_countCH_lastrow ? Conv_CH_count:conv_countCH-1'b1)
                        : conv_countCH)) : Conv_CH_count;
assign conv_countW_w = !Kernel_333 ? (matrixmac_st ? Kernel_size :
                       (conv_countCH_lastrow ? (conv_lastrow ? Kernel_size:conv_countW-1'b1)
                       : conv_countW)) : Kernel_size;
assign round_w  = Kernel_333 ? (matrixmac_st ? 2'b11 :
                  fetch_lastrow ? (round==2'b00 ? 2'b11 : round-1'b1) : round)
                  : 2'b11;
assign countH_w = matrixmac_st ? H_count :
                  conv_lastrow ? (countH_lastrow ? H_count:countH-1'b1) : countH;
assign countW_w = matrixmac_st ? W_count :
                  countH_lastrow ? (countW_lastrow ? W_count:countW-1'b1) : countW;
assign countK_w = matrixmac_st ? K_count :
                  countW_lastrow ? (countK_lastrow ? K_count:countK-1'b1) : countK;

always @(posedge clk) begin
    if(rst) begin
        conv_countCH <= #`DLY 16'd0;
        conv_countW <= #`DLY 16'd0;
        countH <= #`DLY 16'd0;
        countW <= #`DLY 16'd0;
        countK <= #`DLY 10'd0;
        round <= #`DLY 2'b11;
    end
    else begin
        conv_countCH <= #`DLY conv_countCH_w;
        conv_countW <= #`DLY conv_countW_w;
        countH <= #`DLY countH_w;
        countW <= #`DLY countW_w;
        countK <= #`DLY countK_w;
        round <= #`DLY round_w;
    end
end

/*
for(countK=0; countK<K_count; countK++, KernelSramAddr+=round_cnt*16*8)
    for(countW=0, countW<W_count; countW++, offsetW+=W_stride)
        for(countH=0, countH<H_count; countH++,KernelSramAddr-=round_cnt*16*8)
            for(int round=0; round<4; round++,KernelSramAddr+=16*8)
                for(int pe=0; pe<16; pe++)      pe_rm.i64 = MemKernel[(KernelSramAddr>>3)+pe];
            for(conv_countW=0, conv_countW<Kernel_size; conv_countW++)
                 for(conv_countCH=0,  conv_countCH<Conv_CH_count; conv_countCH++, conv_offsetCH+=8,KernelSramAddr+=16*8)
                     for(int pe=0; pe<16; pe++)      pe_rm.i64 = MemKernel[(KernelSramAddr>>3)+pe];
*/

assign kernel_fetch_st = kernel_fetch_en & ~kernel_fetch_en_d1;
reg [`KMEM_ADDR_WIDTH-4:0] KernelSramAddr_conv;
wire [`KMEM_ADDR_WIDTH-4:0] KernelSramAddr_conv_w;
wire [`KMEM_ADDR_WIDTH-4:0] KernelSramAddr_w;
// assign KernelSramAddr_conv_w = kernel_fetch_st ? KernelSramAddr : KernelSramAddr_conv;
assign KernelSramAddr_conv_w = conv_firstrow ? KernelSramAddr : KernelSramAddr_conv;
assign KernelSramAddr_w = conv_lastrow&~countW_lastrow ? KernelSramAddr_conv :
                          fetch_lastrow ? KernelSramAddr+5'd9 :
                          kernel_fetch_en ? KernelSramAddr+1'b1 : KernelSramAddr;

always @(posedge clk) begin
    if(rst) begin
        KernelSramAddr <= #`DLY {(`KMEM_ADDR_WIDTH-3){1'b0}};
        KernelSramAddr2 <= #`DLY {(`KMEM_ADDR_WIDTH-3){1'b0}};
        KernelSramAddr_conv <= #`DLY {(`KMEM_ADDR_WIDTH-3){1'b0}};
    end
    else begin
        KernelSramAddr <= #`DLY KernelSramAddr_w;
        KernelSramAddr2 <= #`DLY KernelSramAddr_w+4'd8;
        KernelSramAddr_conv <= #`DLY KernelSramAddr_conv_w;
    end
end





// -------------------------------------------------------------------------
//                  P I N G    P O N G    B U F F E R
// -------------------------------------------------------------------------
wire pingpong_sw_write;
wire pingpong_sw_read;
assign pingpong_sw_write = pingpong_sw & cnt_en;
assign pingpong_sw_read = ~pingpong_sw & cnt_en;
always @(posedge clk) begin
    rm0[0]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd0) ? kernel_rd1 : rm0[0];
    rm0[1]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd1) ? kernel_rd1 : rm0[1];
    rm0[2]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd2) ? kernel_rd1 : rm0[2];
    rm0[3]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd3) ? kernel_rd1 : rm0[3];
    rm0[4]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd4) ? kernel_rd1 : rm0[4];
    rm0[5]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd5) ? kernel_rd1 : rm0[5];
    rm0[6]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd6) ? kernel_rd1 : rm0[6];
    rm0[7]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd7) ? kernel_rd1 : rm0[7];
    rm0[8]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd0) ? kernel_rd2 : rm0[8];
    rm0[9]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd1) ? kernel_rd2 : rm0[9];
    rm0[10] <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd2) ? kernel_rd2 : rm0[10];
    rm0[11] <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd3) ? kernel_rd2 : rm0[11];
    rm0[12] <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd4) ? kernel_rd2 : rm0[12];
    rm0[13] <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd5) ? kernel_rd2 : rm0[13];
    rm0[14] <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd6) ? kernel_rd2 : rm0[14];
    rm0[15] <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b0 && cnt==3'd7) ? kernel_rd2 : rm0[15];

    rm1[0]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd0) ? kernel_rd1 : rm1[0];
    rm1[1]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd1) ? kernel_rd1 : rm1[1];
    rm1[2]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd2) ? kernel_rd1 : rm1[2];
    rm1[3]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd3) ? kernel_rd1 : rm1[3];
    rm1[4]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd4) ? kernel_rd1 : rm1[4];
    rm1[5]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd5) ? kernel_rd1 : rm1[5];
    rm1[6]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd6) ? kernel_rd1 : rm1[6];
    rm1[7]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd7) ? kernel_rd1 : rm1[7];
    rm1[8]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd0) ? kernel_rd2 : rm1[8];
    rm1[9]  <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd1) ? kernel_rd2 : rm1[9];
    rm1[10] <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd2) ? kernel_rd2 : rm1[10];
    rm1[11] <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd3) ? kernel_rd2 : rm1[11];
    rm1[12] <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd4) ? kernel_rd2 : rm1[12];
    rm1[13] <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd5) ? kernel_rd2 : rm1[13];
    rm1[14] <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd6) ? kernel_rd2 : rm1[14];
    rm1[15] <= #`DLY (cnt_en==1'b1 && pingpong_sw_write==1'b1 && cnt==3'd7) ? kernel_rd2 : rm1[15];
end

wire [64*16-1:0] rm0_all;
wire [64*16-1:0] rm1_all;
assign rm0_all = { rm0[15], rm0[14], rm0[13], rm0[12], rm0[11], rm0[10], rm0[9], rm0[8],
                   rm0[7], rm0[6], rm0[5], rm0[4], rm0[3], rm0[2], rm0[1], rm0[0] };
assign rm1_all = { rm1[15], rm1[14], rm1[13], rm1[12], rm1[11], rm1[10], rm1[9], rm1[8],
                   rm1[7], rm1[6], rm1[5], rm1[4], rm1[3], rm1[2], rm1[1], rm1[0] };
assign rm = pingpong_sw_read ? rm1_all : rm0_all;
assign kernel_ra1 = {KernelSramAddr,3'b000};
assign kernel_ra2 = {KernelSramAddr2,3'b000};
assign kernel_ren1 = kernel_fetch_en;
assign kernel_ren2 = kernel_fetch_en;
endmodule
