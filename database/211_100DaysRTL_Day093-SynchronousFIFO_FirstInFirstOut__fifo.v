// This program was cloned from: https://github.com/Suni123456789/100DaysRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module fifo #( parameter WIDTH = 8, DEPTH = 16 )
 ( input clk, rst, wr_en, rd_en,
   input [WIDTH-1:0] wr_data,
   output reg [WIDTH-1:0] rd_data,
   output reg empty, full 
  );

   reg [WIDTH-1:0] mem [0:DEPTH-1];
   reg [WIDTH-1:0] rd_ptr = 0;
   reg [WIDTH-1:0] wr_ptr = 0;
   reg [WIDTH-1:0] next_wr_ptr;
   reg [WIDTH-1:0] next_rd_ptr;
   reg [DEPTH-1:0] num_items = 0;

   always @(posedge clk) 
    begin
        if (rst) 
	      begin
	         rd_ptr <= 0;
	         wr_ptr <= 0;
	         next_rd_ptr <= 0;
	         next_wr_ptr <= 0;
	         num_items <= 0;
	         empty <= 1;
	         full <= 0;
	      end
        else 
          begin
	         rd_ptr <= next_rd_ptr;
	         wr_ptr <= next_wr_ptr;
	         empty <= (num_items == 0);
	         full <= (num_items == DEPTH);

	         if (wr_en && !full) 
	         begin
	            mem[wr_ptr] <= wr_data;
	            next_wr_ptr <= (wr_ptr + 1) % DEPTH;
	            num_items <= num_items + 1;
	         end

	         if (rd_en && !empty) 
	         begin
	            rd_data <= mem[rd_ptr];
	            next_rd_ptr <= (rd_ptr + 1) % DEPTH;
	            num_items <= num_items - 1;
	         end
	    end
    end

endmodule
