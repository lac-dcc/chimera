`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:35:58 06/01/2018 
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
xiaodou doudong(clk_100MHz,oclk,rclk);
TOP_RI_CPU(clk_100MHz,rst,rclk,ZF,OF,F,M_R_Data);
always@(*)
begin
case(SW)
3'b0000:LED=F[7:0];
3'b0001:LED=F[15:8];
3'b0010:LED=F[23:16];
3'b0011:LED=F[31:24];
3'b0100:LED=M_R_Data[7:0];
3'b0101:LED=M_R_Data[15:8];
3'b0110:LED=M_R_Data[23:16];
3'b0111:LED=M_R_Data[31:24];
3'b1111:begin LED[7:2]=0;LED[1]=OF;LED[0]=ZF;end
default:LED=0;
endcase
end
endmodule


