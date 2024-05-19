// This program was cloned from: https://github.com/cjhonlyone/picorv32_Xilinx
// License: MIT License

//                              -*- Mode: Verilog -*-
// Filename        : fifo.v
// Description     : FIFO
// Author          : Philip Tracton
// Created On      : Tue May 27 16:03:26 2014
// Last Modified By: Philip Tracton
// Last Modified On: Tue May 27 16:03:26 2014
// Update Count    : 0
// Status          : Unknown, Use with caution!

module fifo (/*AUTOARG*/
	     // Outputs
	     DATA_OUT, FULL, EMPTY,
	     // Inputs
	     CLK, RESETn, DATA_IN, PUSH, POP
	     ) ;


   //---------------------------------------------------------------------------
   //
   // PARAMETERS
   //
   //---------------------------------------------------------------------------
   parameter DATA_WIDTH = 8;               // Width of input and output data
   parameter ADDR_EXP   = 12;                // Width of our address, FIFO depth is 2^^ADDR_EXP
   parameter ADDR_DEPTH = 4096;    // DO NOT DIRECTLY SET THIS ONE!
   
   //---------------------------------------------------------------------------
   //
   // PORTS
   //
   //---------------------------------------------------------------------------
   input CLK;                           // Clock for all logic
   input RESETn;                         // Synchronous Active High RESETn
   // input ENABLE;                        // When asserted (1'b1), this block is active
   // input FLUSH;                         // When asserted (1'b1), the FIFO is dumped out and RESETn to all 0
   input [DATA_WIDTH - 1:0] DATA_IN;    // Input data stored when PUSHed
   input                    PUSH;       // When asserted (1'b1), DATA_IN is stored into FIFO
   input                    POP;        // When asserted (1'b1), DATA_OUT is the next value in the FIFO
   
   output [DATA_WIDTH - 1:0] DATA_OUT;  // Output data from FIFO
   output                    FULL;      // Asseted when there is no more space in FIFO
   output                    EMPTY;     // Asserted when there is nothing in the FIFO
   

   //---------------------------------------------------------------------------
   //
   // Registers 
   //
   //---------------------------------------------------------------------------
   /*AUTOREG*/
   // Beginning of automatic regs (for this module's undeclared outputs)
   reg 			     EMPTY;
   reg 			     FULL;
   // End of automatics
   (* ram_style = "block" *)
   reg [DATA_WIDTH -1:0]     memory[0:ADDR_DEPTH-1];   // The memory for the FIFO
   reg [ADDR_EXP -1:0] 	     write_ptr;                // Location to write to
   reg [ADDR_EXP -1:0] 	     read_ptr;                 // Location to read from 
   
   //---------------------------------------------------------------------------
   //
   // WIRES
   //
   //---------------------------------------------------------------------------
   /*AUTOWIRE*/
   reg [DATA_WIDTH-1:0]     DATA_OUT;          // Top of the FIFO driven out of the module
   reg [ADDR_EXP -1:0] 	     next_write_ptr;    // Next location to write to
   reg [ADDR_EXP -1:0] 	     next_read_ptr;     // Next location to read from
   wire 		     accept_write;      // Asserted when we can accept this write (PUSH)
   wire 		     accept_read;       // Asserted when we can accept this read (POP)
   
   //---------------------------------------------------------------------------
   //
   // COMBINATIONAL LOGIC
   //
   //---------------------------------------------------------------------------

   //
   // Read and write pointers increment by one unless at the last address.  In that
   // case wrap around to the beginning (0)
   //
   // assign next_write_ptr = (write_ptr == ADDR_DEPTH-1) ? 0  :write_ptr + 1;
   // assign next_read_ptr  = (read_ptr  == ADDR_DEPTH-1) ? 0  :read_ptr  + 1;

   always @(posedge CLK) begin
     if (!RESETn) begin
        next_write_ptr <= 'b0;      
        next_read_ptr <= 'b0;    
     end else begin
        next_write_ptr <= write_ptr + 1;      
        next_read_ptr <= read_ptr  + 1;    
     end
   end

   //
   // Only write if enabled, no flushing and not full or at the same time as a pop
   //
   assign accept_write = (PUSH && !FULL) || (PUSH && POP);

   //
   // Only read if not flushing and not empty or at the same time as a push
   //
   assign accept_read = (POP && !EMPTY) || (PUSH && POP);

   //
   // We are always driving the data out to be read.  Pop will move to the next location
   // in memory
   //
   // assign DATA_OUT = (ENABLE) ? memory[read_ptr]: 'b0;
   
   //---------------------------------------------------------------------------
   //
   // SEQUENTIAL LOGIC
   //
   //---------------------------------------------------------------------------

   //
   // Write Pointer Logic
   //
   always @(posedge CLK)
     if (!RESETn) begin
        write_ptr <= 'b0;       
     end else begin
         if (accept_write) begin
            write_ptr <= next_write_ptr;            
         end
     end

   //
   // Read Pointer Logic
   //
   always @(posedge CLK)
     if (!RESETn) begin
        read_ptr <= 'b0;        
     end else begin
         if (accept_read) begin
            read_ptr <= next_read_ptr;              
         end
    end

   //
   // Empty Logic
   //
   always @(posedge CLK)
     if (!RESETn) begin
        EMPTY <= 1'b1;  
     end else begin
         if (EMPTY && accept_write) begin
            EMPTY <= 1'b0;          
         end
         if (accept_read && (next_read_ptr == write_ptr)) begin
            EMPTY <= 1'b1;          
         end
      end
   //
   // Full Logic 
   //
   always @(posedge CLK)
     if (!RESETn) begin
        FULL <= 1'b0;   
     end else begin
         if (accept_write && (next_write_ptr == read_ptr)) begin
            FULL <= 1;
         end else if (FULL && accept_read) begin
            FULL <= 0;              
         end
     end
   

   //
   // FIFO Write Logic
   //
   
   always @(posedge CLK) begin
      if (accept_write) begin
         memory[write_ptr] <= DATA_IN;           
      end
      DATA_OUT <= memory[read_ptr];
   end
   
endmodule 
