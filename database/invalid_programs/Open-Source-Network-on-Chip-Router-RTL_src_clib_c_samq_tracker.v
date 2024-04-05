// $Id: c_samq_tracker.v 5188 2012-08-30 00:31:31Z dub $

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
// buffer state tracker for statically allocated multi-queue
//==============================================================================

module c_samq_tracker
  (clk, reset, active, push_valid, push_sel_qu, pop_valid, pop_sel_qu, 
   almost_empty_qu, empty_qu, almost_full_qu, full_qu, two_free_qu, errors_qu);

`include "c_functions.v"
`include "c_constants.v"


   //---------------------------------------------------------------------------
   // parameters
   //---------------------------------------------------------------------------

   // number of queues
   parameter num_queues = 4;
   
   // buffer entries per queue
   parameter num_slots_per_queue = 8;
   
   // generate the almost_empty output early in the clock cycle
   parameter fast_almost_empty = 0;
   
   // generate the two_free output early in the clock cycle
   parameter fast_two_free = 0;
   
   // allow bypassing through empty FIFO (i.e., empty & push & pop)
   parameter enable_bypass = 0;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   input clk;
   input reset;
   
   // clock enable signal
   input active;
   
   // insert data
   input push_valid;
   
   // queue to insert into
   input [0:num_queues-1] push_sel_qu;
   
   // remove data
   input 		  pop_valid;
   
   // queue to remove from
   input [0:num_queues-1] pop_sel_qu;
   
   // queue state flags
   output [0:num_queues-1] almost_empty_qu;
   wire [0:num_queues-1]   almost_empty_qu;
   output [0:num_queues-1] empty_qu;
   wire [0:num_queues-1]   empty_qu;
   output [0:num_queues-1] almost_full_qu;
   wire [0:num_queues-1]   almost_full_qu;
   output [0:num_queues-1] full_qu;
   wire [0:num_queues-1]   full_qu;
   output [0:num_queues-1] two_free_qu;
   wire [0:num_queues-1]   two_free_qu;
   
   // internal error conditions detected
   output [0:num_queues*2-1] errors_qu;
   wire [0:num_queues*2-1]   errors_qu;
   
   
   //---------------------------------------------------------------------------
   // implementation
   //---------------------------------------------------------------------------
   
   genvar 		     queue;
   
   generate
      
      for(queue = 0; queue < num_queues; queue = queue + 1)
	begin:queues
	   
	   wire push_sel;
	   assign push_sel = push_sel_qu[queue];
	   
	   wire push_valid_sel;
	   assign push_valid_sel = push_valid & push_sel;
	   
	   wire pop_sel;
	   assign pop_sel = pop_sel_qu[queue];
	   
	   wire pop_valid_sel;
	   assign pop_valid_sel = pop_valid & pop_sel;
	   
	   wire almost_empty;
	   wire empty;
	   wire almost_full;
	   wire full;
	   wire two_free;
	   wire [0:1] errors;
	   c_fifo_tracker
	     #(.depth(num_slots_per_queue),
	       .fast_almost_empty(fast_almost_empty),
	       .fast_two_free(fast_two_free),
	       .enable_bypass(enable_bypass),
	       .reset_type(reset_type))
	   ft
	     (.clk(clk),
	      .reset(reset),
	      .active(active),
	      .push(push_valid_sel),
	      .pop(pop_valid_sel),
	      .almost_empty(almost_empty),
	      .empty(empty),
	      .almost_full(almost_full),
	      .full(full),
	      .two_free(two_free),
	      .errors(errors));
	   
	   assign almost_empty_qu[queue] = almost_empty;
	   assign empty_qu[queue] = empty;
	   assign almost_full_qu[queue] = almost_full;
	   assign full_qu[queue] = full;
	   assign two_free_qu[queue] = two_free;
	   assign errors_qu[queue*2:queue*2+1] = errors;
	   
	end
      
   endgenerate
   
endmodule
