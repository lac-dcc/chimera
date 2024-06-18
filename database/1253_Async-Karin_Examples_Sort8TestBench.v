// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 11/30/2019 03:57:11 PM
// Module Name: Sort8TestBench
// Top Level: sort8
// Description: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Sort8TestBench();
reg req=1'b0;
wire fin;
reg [15:0] inputNumber[0:7];
wire [127:0] inputNumberLine;
wire [127:0] outputNumberLine;
wire [15:0] outputNumber[0:7];

initial begin
#10;
inputNumber[0] = $random;
inputNumber[1] = $random;
inputNumber[2] = $random;
inputNumber[3] = $random;
inputNumber[4] = $random;
inputNumber[5] = $random;
inputNumber[6] = $random;
inputNumber[7] = $random;
end

genvar i;
generate 
for(i=0;i<8;i=i+1)
begin
   assign inputNumberLine[16*i+15:i*16]=inputNumber[7-i];
   assign outputNumber[7-i]=outputNumberLine[16*i+15:i*16];
end
endgenerate 

initial begin
#400 req=1'b1;
end

sort8 #(32) sort8 (req,fin,inputNumberLine,outputNumberLine);

endmodule
