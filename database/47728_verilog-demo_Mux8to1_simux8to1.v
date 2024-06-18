// This program was cloned from: https://github.com/DingWH03/verilog-demo
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/23 14:39:36
// Design Name: 
// Module Name: simux8to1
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

// mux8to1_tb.v
`timescale 1ns/1ns

module mux8to1_tb;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Inputs
    reg i0, i1, i2, i3, i4, i5, i6, i7;
    reg s0, s1, s2;
    reg clk;

    // Outputs
    wire o;

    // Instantiate the mux8to1 module
    mux8to1 uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .i4(i4),
        .i5(i5),
        .i6(i6),
        .i7(i7),
        .s0(s0),
        .s1(s1),
        .s2(s2),
        .o(o)
    );

    // Clock generation
    always #((CLK_PERIOD)/2) clk = ~clk;

    // Test stimulus
    initial begin
        $dumpfile("wave.vcd");        //生成的vcd文件名称
        $dumpvars(0, mux8to1_tb);    //tb模块名称
        // Initialize inputs
        i0 = 1'b1; i1 = 1'b0; i2 = 1'b1; i3 = 1'b0;
        i4 = 1'b1; i5 = 1'b0; i6 = 1'b1; i7 = 1'b0;
        s0 = 1'b0; s1 = 1'b0; s2 = 1'b0;

        // Apply stimulus
        #100 s0 = 1'b1; s1 = 1'b0; s2 = 1'b0; // Select input i0
        #100 s0 = 1'b0; s1 = 1'b1; s2 = 1'b0; // Select input i1
        #100 s0 = 1'b1; s1 = 1'b1; s2 = 1'b0; // Select input i2
        #100 s0 = 1'b0; s1 = 1'b0; s2 = 1'b1; // Select input i3
        #100 s0 = 1'b1; s1 = 1'b0; s2 = 1'b1; // Select input i4
        #100 s0 = 1'b0; s1 = 1'b1; s2 = 1'b1; // Select input i5
        #100 s0 = 1'b1; s1 = 1'b1; s2 = 1'b1; // Select input i6
        #100 s0 = 1'b0; s1 = 1'b0; s2 = 1'b0; // Select input i7

        // Add more test cases as needed

        // End simulation
       #10 $finish;
    end

endmodule

