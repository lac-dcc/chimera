// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;

   localparam WIDTH = 8, DEPTH = 16;

   reg clk, rst, wr_en, rd_en;
   reg [WIDTH-1:0] wr_data;
   wire [WIDTH-1:0] rd_data;
   wire empty, full;

   fifo #(WIDTH,DEPTH) dut(clk,rst,wr_en,rd_en,wr_data,rd_data,empty,full);
   
   initial begin 
   clk= 0;
   forever #5 clk = ~clk;
   end
   
    initial begin
	      rst = 1;
	      wr_en = 0;
	      rd_en = 0;
	      wr_data = 0;
	      #10 rst = 0;
	      #10 wr_en = 1; wr_data = 1;
	      #10 wr_en = 1; wr_data = 2;
	      #10 wr_en = 1; wr_data = 3;
	      #10 rd_en = 1;
	      #10 rd_en = 1;
	      #10 wr_en = 1; wr_data = 4;
	      #10 wr_en = 1; wr_data = 5;
	      #80 $finish;
    end
    
   always @(posedge clk) begin
      $display("RD Data: %d, Empty: %d, Full: %d", rd_data, empty, full);
   end
endmodule
