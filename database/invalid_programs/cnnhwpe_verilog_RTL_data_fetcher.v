// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  data_fetcher.v
// Module  name  :  data_fetcher
// Created Time  :  2018/5/7 17:09:08
// Last Modified :  2018/5/29 17:14:51
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/11  chenhaoc     initial version
//
// ********************************************************

`include "hwpe_define.vh"
`define DLY 1
`timescale 1ns/10ps

module data_fetcher(
    input  wire          clk,
    input  wire          rst,
    input  wire          matrixmac_st,
    input  wire          hwpe_conv_st,
    // input  wire          hwpe_conv_en,
    // input  wire          matrixmac_en,

    // cfgreg
    input  wire  [15:0]  Conv_W_offset,
    input  wire  [15:0]  Conv_CH_count,
    input  wire  [3:0]   Kernel_size,
    input  wire          Layer_type,
    input  wire          Kernel_333,
    input  wire  [9:0]   K_count,
    input  wire  [15:0]  W_count,
    input  wire  [15:0]  H_count,
    input  wire  [15:0]  W_stride,
    input  wire  [15:0]  H_stride,
    input  wire  [`FMEM_ADDR_WIDTH-1:0] baseaddr_rd1,
    input  wire  [`FMEM_ADDR_WIDTH-1:0] baseaddr_rd2,
    output wire  [2:0]   baseaddr_ra1,
    output wire  [2:0]   baseaddr_ra2,

    // fmap_sram
    input  wire  [63:0]  fmap_rd1,
    input  wire  [63:0]  fmap_rd2,
    output  reg  [`FMEM_ADDR_WIDTH-1:0] fmap_ra1,
    output  reg  [`FMEM_ADDR_WIDTH-1:0] fmap_ra2,
    output  reg          fmap_ren1,
    output  reg          fmap_ren2,

    // fifo
    output wire  [127:0] fifo0_wd,
    output wire          fifo0_wen,
    output wire          fifo_w2entry,
    output wire  [127:0] fifo1_wd,
    output wire          fifo1_wen,

    output wire          matrix_done

);

// -------------------- Conv Counter Control --------------------------
// wire rst;
// reg matrixmac_st;//start hwpe conv
// wire hwpe_conv_st;
wire lastH;
wire lastW;
wire lastK;
wire fetch_lastrow;
wire [2:0] row_i_w;
wire conv_W_lastCH;
wire conv_countCH_lastrow;
wire conv_lastW;
wire conv_lastrow;
wire countH_lastrow;
wire countW_lastrow;
wire countK_lastrow;
wire [9:0]  countK_w;
wire [15:0] countW_w;
wire [15:0] countH_w;
wire [15:0] conv_countW_w;
wire [15:0] conv_countCH_w;
wire [1:0]  round_w;
wire row_en_w;
reg row_en;

reg [2:0] row_i;
reg [9:0]  countK;
reg [15:0] countW;
reg [15:0] countH;
reg [15:0] conv_countW;
reg [15:0] conv_countCH;
reg [1:0]  round;//kernel_333 round=0~3

assign matrix_done = countK_lastrow;
assign row_en_w = matrixmac_st|hwpe_conv_st ? 1'b1 :(conv_lastrow ? 1'b0 : row_en);
assign row_i_w = matrixmac_st|hwpe_conv_st ? 3'b000 : row_en ? row_i + 1'b1 : row_i;


always @(posedge clk) begin
    if(rst) begin
        row_i <= #`DLY 3'b000;
        row_en <= #`DLY 1'b0;
    end
    else begin
        row_i <= #`DLY row_i_w;
        row_en <= #`DLY row_en_w;
    end
end

assign conv_W_lastCH = conv_countCH==16'd1;
assign conv_lastW = conv_countW==16'd1;
assign lastH = countH==16'd1;
assign lastW = countW==16'd1;
assign lastK = countK==10'd1;

assign fetch_lastrow =  row_en & (row_i==3'd7);
assign conv_countCH_lastrow = conv_W_lastCH & fetch_lastrow ;

assign conv_lastrow = Kernel_333 ? (round==3'b00 & fetch_lastrow) : conv_lastW & conv_countCH_lastrow;
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
                  : 2'b00;
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
        round <= #`DLY 2'b00;
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

//------------------------ Conv Addr --------------------------------
wire [`FMEM_ADDR_WIDTH-1:0] fmap_addr_base1;
wire [`FMEM_ADDR_WIDTH-1:0] fmap_addr_base2;
wire [`FMEM_ADDR_WIDTH-1:0] add_conv_addr1;
wire [`FMEM_ADDR_WIDTH-1:0] add_conv_addr2;
wire [`FMEM_ADDR_WIDTH-1:0] conv_offsetCH_w;
wire [`FMEM_ADDR_WIDTH-1:0] conv_offsetW_w;
wire [`FMEM_ADDR_WIDTH-1:0] offsetH_w;
wire [`FMEM_ADDR_WIDTH-1:0] offsetW_w;
wire [`FMEM_ADDR_WIDTH-1:0] FmapConvAddr_w[0:7];
reg  [`FMEM_ADDR_WIDTH-1:0] FmapConvAddr[0:7];
reg  [`FMEM_ADDR_WIDTH-1:0] conv_offsetCH;
reg  [`FMEM_ADDR_WIDTH-1:0] conv_offsetW;
reg  [`FMEM_ADDR_WIDTH-1:0] offsetH;
reg  [`FMEM_ADDR_WIDTH-1:0] offsetW;
wire [`FMEM_ADDR_WIDTH-1:0] offsetW_H;
reg  conv_first3clk;
wire conv_first4clk_en;
// combination logic of FmapConvAddr, this path maybe the critical path :
// row_i_w -> baseaddr_ra  ->  baseaddr  -> +offset -> conv_addr_w -> FmapConvAddr

//first 4 clk, copy BaseAddr to ConvAddr;
always @(posedge clk) begin
    if(rst)
        conv_first3clk <= #`DLY 1'b0;
    else
        conv_first3clk <= #`DLY matrixmac_st|hwpe_conv_st ? 1'b1 : row_i==3'b010 ? 1'b0 : conv_first3clk;
end
assign conv_first4clk_en = matrixmac_st|hwpe_conv_st|conv_first3clk;
assign baseaddr_ra1 = conv_first4clk_en ? {row_i_w[1:0],1'b0} : 3'b000; //0,2,4,6
assign baseaddr_ra2 = conv_first4clk_en ? {row_i_w[1:0],1'b1} : 3'b001; //1,3,5,7
assign fmap_addr_base1 = baseaddr_rd1;
assign fmap_addr_base2 = baseaddr_rd2;
assign offsetW_H = offsetW + offsetH;
assign add_conv_addr1  = fmap_addr_base1 + offsetW_H;
assign add_conv_addr2  = fmap_addr_base2 + offsetW_H;

assign FmapConvAddr_w[0] = (conv_first4clk_en &(baseaddr_ra1==3'd0)) ? add_conv_addr1 : FmapConvAddr[0];
assign FmapConvAddr_w[2] = (conv_first4clk_en &(baseaddr_ra1==3'd2)) ? add_conv_addr1 : FmapConvAddr[2];
assign FmapConvAddr_w[4] = (conv_first4clk_en &(baseaddr_ra1==3'd4)) ? add_conv_addr1 : FmapConvAddr[4];
assign FmapConvAddr_w[6] = (conv_first4clk_en &(baseaddr_ra1==3'd6)) ? add_conv_addr1 : FmapConvAddr[6];
assign FmapConvAddr_w[1] = (conv_first4clk_en &(baseaddr_ra2==3'd1)) ? add_conv_addr2 : FmapConvAddr[1];
assign FmapConvAddr_w[3] = (conv_first4clk_en &(baseaddr_ra2==3'd3)) ? add_conv_addr2 : FmapConvAddr[3];
assign FmapConvAddr_w[5] = (conv_first4clk_en &(baseaddr_ra2==3'd5)) ? add_conv_addr2 : FmapConvAddr[5];
assign FmapConvAddr_w[7] = (conv_first4clk_en &(baseaddr_ra2==3'd7)) ? add_conv_addr2 : FmapConvAddr[7];

assign conv_offsetCH_w = matrixmac_st|conv_countCH_lastrow ? `OFFSET_IS_0 :
                         fetch_lastrow ? conv_offsetCH+4'd8 : conv_offsetCH;
assign conv_offsetW_w = matrixmac_st|conv_lastrow ? `OFFSET_IS_0 :
                        conv_countCH_lastrow ? conv_offsetW+Conv_W_offset : conv_offsetW;
assign offsetH_w = matrixmac_st|countH_lastrow ? `OFFSET_IS_0 :
                   conv_lastrow ? offsetH+H_stride : offsetH;
assign offsetW_w = matrixmac_st|countW_lastrow ? `OFFSET_IS_0 :
                   countH_lastrow ? offsetW+W_stride : offsetW;

always @(posedge clk) begin
    if(rst) begin
        conv_offsetCH <= #`DLY `OFFSET_IS_0;
        conv_offsetW <= #`DLY `OFFSET_IS_0;
        offsetH <= #`DLY `OFFSET_IS_0;
        offsetW <= #`DLY `OFFSET_IS_0;
    end
    else begin
        conv_offsetCH <= #`DLY conv_offsetCH_w;
        conv_offsetW <= #`DLY conv_offsetW_w;
        offsetH <= #`DLY offsetH_w;
        offsetW <= #`DLY offsetW_w;
    end
end

// note: no reset, read after write
always @(posedge clk) begin
    FmapConvAddr[0] <= #`DLY FmapConvAddr_w[0];
    FmapConvAddr[1] <= #`DLY FmapConvAddr_w[1];
    FmapConvAddr[2] <= #`DLY FmapConvAddr_w[2];
    FmapConvAddr[3] <= #`DLY FmapConvAddr_w[3];
    FmapConvAddr[4] <= #`DLY FmapConvAddr_w[4];
    FmapConvAddr[5] <= #`DLY FmapConvAddr_w[5];
    FmapConvAddr[6] <= #`DLY FmapConvAddr_w[6];
    FmapConvAddr[7] <= #`DLY FmapConvAddr_w[7];
end

// --------------------------  SramAddr  -------------------------------
wire [`FMEM_ADDR_WIDTH-1:0] fmap_addr_conv_1;
wire [`FMEM_ADDR_WIDTH-1:0] fmap_addr_conv_2;
wire [`FMEM_ADDR_WIDTH-1:0] add_sram_addr1;
wire [`FMEM_ADDR_WIDTH-1:0] add_sram_addr2;
wire [`FMEM_ADDR_WIDTH-1:0] conv_offsetCH_W;

assign fmap_addr_conv_1 = !Layer_type ? FmapConvAddr[row_i] :
                          !Kernel_333 ? FmapConvAddr[{row_i[2:1],1'b0}] :
                          FmapConvAddr[{1'b0,row_i[2],1'b0}];
assign fmap_addr_conv_2 = !Layer_type ? {`FMEM_ADDR_WIDTH{1'b0}} :
                          !Kernel_333 ? FmapConvAddr[{row_i[2:1],1'b1}] :
                          FmapConvAddr[{1'b0,row_i[2],1'b1}];

assign conv_offsetCH_W = conv_offsetW + conv_offsetCH;
assign add_sram_addr1 = fmap_addr_conv_1 + conv_offsetCH_W;
assign add_sram_addr2 = fmap_addr_conv_2 + conv_offsetCH_W;
// -----------------------------------------------------------------------

reg [127:0] lmreg128_1;
reg [127:0] lmreg128_2;
reg [63:0]  fmap_data1;
reg [63:0]  fmap_data2;

///////////////////////////////////////////////////////////////////////////////
//                           I N T E R   L A Y E R                           //
///////////////////////////////////////////////////////////////////////////////
wire [`FMEM_ADDR_WIDTH-1:0] inter_addr1;
wire [`FMEM_ADDR_WIDTH-1:0] inter_addr2;
wire inter_fetch_en_1;
wire inter_fetch_en_2;
wire inter_ren1;
wire inter_ren2;
wire inter_ra_0or1;
reg  inter_fetch_en_1_d0;
reg  inter_fetch_en_1_d1;
reg  inter_fetch_en_1_d2;
reg  inter_fetch_en_2_d0;
reg  inter_fetch_en_2_d1;
reg  inter_fetch_en_2_d2;
reg  inter_ra_0or1_d0;
reg  inter_ra_0or1_d1;

assign inter_addr1 = !add_sram_addr1[`FMEM_ADDR_WIDTH-1] ? add_sram_addr1 : {`FMEM_ADDR_WIDTH{1'b0}};
assign inter_addr2 = add_sram_addr1[`FMEM_ADDR_WIDTH-1] ? add_sram_addr1 : {`FMEM_ADDR_WIDTH{1'b0}};
assign inter_fetch_en_1 = ~Layer_type & row_en & ~row_i[0];//0,2,4,6
assign inter_fetch_en_2 = ~Layer_type & row_en & row_i[0];//1,3,5,7
assign inter_ren1 = ~Layer_type & row_en & ~add_sram_addr1[`FMEM_ADDR_WIDTH-1];
assign inter_ren2 = ~Layer_type & row_en & add_sram_addr1[`FMEM_ADDR_WIDTH-1];
assign inter_ra_0or1 = add_sram_addr1[`FMEM_ADDR_WIDTH-1];

always @(posedge clk) begin
    if(rst) begin
        inter_fetch_en_1_d0 <= #`DLY 1'b0;
        inter_fetch_en_1_d1 <= #`DLY 1'b0;
        inter_fetch_en_1_d2 <= #`DLY 1'b0;
        inter_fetch_en_2_d0 <= #`DLY 1'b0;
        inter_fetch_en_2_d1 <= #`DLY 1'b0;
        inter_fetch_en_2_d2 <= #`DLY 1'b0;
        inter_ra_0or1_d0 <= #`DLY 1'b0;
        inter_ra_0or1_d1 <= #`DLY 1'b0;
    end
    else begin
        inter_fetch_en_1_d0 <= #`DLY inter_fetch_en_1;
        inter_fetch_en_1_d1 <= #`DLY inter_fetch_en_1_d0;
        inter_fetch_en_1_d2 <= #`DLY inter_fetch_en_1_d1;
        inter_fetch_en_2_d0 <= #`DLY inter_fetch_en_2;
        inter_fetch_en_2_d1 <= #`DLY inter_fetch_en_2_d0;
        inter_fetch_en_2_d2 <= #`DLY inter_fetch_en_2_d1;
        inter_ra_0or1_d0 <= #`DLY inter_ra_0or1;
        inter_ra_0or1_d1 <= #`DLY inter_ra_0or1_d0;
    end
end



///////////////////////////////////////////////////////////////////////////////
//                        I N P U T   not 3x3x3                              //
///////////////////////////////////////////////////////////////////////////////
wire inputn3_fetch_en_1;
wire inputn3_fetch_en_2;
wire [`FMEM_ADDR_WIDTH-1:0] inputn3_addr1;
wire [`FMEM_ADDR_WIDTH-1:0] inputn3_addr2;
wire [7:0] inputn3_mask1;
wire [7:0] inputn3_mask2;
wire inputn3_ren1;
wire inputn3_ren2;
wire [63:0] inputn3_data1_masked;
wire [63:0] inputn3_data2_masked;
wire [63:0] inputn3_lm2fifo1_w;
wire [63:0] inputn3_lm2fifo2_w;
reg inputn3_fetch_en_1_d0;
reg inputn3_fetch_en_1_d1;
reg inputn3_fetch_en_2_d0;
reg inputn3_fetch_en_2_d1;
reg inputn3_fetch_en_2_d2;
reg [7:0] inputn3_mask1_d0;
reg [7:0] inputn3_mask2_d0;
reg [7:0] inputn3_mask1_d1;
reg [7:0] inputn3_mask2_d1;
reg inputn3_ren1_d0;
reg inputn3_ren2_d0;
reg inputn3_ren1_d1;
reg inputn3_ren2_d1;
wire [`FMEM_ADDR_WIDTH-1:0] FmapSramAddr1;
wire [`FMEM_ADDR_WIDTH-1:0] FmapSramAddr2;

assign FmapSramAddr1 = fmap_ra1;
assign FmapSramAddr2 = fmap_ra2;
assign inputn3_fetch_en_1 = Layer_type & !Kernel_333 & row_en & ~row_i[0];
assign inputn3_fetch_en_2 = Layer_type & !Kernel_333 & row_en & row_i[0];
assign inputn3_addr1 = inputn3_fetch_en_2 ? FmapSramAddr1+4'd8 : add_sram_addr1;
assign inputn3_addr2 = inputn3_fetch_en_2 ? FmapSramAddr2+4'd8 : add_sram_addr2;
assign inputn3_mask1 = inputn3_fetch_en_1 ? (8'hFF << inputn3_addr1[2:0]) :
                        inputn3_fetch_en_2 ? ~(8'hFF << inputn3_addr1[2:0]) : 8'h00;
assign inputn3_mask2 = inputn3_fetch_en_1 ? (8'hFF << inputn3_addr2[2:0]) :
                        inputn3_fetch_en_2 ? ~(8'hFF << inputn3_addr2[2:0]) : 8'h00;
assign inputn3_ren1 = inputn3_fetch_en_1|inputn3_fetch_en_2;
assign inputn3_ren2 = inputn3_fetch_en_1|inputn3_fetch_en_2;

always @(posedge clk) begin
    if(rst) begin
        inputn3_fetch_en_1_d0 <= #`DLY 1'b0;
        inputn3_fetch_en_1_d1 <= #`DLY 1'b0;
        inputn3_fetch_en_2_d0 <= #`DLY 1'b0;
        inputn3_fetch_en_2_d1 <= #`DLY 1'b0;
        inputn3_fetch_en_2_d2 <= #`DLY 1'b0;
        inputn3_mask1_d0      <= #`DLY 1'b0;
        inputn3_mask1_d1      <= #`DLY 1'b0;
        inputn3_mask2_d0      <= #`DLY 1'b0;
        inputn3_mask2_d1      <= #`DLY 1'b0;
        inputn3_ren1_d0       <= #`DLY 1'b0;
        inputn3_ren1_d1       <= #`DLY 1'b0;
        inputn3_ren2_d0       <= #`DLY 1'b0;
        inputn3_ren2_d1       <= #`DLY 1'b0;
    end
    else begin
        inputn3_fetch_en_1_d0 <= #`DLY inputn3_fetch_en_1;
        inputn3_fetch_en_1_d1 <= #`DLY inputn3_fetch_en_1_d0;
        inputn3_fetch_en_2_d0 <= #`DLY inputn3_fetch_en_2;
        inputn3_fetch_en_2_d1 <= #`DLY inputn3_fetch_en_2_d0;
        inputn3_fetch_en_2_d2 <= #`DLY inputn3_fetch_en_2_d1;
        inputn3_mask1_d0 <= #`DLY inputn3_mask1;
        inputn3_mask1_d1 <= #`DLY inputn3_mask1_d0;
        inputn3_mask2_d0 <= #`DLY inputn3_mask2;
        inputn3_mask2_d1 <= #`DLY inputn3_mask2_d0;
        inputn3_ren1_d0 <= #`DLY inputn3_ren1;
        inputn3_ren1_d1 <= #`DLY inputn3_ren1_d0;
        inputn3_ren2_d0 <= #`DLY inputn3_ren2;
        inputn3_ren2_d1 <= #`DLY inputn3_ren2_d0;
    end
end

function [63:0] data64_after_mask;
    input [7:0] mask;
    input [63:0] datain;
    input [63:0] data;
    case(mask)
        8'b1111_1111 : data64_after_mask = datain[63:0];
        8'b1111_1110 : data64_after_mask = {datain[63:8 ],data[63:56]};
        8'b1111_1100 : data64_after_mask = {datain[63:16],data[63:48]};
        8'b1111_1000 : data64_after_mask = {datain[63:24],data[63:40]};
        8'b1111_0000 : data64_after_mask = {datain[63:32],data[63:32]};
        8'b1110_0000 : data64_after_mask = {datain[63:40],data[63:24]};
        8'b1100_0000 : data64_after_mask = {datain[63:48],data[63:16]};
        8'b1000_0000 : data64_after_mask = {datain[63:56],data[63:8 ]};
        8'b0000_0000 : data64_after_mask = data;
        8'b0000_0001 : data64_after_mask = {datain[ 7:0] ,data[63:8 ]};
        8'b0000_0011 : data64_after_mask = {datain[15:0] ,data[63:16]};
        8'b0000_0111 : data64_after_mask = {datain[23:0] ,data[63:24]};
        8'b0000_1111 : data64_after_mask = {datain[31:0] ,data[63:32]};
        8'b0001_1111 : data64_after_mask = {datain[39:0] ,data[63:40]};
        8'b0011_1111 : data64_after_mask = {datain[47:0] ,data[63:48]};
        8'b0111_1111 : data64_after_mask = {datain[55:0] ,data[63:56]};
        default : data64_after_mask = data;
    endcase
endfunction

assign inputn3_data1_masked = inputn3_ren1_d1 ? data64_after_mask(inputn3_mask1_d1,fmap_data1,lmreg128_1[63:0]) : lmreg128_1[63:0];
assign inputn3_data2_masked = inputn3_ren2_d1 ? data64_after_mask(inputn3_mask2_d1,fmap_data2,lmreg128_2[63:0]) : lmreg128_2[63:0];
assign inputn3_lm2fifo1_w[63:0] = inputn3_data1_masked[63:0];
assign inputn3_lm2fifo2_w[63:0] = inputn3_data2_masked[63:0];


///////////////////////////////////////////////////////////////////////////////
//                           I N P U T    3x3x3                              //
///////////////////////////////////////////////////////////////////////////////
wire [1:0] mask_sft1;
wire [1:0] mask_sft2;
wire input3_fetch_en_3;
wire input3_round3_end;
wire input3_round4_end;
wire [127:0] input3_fmap_masked1;
wire [127:0] input3_fmap_masked2;
wire [127:0] input3_lm2fifo1_w;
wire [127:0] input3_lm2fifo2_w;


reg  [`FMEM_ADDR_WIDTH-1:0] input3_addr1;
reg  [`FMEM_ADDR_WIDTH-1:0] input3_addr2;
reg  [3:0] input3_mask1;
reg  input3_ren1;
reg  input3_ren1_d0;
reg  input3_ren1_d1;
reg  input3_ren2;
reg  input3_ren2_d0;
reg  input3_ren2_d1;
reg  [3:0] input3_mask2;
reg input3_round3_end_d0;
reg input3_round4_end_d0;
reg input3_round3_end_d1;
reg input3_round4_end_d1;
reg input3_fetch_en_3_d0;
reg input3_fetch_en_3_d1;
reg input3_fetch_en_3_d2;
reg [3:0] input3_mask1_d0;
reg [3:0] input3_mask2_d0;
reg [3:0] input3_mask1_d1;
reg [3:0] input3_mask2_d1;

// to save last sram access address every round
reg [`FMEM_ADDR_WIDTH-1:0] input3_sram_addr0;
reg [`FMEM_ADDR_WIDTH-1:0] input3_sram_addr1;
reg [`FMEM_ADDR_WIDTH-1:0] input3_sram_addr2;
reg [`FMEM_ADDR_WIDTH-1:0] input3_sram_addr3;
always @(posedge clk) begin
    input3_sram_addr0 <= #`DLY row_i==3'b011 ? input3_addr1 : input3_sram_addr0;
    input3_sram_addr1 <= #`DLY row_i==3'b011 ? input3_addr2 : input3_sram_addr1;
    input3_sram_addr2 <= #`DLY row_i==3'b111 ? input3_addr1 : input3_sram_addr2;
    input3_sram_addr3 <= #`DLY row_i==3'b111 ? input3_addr2 : input3_sram_addr3;
end

assign mask_sft1 = input3_addr1[2:1];
assign mask_sft2 = input3_addr2[2:1];
always @(*) begin
    if(!Kernel_333) begin
        input3_addr1 = {`FMEM_ADDR_WIDTH{1'b0}};
        input3_ren1 = 1'b0;
        input3_mask1 = 4'b0000;
    end else if(row_en) begin
        input3_addr1 = FmapSramAddr1 + 4'd8;
        input3_ren1 = 1'b1;
        input3_mask1 = 4'b0000;
        case({round[1:0],row_i[1:0]})
            4'b1100 : begin
                        input3_addr1 = FmapConvAddr[{1'b0,row_i[2],1'b0}];
                        input3_mask1 = 4'b1111 << mask_sft1; //mask = data after addr
            end
            4'b1101 : input3_mask1 = 4'b1111;
            4'b1110 : if(FmapSramAddr1[2:0]==3'b000)
                            input3_ren1 = 1'b0;
                      else
                            input3_mask1 = ~(4'b1111 << mask_sft1);//mask = data before addr
            4'b1111 : begin
                        input3_addr1 = FmapSramAddr1;
                        input3_ren1 = 1'b0;
            end
            4'b1000 : begin
                        input3_addr1 = row_i[2] ? input3_sram_addr2 : input3_sram_addr0;
                        input3_mask1 = 4'b0001 << mask_sft1;//mask = 2Bytes at addr
            end
            4'b1001 : begin
                        input3_addr1 = FmapConvAddr[{1'b0,row_i[2],1'b0}]+Conv_W_offset;
                        input3_mask1 = 4'b1111 << mask_sft1; //mask = data after addr
            end
            4'b1010 : input3_mask1 = (FmapSramAddr1[2:0]==3'b000) ? 4'b0111 : 4'b1111;
            4'b1011 : begin
                        input3_addr1 = FmapSramAddr1+4'd6;
                        if(FmapSramAddr1[2:0]<=3'b010)
                            input3_ren1 = 1'b0;
                        else
                            input3_mask1 = ~(4'b1111 << mask_sft1);//mask = data before addr
            end
            4'b0100 : begin
                        input3_addr1 = row_i[2] ? input3_sram_addr2 : input3_sram_addr0;
                        if(input3_addr1[2:0]==3'b110)
                            input3_mask1 = 4'b1000;
                        else
                            input3_mask1 = 4'b0011 << mask_sft1; //mask = 4Bytes after addr
            end
            4'b0101 : begin
                        if(FmapSramAddr1[2:0]==3'b110) begin
                            // input3_addr1 = FmapSramAddr1+4'd2;
                            input3_mask1 = 4'b0001;
                        end else begin
                            input3_ren1 = 1'b0;
                            input3_addr1 = FmapSramAddr1;
                        end
            end
            4'b0110 : begin
                        input3_addr1 = FmapConvAddr[{1'b0,row_i[2],1'b0}]+{Conv_W_offset,1'b0};
                        input3_mask1 = 4'b1111 << mask_sft1; //mask = data after addr
            end
            4'b0111 : begin
                        if(FmapSramAddr1[2:0]==3'b000)
                            input3_ren1 = 1'b0;
                        else
                            input3_mask1 = ~(4'b1111 << mask_sft1);//mask = data before addr
            end
            4'b0000 :  begin
                        input3_addr1 = row_i[2] ? input3_sram_addr2 : input3_sram_addr0;
                        input3_mask1 = 4'b1111 << mask_sft1; //mask = data after addr;
            end
            4'b0001 : begin
                        input3_addr1 = (FmapSramAddr1[2:0]==3'b110) ? FmapSramAddr1+4'd8 : FmapSramAddr1+4'd10;
                        input3_mask1 = (FmapSramAddr1[2:0]==3'b110) ? 4'b1111 : ~(4'b1111 << mask_sft1);
            end
            4'b0010, 4'b0011: begin
                input3_ren1 = 1'b0;
                input3_addr1 = FmapSramAddr1;
            end
        endcase
    end
    else begin
        input3_addr1 = FmapSramAddr1;
        input3_ren1 = 1'b0;
        input3_mask1 = 4'b0000;
    end
end


always @(*) begin
    if(!Kernel_333) begin
        input3_addr2 = {`FMEM_ADDR_WIDTH{1'b0}};
        input3_ren2 = 1'b0;
        input3_mask2 = 4'b0000;
    end else if(row_en) begin
        input3_addr2 = FmapSramAddr2 + 4'd8;
        input3_ren2 = 1'b1;
        input3_mask2 = 4'b0000;
        case({round[1:0],row_i[1:0]})
            4'b1100 : begin
                        input3_addr2 = FmapConvAddr[{1'b0,row_i[2],1'b1}];
                        input3_mask2 = 4'b1111 << mask_sft2; //mask = data after addr
            end
            4'b1101 : input3_mask2 = 4'b1111;
            4'b1110 : if(FmapSramAddr2[2:0]==3'b000)
                            input3_ren2 = 1'b0;
                      else
                            input3_mask2 = ~(4'b1111 << mask_sft2);//mask = data before addr
            4'b1111 : begin
                        input3_addr2 = FmapSramAddr2;
                        input3_ren2 = 1'b0;
            end
            4'b1000 : begin
                        input3_addr2 = row_i[2] ? input3_sram_addr3 : input3_sram_addr1;
                        input3_mask2 = 4'b0001 << mask_sft2;//mask = 2Bytes at addr
            end
            4'b1001 : begin
                        input3_addr2 = FmapConvAddr[{1'b0,row_i[2],1'b1}]+Conv_W_offset;
                        input3_mask2 = 4'b1111 << mask_sft2; //mask = data after addr
            end
            4'b1010 : input3_mask2 = (FmapSramAddr2[2:0]==3'b000) ? 4'b0111 : 4'b1111;
            4'b1011 : begin
                        input3_addr2 = FmapSramAddr2+4'd6;
                        if(FmapSramAddr2[2:0]<=3'b010)
                            input3_ren2 = 1'b0;
                        else
                            input3_mask2 = ~(4'b1111 << mask_sft2);//mask = data before addr
            end
            4'b0100 : begin
                        input3_addr2 = row_i[2] ? input3_sram_addr3 : input3_sram_addr1;
                        if(input3_addr2[2:0]==3'b110)
                            input3_mask2 = 4'b1000;
                        else
                            input3_mask2 = 4'b0011 << mask_sft2; //mask = 4Bytes after addr
            end
            4'b0101 : begin
                        if(FmapSramAddr2[2:0]==3'b110) begin
                            // input3_addr2 = FmapSramAddr2+4'd2;
                            input3_mask2 = 4'b0001;
                        end else begin
                            input3_ren2 = 1'b0;
                            input3_addr2 = FmapSramAddr2;
                        end
            end
            4'b0110 : begin
                        input3_addr2 = FmapConvAddr[{1'b0,row_i[2],1'b1}]+{Conv_W_offset,1'b0};
                        input3_mask2 = 4'b1111 << mask_sft2; //mask = data after addr
            end
            4'b0111 : begin
                        if(FmapSramAddr2[2:0]==3'b000)
                            input3_ren2 = 1'b0;
                        else
                            input3_mask2 = ~(4'b1111 << mask_sft2);//mask = data before addr
            end
            4'b0000 : begin
                        input3_addr2 = row_i[2] ? input3_sram_addr3 : input3_sram_addr1;
                        input3_mask2 = 4'b1111 << mask_sft2; //mask = data after addr;
            end
            4'b0001 : begin
                        input3_addr2 = (FmapSramAddr2[2:0]==3'b110) ? FmapSramAddr2+4'd8 : FmapSramAddr2+4'd10;
                        input3_mask2 = (FmapSramAddr2[2:0]==3'b110) ? 4'b1111 : ~(4'b1111 << mask_sft2);
            end
            4'b0010, 4'b0011: begin
                input3_ren2 = 1'b0;
                input3_addr2 = FmapSramAddr2;
            end
        endcase
    end
    else begin
        input3_addr2 = FmapSramAddr2;
        input3_ren2 = 1'b0;
        input3_mask2 = 4'b0000;
    end
end

function [127:0] data128_after_mask;
    input [3:0] mask;
    input [63:0] datain;
    input [127:0] data;
    case(mask)
        4'b1111 : data128_after_mask = {datain[63:0] ,data[127:64]};
        4'b1110 : data128_after_mask = {datain[63:16],data[127:48]};
        4'b0111 : data128_after_mask = {datain[47:0] ,data[127:48]};
        4'b1100 : data128_after_mask = {datain[63:32],data[127:32]};
        4'b0110 : data128_after_mask = {datain[47:16],data[127:32]};
        4'b0011 : data128_after_mask = {datain[31:0] ,data[127:32]};
        4'b1000 : data128_after_mask = {datain[63:48],data[127:16]};
        4'b0100 : data128_after_mask = {datain[47:32],data[127:16]};
        4'b0010 : data128_after_mask = {datain[31:16],data[127:16]};
        4'b0001 : data128_after_mask = {datain[15:0] ,data[127:16]};
        4'b0000 : data128_after_mask = data;
        default : data128_after_mask = data;
    endcase
endfunction


assign input3_fetch_en_3 = Kernel_333 & row_en & row_i[1:0]==2'b11;
assign input3_round3_end = {round[1:0],row_i[1:0]}==4'b0111;
assign input3_round4_end = {round[1:0],row_i[1:0]}==4'b0011;
assign input3_fmap_masked1 = ~input3_ren1_d1 ? lmreg128_1 : data128_after_mask(input3_mask1_d1,fmap_data1,lmreg128_1);
assign input3_lm2fifo1_w = input3_round3_end_d1 ? {{32{1'b0}},input3_fmap_masked1[127:32]} :
                           input3_round4_end_d1 ? {{48{1'b0}},input3_fmap_masked1[127:48]} :
                           input3_fmap_masked1;
assign input3_fmap_masked2 = ~input3_ren2_d1 ? lmreg128_2 : data128_after_mask(input3_mask2_d1,fmap_data2,lmreg128_2);
assign input3_lm2fifo2_w = input3_round3_end_d1 ? {{32{1'b0}},input3_fmap_masked2[127:32]} :
                           input3_round4_end_d1 ? {{48{1'b0}},input3_fmap_masked2[127:48]} :
                           input3_fmap_masked2;

always @(posedge clk) begin
    if(rst) begin
        input3_round3_end_d0 <= #`DLY 1'b0;
        input3_round3_end_d1 <= #`DLY 1'b0;
        input3_round4_end_d0 <= #`DLY 1'b0;
        input3_round4_end_d1 <= #`DLY 1'b0;
        input3_fetch_en_3_d0 <= #`DLY 1'b0;
        input3_fetch_en_3_d1 <= #`DLY 1'b0;
        input3_fetch_en_3_d2 <= #`DLY 1'b0;
        input3_mask1_d0      <= #`DLY 1'b0;
        input3_mask1_d1      <= #`DLY 1'b0;
        input3_mask2_d0      <= #`DLY 1'b0;
        input3_mask2_d1      <= #`DLY 1'b0;
        input3_ren1_d0       <= #`DLY 1'b0;
        input3_ren1_d1       <= #`DLY 1'b0;
        input3_ren2_d0       <= #`DLY 1'b0;
        input3_ren2_d1       <= #`DLY 1'b0;
    end
    else begin
        input3_round3_end_d0 <= #`DLY input3_round3_end;
        input3_round3_end_d1 <= #`DLY input3_round3_end_d0;
        input3_round4_end_d0 <= #`DLY input3_round4_end;
        input3_round4_end_d1 <= #`DLY input3_round4_end_d0;
        input3_fetch_en_3_d0 <= #`DLY input3_fetch_en_3;
        input3_fetch_en_3_d1 <= #`DLY input3_fetch_en_3_d0;
        input3_fetch_en_3_d2 <= #`DLY input3_fetch_en_3_d1;
        input3_mask1_d0      <= #`DLY input3_mask1;
        input3_mask1_d1      <= #`DLY input3_mask1_d0;
        input3_mask2_d0      <= #`DLY input3_mask2;
        input3_mask2_d1      <= #`DLY input3_mask2_d0;
        input3_ren1_d0       <= #`DLY input3_ren1;
        input3_ren1_d1       <= #`DLY input3_ren1_d0;
        input3_ren2_d0       <= #`DLY input3_ren2;
        input3_ren2_d1       <= #`DLY input3_ren2_d0;
    end
end


///////////////////////////////////////////////////////////////////////////////
//                       O U T P U T                                         //
///////////////////////////////////////////////////////////////////////////////
wire [`FMEM_ADDR_WIDTH-1:0] fmap_ra1_w;
wire [`FMEM_ADDR_WIDTH-1:0] fmap_ra2_w;
wire fmap_ren1_w;
wire fmap_ren2_w;
wire [63:0] inter_lm2fifo_w;
wire [127:0] lmreg128_1_w;
wire [127:0] lmreg128_2_w;
wire [127:0] input3_lm2fifo0_re;
wire [127:0] input3_lm2fifo1_re;
// output for fmap_sram
assign fmap_ra1_w = !Layer_type ? inter_addr1 :
                    !Kernel_333 ? inputn3_addr1 : input3_addr1;
assign fmap_ra2_w = !Layer_type ? inter_addr2 :
                    !Kernel_333 ? inputn3_addr2 : input3_addr2;
assign fmap_ren1_w = !Layer_type ? inter_ren1 :
                     !Kernel_333 ? inputn3_ren1 : input3_ren1;
assign fmap_ren2_w = !Layer_type ? inter_ren2 :
                     !Kernel_333 ? inputn3_ren2 : input3_ren2;

always @(posedge clk) begin
    if(rst) begin
        fmap_ren1  <= #`DLY 1'b0;
        fmap_ren2  <= #`DLY 1'b0;
        fmap_ra1   <= #`DLY {`FMEM_ADDR_WIDTH{1'b0}};
        fmap_ra2   <= #`DLY {`FMEM_ADDR_WIDTH{1'b0}};
        fmap_data1 <= #`DLY 64'd0;
        fmap_data2 <= #`DLY 64'd0;
    end
    else begin
        fmap_ren1  <= #`DLY fmap_ren1_w;
        fmap_ren2  <= #`DLY fmap_ren2_w;
        fmap_ra1   <= #`DLY fmap_ra1_w;
        fmap_ra2   <= #`DLY fmap_ra2_w;
        fmap_data1 <= #`DLY fmap_rd1;
        fmap_data2 <= #`DLY fmap_rd2;
    end
end

assign inter_lm2fifo_w = inter_ra_0or1_d1 ? fmap_data2 : fmap_data1;
assign lmreg128_1_w = !Layer_type ? {{64{1'b0}}, inter_lm2fifo_w} :
                      !Kernel_333 ? {{64{1'b0}}, inputn3_lm2fifo1_w} :
                      input3_lm2fifo1_w;
assign lmreg128_2_w = !Layer_type ? {128{1'b0}} :
                      !Kernel_333 ? {{64{1'b0}}, inputn3_lm2fifo2_w} :
                      input3_lm2fifo2_w;

always @(posedge clk) begin
    if(rst) begin
        lmreg128_1 <= #`DLY 128'd0;
        lmreg128_2 <= #`DLY 128'd0;
    end
    else begin
        lmreg128_1 <= #`DLY lmreg128_1_w;
        lmreg128_2 <= #`DLY lmreg128_2_w;
    end
end
wire [63:0] input3_lm2fifo0;
wire [63:0] input3_lm2fifo1;
wire [63:0] input3_lm2fifo2;
wire [63:0] input3_lm2fifo3;
assign input3_lm2fifo0 =
    {lmreg128_1[119:112],lmreg128_1[103:96],lmreg128_1[87:80],lmreg128_1[71:64],
     lmreg128_1[55:48],  lmreg128_1[39:32], lmreg128_1[23:16],lmreg128_1[7:0]  };
assign input3_lm2fifo1 =
    {lmreg128_1[127:120],lmreg128_1[111:104],lmreg128_1[95:88],lmreg128_1[79:72],
     lmreg128_1[63:56],  lmreg128_1[47:40], lmreg128_1[31:24],lmreg128_1[15:8]  };
assign input3_lm2fifo2 =
    {lmreg128_2[119:112],lmreg128_2[103:96],lmreg128_2[87:80],lmreg128_2[71:64],
     lmreg128_2[55:48],  lmreg128_2[39:32], lmreg128_2[23:16],lmreg128_2[7:0]  };
assign input3_lm2fifo3 =
    {lmreg128_2[127:120],lmreg128_2[111:104],lmreg128_2[95:88],lmreg128_2[79:72],
     lmreg128_2[63:56],  lmreg128_2[47:40], lmreg128_2[31:24],lmreg128_2[15:8]  };

assign input3_lm2fifo0_re = {input3_lm2fifo2,input3_lm2fifo0};
assign input3_lm2fifo1_re = {input3_lm2fifo3,input3_lm2fifo1};
assign fifo0_wen = !Layer_type ? inter_fetch_en_1_d2 :
                   !Kernel_333 ? inputn3_fetch_en_2_d2 : input3_fetch_en_3_d2;
assign fifo1_wen = !Layer_type ? inter_fetch_en_2_d2 :
                   !Kernel_333 ? inputn3_fetch_en_2_d2 : input3_fetch_en_3_d2;
assign fifo0_wd  = !Layer_type ? lmreg128_1 : !Kernel_333 ? lmreg128_1 : input3_lm2fifo0_re;
assign fifo1_wd  = !Layer_type ? lmreg128_1 : !Kernel_333 ? lmreg128_2 : input3_lm2fifo1_re;
assign fifo_w2entry = Kernel_333 ;//write 2 entry fifo


endmodule
