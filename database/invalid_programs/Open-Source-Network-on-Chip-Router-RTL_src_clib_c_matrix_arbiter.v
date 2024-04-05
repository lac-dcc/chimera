// $Id: c_matrix_arbiter.v 5188 2012-08-30 00:31:31Z dub $

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
// matrix arbiter
//==============================================================================

module c_matrix_arbiter
  (clk, reset, active, req_pr, gnt_pr, gnt, update);
   
`include "c_constants.v"
   
   // number of inputs ports
   parameter num_ports = 32;
   
   // number of priority levels
   parameter num_priorities = 1;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   input active;
   
   // request vector
   input [0:num_priorities*num_ports-1] req_pr;
   
   // grant vector
   output [0:num_priorities*num_ports-1] gnt_pr;
   wire [0:num_priorities*num_ports-1] 	 gnt_pr;
   
   // merged grant vector
   output [0:num_ports-1] 		 gnt;
   wire [0:num_ports-1] 		 gnt;
   
   // update port priorities
   input 				 update;
   
   wire [0:num_priorities*num_ports-1] 	 gnt_intm_pr;
   
   // port priority matrix
   wire [0:num_ports*num_ports-1] 	 state;
   
   genvar 				 row;
   
   generate
      
      for(row = 0; row < num_ports; row = row + 1)
	begin:rows
	   
	   genvar prio;
	   
	   for(prio = 0; prio < num_priorities; prio = prio + 1)
	     begin:prios
		
		// grant requests if we have precedence over all other 
		// requestors
		assign gnt_intm_pr[prio*num_ports+row] 
		  = req_pr[prio*num_ports+row] &
		    (&(state[row*num_ports:(row+1)*num_ports-1] | 
		       ~req_pr[prio*num_ports:(prio+1)*num_ports-1]));
		
	     end
	   
	   genvar col;
	   
	   for(col = 0; col < num_ports; col = col + 1)
	     begin:cols
		
		// lower triangle has inverted values of transposed upper 
		// triangle
		if(col < row)
		  assign state[row*num_ports+col] = ~state[col*num_ports+row];
		
		// diagonal has all ones
		else if(col == row)
		  assign state[row*num_ports+col] = 1'b1;
		
		// upper triangle has actual registers
		else if(col > row)
		  begin
		     
		     wire state_s, state_q;
		     assign state_s = update ? 
				      ((state_q | gnt[col]) & ~gnt[row]) : 
				      state_q;
		     c_dff
		       #(.width(1),
			 .reset_type(reset_type),
			 .reset_value(1'b1))
		     stateq
		       (.clk(clk),
			.reset(reset),
			.active(active),
			.d(state_s),
			.q(state_q));
		     
		     assign state[row*num_ports+col] = state_q;
		     
		  end
		
	     end
	   
	end
      
      if(num_priorities == 1)
	begin
	   assign gnt_pr = gnt_intm_pr;
	   assign gnt = gnt_intm_pr;
	end
      else if(num_priorities > 1)
	begin
	   
	   wire [0:num_priorities-1] 	any_req_pr;
	   c_reduce_bits
	     #(.num_ports(num_priorities),
	       .width(num_ports),
	       .op(`BINARY_OP_OR))
	   any_req_pr_rb
	     (.data_in(req_pr),
	      .data_out(any_req_pr));
	   
	   wire [0:num_priorities-1] 	any_req_mod_pr;
	   assign any_req_mod_pr = {any_req_pr[0:num_priorities-2], 1'b1};
	   
	   wire [0:num_priorities-1] 	sel_pr;
	   c_lod
	     #(.width(num_priorities))
	   sel_pr_lod
	     (.data_in(any_req_mod_pr),
	      .data_out(sel_pr));
	   
	   c_gate_bits
	     #(.num_ports(num_priorities),
	       .width(num_ports),
	       .op(`BINARY_OP_AND))
	   gnt_pr_gb
	     (.select(sel_pr),
	      .data_in(gnt_intm_pr),
	      .data_out(gnt_pr));
	   
	   c_select_1ofn
	     #(.num_ports(num_priorities),
	       .width(num_ports))
	   gnt_sel
	     (.select(sel_pr),
	      .data_in(gnt_intm_pr),
	      .data_out(gnt));
	   
	end
      
   endgenerate
   
endmodule
