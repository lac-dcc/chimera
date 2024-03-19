`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:28:48 05/25/2018 
// Design Name: 
// Module Name:    TOP_RI_CPU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TOP_RI_CPU(input clk_100MHz,input rst,input clk,output ZF,output OF,output [31:0]F,output [31:0]M_R_Data);
wire Write_Reg;
wire [31:0]Inst_code;
wire [4:0]rs;
wire [4:0]rt;
wire [4:0]rd;
wire [31:0]rs_data;
wire [31:0]rt_data;
wire [31:0]rd_data;
wire [31:0]imm_data;
wire [15:0]imm;
wire rd_rt_s;
wire imm_s;
wire Mem_Write;
wire alu_mem_s;
wire [31:0]W_Addr;
wire [31:0]W_Data;
wire [31:0]R_Data_A;
wire [31:0]R_Data_B;
wire [31:0]F;
wire [31:0]ALU_B;
wire [2:0]ALU_OP;
pc pc_connect(clk,rst,Inst_code);
OP_YIMA op(Inst_code,ALU_OP,rs,rt,rd,Write_Reg,imm,rd_rt_s,imm_s,rt_imm_s,Mem_Write,alu_mem_s);

assign W_Addr=(rd_rt_s)?rt:rd;
 assign imm_data = (imm_s)?{{16{imm[15]}}, imm} : {{16{1'b0}}, imm};
Register_file R_connect(rs,rt,W_Addr,Write_Reg,W_Data,~clk,rst,R_Data_A,R_Data_B);
assign ALU_B=(rt_imm_s)?imm_data:R_Data_B;
ALU ALU_connect(R_Data_A,ALU_B,F,ALU_OP,ZF,OF);

RAM_B Data_Mem (
  .clka(clk_100MHz), // input clka
  .wea(Mem_Write), // input [0 : 0] wea
  .addra(F[5:0]), // input [5 : 0] addra
  .dina(R_Data_B), // input [31 : 0] dina
  .douta(M_R_Data) // output [31 : 0] douta
);
  assign W_Data=alu_mem_s?M_R_Data:F;
endmodule

