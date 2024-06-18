// This program was cloned from: https://github.com/JosephBerman/fpga-injection
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2024 02:38:51 AM
// Design Name: 
// Module Name: injection_tb
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


module injection_tb;
   
   parameter CLK_PERIOD = 100;
   parameter CLK_IN_PERIOD = 10000; //  ns
   parameter [23:0] DATA_TO_PASS = 24'b101000011011001011000011;
    //b101000011011001011000011
    //b110000110100110110000101
   
   reg clk;
   reg clk_in;
   reg data_in;
   reg reset;
   wire clk_out;
   wire data_out;
   
    injection dut (
        .clk(clk),
        .clk_in(clk_in),
        .data_in(data_in),
        .reset(reset),
        .clk_out(clk_out),
        .data_out(data_out)
    );
    
    integer i;
    
    initial begin
        clk = 0; 
        forever #CLK_PERIOD clk = ~clk;
    end
    
    initial begin
        clk_in  = 0; 
        forever #CLK_IN_PERIOD clk_in = ~clk_in;
    end
    
    

    
    initial begin
        clk = 0;
        clk_in = 0;
        data_in = 0;
        //Reset
        reset = 1;
        #50; 
        //Turn reset off
        reset = 0; 
        #10;

    
        // data_in
        for (i = 0; i < 24; i = i + 1) begin
            @(posedge clk_in); 
            data_in = DATA_TO_PASS[i];
            //#CLK_IN_PERIOD;
            
        end
        @(posedge clk_in); 
        data_in = 0;

    end
    

    
    
endmodule