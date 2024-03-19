`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:33 05/16/2018 
// Design Name: 
// Module Name:    Top_LED 
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
module Top_LED(clk,rst,SW,LED);
input clk,rst;
input [2:0]SW;
output reg[7:0]LED;
wire ZF,OF;
wire [31:0]ALU_F;
top_R_cpu test_cpu(rst,clk,ZF,OF,ALU_F);
always@(*)
begin
case(SW)
3'b000:LED=ALU_F[7:0];
3'b001:LED=ALU_F[15:8];
3'b010:LED=ALU_F[23:16];
3'b011:LED=ALU_F[31:24];
3'b100:begin LED[7:2]=0;LED[1]=OF;LED[0]=ZF;end
default:LED=0;
endcase
end
endmodule

