// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg clk, reset;
reg [2:0] parallel_in;
wire [2:0] parallel_out;

pipo dut(clk, reset, parallel_in, parallel_out);

initial begin
    clk=1'b0;
    forever #5 clk=~clk;
    end
    
 initial begin
    reset= 1'b1;
    parallel_in= 3'b000;
    #10 reset= 1'b0;
    end
    
    always #10 parallel_in= $random;
    
 initial begin
    $monitor("\t\t clk: %d  reset: %d  parallel_in: %b  parallel_out: %b", clk, reset, parallel_in, parallel_out);
    #100 $finish;
    end
endmodule
