// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg clk,rst,d;
wire Q;

  dual_edge_trig_ff dut(clk,rst,d,Q);
  
  initial begin 
  clk=0;
  d=0;
  forever #9 clk=~clk;
  end
  
  initial 
    begin
     rst=1;
     #10;  
     rst=0;
    forever #6 d= ~d;
    end 
    
    initial begin
    $monitor("\t\t\t clk: %d  D: %d  Q: %d", clk, d, Q);
    #80 $finish;
    end
endmodule
