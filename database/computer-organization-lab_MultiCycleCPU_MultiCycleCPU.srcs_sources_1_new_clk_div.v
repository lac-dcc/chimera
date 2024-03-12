`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/18 20:46:27
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input clk,
    output reg clk_sys = 0
    );
    
    reg [25:0] div_counter = 0;
    always @(posedge clk) begin
        if(div_counter >= 50000) begin
            clk_sys <= ~clk_sys;
            div_counter <= 0;
        end
        else div_counter <= div_counter + 1;
    end
    
endmodule
