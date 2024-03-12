// $Id: vcr_ovc_ctrl.v 5188 2012-08-30 00:31:31Z dub $

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
// output port controller (tracks state of buffers in downstream router)
//==============================================================================

module vcr_ovc_ctrl
  (clk, reset, vc_active, vc_gnt, vc_sel_ip, vc_sel_ivc, sw_active, sw_gnt, 
   sw_sel_ip, sw_sel_ivc, flit_valid, flit_tail, flit_sel, elig, full, 
   full_prev, empty);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
`include "vcr_constants.v"
   
   // number of VCs
   parameter num_vcs = 4;
   
   // number of input and output ports on router
   parameter num_ports = 5;
   
   // enable speculative switch allocation
   parameter sw_alloc_spec = 1;
   
   // select whether to exclude full or non-empty VCs from VC allocation
   parameter elig_mask = `ELIG_MASK_NONE;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   
   // activity indicator for VC allocation
   input vc_active;
   
   // output VC was granted to an input VC
   input vc_gnt;
   
   // input port that the output VC was granted to
   input [0:num_ports-1] vc_sel_ip;
   
   // input VC that the output VC was granted to
   input [0:num_vcs-1] 	 vc_sel_ivc;
   
   // activity indicator for switch allocation
   input 		 sw_active;
   
   // switch allocator grant
   input 		 sw_gnt;
   
   // which input port does the incoming flit come from?
   input [0:num_ports-1] sw_sel_ip;
   
   // which input VC does the incoming flit belong to?
   input [0:num_vcs-1] 	 sw_sel_ivc;
   
   // incoming flit is valid
   input 		 flit_valid;
   
   // incoming flit is a tail flit
   input 		 flit_tail;
   
   // output VC is the owner of the incoming flit
   output 		 flit_sel;
   wire 		 flit_sel;
   
   // output VC is eligible for allocation (i.e., not currently allocated)
   output 		 elig;
   wire 		 elig;
   
   // VC has no credits left
   input 		 full;
   
   // ignoring the current flit, VC has no credits left
   input 		 full_prev;
   
   // VC is empty
   input 		 empty;
   
   
   //---------------------------------------------------------------------------
   // track whether this output VC is currently assigend to an input VC
   //---------------------------------------------------------------------------
   
   wire 		 alloc_active;
   assign alloc_active = vc_active | flit_valid;
   
   wire 		 allocated;
   
   wire 		 allocated_s, allocated_q;
   assign allocated_s = vc_gnt | allocated;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   allocatedq
     (.clk(clk),
      .reset(reset),
      .active(alloc_active),
      .d(allocated_s),
      .q(allocated_q));
   
   assign allocated = allocated_q & ~(flit_valid & flit_sel & flit_tail);
   
   wire [0:num_ports-1]  allocated_ip_s, allocated_ip_q;
   assign allocated_ip_s = allocated ? allocated_ip_q : vc_sel_ip;
   c_dff
     #(.width(num_ports),
       .reset_type(reset_type))
   allocated_ipq
     (.clk(clk),
      .reset(1'b0),
      .active(vc_active),
      .d(allocated_ip_s),
      .q(allocated_ip_q));
   
   wire 		 port_match;
   wire 		 vc_match;
   
   generate
      
      if(sw_alloc_spec)
	assign port_match = |(sw_sel_ip & allocated_ip_s);
      else
	assign port_match = |(sw_sel_ip & allocated_ip_q);
      
      if(num_vcs == 1)
	assign vc_match = 1'b1;
      else if(num_vcs > 1)
	begin
	   
	   wire [0:num_vcs-1] allocated_ivc_s, allocated_ivc_q;
	   assign allocated_ivc_s = allocated ? allocated_ivc_q : vc_sel_ivc;
	   c_dff
	     #(.width(num_vcs),
	       .reset_type(reset_type))
	   allocated_ivcq
	     (.clk(clk),
	      .reset(1'b0),
	      .active(vc_active),
	      .d(allocated_ivc_s),
	      .q(allocated_ivc_q));
	   
	   if(sw_alloc_spec)
	     assign vc_match = |(sw_sel_ivc & allocated_ivc_s);
	   else
	     assign vc_match = |(sw_sel_ivc & allocated_ivc_q);
	   
	end
      
   endgenerate
   
   wire 		      match_s, match_q;
   assign match_s = sw_gnt ? (port_match & vc_match) : match_q;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   matchq
     (.clk(clk),
      .reset(reset),
      .active(sw_active),
      .d(match_s),
      .q(match_q));
   
   generate
	 
      if(sw_alloc_spec && (elig_mask == `ELIG_MASK_NONE))
	assign flit_sel = allocated_q & match_q & ~full_prev;
      else
	assign flit_sel = allocated_q & match_q;
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // keep track of whether current VC is available for allocation
   //---------------------------------------------------------------------------
   
   generate
      
      case(elig_mask)

	`ELIG_MASK_NONE:
	  begin
	     assign elig = ~allocated;
	  end

	`ELIG_MASK_FULL:
	  begin
	     assign elig = ~allocated & ~full;
	  end

	`ELIG_MASK_USED:
	  begin
	     assign elig = ~allocated & empty;
	  end
	
      endcase
      
   endgenerate
   
endmodule
