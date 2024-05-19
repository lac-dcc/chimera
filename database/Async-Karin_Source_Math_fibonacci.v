// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/02/2019 10:06:19 PM 
// Module Name: fibonacci
// Description: When req rises, fibonacci(N) -> result. Then fin rises.
//              Width is the bit width of N and result.
//              N must >= 3. fibonacci sequence starts numbering from 0.
//
// Dependencies: var, once, add, equalOrNot
// 
// Revision:
// Revision 0.01 - File Created
// Revision 0.02 - Faster
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module fibonacci #(parameter Width=32) (req,fin,N,result);
input req;
input [Width-1:0] N;
output wire fin;
output wire [Width-1:0] result;

wire [Width-1:0] i,a,b,cCal,iCal;
reg [Width-1:0] one=1;
wire onceFin,ABCFin,iFin,equalFin;
wire saveFin,saveRst;
wire branchFalse,branchTrue;
wire onceRstReq,onceRstFin;
wire resultRstFin,addFin;
assign onceRstReq=fin;

var #(Width,0) resultSaver (branchTrue,fin,1'b0,resultRstFin,cCal,result);
var #(Width,1) A (ABCFin,,onceRstFin,,b,a);
var #(Width,1) B (ABCFin,,onceRstFin,,cCal,b);
var #(Width,2) I (iFin,,onceRstFin,,iCal,i);

once                 oncef   (req,branchFalse,onceFin,onceRstReq,onceRstFin);
add        #(Width)  addABC  (onceFin,ABCFin,a,b,cCal,);
add        #(Width)  addi    (onceFin,iFin,i,one,iCal,);
equalOrNot #(Width)  equalOr (iFin,equalFin,branchTrue,branchFalse,i,N);

endmodule