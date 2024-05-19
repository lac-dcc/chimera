// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero 
//
// Create Date: 11/30/2019 04:51:46 PM
// Module Name: reqAndSimple
//
// Description: Not recommended to use.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module reqAndSimple #(parameter reqNumber=3) (reqs,fin);
input [reqNumber-1:0] reqs;
output wire fin;

wire [reqNumber:0] reqsConnect;
assign reqsConnect[0]=reqs[0];
assign fin=reqsConnect[reqNumber];

genvar i;
generate
for(i=0;i<reqNumber;i=i+1)
begin:reqTogetherSimple
    assign reqsConnect[i+1]=reqsConnect[i]&reqs[i];
end
endgenerate



endmodule
