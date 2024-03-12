// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  kernel_sram.v
// Module  name  :  kernel_sram
// Created Time  :  2018/5/7 21:52:36
// Last Modified :  2018/5/29 10:32:23
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

module kernel_sram(
    input  wire                        clk,
    input  wire                        ren1,
    input  wire [`KMEM_ADDR_WIDTH-1:0] ra1,
    input  wire                        ren2,
    input  wire [`KMEM_ADDR_WIDTH-1:0] ra2,
    input  wire [`KMEM_ADDR_WIDTH-1:0] wa,
    input  wire [63:0]                 wd,
    input  wire                        wen,
    output wire [63:0]                 rd1,
    output wire [63:0]                 rd2,
    output wire                        kernel_2addr_error,
    output wire                        kernel_write_read_error
);


// ra1[6] must be 0; ra2[6] must be 1; [2:0]->64bit [6:3]->16column;
// first 8column belongs to sram1; last 8columns belongs to sram2;
`ifndef SYNTHESIS
    always @(posedge clk) begin
        if(ren1 & ren2 & ~(~ra1[6] & ra2[6])) begin
            $display("Error:two address of KernelSram are wrong!\n");
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


assign kernel_2addr_error = ren1 & ren2 & ~(~ra1[6] & ra2[6]);
assign kernel_write_read_error = (ren1&wen1) | (ren2&wen2);


assign cen1 = (ren1|wen) & (~ra1[6]|~wa[6]);
assign cen2 = (ren2|wen) & (ra2[6]|wa[6]);
assign wen1 = wen & ~wa[6];
assign wen2 = wen & wa[6];

wire [`SRAM_ADDR_WIDTH-1:0] wa_sram;
assign wa_sram = {wa[`FMEM_ADDR_WIDTH-1:7],wa[5:0]};
assign ad1 = wen1 ? wa_sram : {ra1[`FMEM_ADDR_WIDTH-1:7],ra1[5:0]};
assign ad2 = wen2 ? wa_sram : {ra2[`FMEM_ADDR_WIDTH-1:7],ra2[5:0]};

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
