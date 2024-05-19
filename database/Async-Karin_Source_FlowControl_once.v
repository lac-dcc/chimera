// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/07/2019 04:25:50 PM
// Module Name: once
// Description: At first, fin follows req1. 
//              After req1 rises, the fin will always follow req2.
//              Only after rstReq rises, the fin will follow req1, then rstFin rises.
//              This module is usually used to jump into a loop.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module once (req1,req2,fin,rstReq,rstFin);
input req1,req2,rstReq;
output wire fin;
output wire rstFin;

reg first=1'b1;
reg rst=1'b0;
reg req1Buf=1'b0;

assign fin=(first&req1Buf)|(!first&req2);
assign rstFin=first;

always@(posedge req1 or posedge fin) begin
    if(fin) req1Buf<=1'b0;
    else req1Buf<=1'b1;
end

always@(posedge rstReq or posedge first) begin
    if(first) rst<=1'b0;
    else rst<=1'b1;
end

always@(posedge req1Buf or posedge rst) begin
    if(rst) first<=1'b1;
    else first<=1'b0;
end
    
endmodule
