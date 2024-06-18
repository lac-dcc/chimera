// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
// 
// Create Date: 12/10/2019 01:52:54 PM
// Module Name: addTest
// Description: The testbench to test the speed of SYNC add and ASYNC add.
// 
// Dependencies: add
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module addTest(
    input clk,
    input req_in,
    output fin,
    input [31:0] a_in,
    input [31:0] b_in,
    output wire [31:0] s1,
    output wire cout1,
    output wire [31:0] s2,
    output wire cout2
    );
    reg req=1'b0;
    reg [31:0] a=0,b=0;
    always@(posedge clk) begin
        if(req_in) begin
            req<=1'b1;
            a<=a_in;
            b<=b_in;
        end
    end
    
    assign {cout1,s1}=a+b;
    add #(32) add (req,fin,a,b,s2,cout2);
       
endmodule
