// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg clk,rst,d;
wire Q_sr, Q_jk, Q_t;

  D_using_SR_JK_T dut(clk,rst,d,Q_sr, Q_jk, Q_t);
  
  initial begin 
  clk=0;
  d=0;
  forever #4 clk=~clk;
  end
  
  initial 
    begin
     rst=1;
     #10;  
     rst=0;
    forever #10 d= ~d;
    end 
    
    initial begin
    $monitor("\t clk: %d  D: %d  Q_sr: %d  Q_jk: %d  Q_t: %d", clk, d, Q_sr, Q_jk, Q_t);
    #80 $finish;
    end
endmodule
