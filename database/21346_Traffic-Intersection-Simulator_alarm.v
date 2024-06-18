// This program was cloned from: https://github.com/thefranciscoflores/Traffic-Intersection-Simulator
// License: GNU General Public License v2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2024 12:49:26 PM
// Design Name: 
// Module Name: alarm
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


module alarm(input [5:0] number,
output reg [19:0] note,//what is the max frequency
output reg [4:0] duration);

parameter QUARTER = 5'b00010;
parameter HALF = 5'b00100;
parameter ONE = 2* HALF;
parameter TWO = 2* ONE;
parameter FOUR = 2* TWO;
parameter C4=382226, D4=340524, E4 = 303373, F4=286346, G4 = 255105,C5 = 191113, SP = 1;
always @ (number) begin
    case(number) //Row Row Row your boat
        0: begin note = C5; duration = HALF; end 
        1: begin note = SP; duration = HALF; end 
        2: begin note = C5; duration = HALF; end 
        3: begin note = SP; duration = HALF; end 
        4: begin note = C5; duration = HALF; end 
        5: begin note = SP; duration = HALF; end 
        6: begin note = C5; duration = HALF; end 
        7: begin note = SP; duration = HALF; end 
        8: begin note = C5; duration = HALF; end 
        9: begin note = SP; duration = HALF; end 
        10: begin note = C5; duration = HALF; end 
        11: begin note = SP; duration = HALF; end 
        12: begin note = C5; duration = HALF; end 
        13: begin note = SP; duration = HALF; end 
        14: begin note = C5; duration = HALF; end 
        15: begin note = SP; duration = HALF; end 
        16: begin note = C5; duration = HALF; end 
        17: begin note = SP; duration = HALF; end 
        18: begin note = C5; duration = HALF; end 
        19: begin note = SP; duration = HALF; end 
        default: begin note = SP; duration = FOUR; end
    endcase
end






endmodule

