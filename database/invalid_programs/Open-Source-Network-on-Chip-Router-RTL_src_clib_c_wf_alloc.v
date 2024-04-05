// $Id: c_wf_alloc.v 5188 2012-08-30 00:31:31Z dub $

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
// generic wavefront allocator
//==============================================================================

module c_wf_alloc
  (clk, reset, active, req_pr, gnt_pr, gnt, update);
   
`include "c_constants.v"
   
   // number of input/output ports
   // each input can bid for any combination of outputs
   parameter num_ports = 8;
   
   // number of priority levels
   parameter num_priorities = 1;
   
   // when selecting next priority diagonal, skip diagonals without requests
   parameter skip_empty_diags = 0;
   
   // select implementation variant
   parameter wf_alloc_type = `WF_ALLOC_TYPE_REP;
   
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
	   
	   case(wf_alloc_type)
	     `WF_ALLOC_TYPE_MUX:
	       begin
		  c_wf_alloc_mux
		    #(.num_ports(num_ports),
		      .num_priorities(num_priorities),
		      .skip_empty_diags(skip_empty_diags),
		      .reset_type(reset_type))
		  core_mux
		    (.clk(clk),
		     .reset(reset),
		     .active(active),
		     .req_pr(req_pr),
		     .gnt_pr(gnt_pr),
		     .gnt(gnt),
		     .update(update));
	       end
	     `WF_ALLOC_TYPE_REP:
	       begin
		  c_wf_alloc_rep
		    #(.num_ports(num_ports),
		      .num_priorities(num_priorities),
		      .skip_empty_diags(skip_empty_diags),
		      .reset_type(reset_type))
		  core_rep
		    (.clk(clk),
		     .reset(reset),
		     .active(active),
		     .req_pr(req_pr),
		     .gnt_pr(gnt_pr),
		     .gnt(gnt),
		     .update(update));
	       end
	     `WF_ALLOC_TYPE_DPA:
	       begin
		  c_wf_alloc_dpa
		    #(.num_ports(num_ports),
		      .num_priorities(num_priorities),
		      .skip_empty_diags(skip_empty_diags),
		      .reset_type(reset_type))
		  core_dpa
		    (.clk(clk),
		     .reset(reset),
		     .active(active),
		     .req_pr(req_pr),
		     .gnt_pr(gnt_pr),
		     .gnt(gnt),
		     .update(update));
	       end      
	     `WF_ALLOC_TYPE_ROT:
	       begin
		  c_wf_alloc_rot
		    #(.num_ports(num_ports),
		      .num_priorities(num_priorities),
		      .skip_empty_diags(skip_empty_diags),
		      .reset_type(reset_type))
		  core_rot
		    (.clk(clk),
		     .reset(reset),
		     .active(active),
		     .req_pr(req_pr),
		     .gnt_pr(gnt_pr),
		     .gnt(gnt),
		     .update(update));
	       end
	     `WF_ALLOC_TYPE_LOOP:
	       begin
		  c_wf_alloc_loop
		    #(.num_ports(num_ports),
		      .num_priorities(num_priorities),
		      .skip_empty_diags(skip_empty_diags),
		      .reset_type(reset_type))
		  core_loop
		    (.clk(clk),
		     .reset(reset),
		     .active(active),
		     .req_pr(req_pr),
		     .gnt_pr(gnt_pr),
		     .gnt(gnt),
		     .update(update));
	       end
	     `WF_ALLOC_TYPE_SDPA:
	       begin
		  c_wf_alloc_sdpa
		    #(.num_ports(num_ports),
		      .num_priorities(num_priorities),
		      .skip_empty_diags(skip_empty_diags),
		      .reset_type(reset_type))
		  core_sdpa
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
