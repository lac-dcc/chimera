// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/02/2019 10:06:19 PM
// Module Name: divide
// Description: When req rises, a/b -> s,
//                       mod of a/b -> mod. Then fin rises.
//
//              AWidth is the bit width of a. 
//              BWidth is the bit width of b.
//              The bit width of s is AWidth.
//              The bit width of mod is BWidth.
//
// Dependencies: var, var2, registerRight, once, comparator, minus, reqAnd, reqOr
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module divide #(parameter AWidth=32,parameter BWidth=32) (req,fin,a,b,s,mod);
input req;
input [AWidth-1:0] a;
input [BWidth-1:0] b;
output wire [AWidth-1:0] s;
output wire [BWidth-1:0] mod;
output wire fin;

reg [AWidth:0] zeros2=0;
reg [AWidth-1:0] zeros=0;
reg [BWidth-1:0] zerosM=0;
wire [AWidth+1:0] right;
wire [AWidth-1:0] rightOrs,aOut,aMinus;
wire [AWidth+BWidth-1:0] bOut;
wire onceLeftRightReq2,onceLeftRightRstFin,aFin,orFin,rightFin,req2,minusFin;
wire compareFin,compareReq,smaller,bigger,equal,branchBigger,branchSmaller;

assign mod=aOut[BWidth-1:0];
assign branchSmaller = compareFin&(smaller);
assign branchBigger  = compareFin&(bigger|equal);

var  #(AWidth,0) sVar (branchBigger,, req,    ,rightOrs,s);
var2 #(AWidth,0) aVar (minusFin, req,aFin,req2,aMinus,a,aOut);

registerRight #(AWidth+2)     control (req,,orFin,rightFin,{1'b1,zeros2},right);
registerRight #(AWidth+BWidth) bRight (req,,orFin,        ,{b,zeros}    ,bOut);

once onceLeftRight (req2,onceLeftRightReq2,compareReq,fin,onceLeftRightRstFin);
comparator #(AWidth+BWidth) comparatorAB (compareReq,compareFin,{zerosM,aOut},bOut,bigger,equal,smaller);
minus #(AWidth) minus (branchBigger,minusFin,aOut,bOut[AWidth-1:0],aMinus,);
branch branchFinish (rightFin,fin,onceLeftRightReq2,right[0]);
reqOr #(2) reqOr ({branchSmaller,aFin},orFin);

genvar i;
generate
for(i=0;i<AWidth;i=i+1)
begin:rights
    assign rightOrs[i]=s[i]|right[i+1];
end
endgenerate

endmodule