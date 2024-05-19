// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg clk, reset;
wire [3:0] counter;

sequence_counter dut(clk, reset,counter);

    initial 
        begin
        clk = 0;
        reset = 1;
        
       # 10 reset = 0 ;
        end
        
    always #5 clk = ~clk;
    
    initial begin
    $monitor("\t\t clk: %b    counter:%b", clk, counter);
    #140 $finish;
    end
endmodule
