// $Id: c_damq_tracker.v 5188 2012-08-30 00:31:31Z dub $

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
// buffer state tracker for dynamically allocated multi-queue
//==============================================================================

module c_damq_tracker
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
   parameter num_slots = 32;
   
   // generate the almost_empty output early in the clock cycle
   parameter fast_almost_empty = 0;
   
   // generate the two_free output early in the clock cycle
   parameter fast_two_free = 0;
   
   // allow bypassing through empty FIFO (i.e., empty & push & pop)
   parameter enable_bypass = 0;
   
   // reserve one entry for each queue
   parameter enable_reservations = 0;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   
   //---------------------------------------------------------------------------
   // derived parameters
   //---------------------------------------------------------------------------
   
   // number of shared credits
   localparam num_shared_slots
     = enable_reservations ? (num_slots - num_queues) : num_slots;
   
   // max. number of slots per queue
   localparam num_queue_slots
     = enable_reservations ? (1 + num_shared_slots) : num_slots;
   
   
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

   wire 		     push_shared;
   wire 		     pop_shared;
   
   generate
      
      if(enable_reservations)
	begin
	   
	   wire push_empty;
	   c_select_1ofn
	     #(.num_ports(num_queues),
	       .width(1))
	   push_empty_sel
	     (.select(push_sel_qu),
	      .data_in(empty_qu),
	      .data_out(push_empty));
	   
	   wire pop_almost_empty;
	   c_select_1ofn
	     #(.num_ports(num_queues),
	       .width(1))
	   pop_almost_empty_sel
	     (.select(pop_sel_qu),
	      .data_in(almost_empty_qu),
	      .data_out(pop_almost_empty));
	   
	   wire same_queue;
	   assign same_queue = |(push_sel_qu & pop_sel_qu);
	   
	   assign push_shared = push_valid & ~push_empty & 
				(~pop_valid | (pop_almost_empty & ~same_queue));
	   
	   if(enable_bypass)
	     assign pop_shared = pop_valid & ~pop_almost_empty & 
				 (~push_valid | (push_empty & ~same_queue));
	   else
	     assign pop_shared = pop_valid & ~pop_almost_empty & 
				 (~push_valid | push_empty);
	   
	end
      else
	begin
	   assign push_shared = push_valid & ~pop_valid;
	   assign pop_shared = pop_valid & ~push_valid;
	end
      
   endgenerate
   
   wire 		     shared_almost_full;
   wire 		     shared_full;
   wire 		     shared_two_free;
   wire [0:1] 		     shared_errors;
   c_fifo_tracker
     #(.depth(num_shared_slots),
       .fast_two_free(fast_two_free),
       .enable_bypass(0),
       .reset_type(reset_type))
   sft
     (.clk(clk),
      .reset(reset),
      .active(active),
      .push(push_shared),
      .pop(pop_shared),
      .almost_empty(),
      .empty(),
      .almost_full(shared_almost_full),
      .full(shared_full),
      .two_free(shared_two_free),
      .errors(shared_errors));
   
   genvar 		     queue;
   
   generate
      
      for(queue = 0; queue < num_queues; queue = queue + 1)
	begin:queues
	   
	   wire push_sel;
	   assign push_sel = push_sel_qu[queue];
	   
	   wire push;
	   assign push = push_valid & push_sel;
	   
	   wire pop_sel;
	   assign pop_sel = pop_sel_qu[queue];
	   
	   wire pop;
	   assign pop = pop_valid & pop_sel;
	   
	   wire almost_empty;
	   wire empty;
	   wire [0:1] private_errors;
	   c_fifo_tracker
	     #(.depth(num_queue_slots),
	       .fast_almost_empty(fast_almost_empty),
	       .enable_bypass(enable_bypass),
	       .reset_type(reset_type))
	   ft
	     (.clk(clk),
	      .reset(reset),
	      .active(active),
	      .push(push),
	      .pop(pop),
	      .almost_empty(almost_empty),
	      .empty(empty),
	      .almost_full(),
	      .full(),
	      .two_free(),
	      .errors(private_errors));
	   
	   wire [0:1] errors;
	   assign errors[0] = private_errors[0] | (pop & shared_errors[0]);
	   assign errors[1] = private_errors[1] | (push & shared_errors[1]);
	   
	   wire       almost_full;
	   wire       full;
	   wire       two_free;
	   
	   if(enable_reservations)
	     begin
		assign almost_full = empty ? shared_full : shared_almost_full;
		assign full = ~empty & shared_full;
	   	assign two_free = empty ? shared_almost_full : shared_two_free;
	     end
	   else
	     begin
		assign almost_full = shared_almost_full;
		assign full = shared_full;
	   	assign two_free = shared_two_free;
	     end
	   
	   assign almost_empty_qu[queue] = almost_empty;
	   assign empty_qu[queue] = empty;
	   assign almost_full_qu[queue] = almost_full;
	   assign full_qu[queue] = full;
	   assign two_free_qu[queue] = two_free;
	   assign errors_qu[queue*2:queue*2+1] = errors;
	   
	end
      
   endgenerate
   
endmodule
