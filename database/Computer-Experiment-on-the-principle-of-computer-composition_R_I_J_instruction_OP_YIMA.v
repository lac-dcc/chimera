`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:09:42 06/01/2018 
// Design Name: 
// Module Name:    OP_YIMA 
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
module OP_YIMA(inst,ALU_OP,rs,rt,rd,Write_Reg,
imm,imm_s,rt_imm_s,Mem_Write,address,w_r_s,wr_data_s,PC_s,ZF);
input [31:0]inst;
output reg[2:0]ALU_OP;
output reg[4:0]rs;
output reg[4:0]rt;
output reg[4:0]rd;
output reg Write_Reg;
output reg[15:0]imm;
//output reg rd_rt_s;
output reg imm_s;
output reg rt_imm_s;
output reg Mem_Write;
output reg [25:0]address;
output reg[1:0] w_r_s;
output reg[1:0] wr_data_s;
output reg[1:0] PC_s;
input ZF;
always@(*)
begin
//----------处理R型指令----------
if(inst[31:26]==6'b000000)
begin
 rd=inst[15:11];
 rt=inst[20:16];
 rs=inst[25:21];
 //alu_mem_s=0;
 wr_data_s=2'b00;
 Mem_Write=0;
 //rd_rt_s=0;
 w_r_s=2'b00;
 rt_imm_s=0;
case(inst[5:0])
6'b100000:begin ALU_OP=3'b100;Write_Reg=1;PC_s=2'b00;end
6'b100010:begin ALU_OP=3'b101;Write_Reg=1;PC_s=2'b00;end
6'b100100:begin ALU_OP=3'b000;Write_Reg=1;PC_s=2'b00;end
6'b100101:begin ALU_OP=3'b001;Write_Reg=1;PC_s=2'b00;end
6'b100110:begin ALU_OP=3'b010;Write_Reg=1;PC_s=2'b00;end
6'b100111:begin ALU_OP=3'b011;Write_Reg=1;PC_s=2'b00;end
6'b101011:begin ALU_OP=3'b110;Write_Reg=1;PC_s=2'b00;end
6'b000100:begin ALU_OP=3'b111;Write_Reg=1;PC_s=2'b00;end
6'b001000:begin ALU_OP=3'b100;Write_Reg=0;PC_s=2'b01;end
endcase
end
//---------I型立即数寻址指令-------
if(inst[31:29]==3'b001)
begin
imm=inst[15:0];
rt=inst[20:16];
rs=inst[25:21];
Mem_Write=0;
//rd_rt_s=1;
rt_imm_s=1;
//alu_mem_s=0;
w_r_s=2'b01;
Write_Reg=1;
wr_data_s=2'b00;
case(inst[31:26])
6'b001000:begin imm_s=1;ALU_OP=3'b100;end
6'b001100:begin imm_s=0;ALU_OP=3'b000;end
6'b001110:begin imm_s=0;ALU_OP=3'b010;end
6'b001011:begin imm_s=0;ALU_OP=3'b110;end
endcase
end
//--------处理I型取数/存数指令------
if((inst[31:30]==2'b10)&&(inst[28:26]==3'b011))
begin
imm=inst[15:0];
rt=inst[20:16];//rt寄存器
rs=inst[25:21];//rs寄存器
//rd_rt_s=1;//rt作为目的存储器
rt_imm_s=1;//imm作为源操作数
imm_s=1;
w_r_s=2'b01;
wr_data_s=2'b01;
PC_s=2'b00;
case(inst[31:26])
6'b100011:begin Mem_Write=0; Write_Reg=1;ALU_OP=3'b100;end
6'b101011:begin Mem_Write=1; Write_Reg=0;ALU_OP=3'b100;end
endcase
end
//-----------处理I型跳转指令---------
if(inst[31:27]==5'b00010)
begin
 imm=inst[15:0];
 rt=inst[20:16];//rt
 rs=inst[25:21];//rs
 case(inst[31:26])
 6'b000100:begin rt_imm_s=0;ALU_OP=3'b101;Write_Reg=0;Mem_Write=0;
 PC_s=(ZF?2'b10:2'b00);end
 6'b000101:begin rt_imm_s=0;ALU_OP=3'b101;Write_Reg=0;Mem_Write=0;
 PC_s=(ZF?2'b00:2'b10);end
 endcase
 end
 //----------处理J型跳转指令----------
 if(inst[31:27]==5'b00001)
 begin
 address=inst[25:0];
 case(inst[31:26])
 6'b000010:begin w_r_s=2'b00;Write_Reg=0;Mem_Write=0;PC_s=2'b11;end
 6'b000011:begin w_r_s=2'b10;wr_data_s=2'b10;Write_Reg=1;Mem_Write=0;PC_s=2'b11;end
 endcase
 end
 end
endmodule

