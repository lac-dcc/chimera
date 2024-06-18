// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero 
//
// Create Date: 11/30/2019 04:51:46 PM
// Module Name: compareSwap
// Description: When req rises, smaller(a,b) -> smaller 
//                               bigger(a,b) -> bigger.  Then fin rises.
//              Width is the bit width of a, b, smaller and bigger.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module compareSwap #(parameter Width=32) (req,fin,a,b,smaller,bigger);

input [Width-1:0] a,b;
output wire [Width-1:0] smaller,bigger;
input req;
output wire fin;
wire compareFin,biggerSign,equalSign,smallerSign;
wire biggerFin,smallerFin;

comparator  #(Width) comparator (req,compareFin,a,b,biggerSign,equalSign,smallerSign);
chooseFrom2 #(Width) chooseSmaller (compareFin,smallerFin,a,b,smaller,smallerSign);
chooseFrom2 #(Width) chooseBigger  (compareFin,biggerFin,b,a,bigger,smallerSign);
reqAnd      #(2) finAnd ({smallerFin,biggerFin},fin);

endmodule
