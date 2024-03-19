`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:47 05/16/2018 
// Design Name: 
// Module Name:    ALU 
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
module ALU(A,B,F,ALU_OP,ZF,OF);
input [31:0]A,B;
input [2:0]ALU_OP;
output reg ZF,OF;
output reg[31:0]F;
reg C32;
always@(*)
begin
 OF=1'b0;
 C32=1'b0;
 case(ALU_OP)
 3'b000:F=A&B;
 3'b001:F=A|B;
 3'b010:F=A^B;
 3'b011:F=~(A^B);
 3'b100:begin {C32,F}=A+B;OF=A[31]^B[31]^F[31]^C32;end
 3'b101:begin {C32,F}=A-B;OF=A[31]^B[31]^F[31]^C32;end
 3'b110:
 if(A<B)
   F=1;
 else
   F=0;
 3'b111:F=B<<A;
 endcase
 if(F==0)
  ZF=1;
 else
  ZF=0;
 end
 endmodule
 

