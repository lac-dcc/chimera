// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  eai_itf.v
// Module  name  :  eai_itf
// Created Time  :  2018/5/3 15:32:34
// Last Modified :  2018/5/26 22:07:55
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/03  chenhaoc
//
// ********************************************************

`include "hwpe_define.vh"
`define DLY 1
`timescale 1ns/10ps

module eai_itf(
    //request channel
    input  wire          eai_req_valid,
    output wire          eai_req_ready,
    input  wire [31:0]   eai_req_instr,
    input  wire [31:0]   eai_req_rs1,
    input  wire [31:0]   eai_req_rs2,
    input  wire [1:0]    eai_req_itag,

    //response channel
    output wire          eai_rsp_valid,
    input  wire          eai_rsp_ready,
    output wire [31:0]   eai_rsp_wdat,
    output wire [1:0]    eai_rsp_itag,
    output wire          eai_rsp_err,

    //memory request channel
    output wire          eai_icb_cmd_valid,
    input  wire          eai_icb_cmd_ready,
    output wire [31:0]   eai_icb_cmd_addr,
    output wire          eai_icb_cmd_read,
    output wire [31:0]   eai_icb_cmd_wdata,
    output wire [3:0]    eai_icb_cmd_wmask,

    //memory response channel
    input wire           eai_icb_rsp_valid,
    output wire          eai_icb_rsp_ready,
    input  wire [31:0]   eai_icb_rsp_rdata,
    input  wire          eai_icb_rsp_err,
    //memory holdup
    output wire          eai_mem_holdup,

    input   wire          clk,
    input   wire          rst,
    //instr
    output  wire  [31:0]  instr,
    output  wire  [31:0]  rs1_data,
    output  wire  [31:0]  rs2_data,
    //ReadAccReg
    input   wire          acc_ren,
    input   wire  [31:0]  acc_r_rd,
    //ReLUMemWriteAccReg
    input   wire          relu_ren,
    input   wire          relu_ren_st,
    input   wire  [31:0]  relu_out_32b,
    output  wire          relu_out_continue,
    input   wire          relu_done,
    input   wire          relu_accreg_en,
    //MatrixMac
    input   wire          hwpe_conv_st,
    input   wire          matrixmac_st,
    //reset
    input   wire          instr_reset,
    input   wire          done_imm,

    input   wire          fmap_2addr_error,
    input   wire          kernel_2addr_error,
    input   wire          hwpe_conv_en_error,
    input   wire          fmap_write_read_error,
    input   wire          kernel_write_read_error,

    input   wire          pe_done
);

wire done;
wire done_pe;
wire done_relu;
wire done_instr;
wire has_error;
wire relu_write_error;
wire pe_en;
wire matrixmac_en;
wire hwpe_conv_en;
wire done_instr_st;
reg done_reg;
reg error_reg;
reg eai_mem_holdup_reg;
reg [31:0] relu_write_addr_reg;
reg [31:0] rs1_reg;
reg [31:0] rs2_reg;
reg [1:0]  itag_reg;
reg [31:0] instr_reg;
reg eai_rsp_valid_reg;
reg matrixmac_en_reg;
reg hwpe_conv_en_reg;
reg done_instr_reg;
reg done_instr_nimm_reg;

// for instr
always @(posedge clk) begin
    if(eai_req_valid&eai_req_ready) begin
        instr_reg <= #`DLY eai_req_instr;
        rs1_reg   <= #`DLY eai_req_rs1;
        rs2_reg   <= #`DLY eai_req_rs2;
        itag_reg  <= #`DLY eai_req_itag;
    end
end


//request channel
assign eai_req_ready = (eai_req_valid & eai_req_instr[6:0]!=`CUSTOM0) ? 1'b0 : instr_reset ? 1'b1 : done_reg;//case1: be ready and wait new instr once last instr was done
//assign eai_req_ready = done_reg&eai_req_valid ? 1'b1 : 1'b0;//case2: only ready when new instr comes
assign rs1_data = eai_req_valid ? eai_req_rs1 : rs1_reg;
assign rs2_data = eai_req_valid ? eai_req_rs2 : rs2_reg;
assign instr = eai_req_valid ? eai_req_instr : instr_reg;
wire eai_rsp_valid_w;
wire done_imm_st;
wire done_instr_nimm;
wire done_nimm_st;
//response channel
assign done_imm_st = done_imm&eai_req_valid&eai_req_ready;
assign done_instr_nimm = ~done_imm&done_instr;
assign done_nimm_st = done_instr_nimm&~done_instr_nimm_reg;
// assign eai_rsp_valid_w = (done_imm&eai_req_valid&eai_req_ready)|(~done_imm&done_instr&~eai_rsp_valid_reg)? 1'b1 :
                       // eai_rsp_ready ? 1'b0 : eai_rsp_valid_reg;
// assign eai_rsp_valid = eai_rsp_valid_w | eai_rsp_valid_reg;
assign eai_rsp_valid_w = done_imm_st ? 1'b1 :
                        done_nimm_st&eai_rsp_ready ? 1'b0 :
                        done_nimm_st ? 1'b1 : eai_rsp_ready ? 1'b0 : eai_rsp_valid_reg;
assign eai_rsp_valid = done_imm_st | done_nimm_st | eai_rsp_valid_reg;
assign eai_rsp_wdat = acc_r_rd;
assign eai_rsp_itag = done_instr&eai_req_valid ? eai_req_itag : itag_reg;
assign eai_rsp_err = eai_req_valid & (relu_ren_st|matrixmac_st|hwpe_conv_st) ? 1'b0 : has_error ? 1'b1 : error_reg;

assign has_error = fmap_2addr_error | kernel_2addr_error | relu_write_error | hwpe_conv_en_error |fmap_write_read_error |kernel_write_read_error;

//memory request channel
assign eai_icb_cmd_valid = relu_accreg_en;
assign relu_out_continue = eai_icb_cmd_ready;
assign eai_icb_cmd_addr = relu_write_addr_reg;
assign eai_icb_cmd_read = 1'b0;
assign eai_icb_cmd_wdata = relu_out_32b;
assign eai_icb_cmd_wmask = 4'b1111;
always @(posedge clk) begin
    eai_rsp_valid_reg  <= #`DLY eai_rsp_valid_w;
    relu_write_addr_reg <= #`DLY (eai_req_valid & relu_ren) ? rs1_data :
                                 eai_icb_cmd_ready ? relu_write_addr_reg + 4'd8 :
                                 relu_write_addr_reg ;
end

//memory response channel
assign eai_icb_rsp_ready = eai_icb_rsp_valid;//case1: be ready only when icb_rsp_valid
//assign eai_icb_rsp_ready = 1'b1;//case2: be ready any time, wait icb_rsp_valid
//eai_icb_rsp_rdata; do not use
assign relu_write_error = eai_icb_rsp_valid&eai_icb_rsp_ready&eai_icb_rsp_err;

assign eai_mem_holdup = relu_ren_st ? 1'b1 : eai_rsp_ready ? 1'b0 : eai_mem_holdup_reg;

always @(posedge clk) begin
    if(rst) begin
        eai_mem_holdup_reg <= #`DLY 1'b0;
        done_reg  <= #`DLY 1'b1;
        error_reg <= #`DLY 1'b0;
        matrixmac_en_reg <= #`DLY 1'b0;
        hwpe_conv_en_reg <= #`DLY 1'b0;
         done_instr_reg <= 1'b1;
         done_instr_nimm_reg <= #`DLY 1'b0;
    end
    else begin
        eai_mem_holdup_reg <= #`DLY eai_mem_holdup;
        done_reg  <= #`DLY done;
        error_reg <= #`DLY eai_rsp_err;
        matrixmac_en_reg <= #`DLY matrixmac_en;
        hwpe_conv_en_reg <= #`DLY hwpe_conv_en;
        done_instr_reg <= #`DLY done_instr;
        done_instr_nimm_reg <= #`DLY done_instr_nimm;
    end
end

//done
assign matrixmac_en = matrixmac_st ? 1'b1 : pe_done ? 1'b0 : matrixmac_en_reg;
assign hwpe_conv_en = hwpe_conv_st ? 1'b1 : pe_done ? 1'b0 : hwpe_conv_en_reg;
assign done_matrixmac = matrixmac_en ? (matrixmac_st ? 1'b0 : pe_done ? 1'b1 : done_reg) : 1'b1;
assign done_hwpe_conv = hwpe_conv_en ? (hwpe_conv_st ? 1'b0 : pe_done ? 1'b1 : done_reg) : 1'b1;
assign done_relu = relu_ren ? (relu_ren_st ? 1'b0 : relu_done ? 1'b1 : done_instr_reg) : 1'b1;

assign done_instr = done_matrixmac & done_relu;
assign done = done_matrixmac & done_hwpe_conv & done_relu;

assign done_instr_st = done_instr&~done_instr_reg;
endmodule

