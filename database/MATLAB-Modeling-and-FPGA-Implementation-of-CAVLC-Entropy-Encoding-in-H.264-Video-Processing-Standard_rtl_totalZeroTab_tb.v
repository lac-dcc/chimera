// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2024 08:13:52 AM
// Design Name: 
// Module Name: totalZeroTab_tb
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


`timescale 1ns / 1ps

module totalZeroTab_tb;

    // Inputs
    reg [7:0] addr;
    
    // Outputs
    wire [6:0] TotalZeroCode;
    
    // Instantiate the module
    totalZeroTab dut (
        .addr(addr),
        .TotalZeroCode(TotalZeroCode)
    );
    
    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;
    
    // Test stimulus
    initial begin
        // Initialize inputs
        addr = 8'h00;
        
        // Apply stimulus
        #10 addr = 8'h01;
        #10 addr = 8'h02;
        #10 addr = 8'h03;
        // Add more test cases here
        
        // End simulation
        #10 $finish;
    end
    
    // Monitor
    always @(posedge clk) begin
        $display("addr = %h, TotalZeroCode = %h", addr, TotalZeroCode);
    end
    
endmodule

