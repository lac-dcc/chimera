// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/01/2019 09:39:05 PM
// Module Name: registerRight
// Description: Shift Register (Right)
//              When saveReq rises, in -> out. Then saveFin rises.
//              When rightReq rises, {0,out>>1} -> out. Then rightFin rises.
//              Width is the bit width of in and out.
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module registerRight #(parameter Width=32) (saveReq,saveFin,rightReq,rightFin,in,out);
input saveReq,rightReq;
output reg saveFin=1'b0, rightFin=1'b0;
input [Width-1:0] in;
output reg [Width-1:0] out=0;

reg rightReqBuf=1'b0,rightFinBuf=1'b0,saveReqBuf=1'b0,saveFinBuf=1'b0;
wire eventFin=rightFinBuf|saveFinBuf;

always@(posedge rightReq or posedge rightFinBuf) begin
    if(rightFinBuf) begin 
        rightReqBuf<=1'b0;
        rightFin<=1'b1;
    end
    else begin
        rightReqBuf<=1'b1;
        rightFin<=1'b0;
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

always@(posedge saveReqBuf or posedge rightReqBuf or posedge eventFin) begin
if(eventFin) begin
    saveFinBuf<=1'b0;
    rightFinBuf<=1'b0;
    out<=out;
end
else if(saveReqBuf) begin
    saveFinBuf<=1'b1;
    rightFinBuf<=1'b0;
    out<=in;
end
else if(rightReqBuf) begin
    rightFinBuf<=1'b1;
    saveFinBuf<=1'b0;
    out<={1'b0,out>>1};
end
else begin
    rightFinBuf<=1'b0;
    saveFinBuf<=1'b0;
    out<=out;
end
end

endmodule
