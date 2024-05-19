// This program was cloned from: https://github.com/mbaykenar/digital-logic-design
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2022 10:48:31 PM
// Design Name: 
// Module Name: soru2
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


module soru2 #(parameter c_clkfreq = 100000000) 
(
input clk, 
input rst, 
input [9:0] start_pos_i,
input [9:0] dest_pos_i, 
input [7:0] start_vel_i, 
input [7:0] vel_i,
output reg reached_o, 
output reg [9:0] pos_o,
output reg [15:0] dest_reach_second_o
);

reg [$clog2(c_clkfreq)-1:0] timer_clk;
reg [15:0] timer_second;
reg timertick;

reg [9:0] start_pos;
reg [9:0] dest_pos;
reg [7:0] start_vel; 
reg [7:0] vel;

always@(posedge clk, posedge rst) begin
    if (rst) begin
        timertick       <= 0;
        timer_second    <= 0;
        timer_clk       <= 0;
    end
    else begin
        if (timer_clk == c_clkfreq-1) begin
            timertick       <= 1'b1;
            timer_clk       <= 0;
            timer_second    <= timer_second + 1;
        end
        else begin
            timertick       <= 1'b0;
            timer_clk       <= timer_clk + 1;
        end
    end
end

always@(posedge clk, posedge rst) begin
    if (rst) begin
        start_pos           <= start_pos_i;
        dest_pos            <= dest_pos_i;
        start_vel           <= start_vel_i;
        reached_o           <= 1'b0;
        pos_o               <= start_pos_i;
        dest_reach_second_o <= 0;
        vel                 <= 0;
    end
    else begin
        if (timertick == 1'b1) begin
            vel <= vel_i;
            if (timer_second == 1) begin
                pos_o   <= start_pos + start_vel;
            end
            else begin
                pos_o   <= pos_o + vel;
            end
        end
        if ((pos_o >= dest_pos) && (reached_o == 1'b0)) begin
            reached_o           <= 1'b1;
            dest_reach_second_o <= timer_second;
        end
    end
end

endmodule