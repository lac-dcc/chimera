// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/03/2019 09:30:01 PM
// Module Name: var2
// Description: A register with two set ports.
//              When req1 rises, dataIn1 -> dataOut. Then fin1 rises.
//              When req2 rises, dataIn2 -> dataOut. Then fin2 rises.
//              Width is the bit width of dataIn1, dataIn2 and dataOut.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module var2 #(parameter Width=32, parameter InitialValue=0) (req1,req2,fin1,fin2,dataIn1,dataIn2,dataOut);
input req1,req2;
input [Width-1:0] dataIn1,dataIn2;
output reg fin1=1'b0,fin2=1'b0;
output reg [Width-1:0] dataOut=InitialValue;

reg req1Buf=1'b0;
reg fin1Buf=1'b0;
reg req2Buf=1'b0;
reg fin2Buf=1'b0;
wire eventFin;
assign eventFin=fin1Buf|fin2Buf;

always@(posedge req1 or posedge fin1Buf) begin
    if(fin1Buf) begin 
        req1Buf<=1'b0;
        fin1<=1'b1;
    end
    else begin
        req1Buf<=1'b1;
        fin1<=1'b0;
    end
end

always@(posedge req2 or posedge fin2Buf) begin
    if(fin2Buf) begin
        req2Buf<=1'b0;
        fin2<=1'b1;
    end
    else begin
        req2Buf<=1'b1;
        fin2<=1'b0;
    end
end

always@(posedge req2Buf or posedge req1Buf or posedge eventFin) begin
if(eventFin) begin
    fin2Buf<=1'b0;
    fin1Buf<=1'b0;
    dataOut<=dataOut;
end
else begin
if(req1Buf) begin
    fin1Buf<=1'b1;
    fin2Buf<=1'b0;
    dataOut<=dataIn1;
end
else if(req2Buf) begin
    fin2Buf<=1'b1;
    fin1Buf<=1'b0;
    dataOut<=dataIn2;
end
else begin
    fin1Buf<=fin1Buf;
    fin2Buf<=fin2Buf;
    dataOut<=dataOut;
end
end
end

endmodule

