// $Id: c_samq_ctrl.v 5188 2012-08-30 00:31:31Z dub $

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
// controller for statically allocated multi-queue
//==============================================================================

module c_samq_ctrl
  (clk, reset, push_active, push_valid, push_sel_qu, push_addr_qu, pop_active, 
   pop_valid, pop_sel_qu, pop_addr_qu, pop_next_addr_qu, almost_empty_qu, 
   empty_qu, full_qu, errors_qu);
   
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
   
   // allow bypassing through empty FIFO (i.e., empty & push & pop)
   parameter enable_bypass = 0;
   
   // improve timing for next pop address generation logic
   parameter fast_pop_next_addr = 0;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   
   //---------------------------------------------------------------------------
   // derived parameters
   //---------------------------------------------------------------------------
   
   // total number of slots
   localparam num_slots = num_queues * num_slots_per_queue;
   
   // address width required for selecting an individual entry
   localparam addr_width = clogb(num_slots);
   
   // address width required for selecting an individual entry in a queue
   localparam queue_addr_width = clogb(num_slots_per_queue);
   
   // difference between the two
   localparam addr_pad_width = addr_width - queue_addr_width;
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   input clk;
   input reset;

   // activity indicator for insertion
   input push_active;

   // insert data
   input push_valid;
   
   // queue to insert into
   input [0:num_queues-1] push_sel_qu;
   
   // location of next insertion
   output [0:num_queues*addr_width-1] push_addr_qu;
   wire [0:num_queues*addr_width-1]   push_addr_qu;
   
   // activity indicator for read / removal
   input 			      pop_active;
   
   // read and remove data
   input 			      pop_valid;
   
   // queue to remove from
   input [0:num_queues-1] 	      pop_sel_qu;
   
   // location of next element to be read
   output [0:num_queues*addr_width-1] pop_addr_qu;
   wire [0:num_queues*addr_width-1]   pop_addr_qu;
   
   // location of the element after the next one to be read
   output [0:num_queues*addr_width-1] pop_next_addr_qu;
   wire [0:num_queues*addr_width-1]   pop_next_addr_qu;
   
   // queue state flags
   output [0:num_queues-1] 	      almost_empty_qu;
   wire [0:num_queues-1] 	      almost_empty_qu;
   output [0:num_queues-1] 	      empty_qu;
   wire [0:num_queues-1] 	      empty_qu;
   output [0:num_queues-1] 	      full_qu;
   wire [0:num_queues-1] 	      full_qu;
   
   // internal error conditions detected
   output [0:num_queues*2-1] 	      errors_qu;
   wire [0:num_queues*2-1] 	      errors_qu;
   
   
   genvar 			      queue;
   
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
	   
	   wire [0:addr_width-1] push_addr;
	   wire [0:addr_width-1] pop_addr;
	   wire 		 almost_empty;
	   wire 		 empty;
	   wire 		 full;
	   wire [0:1] 		 errors;
	   c_fifo_ctrl
	     #(.depth(num_slots_per_queue),
	       .extra_addr_width(addr_pad_width),
	       .offset(queue * num_slots_per_queue),
	       .fast_almost_empty(fast_almost_empty),
	       .enable_bypass(enable_bypass),
	       .reset_type(reset_type))
	   fc
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
	   
	   wire [0:addr_width-1] pop_next_addr;
	   
	   if(num_slots_per_queue == 1)
	     assign pop_next_addr = pop_addr;
	   else if(num_slots_per_queue > 1)
	     begin
		
		if(fast_pop_next_addr)
		  begin
		     
		     wire [0:addr_width-1] pop_next_addr_inc;
		     c_incr
		       #(.width(addr_width),
			 .min_value(queue * num_slots_per_queue),
			 .max_value((queue + 1) * num_slots_per_queue - 1))
		     pop_next_addr_inc_incr
		       (.data_in(pop_next_addr),
			.data_out(pop_next_addr_inc));
		     
		     wire [0:addr_width-1] pop_next_addr_s, pop_next_addr_q;
		     assign pop_next_addr_s
		       = pop ? pop_next_addr_inc : pop_next_addr_q;
		     c_dff
		       #(.width(addr_width),
			 .reset_value(queue * num_slots_per_queue + 1),
			 .reset_type(reset_type))
		     pop_next_addrq
		       (.clk(clk),
			.reset(reset),
			.active(pop_active),
			.d(pop_next_addr_s),
			.q(pop_next_addr_q));
		     
		     assign pop_next_addr = pop_next_addr_q;
		     
		  end
		else
		  begin
		     
		     c_incr
		       #(.width(addr_width),
			 .min_value(queue * num_slots_per_queue),
			 .max_value((queue + 1) * num_slots_per_queue - 1))
		     pop_next_addr_incr
		       (.data_in(pop_addr),
			.data_out(pop_next_addr));
		     
		  end
		
	     end
	   
	   assign push_addr_qu[queue*addr_width:(queue+1)*addr_width-1]
	     = push_addr;
	   assign pop_addr_qu[queue*addr_width:(queue+1)*addr_width-1]
	     = pop_addr;
	   assign pop_next_addr_qu[queue*addr_width:(queue+1)*addr_width-1]
	     = pop_next_addr;
	   assign full_qu[queue] = full;
	   assign almost_empty_qu[queue] = almost_empty;
	   assign empty_qu[queue] = empty;
	   assign errors_qu[queue*2:queue*2+1] = errors;
	   
	end
      
   endgenerate
   
endmodule
