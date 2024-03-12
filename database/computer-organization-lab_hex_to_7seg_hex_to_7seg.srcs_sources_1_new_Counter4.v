`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/15 14:03:28
// Design Name: 
// Module Name: Counter4
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


module Counter4(
    input clk,
    input reset,
    output reg [1:0] count
    );
    
    always @(posedge clk or posedge reset) begin
        if(reset == 1) count <= 0;
        else begin
            if(count == 2'b11) count <= 0;
            else count <= count + 1;
        end
    end
    
endmodule
