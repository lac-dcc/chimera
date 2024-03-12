// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  regcfg.v
// Module  name  :  regcfg
// Created Time  :  2018/5/7 10:55:10
// Last Modified :  2018/5/21 15:05:01
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

module regcfg(
    input  wire          clk,
    input  wire          write_fmap_addrreg,
    input  wire          write_cfgreg,
    input  wire          matrixmac_st,
    input  wire  [4:0]   rs1,
    input  wire  [4:0]   rs2,
    input  wire  [4:0]   rd,
    input  wire  [31:0]  rs1_data,
    input  wire  [31:0]  rs2_data,

    output wire  [15:0]  Conv_W_offset,
    output wire  [15:0]  Conv_CH_count,
    output wire  [3:0]   Kernel_size,
    output wire  [1:0]   Data_type,
    output wire          Layer_type,
    output wire          Kernel_333,
    output wire  [4:0]   AccReg_shift,
    output wire  [9:0]   K_count,
    output reg   [15:0]  W_count,
    output reg   [15:0]  H_count,
    output reg   [15:0]  W_stride,
    output reg   [15:0]  H_stride,

    input  wire  [2:0]   baseaddr_ra1,
    input  wire  [2:0]   baseaddr_ra2,
    output wire  [`FMEM_ADDR_WIDTH-1:0] baseaddr_rd1,
    output wire  [`FMEM_ADDR_WIDTH-1:0] baseaddr_rd2
);

//HWPEWriteFmapAddrReg
reg [`FMEM_ADDR_WIDTH-1:0] FmapAddrBase[0:7];
wire [2:0] base_addr_idx;
assign base_addr_idx = rd[2:0];

always @(posedge clk) begin
    if(write_fmap_addrreg) begin
        FmapAddrBase[base_addr_idx] <= #`DLY rs1_data;
        FmapAddrBase[base_addr_idx+1] <= #`DLY rs2_data;
    end
end

assign baseaddr_rd1 = FmapAddrBase[baseaddr_ra1];
assign baseaddr_rd2 = FmapAddrBase[baseaddr_ra2];


//HWPEWriteCfgReg
reg [31:0] cfgreg0,cfgreg1;

always @(posedge clk) begin
    if(write_cfgreg) begin
        cfgreg0 <= #`DLY rs1_data;
        cfgreg1 <= #`DLY rs2_data;
    end
end

assign Conv_CH_count    = cfgreg0[15:0];
assign Conv_W_offset	= cfgreg0[31:16];
assign Kernel_size	= cfgreg1[3:0];
assign Data_type	= cfgreg1[5:4];
assign Layer_type	= cfgreg1[6];
assign Kernel_333	= cfgreg1[7];
assign AccReg_shift	= cfgreg1[12:8];
assign K_count  	= cfgreg1[22:13];

//HWPEMatrixMac
always @(posedge clk) begin
    if(matrixmac_st) begin
        H_count <= #`DLY rs1_data[15:0];
        W_count <= #`DLY rs1_data[31:16];
        H_stride <= #`DLY rs2_data[15:0];
        W_stride <= #`DLY rs2_data[31:16];
    end
end

endmodule



