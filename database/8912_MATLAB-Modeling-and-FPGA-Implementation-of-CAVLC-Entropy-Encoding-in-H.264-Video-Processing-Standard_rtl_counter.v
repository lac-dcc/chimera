// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2024 02:29:07 PM
// Design Name: 
// Module Name: counter
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


module counter (
    input clk,      // Clock input
    input rst,    // rst signal
    input en,       // Enable signal
    
    output reg [3:0] count // 4-bit counter output
);

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            count <= 4'b0000; // rstet the counter to 0
        end 
        else if (en) begin
            count <= count + 1; // Increment the counter only when enable is asserted
        end
    end

endmodule

