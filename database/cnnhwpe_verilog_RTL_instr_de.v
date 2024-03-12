// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  instr_de.v
// Module  name  :  instr_de
// Created Time  :  2018/5/3 21:35:08
// Last Modified :  2018/5/25 11:52:53
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



module instr_de(
    input  wire  [31:0]  instr,
    input  wire  [31:0]  rs1_data,
    input  wire  [31:0]  rs2_data,

    input  wire          clk,
    output wire          rst,
    //regcfg
    output wire          write_fmap_addrreg,
    output wire          write_cfgreg,
    output wire          matrixmac_st,
    output wire  [4:0]   rs1,
    output wire  [4:0]   rs2,
    output wire  [4:0]   rd,
    input  wire          Kernel_333,
    input  wire          Layer_type,

    //fetcher
    output wire          fmap_matrixmac_st,
    output wire          kernel_matrixmac_st,
    output wire          hwpe_conv_st,

    //pe.accreg
    output wire          acc_wen,
    output wire  [2:0]   acc_w_acc_id,
    output wire  [3:0]   acc_w_pe_id,
    output wire  [31:0]  acc_w_wd,
    output wire          acc_ren,
    output wire  [2:0]   acc_r_acc_id,
    output wire  [3:0]   acc_r_pe_id,
    output wire          relu_ren,
    output wire  [2:0]   relu_acc_id,

    output wire          instr_reset,
    output wire          matrixmac_en,
    output wire          relu_ren_st,
    input  wire          matrix_done,
    output wire          hwpe_conv_en_error,
    input  wire          eai_req_valid,
    input  wire          eai_req_ready,
    output wire          done_imm
);

wire [6:0] funct7;
wire [6:0] opcode;
wire xd,xs1,xs2;

assign funct7 = instr[31:25];
assign rs2 = instr[24:20];
assign rs1 = instr[19:15];
assign rd = instr[11:7];
assign opcode = instr[6:0];
assign xd = instr[14];
assign xs1 = instr[13];
assign xs2 = instr[12];


//===================  Decode Instr ===========================
//`HWPEWriteFmapAddrReg
assign write_fmap_addrreg = funct7[6:0]==`HWPEWriteFmapAddrReg;

//`HWPEWriteCfgReg
assign write_cfgreg = funct7[6:0]==`HWPEWriteCfgReg;

//`HWPEMatrixMac
assign matrixmac_en = funct7[6:0]==`HWPEMatrixMac;

//HWPEWriteAccReg
assign acc_wen = funct7[6:0]==`HWPEWriteAccReg;
assign acc_w_pe_id = rs2[3:0];
assign acc_w_acc_id = rd[2:0];
assign acc_w_wd = rs1_data;

//`HWPEReadAccReg
assign acc_ren = funct7[6:0]== `HWPEReadAccReg;
assign acc_r_acc_id = rs1[2:0];
assign acc_r_pe_id = rs2[3:0];

//`HWPEReLUMemWriteAccReg
assign relu_ren = funct7[6:0]==`HWPEReLUMemWriteAccReg;
assign relu_ren_st = relu_ren&eai_req_valid&eai_req_ready;
assign relu_acc_id = rs2[2:0];

//`HWPEReset
assign reset = funct7[6:0]==`HWPEReset;
assign instr_reset = reset;

//================  rst =============================
reg reset_reg;
reg reset_reg2;
reg reset_reg3;
always @(posedge clk) begin
    reset_reg <= #`DLY reset & eai_req_ready & eai_req_valid;
end

assign rst = reset_reg;

assign done_imm = ~(funct7[6:0]==`HWPEReLUMemWriteAccReg | funct7[6:0]==`HWPEMatrixMac);
//=============== fmap/kernel start ==================
reg matrixmac_en_d1;
reg hwpe_conv_en_d1;
reg matrixmac_st_d0;
reg matrixmac_st_d1;
reg matrixmac_st_d2;
reg matrixmac_st_d3;
reg matrix_f_reg;
wire matrix_f;
wire hwpe_conv_en;
assign matrixmac_st = matrixmac_en & ~matrixmac_en_d1;
assign hwpe_conv_st = hwpe_conv_en & ~hwpe_conv_en_d1;

always @(posedge clk) begin
    if(rst) begin
        matrixmac_en_d1 <= #`DLY 1'b0;
        hwpe_conv_en_d1 <= #`DLY 1'b0;
        matrixmac_st_d0 <= #`DLY 1'b0;
        matrixmac_st_d1 <= #`DLY 1'b0;
        matrixmac_st_d2 <= #`DLY 1'b0;
        matrixmac_st_d3 <= #`DLY 1'b0;
        matrix_f_reg <= #`DLY 1'b0;
    end
    else begin
        matrixmac_en_d1 <= #`DLY matrixmac_en;
        hwpe_conv_en_d1 <= #`DLY hwpe_conv_en;
        matrixmac_st_d0 <= #`DLY matrixmac_st;//wait W/H_count/H/W_stride to be writed in cfgreg
        matrixmac_st_d1 <= #`DLY !Kernel_333 ? matrixmac_st_d0 : 1'b0;
        matrixmac_st_d2 <= #`DLY !Kernel_333 ? matrixmac_st_d1 : 1'b0;
        matrixmac_st_d3 <= #`DLY !Layer_type ? matrixmac_st_d2 : 1'b0;
        matrix_f_reg <= #`DLY matrix_f;
    end
end

assign fmap_matrixmac_st  =  Kernel_333 ? matrixmac_st_d0 :    //input3
                             Layer_type ? matrixmac_st_d2 : //inputn3
                             matrixmac_st_d3;               //inter
assign kernel_matrixmac_st = matrixmac_st_d0;

assign matrix_f = matrixmac_st ? 1'b1 : matrix_done ? 1'b0 : matrix_f_reg;
assign hwpe_conv_en_error = (acc_ren|relu_ren) & rs2[4] & ~matrix_f_reg;
assign hwpe_conv_en = ((acc_ren&rs1[4])|(relu_ren&rs2[4])) & matrix_f_reg;
// assign hwpe_conv_en = (acc_ren|relu_ren) & matrix_f_reg ?
                       // acc_ren ? rs1[4] : relu_ren ? rs2[4] : 1'b0 : 1'b0;

endmodule
