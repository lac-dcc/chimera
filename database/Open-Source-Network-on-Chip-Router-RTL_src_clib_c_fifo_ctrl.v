// $Id: c_fifo_ctrl.v 5188 2012-08-30 00:31:31Z dub $

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
// simple FIFO controller
//==============================================================================

module c_fifo_ctrl
  (clk, reset, push_active, pop_active, push, pop, push_addr, pop_addr, 
   almost_empty, empty, full, errors);
   
`include "c_functions.v"
`include "c_constants.v"
   
   // number of entries in FIFO
   parameter depth = 8;
   
   // add additional address bits
   parameter extra_addr_width = 0;
   
   // address width
   localparam addr_width = clogb(depth) + extra_addr_width;
   
   // starting address (i.e., address of leftmost entry)
   parameter offset = 0;
   
   // minimum (leftmost) address
   localparam [0:addr_width-1] min_value = offset;
   
   // maximum (rightmost) address
   localparam [0:addr_width-1] max_value = offset + depth - 1;
   
   // generate the almost_empty output early in the clock cycle
   parameter fast_almost_empty = 0;
   
   // allow bypassing through empty FIFO (i.e., empty & push & pop)
   parameter enable_bypass = 0;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   input push_active;
   input pop_active;
   
   // write (add) an element
   input push;
   
   // read (remove) an element
   input pop;
   
   // address to write current input element to
   output [0:addr_width-1] push_addr;
   wire [0:addr_width-1]   push_addr;
   
   // address to read current output element from
   output [0:addr_width-1] pop_addr;
   wire [0:addr_width-1]   pop_addr;
   
   // buffer nearly empty (1 used slot remaining) indication
   output 		   almost_empty;
   wire 		   almost_empty;
   
   // buffer empty indication
   output 		   empty;
   wire 		   empty;
   
   // buffer full indication
   output 		   full;
   wire 		   full;
   
   // internal error condition detected
   output [0:1] 	   errors;
   wire [0:1] 		   errors;
   
   wire 		   active;
   assign active = push_active | pop_active;
   
   generate
      
      if(depth == 1)
	begin
	   
	   assign push_addr = min_value;
	   assign pop_addr = min_value;
	   
	   wire empty_s, empty_q;
	   assign empty_s = (empty_q & ~push) | pop;
	   c_dff
	     #(.width(1),
	       .reset_value(1'b1),
	       .reset_type(reset_type))
	   emptyq
	     (.clk(clk),
	      .reset(reset),
	      .active(active),
	      .d(empty_s),
	      .q(empty_q));
	   
	   assign almost_empty = ~empty_q;
	   assign empty = empty_q;
	   assign full = ~empty_q;
	   
	end
      else if(depth > 1)
	begin
	   
	   wire [0:addr_width-1] push_addr_q;
	   
	   wire [0:addr_width-1] push_addr_next;
	   c_incr
	     #(.width(addr_width),
	       .min_value(min_value),
	       .max_value(max_value))
	   push_addr_incr
	     (.data_in(push_addr_q),
	      .data_out(push_addr_next));
	   
	   wire [0:addr_width-1] push_addr_prev;
	   c_decr
	     #(.width(addr_width),
	       .min_value(min_value),
	       .max_value(max_value))
	   push_addr_decr
	     (.data_in(push_addr_q),
	      .data_out(push_addr_prev));
	   
	   wire [0:addr_width-1] push_addr_s;
	   assign push_addr_s = push ? push_addr_next : push_addr_q;
	   c_dff
	     #(.width(addr_width),
	       .reset_value(min_value),
	       .reset_type(reset_type))
	   push_addrq
	     (.clk(clk),
	      .reset(reset),
	      .active(push_active),
	      .d(push_addr_s),
	      .q(push_addr_q));
	   
	   assign push_addr = push_addr_q;
	   
	   wire [0:addr_width-1] pop_addr_q;
	   
	   wire [0:addr_width-1] pop_addr_next;
	   c_incr
	     #(.width(addr_width),
	       .min_value(min_value),
	       .max_value(max_value))
	   pop_addr_incr
	     (.data_in(pop_addr_q),
	      .data_out(pop_addr_next));
	   
	   wire [0:addr_width-1] pop_addr_prev;
	   c_decr
	     #(.width(addr_width),
	       .min_value(min_value),
	       .max_value(max_value))
	   pop_addr_decr
	     (.data_in(pop_addr_q),
	      .data_out(pop_addr_prev));
	   
	   wire [0:addr_width-1] pop_addr_s;
	   assign pop_addr_s = pop ? pop_addr_next : pop_addr_q;
	   c_dff
	     #(.width(addr_width),
	       .reset_value(min_value),
	       .reset_type(reset_type))
	   pop_addrq
	     (.clk(clk),
	      .reset(reset),
	      .active(pop_active),
	      .d(pop_addr_s),
	      .q(pop_addr_q));
	   
	   assign pop_addr = pop_addr_q;

	   if(fast_almost_empty)
	     begin
		
		wire equal;
		assign equal = (push_addr_q == pop_addr_q);
		
		wire next_almost_empty;
		assign next_almost_empty = (push_addr_prev == pop_addr_next);
		
		wire almost_empty_s, almost_empty_q;
		if(enable_bypass)
		  assign almost_empty_s = (almost_empty & ~(push ^ pop)) | 
					  (next_almost_empty & (~push & pop)) |
					  (equal & (push & ~pop));
		else
		  assign almost_empty_s = (almost_empty & ~(push ^ pop)) | 
					  (next_almost_empty & (~push & pop)) |
					  (equal & push);
		c_dff
		  #(.width(1),
		    .reset_type(reset_type))
		almost_emptyq
		  (.clk(clk),
		   .reset(reset),
		   .active(active),
		   .d(almost_empty_s),
		   .q(almost_empty_q));
		
		assign almost_empty = almost_empty_q;
		
	     end
	   else
	     assign almost_empty = (push_addr_prev == pop_addr_q);
	   
	   wire 		 next_empty;
	   assign next_empty = (push_addr_q == pop_addr_next);
	   
	   wire 		 empty_s, empty_q;
	   if(enable_bypass)
	     assign empty_s = (empty & ~(push & ~pop)) | 
			      (next_empty & (~push & pop));
	   else
	     assign empty_s = (empty | (next_empty & pop)) & ~push;
	   c_dff
	     #(.width(1),
	       .reset_value(1'b1),
	       .reset_type(reset_type))
	   emptyq
	     (.clk(clk),
	      .reset(reset),
	      .active(active),
	      .d(empty_s),
	      .q(empty_q));
	   
	   assign empty = empty_q;
	   
	   wire 		 next_full;
	   assign next_full = (push_addr_next == pop_addr_q);
	   
	   wire 		 full_s, full_q;
	   assign full_s = (full | (next_full & push)) & ~pop;
	   c_dff
	     #(.width(1),
	       .reset_type(reset_type))
	   fullq
	     (.clk(clk),
	      .reset(reset),
	      .active(active),
	      .d(full_s),
	      .q(full_q));
	   
	   assign full = full_q;
	   
	end
      
      // synopsys translate_off
      
      else
	begin
	   initial
	   begin
	      $display({"ERROR: FIFO controller module %m requires a depth ", 
			"of at least one entry."});
	      $stop;
	   end
	end
      
      // synopsys translate_on
      
   endgenerate
   
   wire 			 error_underflow;
   
   generate
      
      if(enable_bypass)
	assign error_underflow = empty & ~push & pop;
      else
	assign error_underflow = empty & pop;
      
   endgenerate
   
   wire 			 error_overflow;
   assign error_overflow = full & push;
   
   // synopsys translate_off
   
   always @(posedge clk)
     begin
	
	if(error_underflow)
	  $display("ERROR: FIFO underflow in module %m.");
	
	if(error_overflow)
	  $display("ERROR: FIFO overflow in module %m.");
	
     end
   
   // synopsys translate_on
   
   assign errors[0] = error_underflow;
   assign errors[1] = error_overflow;
   
endmodule
