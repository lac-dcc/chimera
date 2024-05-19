// This program was cloned from: https://github.com/tongplw/HW-Syn-Lab
// License: MIT License

`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Computer Engineering Department, Chulalongkorn University
// Engineer: Pollawat Hongwimol
// 
// Create Date: 04/11/2020 10:55:48 PM
// Design Name: 
// Module Name: hsync
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


module hsync(
    input clk,
    output reg line_clk = 0,
    output reg [15:0] h_val = 0
    );
    
    always @(posedge clk)
    begin
        if (h_val == 800) begin h_val = 0; line_clk = 1; end
        else begin h_val = h_val + 1; line_clk = 0; end
    end
endmodule
