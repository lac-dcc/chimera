// This program was cloned from: https://github.com/theuppercaseguy/FYP--Risc-V-32-bit-Matrix-Mac
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2023 10:26:02 PM
// Design Name: 
// Module Name: Slow_Clock
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


module Clock_slowed(
    input clk_100mhz, rst,
    output reg clk_1sec, reg clk_1msec, reg clk_25mhz 
    );
    
    reg [25:0] delay;
    always @ (posedge clk_100mhz or posedge rst)
     begin
      delay             <= delay + 1;
      if (rst == 0)
      begin
        delay           <= 0;
        clk_1sec        <= 0;
        clk_1msec       <= 0;
        clk_25mhz       <= 0;
      end
      else if(delay == 10000)
        clk_1msec           <= ~clk_1msec;        
      else if(delay == 12500000)
      begin
        clk_25mhz           <= ~clk_25mhz;  
      end
      else if(delay == 25'b1111111111111111111111111)
        clk_1sec            <= ~clk_1sec ;
     end
     
endmodule
