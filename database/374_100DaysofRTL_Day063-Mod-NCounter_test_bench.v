// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
parameter N = 6;
parameter LENGTH = 3;
        
reg clk,reset;
wire [LENGTH-1:0] counter;

mod_N_counter dut(clk, reset, counter);

initial
        begin
            clk = 0;
            forever #5 clk = ~clk;
        end
        
        initial
        begin
            reset = 1;
            #10;
            reset = 0;    
        end

initial begin
    $monitor("\t\t\t counter: %d",counter);
    #125 $finish;
end

endmodule
