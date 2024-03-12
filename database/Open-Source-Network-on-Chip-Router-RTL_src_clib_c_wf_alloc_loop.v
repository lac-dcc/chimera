// $Id: c_wf_alloc_loop.v 5188 2012-08-30 00:31:31Z dub $

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
// wavefront allocator variant which uses wraparound (forming a false 
// combinational loop) as described in Dally et al, "Principles and Practices of
// Interconnection Networks"
//==============================================================================

module c_wf_alloc_loop
  (clk, reset, active, req_pr, gnt_pr, gnt, update);
   
`include "c_constants.v"
   
   // number of input/output ports
   // each input can bid for any combination of outputs
   parameter num_ports = 8;
   
   // number of priority levels
   parameter num_priorities = 1;
   
   // when selecting next priority diagonal, skip diagonals without requests
   parameter skip_empty_diags = 0;
   
   // reset value for priority pointer
   localparam [0:num_ports-1] prio_init = {1'b1, {(num_ports-1){1'b0}}};
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   input active;
   
   // request matrix
   input [0:num_priorities*num_ports*num_ports-1] req_pr;
   
   // grant matrix
   output [0:num_priorities*num_ports*num_ports-1] gnt_pr;
   wire [0:num_priorities*num_ports*num_ports-1]   gnt_pr;
   
   // combined grant matrix
   output [0:num_ports*num_ports-1] 		   gnt;
   wire [0:num_ports*num_ports-1] 		   gnt;
   
   // update port priorities
   input 					   update;
   
   wire [0:num_ports-1] 			   prio_next;
   
   // Need to make sure priority is one-hot, otherwise conflicting grants can be
   // generated!
   wire [0:num_ports-1] 			   prio_s, prio_q;
   assign prio_s = update ? prio_next : prio_q;
   c_dff
     #(.width(num_ports),
       .reset_type(reset_type),
       .reset_value(prio_init))
   prioq
     (.clk(clk),
      .reset(reset),
      .active(active),
      .d(prio_s),
      .q(prio_q));
   
   generate

      wire [0:num_priorities*num_ports-1] 	   first_diag_pr;
      
      if(skip_empty_diags)
	begin
	   
	   wire [0:num_ports-1] first_diag;
	   
	   if(num_priorities == 1)
	     assign first_diag = first_diag_pr;
	   else if(num_priorities > 1)
	     begin
		
		wire [0:num_priorities-1] any_req_pr;
		c_reduce_bits
		  #(.num_ports(num_priorities),
		    .width(num_ports),
		    .op(`BINARY_OP_OR))
		any_req_pr_rb
		  (.data_in(first_diag_pr),
		   .data_out(any_req_pr));
		
		wire [0:num_priorities-1] 	  any_req_mod_pr;
		assign any_req_mod_pr = {any_req_pr[0:num_priorities-2], 1'b1};
		
		wire [0:num_priorities-1] 	  sel_pr;
		c_lod
		  #(.width(num_priorities))
		sel_pr_lod
		  (.data_in(any_req_mod_pr),
		   .data_out(sel_pr));
		
		c_select_1ofn
		  #(.num_ports(num_priorities),
		    .width(num_ports))
		prio_next_sel
		  (.select(sel_pr),
		   .data_in(first_diag_pr),
		   .data_out(first_diag));
		
	     end
	   
	   assign prio_next
	     = {first_diag[num_ports-1], first_diag[0:num_ports-2]};
	   
	end
      else
	assign prio_next = {prio_q[num_ports-1], prio_q[0:num_ports-2]};
      
      wire [0:num_priorities*num_ports*num_ports-1] gnt_intm_pr;
      assign gnt = gnt_intm_pr[(num_priorities-1)*num_ports*num_ports:
			       num_priorities*num_ports*num_ports-1];
      
      genvar 					    pr;
      
      for(pr = 0; pr < num_priorities; pr = pr + 1)
	begin:prs
	   
	   wire [0:num_ports*num_ports-1] req;
	   assign req
	     = req_pr[pr*num_ports*num_ports:(pr+1)*num_ports*num_ports-1];
	   
	   if(skip_empty_diags)
	     begin
		
		wire [0:num_ports-1] req_on_diag;
		c_diag_op
		  #(.width(num_ports),
		    .op(`BINARY_OP_OR))
		req_on_diag_dop
		  (.data_in(req),
		   .data_out(req_on_diag));
		
		wire [0:num_ports-1] first_diag;
		c_prefix_arbiter_base
		  #(.num_ports(num_ports))
		first_diag_pa
		  (.prio_port(prio_q),
		   .req(req_on_diag),
		   .gnt(first_diag));
		
		assign first_diag_pr[pr*num_ports:(pr+1)*num_ports-1]
		  = first_diag;
		
	     end
	   
	   wire [0:num_ports*num_ports-1] gnt_intm_in;
	   if(pr == 0)
	     assign gnt_intm_in = {(num_ports*num_ports){1'b0}};
	   else if(pr > 0)
	     assign gnt_intm_in
	       = gnt_intm_pr[(pr-1)*num_ports*num_ports:
			     pr*num_ports*num_ports-1];
	   
	   wire [0:num_ports-1] 	  row_gnt;
	   c_reduce_bits
	     #(.num_ports(num_ports),
	       .width(num_ports),
	       .op(`BINARY_OP_OR))
	   row_gnt_rb
	     (.data_in(gnt_intm_in),
	      .data_out(row_gnt));
	   
	   wire [0:num_ports-1] 	  col_gnt;
	   c_binary_op
	     #(.num_ports(num_ports),
	       .width(num_ports),
	       .op(`BINARY_OP_OR))
	   col_gnt_bop
	     (.data_in(gnt_intm_in),
	      .data_out(col_gnt));
	   
	   wire [0:num_ports*num_ports-1] mask;
	   c_mat_mult
	     #(.dim1_width(num_ports),
	       .dim2_width(1),
	       .dim3_width(num_ports),
	       .prod_op(`BINARY_OP_NOR),
	       .sum_op(`BINARY_OP_OR))
	   mask_mmult
	     (.input_a(row_gnt),
	      .input_b(col_gnt),
	      .result(mask));
	   
	   wire [0:num_ports*num_ports-1] req_masked;
	   assign req_masked = req & mask;
	   
	   wire [0:num_ports*num_ports-1] gnt;
	   assign gnt_pr[pr*num_ports*num_ports:(pr+1)*num_ports*num_ports-1]
	     = gnt;
	   
	   wire [0:num_ports*num_ports-1] gnt_intm_out;
	   assign gnt_intm_out = gnt_intm_in | gnt;
	   
	   assign gnt_intm_pr[pr*num_ports*num_ports:
			      (pr+1)*num_ports*num_ports-1]
	     = gnt_intm_out;
	   
	   wire [0:num_ports*num_ports-1] x_pri;
	   wire [0:num_ports*num_ports-1] y_pri;
	   
	   genvar 			  row;
	   for(row = 0; row < num_ports; row = row + 1)
	     begin:rows
		genvar col;
		for(col = 0; col < num_ports; col = col + 1)
		  begin:cols
		     
		     wire req_in;
		     assign req_in = req_masked[row*num_ports+col];
		     
		     wire x_pri_in;
		     assign x_pri_in
		       = x_pri[row*num_ports + ((col+num_ports-1)%num_ports)] |
			 prio_q[(row+col)%num_ports];
		     
		     wire y_pri_in;
		     assign y_pri_in
		       = y_pri[((row+num_ports-1)%num_ports)*num_ports + col] |
			 prio_q[(row+col)%num_ports];
		     
		     wire gnt_out;
		     assign gnt_out = req_in & x_pri_in & y_pri_in;
		     assign gnt[row*num_ports+col] = gnt_out;
		     
		     wire x_pri_out;
		     assign x_pri_out = x_pri_in & ~gnt_out;
		     assign x_pri[row*num_ports+col] = x_pri_out;
		     
		     wire y_pri_out;
		     assign y_pri_out = y_pri_in & ~gnt_out;
		     assign y_pri[row*num_ports+col] = y_pri_out;
		     
		  end
		
	     end
	   
	end
      
   endgenerate
   
endmodule
