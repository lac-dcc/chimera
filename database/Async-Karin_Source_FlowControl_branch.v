// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero 
//
// Create Date: 11/30/2019 04:51:46 PM
// Module Name: branch
// Description: It works like 'if'. finTrue  = req & boolIn,
//                                  finFalse = req & !boolIn.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module branch (req,finTrue,finFalse,boolIn);

input req,boolIn;
output wire finTrue,finFalse;

assign finTrue=req&boolIn;
assign finFalse=req&!boolIn;

endmodule

