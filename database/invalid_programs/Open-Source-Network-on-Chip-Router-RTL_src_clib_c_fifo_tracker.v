// $Id: c_fifo_tracker.v 5188 2012-08-30 00:31:31Z dub $

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
// module for tracking state of a FIFO
//==============================================================================

module c_fifo_tracker
  (clk, reset, active, push, pop, almost_empty, empty, almost_full, full, 
   two_free, errors);
   
`include "c_functions.v"
`include "c_constants.v"
   
   // total number of credits available
   parameter depth = 8;
   
   // generate the almost_empty output early in the clock cycle
   parameter fast_almost_empty = 0;
   
   // generate the two_free output early in the clock cycle
   parameter fast_two_free = 0;
   
   // allow bypassing through empty FIFO (i.e., empty & push & pop)
   parameter enable_bypass = 0;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   // width required to represent full range of credit count (0..depth)
   localparam free_width = clogb(depth+1);
   
   input clk;
   input reset;
   input active;
   
   // add an entry
   input push;
   
   // remove an entry
   input pop;
   
   // all but one entries free
   output almost_empty;
   wire   almost_empty;
   
   // all entries free
   output empty;
   wire   empty;
   
   // all but one entries occupied
   output almost_full;
   wire   almost_full;
   
   // all entries occupied
   output full;
   wire   full;
   
   // two entries are free
   output two_free;
   wire   two_free;
   
   // internal error condition encountered
   output [0:1] 	   errors;
   wire [0:1] 		   errors;
   
   wire 		   error_underflow;
   
   generate
      
      if(enable_bypass)
	assign error_underflow = empty & ~push & pop;
      else
	assign error_underflow = empty & pop;
      
   endgenerate
   
   wire 		   error_overflow;
   assign error_overflow = full & push;
   
   generate
      
      if(depth == 1)
	begin
	   
	   wire empty_s, empty_q;
	   assign empty_s = pop ? 1'b1 : 
			    push ? 1'b0 : 
			    empty_q;
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

	   assign almost_empty = ~empty;
	   assign almost_full = empty;
	   assign full = ~empty;
	   assign two_free = 1'b0;
	   
	end
      else if(depth > 1)
	begin
	   
	   wire [0:free_width-1] free;
	   
	   wire [0:free_width-1] free_minus1;
	   c_decr
	     #(.width(free_width))
	   free_minus1_decr
	     (.data_in(free),
	      .data_out(free_minus1));
	   
	   wire [0:free_width-1] free_plus1;
	   c_incr
	     #(.width(free_width))
	   free_plus1_incr
	       (.data_in(free),
		.data_out(free_plus1));
	   
	   wire [0:free_width-1]   free_s, free_q;
	   assign free_s = (push & ~pop) ? free_minus1 : 
			   (~push & pop) ? free_plus1 : 
			   free_q;
	   c_dff
	     #(.width(free_width),
	       .reset_value(depth),
	       .reset_type(reset_type))
	   freeq
	     (.clk(clk),
	      .reset(reset),
	      .active(active),
	      .d(free_s),
	      .q(free_q));
	   
	   assign free = free_q;
	   
	   wire 		   free_max_minus1;
	   assign free_max_minus1 = (free == (depth - 1));
	   
	   if(fast_almost_empty)
	     begin
		
		wire free_max;
		assign free_max = (free == depth);
		
		wire free_max_minus2;
		assign free_max_minus2 = (free == (depth - 2));
		
		wire almost_empty_s, almost_empty_q;
		if(enable_bypass)
		  assign almost_empty_s = (push & ~pop) ? free_max :
					  (~push & pop) ? free_max_minus2 : 
					  almost_empty_q;
		else
		  assign almost_empty_s = push ? free_max : 
					  pop ? free_max_minus2 : 
					  almost_empty_q;
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
	     assign almost_empty = free_max_minus1;
	   
	   wire      empty_s, empty_q;
	   if(enable_bypass)
	     assign empty_s = (push & ~pop) ? 1'b0 : 
			      (pop & ~push) ? free_max_minus1 : 
			      empty_q;
	   else
	     assign empty_s = push ? 1'b0 :
			      pop ? free_max_minus1 : 
			      empty_q;
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
	   
	   wire      free_one;
	   assign free_one = (free == 1);
	   
	   if(depth == 2)
	     begin
		assign almost_full = almost_empty;
		assign two_free = empty;
	     end
	   else if(depth > 2)
	     begin
		
		wire free_two;
		assign free_two = (free == 2);
		
		wire free_zero;
		assign free_zero = (free == 0);
		
		wire almost_full_s, almost_full_q;
		assign almost_full_s = (push & ~pop) ? free_two : 
				       (~push & pop) ? free_zero : 
				       almost_full_q;
		c_dff
		  #(.width(1),
		    .reset_type(reset_type))
		almost_fullq
		  (.clk(clk),
		   .reset(reset),
		   .active(active),
		   .d(almost_full_s),
		   .q(almost_full_q));
		
		assign almost_full = almost_full_q;
		
		wire free_three;
		assign free_three = (free == 3);
		
		if(fast_two_free)
		  begin
		     
		     wire two_free_s, two_free_q;
		     assign two_free_s = (push & ~pop) ? free_three :
					 (~push & pop) ? free_one :
					 two_free_q;
		     c_dff
		       #(.width(1),
			 .reset_type(reset_type))
		     two_freeq
		       (.clk(clk),
			.reset(reset),
			.active(active),
			.d(two_free_s),
			.q(two_free_q));
		     
		     assign two_free = two_free_q;
		     
		  end
		else
		  assign two_free = free_two;
		
	     end
	   
	   wire 	  full_s, full_q;
	   assign full_s = pop ? 1'b0 : 
			   push ? free_one : 
			   full_q;
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
	      $display({"ERROR: FIFO tracker module %m requires a depth of at ",
			"least one entry."});
	      $stop;
	   end
	end
      
      // synopsys translate_on
      
   endgenerate
   
   // synopsys translate_off
   
   always @(posedge clk)
     begin
	
	if(error_underflow)
	  $display("ERROR: FIFO tracker underflow in module %m.");
	
	if(error_overflow)
	  $display("ERROR: FIFO tracker overflow in module %m.");
	
     end
   
   // synopsys translate_on
   
   assign errors = {error_underflow, error_overflow};
   
endmodule
