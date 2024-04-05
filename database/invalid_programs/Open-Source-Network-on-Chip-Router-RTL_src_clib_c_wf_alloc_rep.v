// $Id: c_wf_alloc_rep.v 5188 2012-08-30 00:31:31Z dub $

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
// wavefront allocator variant which replicates the entire allocation logic for
// the different priorities and selects the result from the appropriate one
//==============================================================================

module c_wf_alloc_rep
  (clk, reset, active, req_pr, gnt_pr, gnt, update);
   
`include "c_functions.v"
`include "c_constants.v"
   
   // number of input/output ports
   // each input can bid for any combination of outputs
   parameter num_ports = 8;
   
   // number of priority levels
   parameter num_priorities = 1;
   
   // width of priority selector
   localparam port_idx_width = clogb(num_ports);
   
   // when selecting next priority diagonal, skip diagonals without requests
   parameter skip_empty_diags = 0;
   
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
   
   wire [0:port_idx_width-1] 			   prio_next;
   
   wire [0:port_idx_width-1] 			   prio_s, prio_q;
   assign prio_s = update ? prio_next : prio_q;
   c_dff
     #(.width(port_idx_width),
       .reset_type(reset_type))
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
	   
	   c_encode
	     #(.num_ports(num_ports),
	       .offset(1))
	   prio_next_enc
	     (.data_in(first_diag),
	      .data_out(prio_next));
	   
	end
      else
	begin
	   
	   c_incr
	     #(.width(port_idx_width),
	       .min_value(0),
	       .max_value(num_ports-1))
	   prio_next_incr
	     (.data_in(prio_q),
	      .data_out(prio_next));
	   
	end
      
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
		
		wire [0:num_ports-1] prio_port;
		c_decode
		  #(.num_ports(num_ports))
		prio_port_dec
		  (.data_in(prio_q),
		   .data_out(prio_port));
		
		wire [0:num_ports-1] first_diag;
		c_prefix_arbiter_base
		  #(.num_ports(num_ports))
		first_diag_pa
		  (.prio_port(prio_port),
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
	   
	   wire [0:num_ports*num_ports*num_ports-1] gnt_by_prio;
	   assign gnt
	     = gnt_by_prio[prio_q*num_ports*num_ports +: num_ports*num_ports];
	   
	   genvar 				    prio;
	   for(prio = 0; prio < num_ports; prio = prio + 1)
	     begin:prios
		
		wire [0:num_ports*num_ports-1] req_int;
		wire [0:num_ports*num_ports-1] gnt_int;
		wire [0:num_ports*num_ports-1] y;
		
		genvar 			       row;		
		for(row = 0; row < num_ports; row = row + 1)
		  begin:rows
		     
		     wire [0:num_ports-1] x_in, y_in;
		     wire [0:num_ports]   x_out, y_out;
		     wire [0:num_ports-1] req_in;
		     wire [0:num_ports-1] gnt_out;
		     
		     assign x_in = x_out[0:num_ports-1];
		     assign y_in
		       = y[((row+num_ports)%num_ports)*num_ports:
			   ((row+num_ports)%num_ports+1)*num_ports-1];
		     assign req_in = req_int[row*num_ports:
					     (row+1)*num_ports-1];
		     
		     assign x_out = {1'b1, (~y_in | ~req_in) & x_in};
		     assign y_out = {1'b1, (~x_in | ~req_in) & y_in};
		     assign gnt_out = req_in & x_in & y_in;
		     
		     assign y[((row+num_ports+1)%num_ports)*num_ports:
			      ((row+num_ports+1)%num_ports+1)*num_ports-1]
		       = y_out[0:num_ports-1];
		     assign gnt_int[row*num_ports:(row+1)*num_ports-1]
		       = gnt_out;
		     
		     genvar 		  col;
		     for(col = 0; col < num_ports; col = col + 1)
		       begin:cols
			  
			  assign req_int[row*num_ports+col] 
			    = req_masked[((prio+row)%num_ports)*num_ports +
					 (num_ports-row+col)%num_ports];
			  assign gnt_by_prio[((prio+row)%num_ports)*
					     num_ports +
					     (num_ports-row+col)%num_ports +
					     prio*num_ports*num_ports]
			    = gnt_int[row*num_ports+col];
			  
		       end
		     
		  end
		
	     end
	   
	end
      
   endgenerate
   
endmodule
