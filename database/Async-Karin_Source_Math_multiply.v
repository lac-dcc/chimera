// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/01/2019 08:28:53 PM
// Module Name: multiply
// Description: When req rises. x*y -> result. Then fin rises.
//
//              Width is the bit width of x and y.
//              2*Width is the bit width of result.
// 
// Dependencies: registerRight, registerLeft,reqOr, branch, add, var, once
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module multiply #(parameter Width=32) (req,fin,x,y,result);
input req;
output wire fin;
input [Width-1:0] x,y;
output wire [2*Width-1:0] result;

wire [Width-1:0] xOut;
wire [2*Width-1:0] yOut;
wire [Width:0] iOut;
wire xSaveFin;
wire onceReq2,onceFin;
wire reqOrFin;
wire branchOnce0,branchOnce1;
wire saveResultFin,saveResultReq;
wire [2*Width-1:0] resultIn;
wire finishBranchReq;

registerRight #(Width)  registerX (req,xSaveFin,reqOrFin,,x,xOut);
registerLeft #(2*Width) registerY (req,,reqOrFin,,y,yOut);
registerLeft #(Width+1) registerI (req,,reqOrFin,finishBranchReq,1,iOut);
reqOr #(2) or2 ({branchOnce0,saveResultFin},reqOrFin);
branch branchOnce (onceFin,branchOnce1,branchOnce0,xOut[0]);
add #(2*Width) addResult  (branchOnce1,saveResultReq,result,yOut,resultIn,);
var #(2*Width,0) resultVar(saveResultReq,saveResultFin,req,,resultIn,result);
once once (xSaveFin,onceReq2,onceFin,fin,);
branch finishBranch (finishBranchReq,fin,onceReq2,iOut[Width]);

endmodule
