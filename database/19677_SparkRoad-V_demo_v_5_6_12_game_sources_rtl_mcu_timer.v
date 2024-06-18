// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:
// Design Name: 
// Module Name: timer
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

module timer
(
    input   wire		clk,
    
    // timer set
    input   wire		timer_wen,
    input   wire [23:0]	timer_wdata,
    
    output  reg			timer_state
);

reg [23:0] cnt;

// 定时器计时
always@(posedge clk)
begin
    if(timer_wen)
        cnt <= timer_wdata;
    else if(cnt != 0)
        cnt <= cnt - 1;
end

// 定时器状态
always@(posedge clk)
begin
    timer_state <= (cnt == 0);
end

endmodule
