`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:59 05/16/2018 
// Design Name: 
// Module Name:    top_R_cpu 
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
module top_R_cpu(input rst,input clk,output ZF,output OF,output [31:0]F);
reg write_reg;
wire [31:0]Inst_code;
wire [31:0]R_Data_A;
wire [31:0]R_Data_B;
reg [2:0]ALU_OP;
pc pc_connect(clk,rst,Inst_code);
Register_file R_connect(Inst_code[25:21],Inst_code[20:16],
                        Inst_code[15:11],write_reg,F,~clk,rst,
								R_Data_A,R_Data_B);
ALU ALU_connect(R_Data_A,R_Data_B,F,ALU_OP,ZF,OF);
always@(*)
begin
 write_reg=0;
 ALU_OP=0;
 if(Inst_code[31:26]==0)
 begin
  case(Inst_code[5:0])
  6'b100000:ALU_OP=3'b100;
  6'b100010:ALU_OP=3'b101;
  6'b100100:ALU_OP=3'b000;
  6'b100101:ALU_OP=3'b001;
  6'b100110:ALU_OP=3'b010;
  6'b100111:ALU_OP=3'b011;
  6'b101011:ALU_OP=3'b110;
  6'b000100:ALU_OP=3'b111;
  endcase
  write_reg=1;
  end
  end
  endmodule
  


