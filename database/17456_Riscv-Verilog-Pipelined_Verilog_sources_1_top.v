// This program was cloned from: https://github.com/Helazhary/Riscv-Verilog-Pipelined
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2024 12:59:23 PM
// Design Name: 
// Module Name: top
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


module top (input clk, rst,SSD_clk, input [1:0] led_sel, input[3:0]SSD_sel, output [15:0] LED, output [3:0] Anode,
    output  [6:0] SEG);
    
    wire [12:0]ssd;
    DataPath dp(.clk(clk), .rst(rst), .led_sel(led_sel),.SSD_sel(SSD_sel), .LED(LED) ,.ssd(ssd));
    
    
    Four_Digit_Seven_Segment_Driver_Optimized  FDSSDO(  .clk(SSD_clk), .num(ssd), .Anode(Anode), .LED_out(SEG));
    
    
endmodule
