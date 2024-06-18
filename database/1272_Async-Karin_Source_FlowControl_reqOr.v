// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero 
//
// Create Date: 12/01/2019 09:53:37 PM
// Module Name: reqOr
// Description: When one of reqs has risen, it outputs a pulse of fin.
//              This module is always used to detect 
//              whether one of the connected modules have finished its operations or not.
//              reqNumber is the bit width of reqs.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module reqOr #(parameter reqNumber=2) (reqs,fin);
input [reqNumber-1:0] reqs;
output reg fin=1'b0;

reg [reqNumber-1:0] finBuf=0;
reg [reqNumber-1:0] zeros=0;
wire finAll;

assign finAll = (finBuf!=zeros);

always@(posedge finAll or posedge fin) begin
    if(fin) fin<=1'b0;
    else fin<=1'b1;
end

genvar i;
generate
for(i=0;i<reqNumber;i=i+1)
begin:ipp
always@(posedge reqs[i] or posedge fin) begin
    if(fin) finBuf[i]<=1'b0;
    else finBuf[i]<=1'b1;
end
end

endgenerate

endmodule
