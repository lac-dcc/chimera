// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  fmap_sram.v
// Module  name  :  fmap_sram
// Created Time  :  2018/5/7 17:09:47
// Last Modified :  2018/5/20 9:38:40
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/07  chenhaoc
//
// ********************************************************
`include "hwpe_define.vh"
`define DLY 1
`timescale 1ns/10ps

module fmap_sram(
    input  wire                        clk,
    input  wire                        ren1,
    input  wire [`FMEM_ADDR_WIDTH-1:0] ra1,
    input  wire                        ren2,
    input  wire [`FMEM_ADDR_WIDTH-1:0] ra2,
    input  wire [`FMEM_ADDR_WIDTH-1:0] wa,
    input  wire [63:0]                 wd,
    input  wire                        wen,
    output wire [63:0]                 rd1,
    output wire [63:0]                 rd2,
    output wire                        fmap_2addr_error,
    output wire                        fmap_write_read_error
);

// ra1_MSB must be 0; ra2_MSB must be 1;
`ifndef SYNTHESIS
    always @(posedge clk) begin
        if(ren1 & ren2 & ~(~ra1[`FMEM_ADDR_WIDTH-1] & ra2[`FMEM_ADDR_WIDTH-1])) begin
            $display("Error:two address of FmapSram are wrong!\n");
            $error;
        end
    end
`endif

wire cen1;
wire cen2;
wire [`SRAM_ADDR_WIDTH-1:0] ad1;
wire [`SRAM_ADDR_WIDTH-1:0] ad2;
wire wen1;
wire wen2;

assign fmap_2addr_error = ren1 & ren2 & ~(~ra1[`FMEM_ADDR_WIDTH-1] & ra2[`FMEM_ADDR_WIDTH-1]);
assign fmap_write_read_error = (ren1&wen1) | (ren2&wen2);

assign cen1 = (ren1|wen) & (~ra1[`FMEM_ADDR_WIDTH-1]|~wa[`FMEM_ADDR_WIDTH-1]);
assign cen2 = (ren2|wen) & (ra2[`FMEM_ADDR_WIDTH-1]|wa[`FMEM_ADDR_WIDTH-1]);
assign wen1 = wen & ~wa[`FMEM_ADDR_WIDTH-1];
assign wen2 = wen & wa[`FMEM_ADDR_WIDTH-1];
assign ad1 = wen1 ? wa[`SRAM_ADDR_WIDTH-1:0] : ra1[`SRAM_ADDR_WIDTH-1:0];
assign ad2 = wen2 ? wa[`SRAM_ADDR_WIDTH-1:0] : ra2[`SRAM_ADDR_WIDTH-1:0];

sram fmap_sram1(
     .clk   (clk)
    ,.cen   (cen1)
    ,.ad    (ad1)
    ,.wd    (wd)
    ,.wen   (wen1)
    ,.rd    (rd1)
);

sram fmap_sram2(
     .clk   (clk)
    ,.cen   (cen2)
    ,.ad    (ad2)
    ,.wd    (wd)
    ,.wen   (wen2)
    ,.rd    (rd2)
);

endmodule
