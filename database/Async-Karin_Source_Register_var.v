// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/01/2019 09:39:05 PM
// Module Name: var
// Description: A register with set and reset ports.
//              When saveReq rises,      dataIn -> dataOut. Then saveFin rises.
//              When rstReq rises, InitialValue -> dataOut. Then rstFin rises.
//              Width is the bit width of dataIn and dataOut.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module var #(parameter Width=32, parameter InitialValue=0) (saveReq,saveFin,rstReq,rstFin,dataIn,dataOut);
input saveReq,rstReq;
input [Width-1:0] dataIn;
output reg saveFin=1'b1,rstFin=1'b1;
output reg [Width-1:0] dataOut=InitialValue;

reg rstReqBuf=1'b0;
reg rstFinBuf=1'b0;
reg saveReqBuf=1'b0;
reg saveFinBuf=1'b0;
wire eventFin;
assign eventFin=rstFinBuf|saveFinBuf;

always@(posedge rstReq or posedge rstFinBuf) begin
    if(rstFinBuf) begin 
        rstReqBuf<=1'b0;
        rstFin<=1'b1;
    end
    else begin
        rstReqBuf<=1'b1;
        rstFin<=1'b0;
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

always@(posedge saveReqBuf or posedge rstReqBuf or posedge eventFin) begin
if(eventFin) begin
    saveFinBuf<=1'b0;
    rstFinBuf<=1'b0;
    dataOut<=dataOut;
end
else begin
if(rstReqBuf) begin
    rstFinBuf<=1'b1;
    saveFinBuf<=1'b0;
    dataOut<=InitialValue;
end
else if(saveReqBuf) begin
    saveFinBuf<=1'b1;
    rstFinBuf<=1'b0;
    dataOut<=dataIn;
end
else begin
    rstFinBuf<=rstFinBuf;
    saveFinBuf<=saveFinBuf;
    dataOut<=dataOut;
end
end
end

endmodule
