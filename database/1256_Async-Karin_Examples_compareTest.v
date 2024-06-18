// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 01/10/2020 03:21:00 PM
// Module Name: addTest
// Description: The testbench to test the speed of SYNC add and ASYNC compare.
// 
// Dependencies: comparator
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module compareTest(
    input clk,
    input [31:0] a_in,
    input [31:0] b_in,
    input req_in,
    output wire fin,
    output wire [2:0] resultNormal,
    output wire [2:0] resultKarin
    );
    reg req=1'b0;
    reg [31:0] a=0;
    reg [31:0] b=0;
    always@(posedge clk) begin
        if(req_in) begin
            req<=1'b1;
            a<=a_in;
            b<=b_in;
        end
    end
    assign resultNormal[2] = a>b;
    assign resultNormal[1] = a==b;
    assign resultNormal[0] = a<b;
    comparator #(32) comparator (req,fin,a,b,resultKarin[2],resultKarin[1],resultKarin[0]);
endmodule
