// This program was cloned from: https://github.com/intel/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. All rights reserved
module hdpldadapt_rx_datapath_fifo_ram
  #(
    parameter DWIDTH = 'd40,             // FIFO Input data width 
    parameter DEPTH  = 'd16              // FIFO Depth 
    )
(
    input  wire              r_double_read,	// Read from 2 consecutive locations
    input  wire		     r_stop_write, // Disable/enable writing when FIFO is full    
    input  wire              wr_clk,     // Write Domain Clock
    input  wire		     wr_rst_n,   // Write Domain Reset 
    input  wire		     wr_full,
    input  wire              wr_en,      // Write Data Enable
    input  wire [DEPTH-1:0] wr_ptr,     // Write Pointer
    input  wire [DWIDTH-1:0] wr_data,    // Write Data In
    input  wire [DEPTH-1:0] rd_ptr,     // Read Pointer
    output reg  [DWIDTH-1:0] rd_data,   // Read Data
    output reg  [DWIDTH-1:0] rd_data2,    // Read Data
    output reg  [DWIDTH-1:0] rd_data_next,   // Read Data
    output reg  [DWIDTH-1:0] rd_data2_next    // Read Data

);

   //********************************************************************
   // Infer Memory or use Dual Port Memory from Quartus/ASIC Memory
   //********************************************************************

   wire 	[DEPTH-1:0]	rd_ptr2;   
   wire 	[DEPTH-1:0]	rd_ptr_next;   
   wire 	[DEPTH-1:0]	rd_ptr2_next;   
   integer		m;
   integer		i, j;
//   reg [DWIDTH-1:0]          fifo_mem [((1<<AWIDTH)-1):0];
   reg [DWIDTH-1:0]          fifo_mem [DEPTH-1:0];
   
   always @(negedge wr_rst_n or posedge wr_clk) begin
      if (~wr_rst_n) begin
         for (m='d0; m<=(DEPTH-1'b1); m=m+1'b1)
            fifo_mem[m] <= 'd0;	
      end 
      else if (wr_en &&  (~wr_full||~r_stop_write)) begin
         for (m='d0; m<=(DEPTH-1'b1); m=m+1'b1) begin
           if (wr_ptr[m]) begin
             fifo_mem[m] <= wr_data;
             end  
         end   
      end
   end

   assign rd_ptr2 = {rd_ptr[DEPTH-2:0], rd_ptr[DEPTH-1]};   

   assign rd_ptr_next = {rd_ptr[DEPTH-3:0], rd_ptr[DEPTH-1:DEPTH-2]};   

   assign rd_ptr2_next = {rd_ptr[DEPTH-4:0], rd_ptr[DEPTH-1:DEPTH-3]};   
   
   always @ *
   begin: data_out 
     rd_data = fifo_mem[0];
     for (i='d0; i<=(DEPTH-1'b1); i=i+1'b1) begin
       if (rd_ptr[i]) begin
         rd_data = fifo_mem[i];
       end       
     end   
      end 
      
      always @ *
      begin: data_out2 
        rd_data2 = fifo_mem[0];
     for (j='d0; j<=(DEPTH-1'b1); j=j+1'b1) begin
          if (rd_ptr2[j]) begin
            rd_data2 = fifo_mem[j];
       end       
     end   
   end 

      always @ *
      begin: data_out_next 
        rd_data_next = fifo_mem[0];
     for (j='d0; j<=(DEPTH-1'b1); j=j+1'b1) begin
          if (rd_ptr_next[j]) begin
            rd_data_next = fifo_mem[j];
       end       
     end   
   end 

      always @ *
      begin: data_out2_next 
        rd_data2_next = fifo_mem[0];
     for (j='d0; j<=(DEPTH-1'b1); j=j+1'b1) begin
          if (rd_ptr2_next[j]) begin
            rd_data2_next = fifo_mem[j];
       end       
     end   
   end 

   
endmodule
