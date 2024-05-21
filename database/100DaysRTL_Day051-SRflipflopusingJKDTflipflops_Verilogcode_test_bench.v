// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
reg S, R, clk, rst;
wire Q_jk, Q_d, Q_t;

  SR_using_JK_D_T dut(S, R, clk, rst, Q_jk, Q_d, Q_t);
initial begin 
        clk = 0;
       forever #5 clk = ~clk;
       end 
       
 initial begin
        rst=1;
        S = 0;
        R = 0;
        #10;
        rst=0;
    end
    
    always begin
        S=0;
        R=0;
        #10;
        S=0;
        R=1;
        #10;
        S=1;
        R=0;
        #10;
        S=1;
        R=1;
        #10;

    end
  initial begin
  $monitor("\t clk: %d  S: %d  R: %d  Q_jk: %d  Q_d: %d  Q_t:%d", clk,S,R,Q_jk, Q_d, Q_t);
  #90 $finish;
  end
endmodule
