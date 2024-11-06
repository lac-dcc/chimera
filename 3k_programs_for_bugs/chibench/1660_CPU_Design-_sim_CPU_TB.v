// This program was cloned from: https://github.com/mmohamedkhaled/CPU_Design-
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 09:08:10 AM
// Design Name: 
// Module Name: CPU_TB
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


module CPU_TB();
reg clk, rst;
wire [7:0] z;
CPU DUT(clk, rst, z);
initial begin
     clk = 1;
     forever #25 clk=~clk;
end
initial begin
rst=1;
#50
rst=0;
end
endmodule
