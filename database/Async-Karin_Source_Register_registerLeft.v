// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/01/2019 09:39:05 PM
// Module Name: registerLeft
// Description: Shift Register (Left)
//              When saveReq rises, in -> out. Then saveFin rises.
//              When leftReq rises, {out<<1,0} -> out. Then leftFin rises.
//              Width is the bit width of in and out.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module registerLeft #(parameter Width=32) (saveReq,saveFin,leftReq,leftFin,in,out);
input saveReq,leftReq;
output reg saveFin=1'b0, leftFin=1'b0;
input [Width-1:0] in;
output reg [Width-1:0] out=0;

reg leftReqBuf=1'b0,leftFinBuf=1'b0,saveReqBuf=1'b0,saveFinBuf=1'b0;
wire eventFin=leftFinBuf|saveFinBuf;

always@(posedge leftReq or posedge leftFinBuf) begin
    if(leftFinBuf) begin 
        leftReqBuf<=1'b0;
        leftFin<=1'b1;
    end
    else begin
        leftReqBuf<=1'b1;
        leftFin<=1'b0;
    end
end

always@(posedge saveReq or posedge saveFinBuf) begin
    if(saveFinBuf) begin
        saveReqBuf<=1'b0;
        saveFin<=1'b1;
    end
    else begin
        saveReqBuf<=1'b1;
        saveFin<=1'b0;
    end
end

always@(posedge saveReqBuf or posedge leftReqBuf or posedge eventFin) begin
if(eventFin) begin
    saveFinBuf<=1'b0;
    leftFinBuf<=1'b0;
    out<=out;
end
else if(saveReqBuf) begin
    saveFinBuf<=1'b1;
    leftFinBuf<=1'b0;
    out<=in;
end
else if(leftReqBuf) begin
    leftFinBuf<=1'b1;
    saveFinBuf<=1'b0;
    out<={out<<1,1'b0};
end
else begin
    leftFinBuf<=1'b0;
    saveFinBuf<=1'b0;
    out<=out;
end
end

endmodule
