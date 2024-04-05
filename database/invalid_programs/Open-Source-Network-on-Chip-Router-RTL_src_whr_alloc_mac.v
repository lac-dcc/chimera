// $Id: whr_alloc_mac.v 5188 2012-08-30 00:31:31Z dub $

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
// allocator module
//==============================================================================

module whr_alloc_mac
  (clk, reset, route_ip_op, req_ip, req_head_ip, req_tail_ip, gnt_ip, 
   flit_valid_op, flit_head_op, flit_tail_op, xbr_ctrl_op_ip, elig_op, full_op);
   
`include "c_constants.v"
`include "c_functions.v"
   
   // number of input and output ports on router
   parameter num_ports = 5;
   
   // width required to select an individual port
   localparam port_idx_width = clogb(num_ports);
   
   // precompute output-side arbitration decision one cycle ahead
   parameter precomp_ip_sel = 1;
   
   // select which arbiter type to use in allocator
   parameter arbiter_type = `ARBITER_TYPE_ROUND_ROBIN_BINARY;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   
   // destination port selects from input ports
   input [0:num_ports*num_ports-1] route_ip_op;
   
   // requests from input ports
   input [0:num_ports-1] 	   req_ip;
   
   // requests are for head flits
   input [0:num_ports-1] 	   req_head_ip;
   
   // requests are for tail flits
   input [0:num_ports-1] 	   req_tail_ip;
   
   // grants to input ports
   output [0:num_ports-1] 	   gnt_ip;
   wire [0:num_ports-1] 	   gnt_ip;
   
   // grant to output port
   output [0:num_ports-1] 	   flit_valid_op;
   wire [0:num_ports-1] 	   flit_valid_op;
   
   // granted flit is head flit
   output [0:num_ports-1] 	   flit_head_op;
   wire [0:num_ports-1] 	   flit_head_op;
   
   // granted flit is tail flit
   output [0:num_ports-1] 	   flit_tail_op;
   wire [0:num_ports-1] 	   flit_tail_op;
   
   // crossbar control signals
   output [0:num_ports*num_ports-1] xbr_ctrl_op_ip;
   wire [0:num_ports*num_ports-1]   xbr_ctrl_op_ip;
   
   // is output port eligible for allocation?
   input [0:num_ports-1] 	    elig_op;
   
   // is output port full?
   input [0:num_ports-1] 	    full_op;
   
   
   //---------------------------------------------------------------------------
   // implementation
   //---------------------------------------------------------------------------
   
   wire [0:num_ports*num_ports-1]   route_op_ip;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   route_op_ip_intl
     (.data_in(route_ip_op),
      .data_out(route_op_ip));
   
   wire [0:num_ports*num_ports-1]   gnt_op_ip;
   
   genvar 			    op;
   
   generate
      
      for(op = 0; op < num_ports; op = op + 1)
	begin:ops
	   
	   
	   //-------------------------------------------------------------------
	   // connect inputs and outputs
	   //-------------------------------------------------------------------
	   
	   wire [0:num_ports-1] route_ip;
	   assign route_ip = route_op_ip[op*num_ports:(op+1)*num_ports-1];
	   
	   wire 		elig;
	   assign elig = elig_op[op];
	   
	   wire 		full;
	   assign full = full_op[op];
	   
	   wire [0:num_ports-1] gnt_ip;
	   assign gnt_op_ip[op*num_ports:(op+1)*num_ports-1] = gnt_ip;
	   
	   wire 		flit_valid;
	   assign flit_valid_op[op] = flit_valid;
	   
	   wire 		flit_head;
	   assign flit_head_op[op] = flit_head;
	   
	   wire 		flit_tail;
	   assign flit_tail_op[op] = flit_tail;
	   
	   wire [0:num_ports-1] xbr_ctrl_ip;
	   assign xbr_ctrl_op_ip[op*num_ports:(op+1)*num_ports-1] = xbr_ctrl_ip;
	   
	   
	   //-------------------------------------------------------------------
	   // arbitration
	   //-------------------------------------------------------------------
	   
	   wire [0:num_ports-1] arb_req_ip;
	   assign arb_req_ip = req_ip & route_ip;
	   
	   
	   // NOTE: For the wormhole router, credit and eligibility checking is 
	   // performed after arbitration, so request generation is simple and 
	   // fast; however, if clock gating based on requests should prove to 
	   // be timing-critical, we could just enable all output controllers 
	   // whenever any input controller has data available.
	   
	   wire 		arb_active;
	   assign arb_active = |arb_req_ip;
	   
	   wire [0:num_ports-1] hold_gnt_ip;
	   assign hold_gnt_ip = arb_req_ip & ~req_head_ip;
	   
	   wire [0:num_ports-1] arb_gnt_ip;
	   
	   wire 		gnt;
	   
	   if(precomp_ip_sel)
	     begin
		
		wire [0:num_ports-1] prio_ip;
		
		wire [0:num_ports-1] mgnt_ip;
		c_prefix_arbiter_base
		  #(.num_ports(num_ports))
		opab
		  (.prio_port(prio_ip),
		   .req(arb_req_ip),
		   .gnt(mgnt_ip));
		
		wire 		     update;
		assign update
		  = (|(hold_gnt_ip & req_tail_ip) | (elig & |arb_req_ip)) & 
		    ~full;
		
		wire [0:port_idx_width-1] next_port;
		c_encode
		  #(.num_ports(num_ports))
		next_port_enc
		  (.data_in(mgnt_ip),
		   .data_out(next_port));
		
		wire [0:port_idx_width-1] presel_s, presel_q;
		assign presel_s = update ? next_port : presel_q;
		c_dff
		  #(.width(port_idx_width),
		    .reset_type(reset_type))
		preselq
		  (.clk(clk),
		   .reset(reset),
		   .active(arb_active),
		   .d(presel_s),
		   .q(presel_q));
		
		c_decode
		  #(.num_ports(num_ports),
		    .offset(num_ports-1))
		prio_ip_dec
		  (.data_in(presel_q),
		   .data_out(prio_ip));
		
		wire [0:num_ports-1] 	  presel_ip;
		c_decode
		  #(.num_ports(num_ports))
		presel_ip_dec
		  (.data_in(presel_q),
		   .data_out(presel_ip));
		
		wire [0:num_ports-1] 	  gnt_presel_ip;
		assign gnt_presel_ip = arb_req_ip & presel_ip;
		
		wire [0:num_ports-1] 	  gnt_onehot_ip;
		c_one_hot_filter
		  #(.width(num_ports))
		oohf
		  (.data_in(arb_req_ip),
		   .data_out(gnt_onehot_ip));
		
		// NOTE: If the request vector is one-hot, either both methods 
		// will agree, or preselection will not generate a grant; on 
		// the other hand, if it is not one-hot, the one-hot filter 
		// will return a zero vector. In both cases, we can safely just 
		// OR the results together.
		
		assign arb_gnt_ip = gnt_presel_ip | gnt_onehot_ip;
		
		assign gnt
		  = ((elig & |arb_gnt_ip) | |(arb_req_ip & ~req_head_ip)) & 
		    ~full;
		
	     end
	   else
	     begin
		
		wire arb_update;
		assign arb_update = |arb_req_ip & elig & ~full;
		
		c_arbiter
		  #(.num_ports(num_ports),
		    .num_priorities(1),
		    .arbiter_type(arbiter_type),
		    .reset_type(reset_type))
		arb
		  (.clk(clk),
		   .reset(reset),
		   .active(arb_active),
		   .update(arb_update),
		   .req_pr(arb_req_ip),
		   .gnt_pr(arb_gnt_ip),
		   .gnt());
		
		assign gnt
		  = |(arb_req_ip & (~req_head_ip | {num_ports{elig}})) & ~full;
		
	     end
	   
	   wire [0:num_ports-1] raw_gnt_ip;
	   assign raw_gnt_ip = elig ? arb_gnt_ip : hold_gnt_ip;
	   
	   assign gnt_ip = raw_gnt_ip & {num_ports{~full}};
	   
	   wire 		gnt_head;
	   assign gnt_head = elig;
	   
	   wire 		gnt_tail;
	   c_select_1ofn
	     #(.num_ports(num_ports),
	       .width(1))
	   gnt_tail_sel
	     (.select(raw_gnt_ip),
	      .data_in(req_tail_ip),
	      .data_out(gnt_tail));
	   
	   wire 		xbr_ctrl_active;
	   assign xbr_ctrl_active = arb_active | (|xbr_ctrl_ip);
	   
	   wire [0:num_ports-1] xbr_ctrl_ip_s, xbr_ctrl_ip_q;
	   assign xbr_ctrl_ip_s = raw_gnt_ip;
	   c_dff
	     #(.width(num_ports),
	       .reset_type(reset_type))
	   xbr_ctrl_ipq
	     (.clk(clk),
	      .reset(reset),
	      .active(xbr_ctrl_active),
	      .d(xbr_ctrl_ip_s),
	      .q(xbr_ctrl_ip_q));
	   
	   assign xbr_ctrl_ip = xbr_ctrl_ip_q;
	   
	   wire 		flit_valid_s, flit_valid_q;
	   assign flit_valid_s = gnt;
	   c_dff
	     #(.width(1),
	       .reset_type(reset_type))
	   flit_validq
	     (.clk(clk),
	      .reset(reset),
	      .active(xbr_ctrl_active),
	      .d(flit_valid_s),
	      .q(flit_valid_q));
	   
	   assign flit_valid = flit_valid_q;
	   
	   wire 		flit_head_s, flit_head_q;
	   assign flit_head_s = gnt_head;
	   c_dff
	     #(.width(1),
	       .reset_type(reset_type))
	   flit_headq
	     (.clk(clk),
	      .reset(1'b0),
	      .active(arb_active),
	      .d(flit_head_s),
	      .q(flit_head_q));
	   
	   assign flit_head = flit_head_q;
	   
	   wire 		flit_tail_s, flit_tail_q;
	   assign flit_tail_s = gnt_tail;
	   c_dff
	     #(.width(1),
	       .reset_type(reset_type))
	   flit_tailq
	     (.clk(clk),
	      .reset(1'b0),
	      .active(arb_active),
	      .d(flit_tail_s),
	      .q(flit_tail_q));
	   
	   assign flit_tail = flit_tail_q;
	   
	end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // generate input-side grants
   //---------------------------------------------------------------------------
   
   c_binary_op
     #(.num_ports(num_ports),
       .width(num_ports),
       .op(`BINARY_OP_OR))
   gnt_ip_or
     (.data_in(gnt_op_ip),
      .data_out(gnt_ip));
   
endmodule
