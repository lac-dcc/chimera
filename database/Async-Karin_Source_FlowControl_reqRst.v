// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero 
// 
// Create Date: 12/05/2019 10:11:15 PM
// Module Name: reqRst
// Description: This module is always used to hold the req signal 
//              when the parent module is doing operations or reseting. 
//              It will release the req signal after rst rises.
//              This module doesn't need to reset first and it can 
//              catch the first req signal successfully.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module reqRst (req,rst,fin);
input req,rst;
output wire fin;

reg reqBuf=1'b0;
reg rstBuf=1'b1;
assign fin=reqBuf&rstBuf;

always@(posedge req or posedge fin) begin
    if(fin) reqBuf<=1'b0;
    else reqBuf<=1'b1;
end

always@(posedge rst or posedge fin) begin
    if(fin) rstBuf<=1'b0;
    else rstBuf<=1'b1;
end

endmodule
