`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/11/13 18:50:14
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,
    input Reset,
    input PCWre,
    input [31:0] nextIAddr,
    output reg [31:0] currentIAddr
    );
    
    initial currentIAddr <= 0;
    
    always @(posedge clk or negedge Reset) begin
        if(Reset == 0) currentIAddr <= 0;
        else begin
            if(PCWre == 1) currentIAddr <= nextIAddr;
            else currentIAddr <= currentIAddr;
        end
    end
endmodule
