// $Id: c_damq_ctrl.v 5188 2012-08-30 00:31:31Z dub $

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

module c_damq_ctrl
  (clk, reset, push_active, push_valid, push_sel_qu, push_addr, pop_active, 
   pop_valid, pop_sel_qu, pop_addr_qu, pop_next_addr_qu, almost_empty_qu, 
   empty_qu, full, errors_qu);
   
`include "c_functions.v"
`include "c_constants.v"
   
   
   //---------------------------------------------------------------------------
   // parameters
   //---------------------------------------------------------------------------
   
   // number of queues
   parameter num_queues = 4;
   
   // total number of buffer entries
   parameter num_slots = 8;
   
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
   
   // address width required for selecting an individual entry
   localparam addr_width = clogb(num_slots);
   
   
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
   output [0:addr_width-1] push_addr;
   wire [0:addr_width-1]   push_addr;
   
   // activity indicator for read / removal
   input 		   pop_active;
   
   // read and remove data
   input 		   pop_valid;
   
   // queue to remove from
   input [0:num_queues-1]  pop_sel_qu;
   
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
   output 			      full;
   wire 			      full;
   
   // internal error conditions detected
   output [0:num_queues*2-1] 	      errors_qu;
   wire [0:num_queues*2-1] 	      errors_qu;
   
   
   // synopsys translate_off
   
   generate
      
      if(fast_almost_empty)
	begin
	   
	   initial
	     begin
		$display({"ERROR: DAMQ controller %m does not support ", 
			  "fast_almost_empty=1."});
		$stop;
	     end
	   
	end
      
      if(num_slots < 2)
	begin
	   
	   initial
	     begin
		$display({"ERROR: DAMQ controller %m requires at least two ",
			  "slots."});
		$stop;
	     end
	   
	end
      
   endgenerate
   
   // synopsys translate_on
   
   wire 		 active;
   assign active = push_active | pop_active;
   
   wire [0:num_queues*addr_width-1] queue_tail_addr_qu;
   
   wire [0:addr_width-1] 	    push_queue_tail_addr;
   c_select_1ofn
     #(.num_ports(num_queues),
       .width(addr_width))
   push_queue_tail_addr_sel
     (.select(push_sel_qu),
      .data_in(queue_tail_addr_qu),
      .data_out(push_queue_tail_addr));
   
   wire [0:addr_width-1] 	    free_head_addr;
   
   wire [0:addr_width-1] 	    next_queue_tail_addr;
   assign next_queue_tail_addr = free_head_addr;
   
   wire [0:num_queues*addr_width-1] queue_head_addr_qu;
   
   wire [0:addr_width-1] 	    pop_queue_head_addr;
   c_select_1ofn
     #(.num_ports(num_queues),
       .width(addr_width))
   pop_queue_head_addr_sel
     (.select(pop_sel_qu),
      .data_in(queue_head_addr_qu),
      .data_out(pop_queue_head_addr));
   
   wire [0:addr_width-1] 	    next_free_tail_addr;
   
   generate
      
      if(enable_bypass)
	begin
	   
	   wire pop_empty;
	   c_select_1ofn
	     #(.num_ports(num_queues),
	       .width(1))
	   pop_empty_sel
	     (.select(pop_sel_qu),
	      .data_in(empty_qu),
	      .data_out(pop_empty));
	   
	   assign next_free_tail_addr
	     = pop_empty ? free_head_addr : pop_queue_head_addr;
	   
	end
      else
	assign next_free_tail_addr = pop_queue_head_addr;
      
   endgenerate
   
   wire 	push_empty;
   c_select_1ofn
     #(.num_ports(num_queues),
       .width(1))
   push_empty_sel
     (.select(push_sel_qu),
      .data_in(empty_qu),
      .data_out(push_empty));
   
   wire 	update_queue_tail;
   assign update_queue_tail = push_valid & ~push_empty;

   wire 	update_free_tail;
   assign update_free_tail = pop_valid & ~full;
   
   wire [0:num_slots-1] 	    push_queue_tail_sel_sl;
   c_decode
     #(.num_ports(num_slots))
   push_queue_tail_sel_sl_dec
     (.data_in(push_queue_tail_addr),
      .data_out(push_queue_tail_sel_sl));

   wire [0:addr_width-1] 	    free_tail_addr;
   
   wire [0:num_slots-1] 	    free_tail_sel_sl;
   c_decode
     #(.num_ports(num_slots))
   free_tail_sel_sl_dec
     (.data_in(free_tail_addr),
      .data_out(free_tail_sel_sl));
   
   wire [0:num_slots*addr_width-1]  addr_sl;
   
   genvar 			    slot;
   
   generate
      
      for(slot = 0; slot < num_slots; slot = slot + 1)
	begin:slots
	   
	   wire push_queue_tail_sel;
	   assign push_queue_tail_sel = push_queue_tail_sel_sl[slot];
	   
	   wire free_tail_sel;
	   assign free_tail_sel = free_tail_sel_sl[slot];
	   
	   wire [0:1] update_sel;
	   assign update_sel = {update_queue_tail & push_queue_tail_sel,
				update_free_tail & free_tail_sel};
	   
	   wire       update;
	   assign update = |update_sel;
	   
	   wire [0:addr_width-1] next_addr;
	   c_select_1ofn
	     #(.num_ports(2),
	       .width(addr_width))
	   next_addr_sel
	     (.select(update_sel),
	      .data_in({next_queue_tail_addr, next_free_tail_addr}),
	      .data_out(next_addr));
	   
	   wire [0:addr_width-1] addr_s, addr_q;
	   assign addr_s = update ? next_addr : addr_q;
	   c_dff
	     #(.width(addr_width),
	       .reset_value((slot + 1) % num_slots),
	       .reset_type(reset_type))
	   addrq
	     (.clk(clk),
	      .reset(reset),
	      .active(active),
	      .d(addr_s),
	      .q(addr_q));
	   
	   assign addr_sl[slot*addr_width:(slot+1)*addr_width-1] = addr_q;
	   
	end
      
   endgenerate
   
   wire [0:addr_width-1] 	    next_free_head_addr;
   assign next_free_head_addr
     = addr_sl[free_head_addr*addr_width +: addr_width];
   
   wire 			    equal;
   assign equal = (free_head_addr == free_tail_addr);
   
   wire [0:addr_width-1] 	    pop_addr;
   c_select_1ofn
     #(.num_ports(num_queues),
       .width(addr_width))
   pop_addr_sel
     (.select(pop_sel_qu),
      .data_in(pop_addr_qu),
      .data_out(pop_addr));
   
   wire [0:addr_width-1] 	    free_head_addr_s, free_head_addr_q;
   assign free_head_addr_s
     = ((full | (equal & push_valid)) & pop_valid) ? 
       pop_addr : 
       (push_valid ? next_free_head_addr : free_head_addr_q);
   
   c_dff
     #(.width(addr_width),
       .reset_type(reset_type))
   free_head_addrq
     (.clk(clk),
      .reset(reset),
      .active(active),
      .d(free_head_addr_s),
      .q(free_head_addr_q));
   
   assign free_head_addr = free_head_addr_q;
   
   wire [0:addr_width-1] 	    free_tail_addr_s, free_tail_addr_q;
   assign free_tail_addr_s = pop_valid ? next_free_tail_addr : free_tail_addr_q;
   c_dff
     #(.width(addr_width),
       .reset_value(num_slots - 1),
       .reset_type(reset_type))
   free_tail_addrq
     (.clk(clk),
      .reset(reset),
      .active(pop_active),
      .d(free_tail_addr_s),
      .q(free_tail_addr_q));
   
   assign free_tail_addr = free_tail_addr_q;
   
   wire 			    full_s, full_q;
   assign full_s = (full | (equal & push_valid)) & ~pop_valid;
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
   
   wire 			    error_overflow;
   assign error_overflow = full & push_valid;
   
   // synopsys translate_off
   
   always @(posedge clk)
     begin
	
	if(error_overflow)
	  $display("ERROR: FIFO overflow in module %m.");
	
     end
   
   // synopsys translate_on
   
   assign push_addr = free_head_addr;
   
   // synopsys translate_off
   
   wire [0:num_slots-1] push_mask;
   c_decode
     #(.num_ports(num_slots))
   push_mask_dec
     (.data_in(push_addr),
      .data_out(push_mask));
   
   wire [0:num_slots-1]  pop_mask;
   c_decode
     #(.num_ports(num_slots))
   pop_mask_dec
     (.data_in(pop_addr),
      .data_out(pop_mask));
   
   wire [0:num_slots-1]  unused_s, unused_q;
   assign unused_s = (unused_q & ~({num_slots{push_valid}} & push_mask)) |
		     ({num_slots{pop_valid}} & pop_mask);
   c_dff
     #(.width(num_slots),
       .reset_value({num_slots{1'b1}}),
       .reset_type(reset_type))
   unusedq
     (.clk(clk),
      .reset(reset),
      .active(active),
      .d(unused_s),
      .q(unused_q));
   
   wire [0:num_queues*num_slots-1] used_by_queue;
   
   wire [0:num_slots*num_queues-1] used_by_slot;
   c_interleave
     #(.width(num_queues*num_slots),
       .num_blocks(num_queues))
   used_by_slot_intl
     (.data_in(used_by_queue),
      .data_out(used_by_slot));
   
   generate
      
      for(slot = 0; slot < num_slots; slot = slot + 1)
	begin:chk_slots
	   
	   wire [0:num_queues-1] used;
	   assign used = used_by_slot[slot*num_queues:(slot+1)*num_queues-1];
	   
	   wire 		  multi_used;
	   c_multi_hot_det
	     #(.width(num_queues))
	   multi_use_mhd
	     (.data(used),
	      .multi_hot(multi_used));
	   
	   wire 		  used_and_unused;
	   assign used_and_unused = unused_q[slot] & (|used);
	   
	   wire 		  used_nor_unused;
	   assign used_nor_unused = ~unused_q[slot] & (~|used);
	   
	   always @(posedge clk)
	     begin
		if(multi_used)
		  begin
		     $display({"ERROR: slot %d is used by multiple queues in ",
			       "%m."}, slot);
		     $stop;
		  end
		if(used_and_unused)
		  begin
		     $display({"ERROR: slot %d is both in use and in free ",
			       "list in %m."}, slot);
		     $stop;
		  end
		if(used_nor_unused)
		  begin
		     $display({"ERROR: slot %d is neither in use nore in ",
			       "free list in %m."}, slot);
		     $stop;
		  end
	     end
	   
	end
      
   endgenerate
   
   always @(posedge clk)
     begin
	if(~full & ~unused_q[free_head_addr])
	  begin
	     $display("ERROR: Invalid free head pointer in %m.");
	     $stop;
	  end
	if(~full & ~unused_q[free_tail_addr])
	  begin
	     $display("ERROR: Invalid free tail pointer in %m.");
	     $stop;
	  end
     end
   
   // synopsys translate_on
   
   genvar 			    queue;
   
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
	   
	   wire empty;
	   
	   wire [0:addr_width-1] head_addr;
	   wire [0:addr_width-1] tail_addr;
	   
	   wire 		 equal;
	   assign equal = (head_addr == tail_addr);
	   
	   wire [0:addr_width-1] next_head_addr;
	   
	   if(fast_pop_next_addr)
	     begin
		
		wire next_equal;
		assign next_equal = (next_head_addr == tail_addr);
		
		wire [0:addr_width-1] next_next_head_addr;
		assign next_next_head_addr
		  = addr_sl[next_head_addr*addr_width +: addr_width];
		
		wire [0:addr_width-1] next_head_addr_s, next_head_addr_q;
		assign next_head_addr_s
		  = ((equal | (next_equal & pop_valid_sel)) & push_valid_sel) ?
		    free_head_addr :
		    (pop_valid_sel ? next_next_head_addr : next_head_addr_q);
		c_dff
		  #(.width(addr_width),
		    .reset_type(reset_type))
		next_head_addrq
		  (.clk(clk),
		   .reset(1'b0),
		   .active(active),
		   .d(next_head_addr_s),
		   .q(next_head_addr_q));
		
		assign next_head_addr = next_head_addr_q;
		
	     end
	   else
	     assign next_head_addr
	       = addr_sl[head_addr*addr_width +: addr_width];
	   
	   wire [0:addr_width-1] head_addr_s, head_addr_q;
	   assign head_addr_s
	     = ((empty | (equal & pop_valid_sel)) & push_valid_sel) ?
	       free_head_addr :
	       (pop_valid_sel ? next_head_addr : head_addr_q);
	   c_dff
	     #(.width(addr_width),
	       .reset_type(reset_type))
	   head_addrq
	     (.clk(clk),
	      .reset(1'b0),
	      .active(active),
	      .d(head_addr_s),
	      .q(head_addr_q));
	   
	   assign head_addr = head_addr_q;
	   
	   wire [0:addr_width-1] tail_addr_s, tail_addr_q;
	   assign tail_addr_s = push_valid_sel ? free_head_addr : tail_addr_q;
	   c_dff
	     #(.width(addr_width),
	       .reset_type(reset_type))
	   tail_addrq
	     (.clk(clk),
	      .reset(1'b0),
	      .active(push_active),
	      .d(tail_addr_s),
	      .q(tail_addr_q));
	   
	   assign tail_addr = tail_addr_q;
	   
	   wire 		 almost_empty;
	   assign almost_empty = ~empty & equal;
	   
	   wire 		 empty_s, empty_q;
	   if(enable_bypass)
	     assign empty_s = empty ? 
			      ~(push_valid_sel & ~pop_valid_sel) : 
			      (equal & (~push_valid_sel & pop_valid_sel));
	   else
	     assign empty_s
	       = (empty | (equal & pop_valid_sel)) & ~push_valid_sel;
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
	   
	   wire 		 error_underflow;
	   if(enable_bypass)
	     assign error_underflow = empty & ~push_valid_sel & pop_valid_sel;
	   else
	     assign error_underflow = empty & pop_valid_sel;
	   
	   // synopsys translate_off
	   
	   always @(posedge clk)
	     begin
		
		if(error_underflow)
		  $display("ERROR: FIFO underflow in module %m, queue %d.", 
			   queue);
		
	     end
	   
	   // synopsys translate_on
	   
	   wire [0:1] errors;
	   assign errors[0] = error_underflow;
	   assign errors[1] = error_overflow;
	   
	   wire [0:addr_width-1] pop_addr;
	   if(enable_bypass)
	     assign pop_addr = empty ? free_head_addr : head_addr;
	   else
	     assign pop_addr = head_addr;
	   
	   wire [0:addr_width-1] pop_next_addr;
	   assign pop_next_addr = next_head_addr;
	   
	   assign queue_head_addr_qu[queue*addr_width:(queue+1)*addr_width-1]
	     = head_addr;
	   assign queue_tail_addr_qu[queue*addr_width:(queue+1)*addr_width-1]
	     = tail_addr;
	   assign pop_addr_qu[queue*addr_width:(queue+1)*addr_width-1]
	     = pop_addr;
	   assign pop_next_addr_qu[queue*addr_width:(queue+1)*addr_width-1]
	     = pop_next_addr;
	   assign almost_empty_qu[queue] = almost_empty;
	   assign empty_qu[queue] = empty;
	   assign errors_qu[queue*2:queue*2+1] = errors;
	   
	   // synopsys translate_off
	   
	   wire [0:num_slots-1]  used_s, used_q;
	   assign used_s
	     = (used_q | ({num_slots{push_valid_sel}} & push_mask)) & 
	       ~({num_slots{pop_valid_sel}} & pop_mask);
	   c_dff
	     #(.width(num_slots),
	       .reset_type(reset_type))
	   usedq
	     (.clk(clk),
	      .reset(reset),
	      .active(active),
	      .d(used_s),
	      .q(used_q));
	   
	   assign used_by_queue[queue*num_slots:(queue+1)*num_slots-1] = used_q;
	   
	   always @(posedge clk)
	     begin
		if(~empty & ~used_q[head_addr])
		  begin
		     $display("ERROR: Invalid head pointer in queue %d in %m.",
			      queue);
		     $stop;
		  end
		if(~empty & ~used_q[tail_addr])
		  begin
		     $display("ERROR: Invalid tail pointer in queue %d in %m.",
			      queue);
		     $stop;
		  end
	     end
	   
	   // synopsys translate_on
	   
	end
      
   endgenerate
   
endmodule
