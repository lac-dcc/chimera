`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: Computer Engineering Department, Chulalongkorn University
// Engineer: Pollawat Hongwimol
// 
// Create Date: 04/11/2020 10:56:01 PM
// Design Name: 
// Module Name: vsync
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


module vsync(
    input clk,
    input line_clk,
    output reg [15:0] v_val = 0
    );
    
    always @(posedge line_clk)
    begin
        if (v_val == 525) v_val = 0;
        else v_val = v_val + 1;
    end
endmodule
