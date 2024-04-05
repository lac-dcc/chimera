// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  rv_mcu.v
// Module  name  :  rv_mcu
// Created Time  :  2018/5/17 23:04:46
// Last Modified :  2018/5/30 14:39:20
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/17  chenhaoc
//   For testbench, simulate timing of EAI interface
// ********************************************************

`include "hwpe_define.vh"
`define DLY 1
`timescale 1ns/10ps

module rv_mcu(
    //=================   E A I   ====================
    //request channel
    output  wire          eai_req_valid,
    input   wire          eai_req_ready,
    output  wire [31:0]   eai_req_instr,
    output  wire [31:0]   eai_req_rs1,
    output  wire [31:0]   eai_req_rs2,
    output  wire [1:0]    eai_req_itag,

    //response channel
    input   wire          eai_rsp_valid,
    output  wire          eai_rsp_ready,
    input   wire [31:0]   eai_rsp_wdat,
    input   wire [1:0]    eai_rsp_itag,
    input   wire          eai_rsp_err,

    //memory request channel
    input   wire          eai_icb_cmd_valid,
    output  wire          eai_icb_cmd_ready,
    input   wire [31:0]   eai_icb_cmd_addr,
    input   wire          eai_icb_cmd_read,
    input   wire [31:0]   eai_icb_cmd_wdata,
    input   wire [3:0]    eai_icb_cmd_wmask,

    //memory response channel
    output  wire          eai_icb_rsp_valid,
    input   wire          eai_icb_rsp_ready,
    output  wire [31:0]   eai_icb_rsp_rdata,
    output  wire          eai_icb_rsp_err,
    //memory holdup
    input   wire          eai_mem_holdup,

    input   wire          clk,
    input   wire          rst,
    input   wire          send_instr,
    input   wire [31:0]   instr,
    input   wire [31:0]   rs1_data,
    input   wire [31:0]   rs2_data
);

wire eai_req_calid_w;
reg eai_req_valid_reg;
reg eai_rsp_ready_reg;
reg eai_icb_rsp_ready_reg;
reg[1:0] itag_reg;
assign eai_req_valid_w = send_instr&instr[31:25]==`HWPEReset ? 1'b1 :
                         send_instr&eai_req_ready ? 1'b0 :
                         send_instr ? 1'b1 : eai_req_ready ? 1'b0 : eai_req_valid_reg;
assign eai_req_valid = send_instr | eai_req_valid_reg;// | eai_req_valid_reg;
assign eai_req_instr = instr;
assign eai_req_rs1 = rs1_data;
assign eai_req_rs2 = rs2_data;
assign eai_req_itag = itag_reg;

//case1 : always ready
assign eai_rsp_ready = ~eai_req_valid ? 1'b1 : 1'b0;
//case2 : ready only when valid
//assign eai_rsp_ready = ~eai_rsp_ready_reg&~eai_req_valid&eai_rsp_valid ? 1'b1 : 1'b0;

//case1: be ready only when icb_cmd_valid
assign eai_icb_cmd_ready = eai_icb_cmd_valid;
//case2: be ready any time, wait icb_cmd_valid
//assign eai_icb_cmd_ready = 1'b1;

assign eai_icb_rsp_valid = eai_icb_rsp_ready_reg; //delay 1 clk
assign eai_icb_rsp_rdata = 32'd0;
assign eai_icb_rsp_err = 1'b0;

always @(posedge clk) begin
    if(rst) begin
        eai_req_valid_reg <= #`DLY 1'b0;
        eai_rsp_ready_reg <= #`DLY 1'b0;
        itag_reg <= #`DLY 2'b00;
        eai_icb_rsp_ready_reg <= #`DLY 1'b0;
    end
    else begin
        eai_req_valid_reg <= #`DLY eai_req_valid_w;
        eai_rsp_ready_reg <= #`DLY eai_rsp_ready;
        itag_reg <= #`DLY (eai_rsp_valid&eai_rsp_ready)===1'b1 ? itag_reg+2'b01 : itag_reg;
        eai_icb_rsp_ready_reg <= #`DLY eai_icb_rsp_ready;
    end
end

endmodule

