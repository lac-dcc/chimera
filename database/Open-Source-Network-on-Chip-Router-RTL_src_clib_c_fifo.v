// $Id: c_fifo.v 5188 2012-08-30 00:31:31Z dub $

/*
 Copyright (c) 2007-2012, Trustees of The Leland Stanford Junior University
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 Redistributions of source code must retain the above copyright notice, this 
 list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this
 list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//==============================================================================
// generic FIFO buffer built from registers
//==============================================================================

module c_fifo
  (clk, reset, push_active, pop_active, push, pop, push_data, pop_data, 
   almost_empty, empty, full, errors);
   
`include "c_functions.v"
`include "c_constants.v"
   
   // number of entries in FIFO
   parameter depth = 4;
   
   // width of each entry
   parameter width = 8;
   
   // select implementation variant for register file
   parameter regfile_type = `REGFILE_TYPE_FF_2D;
   
   // if enabled, feed through inputs to outputs when FIFO is empty
   parameter enable_bypass = 0;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   // width required for read/write address
   localparam addr_width = clogb(depth);
   
   input clk;
   input reset;
   input push_active;
   input pop_active;
   
   // write (add) an element
   input push;
   
   // read (remove) an element
   input pop;
   
   // data to write to FIFO
   input [0:width-1] push_data;
   
   // data being read from FIFO
   output [0:width-1] pop_data;
   wire [0:width-1]   pop_data;
   
   // buffer nearly empty (1 used slot remaining) indication
   output 	      almost_empty;
   wire 	      almost_empty;
   
   // buffer empty indication
   output 	      empty;
   wire 	      empty;
   
   // buffer full indication
   output 	      full;
   wire 	      full;
   
   // internal error condition detected
   output [0:1]       errors;
   wire [0:1] 	      errors;
   
   wire 	      error_underflow;
   wire 	      error_overflow;
   
   generate
      
      if(depth == 0)
	begin
	   
	   if(enable_bypass)
	     assign pop_data = push_data;
	   
	   assign almost_empty = 1'b0;
	   assign empty = 1'b1;
	   assign full = 1'b1;
	   
	   assign error_underflow = pop;
	   assign error_overflow = push;
	   
	   assign errors[0] = error_underflow;
	   assign errors[1] = error_overflow;
	   
	end
      else if(depth == 1)
	begin
	   
	   wire [0:width-1] data_s, data_q;
	   assign data_s = push ? push_data : data_q;
	   c_dff
	     #(.width(width),
	       .reset_type(reset_type))
	   dataq
	     (.clk(clk),
	      .reset(1'b0),
	      .active(push_active),
	      .d(data_s),
	      .q(data_q));
	   
	   if(enable_bypass)
	     assign pop_data = empty ? push_data : data_q;
	   else
	     assign pop_data = data_q;
	   
	   wire 	    empty_active;
	   assign empty_active = push_active | pop_active;
	   
	   wire 	    empty_s, empty_q;
	   assign empty_s = (empty_q & ~push) | pop;
	   c_dff
	     #(.width(1),
	       .reset_value(1'b1),
	       .reset_type(reset_type))
	   emptyq
	     (.clk(clk),
	      .reset(reset),
	      .active(empty_active),
	      .d(empty_s),
	      .q(empty_q));
	   
	   assign almost_empty = ~empty_q;
	   assign empty = empty_q;
	   assign full = ~empty_q;
	   
	   wire 	    error_underflow;
	   if(enable_bypass)
	     assign error_underflow = empty_q & pop & ~push;
	   else
	     assign error_underflow = empty_q & pop;
	   
	   wire 	    error_overflow;
	   assign error_overflow = ~empty_q & push;
	   
	   assign errors[0] = error_underflow;
	   assign errors[1] = error_overflow;
	   
	end
      else if(depth > 1)
	begin
	   
	   wire [0:addr_width-1] push_addr;
	   wire [0:addr_width-1] pop_addr;
	   c_fifo_ctrl
	     #(.depth(depth),
	       .enable_bypass(enable_bypass),
	       .reset_type(reset_type))
	   ctrl
	     (.clk(clk),
	      .reset(reset),
	      .push_active(push_active),
	      .pop_active(pop_active),
	      .push(push),
	      .pop(pop),
	      .push_addr(push_addr),
	      .pop_addr(pop_addr),
	      .almost_empty(almost_empty),
	      .empty(empty),
	      .full(full),
	      .errors(errors));
	   
	   assign error_underflow = errors[0];
	   assign error_overflow = errors[1];
	   
	   wire [0:width-1] 	 rf_data;
	   c_regfile
	     #(.depth(depth),
	       .width(width),
	       .regfile_type(regfile_type))
	   rf
	     (.clk(clk),
	      .write_active(push_active),
	      .write_enable(push),
	      .write_address(push_addr),
	      .write_data(push_data),
	      .read_address(pop_addr),
	      .read_data(rf_data));
	   
	   if(enable_bypass)
	     assign pop_data = empty ? push_data : rf_data;
	   else
	     assign pop_data = rf_data;
	   
	end
      
   endgenerate
   
endmodule
