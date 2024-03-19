`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:10:45 06/09/2018 
// Design Name: 
// Module Name:    OP 
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
module OP(A,B,F,ZF,OF,ALU_OP);
input[31:0] A,B;
output[31:0] F;
input[2:0] ALU_OP;
output ZF,OF;
reg[31:0] F;
reg ZF,OF;
reg[5:0] i;
reg[32:0] CF;
reg C;

always@(ALU_OP or A or B)
begin
case(ALU_OP)
3'b000:begin CF=A&B; end
3'b001:begin CF=A|B; end
3'b010:begin CF=A^B; end
3'b011:begin CF=A~^B; end
3'b100:begin CF=A+B; end
3'b101:begin CF=A-B; end
3'b110:begin CF=(A<B); end
3'b111:begin CF=B<<A; end
endcase

F[31:0]=CF[31:0];
C=CF[32];
ZF=0;
for(i=0;i<32;i=i+1)
     ZF=ZF|F[i];
ZF=~ZF;
OF=A[31]^B[31]^F[31]^C;
end
endmodule


