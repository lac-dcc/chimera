// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero 
//
// Create Date: 11/30/2019 04:51:46 PM
// Module Name: reqAnd
// Description: When all reqs have risen, it outputs a pulse of fin.
//              This module is always used to detect 
//              whether all the connected modules have finished their operations or not.
//              reqNumber is the bit width of reqs.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module reqAnd #(parameter reqNumber=2) (reqs,fin);
input [reqNumber-1:0] reqs;
output wire fin;

reg [reqNumber-1:0] reqsSave=0;
reg [reqNumber-1:0] zeros=0;

assign fin=(reqsSave==~zeros);

genvar i;
generate
for(i=0;i<reqNumber;i=i+1)
begin:reqTogether
    always@(posedge reqs[i] or posedge fin) begin
        if(fin) reqsSave[i]<=1'b0;
        else reqsSave[i]<=1'b1;
    end 
end
endgenerate 


endmodule
