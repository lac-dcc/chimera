// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero 
//
// Create Date: 11/30/2019 04:51:46 PM
// Module Name: chooseFrom2
// Description: When the req rises, this module changes out to a or b according to sel, then raises fin.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module chooseFrom2 #(parameter N=32) (req,fin,a,b,out,sel);
input req;
input [N-1:0] a,b;
output reg [N-1:0] out=0;
output reg fin=1'b1;
input sel;
reg finBuf=1'b0;

always@(posedge req or posedge finBuf) begin
    if(finBuf) begin
        if(sel) out<=a;
        else out<=b;  
        fin<=1'b1;
        finBuf<=1'b0;
     end
     else begin
        finBuf<=1'b1;
        fin<=1'b0;
        out<=0;
     end
end


endmodule
