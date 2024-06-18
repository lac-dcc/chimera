// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2024 11:19:33 PM
// Design Name: 
// Module Name: Coeff_token_enc_TB
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


module Coeff_token_enc_TB;

    // Inputs
    reg clk;
    reg rst_n;
    reg [3:0] state;
    reg [2:0] NC;
    reg [1:0] TrailOneNum;
    reg [4:0] TotalCoeff;

    // Outputs
    wire [5:0] CodeBit;
    wire [4:0] CodeLength;

    // Instantiate the Unit Under Test (UUT)
    Coeff_token_enc UUT (
        .clk(clk),
        .rst_n(rst_n),
        .state(state),
        .NC(NC),
        .TrailOneNum(TrailOneNum),
        .TotalCoeff(TotalCoeff),
        .CodeBit(CodeBit),
        .CodeLength(CodeLength)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Initial stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        rst_n = 0;
        state = 4'b0000;
        NC = 3'b000;
        TrailOneNum = 2'b00;
        TotalCoeff = 5'b00000;

        // Wait for reset to finish
        #10 rst_n = 1;
        state = 4'b0100;
        NC = 3'b001;
        TrailOneNum = 2'b01;
        TotalCoeff = 5'b00001;
        // Additional stimulus can be added here
        // Example:
        // state = 4'b0010;
        // NC = 3'b001;
        // TrailOneNum = 2'b01;
        // TotalCoeff = 5'b10000;

        // Add delay for simulation to run
        #100;

        // Finish simulation
        $finish;
    end

endmodule

