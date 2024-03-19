`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:15:58 05/16/2018 
// Design Name: 
// Module Name:    top 
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
module top(input clk,input rst,input [1:0]C,output reg[7:0]LED);
wire [31:0]Inst_code;
pc pc_test(clk,rst,Inst_code);
always@(*)
begin
  case(C)
  2'b00:LED=Inst_code[7:0];
  2'b01:LED=Inst_code[15:8];
  2'b10:LED=Inst_code[23:16];
  2'b11:LED=Inst_code[31:24];
endcase
end
endmodule

