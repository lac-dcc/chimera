// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
//
// Create Date: 01/13/2020 03:53:02 PM
// Module Name: delay
// Description: The key to the new structure. 
//				It can delay  a "DFF time".
//
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module delayOne(req,fin);
input req;
(* dont_touch="true" *) output reg fin=1'b0;
// (* dont_touch="true" *) makes it work on Xilinx platform. 

always@(posedge req or posedge fin) begin
    if(fin) fin<=1'b0;
    else fin<=1'b1;
end

endmodule
