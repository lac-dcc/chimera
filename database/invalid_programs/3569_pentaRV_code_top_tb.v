// This program was cloned from: https://github.com/Rohan7Gupta/pentaRV
// License: Apache License 2.0

`include "processor.v"
`timescale 1ns / 1ps
module top_tb();

reg clk,rst,dump;

processor dut(clk,rst,dump);;

initial begin 
    clk=0; 
    forever #5 clk = ~clk;
end

initial begin
    rst =1 ; dump=0;
    #11 rst=0;
    #1000 rst=1; dump=1;
    #5 $finish;
end

initial begin
  $dumpfile("rv32i.vcd");
  $dumpvars;
end

endmodule