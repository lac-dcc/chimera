// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;

 reg [3:0] dataIn;
 reg rd_en, wr_en, rst, clk;
 wire [3:0] dataOut;
 wire empty, full;
 lifo uut (dataIn, rd_en, wr_en, rst, clk, empty, full, dataOut);
 
 initial begin
  dataIn  = 4'h0;
  rd_en  = 1'b0;
  wr_en  = 1'b0;
  rst  = 1'b1;
  clk  = 1'b0;
  #10;      
  wr_en   = 1'b1;
  rst  = 1'b1;
  #40;
  rst     = 1'b0;
  rd_en      = 1'b0;
  dataIn  = 4'h0;
  #20;
  dataIn = 4'h3;
  #20;
  dataIn = 4'h7;
  #20;
  dataIn = 4'ha;
  #20;
  rd_en  = 1'b1;
  
  #100 $finish;
 end 
   always #10 clk = ~clk;

always @(posedge clk) begin
      $display("Data in: %d  Data out: %d  Empty: %d  Full: %d", dataIn, dataOut, empty, full);
   end
endmodule
