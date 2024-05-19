// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero 
//
// Create Date: 12/02/2019 10:31:20 PM
// Module Name: MUX2
// Description: When req1 rises, in1 -> out.
//              When req2 rises, in2 -> out.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: not recommended to use, because it doesn't have a feedback signal,
//                      which may cause error.
// 
//////////////////////////////////////////////////////////////////////////////////


module MUX2 #(parameter Width=32,parameter defaultValue=0) (req1,req2,in1,in2,out);
input req1,req2;
input [Width-1:0] in1,in2;
output wire [Width-1:0] out;
wire req;
wire sel;
reg sel1=1'b0,sel2=defaultValue;  // 0:choose in1, 1:choose in2

assign out=sel?in1:in2;
assign sel=(sel1==sel2);

always@(posedge req1) sel1<=sel2;
always@(posedge req2) sel2<=~sel1;

endmodule
