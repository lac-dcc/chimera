// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
parameter N=4;

reg clk, reset;
wire [N-1:0] counter;

ring_counter dut(clk, reset, counter);

initial begin
    clk= 1'b0;
    forever #5 clk= ~clk;
    end

initial begin 
    reset = 1;
    #10;
    reset = 0;
    end

initial begin
    $monitor("\t\t counter: %d", counter);
    #90 $finish;
end
endmodule
