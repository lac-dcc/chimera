`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:08:52 06/02/2018 
// Design Name: 
// Module Name:    TOP_LED 
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
module TOP_LED(clk_100MHz,oclk,rst,SW,LED);
input clk_100MHz;
input oclk,rst;
input [3:0]SW;
output reg[7:0]LED;
wire rclk;
wire ZF,OF;
wire [31:0]F;
wire [31:0]M_R_Data;
wire [31:0]PC;
xiaodou doudong(clk_100MHz,oclk,rclk);

TOP_RIJ_CPU(rst,clk_100MHz,rclk,ZF,OF,F,M_R_Data,PC);

always@(*)
begin
case(SW)
4'b0000:LED=F[7:0];
4'b0001:LED=F[15:8];
4'b0010:LED=F[23:16];
4'b0011:LED=F[31:24];
4'b0100:LED=M_R_Data[7:0];
4'b0101:LED=M_R_Data[15:8];
4'b0110:LED=M_R_Data[23:16];
4'b0111:LED=M_R_Data[31:24];
4'b1000:begin LED[7:2]=0;LED[1]=OF;LED[0]=ZF;end
4'b1100:LED=PC[7:0];
4'b1101:LED=PC[15:8];
4'b1110:LED=PC[23:16];
4'b1111:LED=PC[31:24];

default:LED=0;
endcase
end
endmodule

