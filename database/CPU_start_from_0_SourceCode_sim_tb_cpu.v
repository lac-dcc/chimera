`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/30 22:51:59
// Design Name: 
// Module Name: tb_cpu
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


module tb_cpu(

    );

reg Clock = 0;
always #10 Clock = ~Clock;

reg [9:0] DataIn = 10;
always #500 DataIn = DataIn + 3;

wire [9:0] DataOut;


CPU inst(
    .Clock(Clock),
    .DataIn(DataIn),
    .DataOut(DataOut)
);


endmodule
