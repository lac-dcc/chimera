// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2023 05:20:54 AM
// Design Name: 
// Module Name: Debouncer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Debounce_Project_Top
  (input  i_Clk,
   input  i_Switch_1,
   output reg led
   );
    wire clk;             
  // Instantiate Debounce Module
  Debounce_Switch Debounce_Inst
  (.i_Clk(i_Clk), 
   .i_Switch(i_Switch_1),
   .o_Switch(clk));


   always@(posedge clk)begin
         led = ~led;
   end
 
endmodule


