// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 01/13/2020 05:30:10 PM
// Module Name: traversal
// Description: traversal an array
//              output each bit when reqDo rises.
//              It works like:
//                  req -> doFin -> reqDo -> doFin -> reqDo -> doFin -> reqDo -> fin
//                 
//              (DO NOT USE IT, because it's being tested.)
//
// Dependencies: registerRight, registerLeft, counter
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module traversal #(parameter Width=32,parameter Direction=0) (req,reqDo,fin,doFin,dataIn,dataOut);
input req,reqDo;
input [Width-1:0] dataIn;
output wire fin,doFin;
output wire dataOut;

reg [Width-2:0] zeros=0;
wire rightFin,right;
wire loadFin,registerDoFin;
wire [Width-1:0] array;
wire continue,finish,continue2;

generate
    if(Direction==0) begin: high2Low
        assign dataOut=array[Width-1];
        registerLeft #(Width) controlLeft (req,loadFin,reqDo,registerDoFin,dataIn,array);
    end
    else begin: low2High
        assign dataOut=array[0];
        registerRight #(Width) controlRight (req,loadFin,reqDo,registerDoFin,dataIn,array);
    end
endgenerate

counter #(Width) counter (reqDo,rightFin,right);
//registerRight #(Width) control (req,,reqDo,rightFin,{1'b1,zeros},right);

branch branch (rightFin,finish,continue,right);

reqDoor #(2) reqDoor (registerDoFin,{continue,finish},{continue2,fin});

once once (loadFin,continue2,doFin,fin,);

//reqOr #(2) reqOr ({loadFin,continue2},doFin);

endmodule