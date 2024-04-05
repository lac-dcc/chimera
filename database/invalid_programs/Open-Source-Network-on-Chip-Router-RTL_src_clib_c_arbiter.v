// $Id: c_arbiter.v 5188 2012-08-30 00:31:31Z dub $

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
// generic arbiter
//==============================================================================

module c_arbiter
  (clk, reset, active, req_pr, gnt_pr, gnt, update);
   
`include "c_functions.v"
`include "c_constants.v"
   
   // number of input ports
   parameter num_ports = 32;
   
   // number of priority levels
   parameter num_priorities = 1;
   
   // number fo bits required to select a port
   localparam port_idx_width = clogb(num_ports);
   
   // select type of arbiter to use
   parameter arbiter_type = `ARBITER_TYPE_ROUND_ROBIN_BINARY;
   
   // for round-robin style arbiters, should state be stored in encoded form?
   localparam encode_state
     = (arbiter_type==`ARBITER_TYPE_ROUND_ROBIN_BINARY) ||
       (arbiter_type==`ARBITER_TYPE_PREFIX_BINARY);
   
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
   
   generate
      
      if(num_ports == 1)
	begin
	   
	   c_lod
	     #(.width(num_priorities))
	   gnt_lod
	     (.data_in(req_pr),
	      .data_out(gnt_pr));
	   
	   assign gnt = |req_pr;
	   
	end
      else if(num_ports > 1)
	begin
	   
	   case(arbiter_type)
	     
	     `ARBITER_TYPE_ROUND_ROBIN_BINARY,
	     `ARBITER_TYPE_ROUND_ROBIN_ONE_HOT:
	       begin
		  
		  c_rr_arbiter
		    #(.num_ports(num_ports),
		      .num_priorities(num_priorities),
		      .encode_state(encode_state),
		      .reset_type(reset_type))
		  rr_arb
		    (.clk(clk),
		     .reset(reset),
		     .active(active),
		     .req_pr(req_pr),
		     .gnt_pr(gnt_pr),
		     .gnt(gnt),
		     .update(update));
		  
	       end
	     
	     `ARBITER_TYPE_PREFIX_BINARY, `ARBITER_TYPE_PREFIX_ONE_HOT:
	       begin
		  
		  c_prefix_arbiter
		    #(.num_ports(num_ports),
		      .num_priorities(num_priorities),
		      .encode_state(encode_state),
		      .reset_type(reset_type))
		  prefix_arb
		    (.clk(clk),
		     .reset(reset),
		     .active(active),
		     .req_pr(req_pr),
		     .gnt_pr(gnt_pr),
		     .gnt(gnt),
		     .update(update));
		  
	       end
	     
	     `ARBITER_TYPE_MATRIX:
	       begin
		  
		  c_matrix_arbiter
		    #(.num_ports(num_ports),
		      .num_priorities(num_priorities),
		      .reset_type(reset_type))
		  matrix_arb
		    (.clk(clk),
		     .reset(reset),
		     .active(active),
		     .req_pr(req_pr),
		     .gnt_pr(gnt_pr),
		     .gnt(gnt),
		     .update(update));
		  
	       end
	     
	   endcase
	   
	end
      
   endgenerate
   
endmodule
