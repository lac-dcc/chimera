// $Id: rtr_alloc_mac.v 5188 2012-08-30 00:31:31Z dub $

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
// VC and switch allocator module
//==============================================================================

module rtr_alloc_mac
  (clk, reset, route_in_ip_ivc_op, route_in_ip_ivc_orc, flit_valid_in_ip_ivc, 
   flit_last_in_ip_ivc, flit_head_in_ip_ivc, flit_tail_in_ip_ivc, 
   route_fast_in_ip_op, route_fast_in_ip_orc, flit_valid_fast_in_ip, 
   flit_head_fast_in_ip, flit_tail_fast_in_ip, flit_sel_fast_in_ip_ivc, 
   flit_sel_out_ip_ivc, flit_sent_out_ip, flit_sel_fast_out_ip, 
   flit_sent_fast_out_ip, flit_sel_out_op_ip, flit_valid_out_op, 
   flit_head_out_op, flit_tail_out_op, flit_sel_out_op_ovc, elig_in_op_ovc, 
   empty_in_op_ovc, almost_full_in_op_ovc, full_in_op_ovc);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
   
   
   //---------------------------------------------------------------------------
   // parameters
   //---------------------------------------------------------------------------
   
   // number of message classes (e.g. request, reply)
   parameter num_message_classes = 2;
   
   // number of resource classes (e.g. minimal, adaptive)
   parameter num_resource_classes = 2;
   
   // number of VCs per class
   parameter num_vcs_per_class = 1;
   
   // number of routers in each dimension
   parameter num_routers_per_dim = 4;
   
   // number of dimensions in network
   parameter num_dimensions = 2;
   
   // number of nodes per router (a.k.a. consentration factor)
   parameter num_nodes_per_router = 1;
   
   // connectivity within each dimension
   parameter connectivity = `CONNECTIVITY_LINE;
   
   // select type of flow control
   parameter flow_ctrl_type = `FLOW_CTRL_TYPE_CREDIT;
   
   // filter out illegal destination ports
   // (the intent is to allow synthesis to optimize away the logic associated 
   // with such turns)
   parameter restrict_turns = 1;
   
   // select routing function type
   parameter routing_type = `ROUTING_TYPE_PHASED_DOR;
   
   // select order of dimension traversal
   parameter dim_order = `DIM_ORDER_ASCENDING;
   
   // precompute input-side arbitration decision one cycle ahead
   parameter precomp_ivc_sel = 1;
   
   // precompute output-side arbitration decision one cycle ahead
   parameter precomp_ip_sel = 1;
   
   // select flit buffer management scheme
   parameter fb_mgmt_type = `FB_MGMT_TYPE_STATIC;
   
   // select whether to exclude full or non-empty VCs from VC allocation
   parameter elig_mask = `ELIG_MASK_NONE;
   
   // select which arbiter type to use for switch allocation
   parameter sw_alloc_arbiter_type = `ARBITER_TYPE_ROUND_ROBIN_BINARY;
   
   // select which arbiter type to use for VC allocation
   parameter vc_alloc_arbiter_type = `ARBITER_TYPE_ROUND_ROBIN_BINARY;
   
   // prefer empty VCs over non-empty ones in VC allocation
   parameter vc_alloc_prefer_empty = 0;
   
   // enable dual-path allocation
   parameter dual_path_alloc = 1;
   
   // resolve output conflicts when using dual-path allocation via arbitration
   // (otherwise, kill if more than one fast-path request per output port)
   parameter dual_path_allow_conflicts = 0;
   
   // only mask fast-path requests if any slow path requests are ready
   parameter dual_path_mask_on_ready = 1;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   
   //---------------------------------------------------------------------------
   // derived parameters
   //---------------------------------------------------------------------------
   
   // total number of packet classes
   localparam num_packet_classes = num_message_classes * num_resource_classes;
   
   // number of VCs
   localparam num_vcs = num_packet_classes * num_vcs_per_class;
   
   // number of adjacent routers in each dimension
   localparam num_neighbors_per_dim
     = ((connectivity == `CONNECTIVITY_LINE) ||
	(connectivity == `CONNECTIVITY_RING)) ?
       2 :
       (connectivity == `CONNECTIVITY_FULL) ?
       (num_routers_per_dim - 1) :
       -1;
   
   // number of input and output ports on router
   localparam num_ports
     = num_dimensions * num_neighbors_per_dim + num_nodes_per_router;
   
   // width required to select an individual port
   localparam port_idx_width = clogb(num_ports);
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   input clk;
   input reset;
   
   // output port select signals for each input port and VC
   input [0:num_ports*num_vcs*num_ports-1] route_in_ip_ivc_op;
   
   // output resource class select signals for each input port and VC
   input [0:num_ports*num_vcs*num_resource_classes-1] route_in_ip_ivc_orc;
   
   // incoming flit control signals
   input [0:num_ports*num_vcs-1] 		      flit_valid_in_ip_ivc;
   input [0:num_ports*num_vcs-1] 		      flit_last_in_ip_ivc;
   input [0:num_ports*num_vcs-1] 		      flit_head_in_ip_ivc;
   input [0:num_ports*num_vcs-1] 		      flit_tail_in_ip_ivc;
   
   // 
   input [0:num_ports*num_ports-1] 		      route_fast_in_ip_op;
   
   // 
   input [0:num_ports*num_resource_classes-1] 	      route_fast_in_ip_orc;
   
   // 
   input [0:num_ports-1] 			      flit_valid_fast_in_ip;
   input [0:num_ports-1] 			      flit_head_fast_in_ip;
   input [0:num_ports-1] 			      flit_tail_fast_in_ip;
   input [0:num_ports*num_vcs-1] 		      flit_sel_fast_in_ip_ivc;
   
   // indicate which input VC is candidate for being sent
   output [0:num_ports*num_vcs-1] 		      flit_sel_out_ip_ivc;
   wire [0:num_ports*num_vcs-1] 		      flit_sel_out_ip_ivc;
   
   // grants to input controllers
   output [0:num_ports-1] 			      flit_sent_out_ip;
   wire [0:num_ports-1] 			      flit_sent_out_ip;
   
   //
   output [0:num_ports-1] 			      flit_sel_fast_out_ip;
   wire [0:num_ports-1] 			      flit_sel_fast_out_ip;
   
   //
   output [0:num_ports-1] 			      flit_sent_fast_out_ip;
   wire [0:num_ports-1] 			      flit_sent_fast_out_ip;
   
   // input-to-output port assignments for crossbar
   output [0:num_ports*num_ports-1] 		      flit_sel_out_op_ip;
   wire [0:num_ports*num_ports-1] 		      flit_sel_out_op_ip;
   
   // outgoing flit control signals
   output [0:num_ports-1] 			      flit_valid_out_op;
   wire [0:num_ports-1] 			      flit_valid_out_op;
   output [0:num_ports-1] 			      flit_head_out_op;
   wire [0:num_ports-1] 			      flit_head_out_op;
   output [0:num_ports-1] 			      flit_tail_out_op;
   wire [0:num_ports-1] 			      flit_tail_out_op;
   
   // indicate which output VC the transmitted flit belongs to
   output [0:num_ports*num_vcs-1] 		      flit_sel_out_op_ovc;
   wire [0:num_ports*num_vcs-1] 		      flit_sel_out_op_ovc;
   
   // which output VCs are eligible for VC allocation?
   input [0:num_ports*num_vcs-1] 		      elig_in_op_ovc;
   
   // with output VCs contain no flits?
   input [0:num_ports*num_vcs-1] 		      empty_in_op_ovc;
   
   // which output VC have only a single credit left?
   input [0:num_ports*num_vcs-1] 		      almost_full_in_op_ovc;
   
   // which output VCs have no credits left?
   input [0:num_ports*num_vcs-1] 		      full_in_op_ovc;
   
   
   //---------------------------------------------------------------------------
   // input side
   //---------------------------------------------------------------------------
   
   wire [0:num_ports*num_vcs-1] 		      nvs_next_elig_op_ovc;
   wire [0:num_ports*num_packet_classes-1] 	      nvs_any_elig_op_opc;
   
   wire [0:num_ports*num_ports-1] 		      active_ip_op;
   
   wire [0:num_ports*num_ports-1] 		      ial_flit_valid_hi_ip_op;
   wire [0:num_ports*num_ports-1] 		      ial_flit_valid_lo_ip_op;
   wire [0:num_ports-1] 			      ial_flit_head_ip;
   wire [0:num_ports-1] 			      ial_flit_tail_ip;
   wire [0:num_ports*num_vcs-1] 		      ial_flit_sel_ip_ovc;
   
   wire [0:num_ports*num_ports-1] 		      ifl_flit_valid_ip_op;
   wire [0:num_ports*num_vcs-1] 		      ifl_flit_sel_ip_ovc;
   
   wire [0:num_ports*num_ports-1] 		      oal_flit_sent_ip_op;
   wire [0:num_ports*num_ports-1] 		      ofl_flit_sent_ip_op;
   wire [0:num_ports-1] 			      oxl_flit_sent_op;
   
   generate
      
      //------------------------------------------------------------------------
      // input ports
      //------------------------------------------------------------------------
      
      genvar 					      ip;
      
      for(ip = 0; ip < num_ports; ip = ip + 1)
	begin:ips
	   
	   //-------------------------------------------------------------------
	   // connect inputs
	   //-------------------------------------------------------------------
	   
	   wire [0:num_vcs-1] flit_valid_in_ivc;
	   assign flit_valid_in_ivc
	     = flit_valid_in_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1];
	   
	   wire [0:num_vcs-1] flit_last_in_ivc;
	   assign flit_last_in_ivc
	     = flit_last_in_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1];
	   
	   wire [0:num_vcs-1] flit_head_in_ivc;
	   assign flit_head_in_ivc
	     = flit_head_in_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1];
	   
	   wire [0:num_vcs-1] flit_tail_in_ivc;
	   assign flit_tail_in_ivc
	     = flit_tail_in_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1];
	   
	   wire [0:num_ports-1] oal_flit_sent_op;
	   assign oal_flit_sent_op
	     = oal_flit_sent_ip_op[ip*num_ports:(ip+1)*num_ports-1];
	   
	   wire [0:num_ports-1] ofl_flit_sent_op;
	   assign ofl_flit_sent_op
	     = ofl_flit_sent_ip_op[ip*num_ports:(ip+1)*num_ports-1];
	   
	   wire [0:num_ports-1] route_fast_in_op;
	   assign route_fast_in_op
	     = route_fast_in_ip_op[ip*num_ports:(ip+1)*num_ports-1];
	   
	   wire [0:num_resource_classes-1] route_fast_in_orc;
	   assign route_fast_in_orc
	     = route_fast_in_ip_orc[ip*num_resource_classes:
				    (ip+1)*num_resource_classes-1];
	   
	   wire 			   flit_valid_fast_in;
	   assign flit_valid_fast_in = flit_valid_fast_in_ip[ip];
	   
	   wire 			   flit_head_fast_in;
	   assign flit_head_fast_in = flit_head_fast_in_ip[ip];
	   
	   wire 			   flit_tail_fast_in;
	   assign flit_tail_fast_in = flit_tail_fast_in_ip[ip];
	   
	   wire [0:num_vcs-1] 		   flit_sel_fast_in_ivc;
	   assign flit_sel_fast_in_ivc
	     = flit_sel_fast_in_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1];
	   
	   
	   //-------------------------------------------------------------------
	   // connect outputs
	   //-------------------------------------------------------------------
	   
	   wire [0:num_ports-1] 	   active_op;
	   assign active_ip_op[ip*num_ports:(ip+1)*num_ports-1] = active_op;
	   
	   wire [0:num_ports-1] 	   ial_flit_valid_hi_op;
	   assign ial_flit_valid_hi_ip_op[ip*num_ports:(ip+1)*num_ports-1]
	     = ial_flit_valid_hi_op;
	   
	   wire [0:num_ports-1] 	   ial_flit_valid_lo_op;
	   assign ial_flit_valid_lo_ip_op[ip*num_ports:(ip+1)*num_ports-1]
	     = ial_flit_valid_lo_op;
	   
	   wire 			   ial_flit_head;
	   assign ial_flit_head_ip[ip] = ial_flit_head;
	   
	   wire 			   ial_flit_tail;
	   assign ial_flit_tail_ip[ip] = ial_flit_tail;
	   
	   wire [0:num_vcs-1] 		   ial_flit_sel_ovc;
	   assign ial_flit_sel_ip_ovc[ip*num_vcs:(ip+1)*num_vcs-1]
	     = ial_flit_sel_ovc;
	   
	   wire [0:num_ports-1] 	   ifl_flit_valid_op;
	   assign ifl_flit_valid_ip_op[ip*num_ports:(ip+1)*num_ports-1]
	     = ifl_flit_valid_op;
	   
	   wire [0:num_vcs-1] 		   ifl_flit_sel_ovc;
	   assign ifl_flit_sel_ip_ovc[ip*num_vcs:(ip+1)*num_vcs-1]
	     = ifl_flit_sel_ovc;
	   
	   wire [0:num_vcs-1] 		   flit_sel_out_ivc;
	   assign flit_sel_out_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1]
	     = flit_sel_out_ivc;
	   
	   wire 			   flit_sent_out;
	   assign flit_sent_out_ip[ip] = flit_sent_out;
	   
	   wire 			   flit_sel_fast_out;
	   assign flit_sel_fast_out_ip[ip] = flit_sel_fast_out;
	   
	   wire 			   flit_sent_fast_out;
	   assign flit_sent_fast_out_ip[ip] = flit_sent_fast_out;
	   
	   
	   //-------------------------------------------------------------------
	   // fast-path logic
	   //-------------------------------------------------------------------
	   
	   wire 			   oal_flit_sent;
	   assign oal_flit_sent = |oal_flit_sent_op;
	   
	   wire 			   ofl_flit_sent;
	   assign ofl_flit_sent = |ofl_flit_sent_op;
	   
	   wire 			   ial_flit_sel_fast;
	   
	   wire [0:num_vcs-1] 		   ifl_allocated_ivc;
	   wire [0:num_vcs_per_class-1]    ifl_allocated_ocvc;
	   wire 			   ifl_next_cred;
	   
	   if(1) begin:ifl
	      
	      if(dual_path_alloc)
		begin
		   
		   wire [0:num_message_classes-1] sel_mc;
		   c_reduce_bits
		     #(.num_ports(num_message_classes),
		       .width(num_resource_classes*num_vcs_per_class),
		       .op(`BINARY_OP_OR))
		   sel_mc_rb
		     (.data_in(flit_sel_fast_in_ivc),
		      .data_out(sel_mc));
		   
		   wire [0:num_packet_classes-1]  sel_opc;
		   c_mat_mult
		     #(.dim1_width(num_message_classes),
		       .dim2_width(1),
		       .dim3_width(num_resource_classes),
		       .prod_op(`BINARY_OP_AND),
		       .sum_op(`BINARY_OP_OR))
		   sel_opc_mmult
		     (.input_a(sel_mc),
		      .input_b(route_fast_in_orc),
		      .result(sel_opc));
		   
		   wire [0:num_packet_classes-1]  any_elig_opc;
		   c_select_1ofn
		     #(.num_ports(num_ports),
		       .width(num_packet_classes))
		   any_elig_opc_sel
		     (.select(route_fast_in_op),
		      .data_in(nvs_any_elig_op_opc),
		      .data_out(any_elig_opc));
		   
		   wire 			  any_elig;
		   c_select_1ofn
		     #(.num_ports(num_packet_classes),
		       .width(1))
		   any_elig_sel
		     (.select(sel_opc),
		      .data_in(any_elig_opc),
		      .data_out(any_elig));
		   
		   wire 			  active;
		   assign active = flit_valid_fast_in;
		   
		   wire 			  match;
		   
		   wire 			  allocated_s, allocated_q;
		   assign allocated_s
		     = flit_valid_fast_in ?
		       (allocated_q ?
			~(match & (flit_tail_fast_in | ~ofl_flit_sent)) :
			(flit_head_fast_in & ~flit_tail_fast_in & 
			 ofl_flit_sent & any_elig)) :
		       allocated_q;
		   c_dff
		     #(.width(1),
		       .reset_type(reset_type))
		   allocatedq
		     (.clk(clk),
		      .reset(reset),
		      .active(active),
		      .d(allocated_s),
		      .q(allocated_q));
		   
		   wire [0:num_vcs-1] 		  allocated_ivc_s, 
						  allocated_ivc_q;
		   assign allocated_ivc_s
		     = allocated_q ? allocated_ivc_q : flit_sel_fast_in_ivc;
		   c_dff
		     #(.width(num_vcs),
		       .reset_type(reset_type))
		   allocated_ivcq
		     (.clk(clk),
		      .reset(1'b0),
		      .active(active),
		      .d(allocated_ivc_s),
		      .q(allocated_ivc_q));
		   
		   c_select_1ofn
		     #(.num_ports(num_vcs),
		       .width(1))
		   match_sel
		     (.select(flit_sel_fast_in_ivc),
		      .data_in(allocated_ivc_q),
		      .data_out(match));
		   
		   wire [0:num_vcs-1] 		  next_elig_opc_ocvc;
		   c_select_1ofn
		     #(.num_ports(num_ports),
		       .width(num_vcs))
		   next_elig_opc_ocvc_sel
		     (.select(route_fast_in_op),
		      .data_in(nvs_next_elig_op_ovc),
		      .data_out(next_elig_opc_ocvc));
		   
		   wire [0:num_vcs-1] 		  next_elig_ovc;
		   c_gate_bits
		     #(.num_ports(num_packet_classes),
		       .width(num_vcs_per_class),
		       .op(`BINARY_OP_AND))
		   next_elig_ovc_gb
		     (.select(sel_opc),
		      .data_in(next_elig_opc_ocvc),
		      .data_out(next_elig_ovc));
		   
		   wire [0:num_vcs-1] 		  allocated_next_ovc;
		   wire [0:num_vcs-1] 		  allocated_ovc;
		   wire [0:num_vcs-1] 		  flit_sel_ovc;
		   
		   if(num_vcs == 1)
		     begin
			assign allocated_next_ovc = 1'b1;
			assign allocated_ovc = 1'b1;
			assign flit_sel_ovc = 1'b1;
		     end
		   else if(num_vcs > 1)
		     begin
			
			assign allocated_next_ovc
			  = allocated_q ? allocated_ovc : next_elig_ovc;
			
			wire [0:num_vcs-1] allocated_ovc_s, allocated_ovc_q;
			assign allocated_ovc_s = allocated_next_ovc;
			c_dff
			  #(.width(num_vcs),
			    .reset_type(reset_type))
			allocated_ovcq
			  (.clk(clk),
			   .reset(1'b0),
			   .active(active),
			   .d(allocated_ovc_s),
			   .q(allocated_ovc_q));
			
			assign allocated_ovc = allocated_ovc_q;
			
			wire [0:num_vcs-1] mask_ovc;
			c_gate_bits
			  #(.num_ports(num_packet_classes),
			    .width(num_vcs_per_class),
			    .op(`BINARY_OP_OR))
			mask_ovc_gb
			  (.select(sel_opc),
			   .data_in({num_vcs{1'b0}}),
			   .data_out(mask_ovc));
			
			assign flit_sel_ovc
			  = allocated_q ? allocated_ovc : mask_ovc;
			
		     end
		   
		   wire [0:num_vcs_per_class-1] allocated_ocvc;
		   
		   if(num_vcs_per_class == 1)
		     assign allocated_ocvc = 1'b1;
		   else
		     begin
			
			c_binary_op
			  #(.num_ports(num_packet_classes),
			    .width(num_vcs_per_class),
			    .op(`BINARY_OP_OR))
			allocted_ocvc_bop
			  (.data_in(allocated_ovc),
			   .data_out(allocated_ocvc));
			
		     end
		   
		   wire [0:port_idx_width-1] 	route_port_fast;
		   c_encode
		     #(.num_ports(num_ports))
		   route_port_fast_enc
		     (.data_in(route_fast_in_op),
		      .data_out(route_port_fast));
		   
		   wire [0:port_idx_width-1] allocated_port_s, allocated_port_q;
		   assign allocated_port_s
		     = allocated_q ? allocated_port_q : route_port_fast;
		   c_dff
		     #(.width(port_idx_width),
		       .reset_type(reset_type))
		   allocated_portq
		     (.clk(clk),
		      .reset(1'b0),
		      .active(active),
		      .d(allocated_port_s),
		      .q(allocated_port_q));
		   
		   wire [0:num_ports-1]      allocated_op;
		   c_decode
		     #(.num_ports(num_ports))
		   allocated_op_dec
		     (.data_in(allocated_port_q),
		      .data_out(allocated_op));
		   
		   wire [0:num_ports-1]      allocated_next_op;
		   assign allocated_next_op
		     = allocated_q ? allocated_op : route_fast_in_op;
		   
		   wire [0:num_vcs-1] 	     almost_full_ovc;
		   c_select_1ofn
		     #(.num_ports(num_ports),
		       .width(num_vcs))
		   almost_full_ovc_sel
		     (.select(allocated_next_op),
		      .data_in(almost_full_in_op_ovc),
		      .data_out(almost_full_ovc));
		   
		   wire 		     almost_full;
		   c_select_1ofn
		     #(.num_ports(num_vcs),
		       .width(1))
		   almost_full_sel
		     (.select(allocated_next_ovc),
		      .data_in(almost_full_ovc),
		      .data_out(almost_full));
		   
		   wire [0:num_vcs-1] 	     full_ovc;
		   c_select_1ofn
		     #(.num_ports(num_ports),
		       .width(num_vcs))
		   full_ovc_sel
		     (.select(allocated_next_op),
		      .data_in(full_in_op_ovc),
		      .data_out(full_ovc));
		   
		   wire 		     full;
		   c_select_1ofn
		     #(.num_ports(num_vcs),
		       .width(1))
		   full_sel
		     (.select(allocated_next_ovc),
		      .data_in(full_ovc),
		      .data_out(full));
		   
		   wire 		     flit_kill;
		   assign flit_kill = flit_head_fast_in & ~any_elig;
		   
		   wire 		     flit_sent;
		   assign flit_sent = ofl_flit_sent & ~flit_kill;
		   
		   wire 		     reduce;
		   
		   if(fb_mgmt_type == `FB_MGMT_TYPE_STATIC)
		     assign reduce = flit_sent;
		   else
		     begin
			
			c_select_1ofn
			  #(.num_ports(num_ports),
			    .width(1))
			reduce_sel
			  (.select(allocated_next_op),
			   .data_in(oxl_flit_sent_op),
			   .data_out(reduce));
			
		     end
		   
		   // we need to track credits even when we temporarily run out 
		   // of flits; otherwise, there can be a dead cycle when a new 
		   // flit arrives after the last flit before we ran out 
		   // filled up the downstream buffer
		   //
		   // NOTE: As it is, synthesis will probably turn this into a 
		   // free-running register!
		   
		   wire 			  cred_active;
		   assign cred_active = flit_valid_fast_in | allocated_q;
		   
		   // NOTE: Since we only use 'cred_q' once the VC is
		   // allocated, we can ignore 'flit_kill' here -- if the flit
		   // is killed, we failed allocation, and thus the value of
		   // 'cred_q' will be ignored in the next cycle anyway.
		   
		   wire 			  next_cred;
		   assign next_cred = ~full & ~(almost_full & reduce);
		   
		   wire 			  cred_s, cred_q;
		   assign cred_s = next_cred;
		   c_dff
		     #(.width(1),
		       .reset_type(reset_type))
		   credq
		     (.clk(clk),
		      .reset(1'b0),
		      .active(cred_active),
		      .d(cred_s),
		      .q(cred_q));
		   
		   wire [0:num_vcs-1] 		  allocated_ivc;
		   assign allocated_ivc
		     = {num_vcs{allocated_q}} & allocated_ivc_q;
		   
		   wire [0:num_ports-1] 	  flit_valid_op;
		   assign flit_valid_op
		     = {num_ports{flit_valid_fast_in & ial_flit_sel_fast}} & 
		       (allocated_q ? 
			({num_ports{match & cred_q}} & allocated_op) : 
			({num_ports{flit_head_fast_in}} & route_fast_in_op));
		   
		   assign ifl_allocated_ivc = allocated_ivc;
		   assign ifl_allocated_ocvc = allocated_ocvc;
		   assign ifl_next_cred = next_cred;
		   assign ifl_flit_valid_op = flit_valid_op;
		   assign ifl_flit_sel_ovc = flit_sel_ovc;
		   
		   assign flit_sel_fast_out = ial_flit_sel_fast;
		   assign flit_sent_fast_out = flit_sent;
		   
		end
	      else
		begin
		   
		   assign ifl_allocated_ivc = {num_vcs{1'b0}};
		   assign ifl_allocated_ocvc = {num_vcs_per_class{1'b0}};
		   assign ifl_next_cred = 1'b0;
		   assign ifl_flit_valid_op = {num_ports{1'b0}};
		   assign ifl_flit_sel_ovc = {num_vcs{1'b0}};
		   
		   assign flit_sel_fast_out = 1'b0;
		   assign flit_sent_fast_out = 1'b0;
		   
		end
	      
	   end
	   
	   
	   //-------------------------------------------------------------------
	   // input VCs
	   //-------------------------------------------------------------------
	   
	   wire [0:num_vcs-1] ial_flit_sel_ivc;
	   
	   wire [0:num_vcs*num_ports-1] rf_route_ivc_op;
	   wire [0:num_vcs*num_resource_classes-1] rf_route_ivc_orc;
	   
	   wire [0:num_vcs-1] 			   ivs_allocated_ivc;
	   wire [0:num_vcs-1] 			   ivs_cred_ivc;
	   wire [0:num_vcs*num_vcs-1] 		   ivs_flit_sel_ivc_ovc;
	   wire [0:num_vcs-1] 			   ivs_flit_kill_ivc;
	   
	   genvar 				   ivc;
	   
	   for(ivc = 0; ivc < num_vcs; ivc = ivc + 1)
	     begin:ivcs
		
		//--------------------------------------------------------------
		// connect inputs
		//--------------------------------------------------------------
		
		wire [0:num_ports-1] route_in_op;
		assign route_in_op
		  = route_in_ip_ivc_op[(ip*num_vcs+ivc)*num_ports:
				       (ip*num_vcs+ivc+1)*num_ports-1];
		
		wire [0:num_resource_classes-1] route_in_orc;
		assign route_in_orc
		  = route_in_ip_ivc_orc[(ip*num_vcs+ivc)*
					num_resource_classes:
					(ip*num_vcs+ivc+1)*
					num_resource_classes-1];
		
		wire 				flit_valid_in;
		assign flit_valid_in = flit_valid_in_ivc[ivc];
		
		wire 				flit_tail_in;
		assign flit_tail_in = flit_tail_in_ivc[ivc];
		
		wire 				flit_sel_fast_in;
		assign flit_sel_fast_in = flit_sel_fast_in_ivc[ivc];
		
		wire 				ial_flit_sel;
		assign ial_flit_sel = ial_flit_sel_ivc[ivc];
		
		wire 				ifl_allocated;
		assign ifl_allocated = ifl_allocated_ivc[ivc];
		
		
		//--------------------------------------------------------------
		// connect outputs
		//--------------------------------------------------------------
		
		wire [0:num_ports-1] 		rf_route_op;
		assign rf_route_ivc_op[ivc*num_ports:(ivc+1)*num_ports-1]
		  = rf_route_op;
		
		wire [0:num_resource_classes-1] rf_route_orc;
		assign rf_route_ivc_orc[ivc*num_resource_classes:
					(ivc+1)*num_resource_classes-1]
		  = rf_route_orc;
		
		wire 				ivs_allocated;
		assign ivs_allocated_ivc[ivc] = ivs_allocated;
		
		wire 				ivs_cred;
		assign ivs_cred_ivc[ivc] = ivs_cred;
		
		wire [0:num_vcs-1] 		ivs_flit_sel_ovc;
		assign ivs_flit_sel_ivc_ovc[ivc*num_vcs:(ivc+1)*num_vcs-1]
		  = ivs_flit_sel_ovc;
		
		wire 				ivs_flit_kill;
		assign ivs_flit_kill_ivc[ivc] = ivs_flit_kill;
		
		
		//--------------------------------------------------------------
		// filter out illegal requests
		//--------------------------------------------------------------
		
		wire [0:1] 			rf_errors;
		rtr_route_filter
		  #(.num_message_classes(num_message_classes),
		    .num_resource_classes(num_resource_classes),
		    .num_vcs_per_class(num_vcs_per_class),
		    .num_ports(num_ports),
		    .num_neighbors_per_dim(num_neighbors_per_dim),
		    .num_nodes_per_router(num_nodes_per_router),
		    .restrict_turns(restrict_turns),
		    .connectivity(connectivity),
		    .routing_type(routing_type),
		    .dim_order(dim_order),
		    .port_id(ip),
		    .vc_id(ivc))
		rf
		  (.clk(clk),
		   .route_valid(flit_valid_in),
		   .route_in_op(route_in_op),
		   .route_in_orc(route_in_orc),
		   .route_out_op(rf_route_op),
		   .route_out_orc(rf_route_orc),
		   .errors(rf_errors));
		
		
		//--------------------------------------------------------------
		// input VC state tracking
		//--------------------------------------------------------------
		
		if(1) begin:ivs
		   
		   wire flit_valid_sel_fast;
		   assign flit_valid_sel_fast
		     = flit_valid_fast_in & flit_sel_fast_in & ifl_allocated;
		   
		   wire flit_valid;
		   
		   if(dual_path_alloc)
		     assign flit_valid = flit_valid_in | flit_valid_sel_fast;
		   else
		     assign flit_valid = flit_valid_in;
		   
		   wire active;
		   assign active = flit_valid;
		   
		   wire [0:num_vcs-1] sel_ivc;
		   assign sel_ivc = (1 << (num_vcs - 1 - ivc));
		   
		   wire [0:num_message_classes-1] sel_mc;
		   c_reduce_bits
		     #(.num_ports(num_message_classes),
		       .width(num_resource_classes*num_vcs_per_class),
		       .op(`BINARY_OP_OR))
		   sel_mc_rb
		     (.data_in(sel_ivc),
		      .data_out(sel_mc));
		   
		   
		   //-----------------------------------------------------------
		   // keep track of which output VC this input VC has allocated
		   //-----------------------------------------------------------
		   
		   wire 			  flit_sent;
		   assign flit_sent = oal_flit_sent & ial_flit_sel;
		   
		   wire 			  flit_kill;
		   
		   // NOTE: For the reset condition, we don't have to worry 
		   // about 'flit_kill', as it only affects flits that are sent 
		   // before a VC has been allocated -- in which case 
		   // 'allocated_q' is zero, and the reset condition has no 
		   // effect anyway.
		   
		   wire 			  allocated_s, allocated_q;
		   if(dual_path_alloc)
		     assign allocated_s
		       = flit_valid ?
			 ((allocated_q | (flit_sent & ~flit_kill) |
			   (flit_valid_sel_fast & ~ofl_flit_sent)) &
			  ~(flit_sent & flit_tail_in)) :
			 allocated_q;
		   else
		     assign allocated_s
		       = (allocated_q | (flit_sent & ~flit_kill)) & 
			 ~(flit_sent & flit_tail_in);
		   c_dff
		     #(.width(1),
		       .reset_type(reset_type))
		   allocatedq
		     (.clk(clk),
		      .reset(reset),
		      .active(active),
		      .d(allocated_s),
		      .q(allocated_q));
		   
		   wire 			  any_elig;
		   rtr_flags_mux
		     #(.num_message_classes(num_message_classes),
		       .num_resource_classes(num_resource_classes),
		       .num_ports(num_ports),
		       .width(1))
		   any_elig_fmux
		     (.sel_mc(sel_mc),
		      .route_op(rf_route_op),
		      .route_orc(rf_route_orc),
		      .flags_op_opc(nvs_any_elig_op_opc),
		      .flags(any_elig));
		   
		   assign flit_kill = ~allocated_q & ~any_elig;
		   
		   wire [0:num_vcs_per_class-1]   next_elig_ocvc;
		   rtr_flags_mux
		     #(.num_message_classes(num_message_classes),
		       .num_resource_classes(num_resource_classes),
		       .num_ports(num_ports),
		       .width(num_vcs_per_class))
		   next_elig_ocvc_fmux
		     (.sel_mc(sel_mc),
		      .route_op(rf_route_op),
		      .route_orc(rf_route_orc),
		      .flags_op_opc(nvs_next_elig_op_ovc),
		      .flags(next_elig_ocvc));
		   
		   wire [0:num_vcs_per_class-1]   allocated_next_ocvc;
		   wire [0:num_vcs_per_class-1]   allocated_ocvc;
		   wire [0:num_vcs_per_class-1]   flit_sel_ocvc;
		   
		   if(num_vcs_per_class == 1)
		     begin
			assign allocated_next_ocvc = 1'b1;
			assign allocated_ocvc = 1'b1;
			assign flit_sel_ocvc = 1'b1;
		     end
		   else if(num_vcs_per_class > 1)
		     begin
			
			assign allocated_next_ocvc
			  = allocated_q ? allocated_ocvc : next_elig_ocvc;
			
			wire [0:num_vcs_per_class-1] allocated_ocvc_s,
						     allocated_ocvc_q;
			assign allocated_ocvc_s = ifl_allocated ? 
						  ifl_allocated_ocvc : 
						  allocated_next_ocvc;
			c_dff
			  #(.width(num_vcs_per_class),
			    .reset_type(reset_type))
			allocated_ocvcq
			  (.clk(clk),
			   .reset(1'b0),
			   .active(active),
			   .d(allocated_ocvc_s),
			   .q(allocated_ocvc_q));
			
			assign allocated_ocvc = allocated_ocvc_q;
			
			assign flit_sel_ocvc
			  = allocated_ocvc | {num_vcs_per_class{~allocated_q}};
			
		     end
		   
		   wire [0:num_resource_classes*
			 num_vcs_per_class-1] 	     flit_sel_orc_ocvc;
		   c_mat_mult
		     #(.dim1_width(num_resource_classes),
		       .dim2_width(1),
		       .dim3_width(num_vcs_per_class),
		       .prod_op(`BINARY_OP_AND),
		       .sum_op(`BINARY_OP_OR))
		   flit_sel_orc_ocvc_mmult
		     (.input_a(rf_route_orc),
		      .input_b(flit_sel_ocvc),
		      .result(flit_sel_orc_ocvc));
		   
		   wire [0:num_vcs-1] 		     flit_sel_ovc;
		   c_mat_mult
		     #(.dim1_width(num_message_classes),
		       .dim2_width(1),
		       .dim3_width(num_resource_classes*num_vcs_per_class),
		       .prod_op(`BINARY_OP_AND),
		       .sum_op(`BINARY_OP_OR))
		   flit_sel_ovc_mmult
		     (.input_a(sel_mc),
		      .input_b(flit_sel_orc_ocvc),
		      .result(flit_sel_ovc));
		   
		   
		   //-----------------------------------------------------------
		   // credit tracking for a priori check (allocated VCs)
		   //-----------------------------------------------------------
		   
		   wire [0:num_vcs_per_class-1]      almost_full_ocvc;
		   rtr_flags_mux
		     #(.num_message_classes(num_message_classes),
		       .num_resource_classes(num_resource_classes),
		       .num_ports(num_ports),
		       .width(num_vcs_per_class))
		   almost_full_ocvc_fmux
		     (.sel_mc(sel_mc),
		      .route_op(rf_route_op),
		      .route_orc(rf_route_orc),
		      .flags_op_opc(almost_full_in_op_ovc),
		      .flags(almost_full_ocvc));
		   
		   wire 			     almost_full;
		   c_select_1ofn
		     #(.num_ports(num_vcs_per_class),
		       .width(1))
		   almost_full_sel
		     (.select(allocated_next_ocvc),
		      .data_in(almost_full_ocvc),
		      .data_out(almost_full));
		   
		   wire [0:num_vcs_per_class-1]      full_ocvc;
		   rtr_flags_mux
		     #(.num_message_classes(num_message_classes),
		       .num_resource_classes(num_resource_classes),
		       .num_ports(num_ports),
		       .width(num_vcs_per_class))
		   full_ocvc_fmux
		     (.sel_mc(sel_mc),
		      .route_op(rf_route_op),
		      .route_orc(rf_route_orc),
		      .flags_op_opc(full_in_op_ovc),
		      .flags(full_ocvc));
		   
		   wire 			     full;
		   c_select_1ofn
		     #(.num_ports(num_vcs_per_class),
		       .width(1))
		   full_sel
		     (.select(allocated_next_ocvc),
		      .data_in(full_ocvc),
		      .data_out(full));
		   
		   wire 			     reduce;
		   
		   if(fb_mgmt_type == `FB_MGMT_TYPE_STATIC)
		     assign reduce = flit_sent;
		   else
		     begin
			
			c_select_1ofn
			  #(.num_ports(num_ports),
			    .width(1))
			reduce_sel
			  (.select(rf_route_op),
			   .data_in(oxl_flit_sent_op),
			   .data_out(reduce));
			
		     end
		   
		   // we need to track credits even when we temporarily run out 
		   // of flits; otherwise, there can be a dead cycle when a new 
		   // flit arrives after the last flit before we ran out 
		   // filled up the downstream buffer
		   //
		   // NOTE: As it is, synthesis will probably turn this into a 
		   // free-running register!
		   
		   wire 			     cred_active;
		   assign cred_active = flit_valid | allocated_q;
		   
		   // NOTE: Since we only use 'cred_q' once the VC is
		   // allocated, we can ignore 'flit_kill' here -- if the flit
		   // is killed, we failed allocation, and thus the value of
		   // 'cred_q' will be ignored in the next cycle anyway.
		   
		   wire 			     next_cred;
		   assign next_cred = ifl_allocated ? 
				      ifl_next_cred : 
				      (~full & ~(almost_full & reduce));
		   
		   wire 			     cred_s, cred_q;
		   assign cred_s = next_cred;
		   c_dff
		     #(.width(1),
		       .reset_type(reset_type))
		   credq
		     (.clk(clk),
		      .reset(1'b0),
		      .active(cred_active),
		      .d(cred_s),
		      .q(cred_q));
		   
		   
		   //-----------------------------------------------------------
		   // connect outputs
		   //-----------------------------------------------------------
		   
		   assign ivs_allocated = allocated_q;
		   assign ivs_cred = cred_q;
		   assign ivs_flit_kill = flit_kill;
		   assign ivs_flit_sel_ovc = flit_sel_ovc;
		   
		end
		
	     end
	   
	   
	   //-------------------------------------------------------------------
	   // switch allocation
	   //-------------------------------------------------------------------
	   
	   if(1) begin:ial
	      
	      wire active;
	      assign active = |flit_valid_in_ivc;
	      	      
	      // We only allow speculative requests and those that already have 
	      // an output VC allocated to them and at least one credit 
	      // available.
	      
	      wire [0:num_vcs-1] req_hi_ivc;
	      assign req_hi_ivc
		= flit_valid_in_ivc & ivs_allocated_ivc & ivs_cred_ivc;
	      
	      wire [0:num_vcs-1] req_lo_ivc;
	      assign req_lo_ivc = flit_valid_in_ivc & ~ivs_allocated_ivc;
	      
	      wire [0:num_vcs-1] req_ivc;
	      assign req_ivc = req_hi_ivc | req_lo_ivc;
	      
	      wire 		 flit_sel_fast;
	      
	      if(dual_path_alloc)
		begin
		   if(dual_path_mask_on_ready)
		     assign flit_sel_fast
		       = ~|(req_ivc | 
			    (flit_valid_in_ivc & flit_sel_fast_in_ivc));
		   else
		     assign flit_sel_fast = ~|flit_valid_in_ivc;
		end
	      else
		assign flit_sel_fast = 1'b0;
	      
	      wire [0:num_vcs-1] sel_ivc;
	      
	      wire 		 flit_kill;
	      c_select_1ofn
		#(.num_ports(num_vcs),
		  .width(1))
	      flit_kill_sel
		(.select(sel_ivc),
		 .data_in(ivs_flit_kill_ivc),
		 .data_out(flit_kill));
	      
	      wire [0:num_vcs-1] gnt_hi_ivc, gnt_lo_ivc;
	      wire [0:num_vcs-1] gnt_ivc;
	      
	      if(precomp_ivc_sel)
		begin
		   
		   if(num_vcs == 1)
		     begin
			assign gnt_hi_ivc = req_hi_ivc;
			assign gnt_lo_ivc = req_lo_ivc;
			assign gnt_ivc = req_ivc;
			assign sel_ivc = 1'b1;
		     end
		   else if(num_vcs > 1)
		     begin
			
			wire [0:num_vcs-1] prio_ivc;
			
			wire [0:num_vcs-1] mgnt_hi_ivc;
			c_prefix_arbiter_base
			  #(.num_ports(num_vcs))
			ihrab
			  (.prio_port(prio_ivc),
			   .req(req_hi_ivc),
			   .gnt(mgnt_hi_ivc));
			
			wire [0:num_vcs-1] mgnt_lo_ivc;
			c_prefix_arbiter_base
			  #(.num_ports(num_vcs))
			ilrab
			  (.prio_port(prio_ivc),
			   .req(req_lo_ivc),
			   .gnt(mgnt_lo_ivc));
			
			wire [0:num_vcs-1] mgnt_other_ivc;
			c_prefix_arbiter_base
			  #(.num_ports(num_vcs))
			iorab
			  (.prio_port(prio_ivc),
			   .req(flit_valid_in_ivc),
			   .gnt(mgnt_other_ivc));
			
			wire [0:num_vcs-1] mgnt_ivc;
			wire 		   update;
			
			if(dual_path_alloc)
			  begin
			     
			     assign mgnt_ivc
			       = (|req_hi_ivc) ? mgnt_hi_ivc : 
				 (|req_lo_ivc) ? mgnt_lo_ivc :
				 flit_sel_fast_in_ivc;
			     
			     assign update
			       = (|req_ivc) ?
				 (~|gnt_ivc | oal_flit_sent) :
				 (flit_valid_fast_in & flit_sel_fast);
			     
			     wire [0:num_vcs-1] presel_ivc_s, presel_ivc_q;
			     assign presel_ivc_s
			       = update ? mgnt_ivc : presel_ivc_q;
			     c_dff
			       #(.width(num_vcs),
				 .reset_value({1'b1, {(num_vcs-1){1'b0}}}),
				 .reset_type(reset_type))
			     presel_ivcq
			       (.clk(clk),
				.reset(reset),
				.active(active),
				.d(presel_ivc_s),
				.q(presel_ivc_q));
			     
			     assign prio_ivc = {presel_ivc_q[num_vcs-1], 
						presel_ivc_q[0:num_vcs-2]};
			     
			     assign gnt_hi_ivc = req_hi_ivc & presel_ivc_q;
			     assign gnt_lo_ivc = req_lo_ivc & presel_ivc_q;
			     assign gnt_ivc = req_ivc & presel_ivc_q;
			     assign sel_ivc = presel_ivc_q;
			     
			  end
			else
			  begin
			     
			     assign mgnt_ivc = (|req_hi_ivc) ? mgnt_hi_ivc :
					       (|req_lo_ivc) ? mgnt_lo_ivc :
					       mgnt_other_ivc;
			     
			     wire 		other_flits_valid;
			     assign other_flits_valid
			       = |(flit_valid_in_ivc & ~sel_ivc);
			     
			     wire 		flit_sent;
			     assign flit_sent = oal_flit_sent & ~flit_kill;
			     
			     wire 		flit_last;
			     c_select_1ofn
			       #(.num_ports(num_vcs),
				 .width(1))
			     flit_last_sel
			       (.select(sel_ivc),
				.data_in(flit_last_in_ivc),
				.data_out(flit_last));
			     
			     wire 		last_flit_sent;
			     assign last_flit_sent
			       = flit_last & flit_sent & ~other_flits_valid;
			     
			     wire [0:num_vcs-1] mask_ivc_s, mask_ivc_q;
			     assign mask_ivc_s
			       = update ? 
				 (mgnt_ivc | {num_vcs{last_flit_sent}}) : 
				 mask_ivc_q;
			     c_dff
			       #(.width(num_vcs),
				 .reset_value({num_vcs{1'b1}}),
				 .reset_type(reset_type))
			     mask_ivcq
			       (.clk(clk),
				.reset(reset),
				.active(active),
				.d(mask_ivc_s),
				.q(mask_ivc_q));
			     
			     assign update
			       = (|req_ivc & (~|gnt_ivc | oal_flit_sent)) | 
				 (|flit_valid_in_ivc & (&mask_ivc_q));
			     
			     assign prio_ivc = (&mask_ivc_q) ? 
					       {1'b1, {(num_vcs-1){1'b0}}} :
					       {mask_ivc_q[num_vcs-1], 
						mask_ivc_q[0:num_vcs-2]};
			     
			     assign gnt_hi_ivc = req_hi_ivc & mask_ivc_q;
			     assign gnt_lo_ivc = req_lo_ivc & mask_ivc_q;
			     assign gnt_ivc = req_ivc & mask_ivc_q;
			     assign sel_ivc = gnt_ivc;
			     
			  end
			
		     end
		   
		end
	      else
		begin
		   
		   wire update;
		   assign update = oal_flit_sent;
		   
		   c_arbiter
		     #(.num_ports(num_vcs),
		       .num_priorities(2),
		       .arbiter_type(sw_alloc_arbiter_type),
		       .reset_type(reset_type))
		   arb
		     (.clk(clk),
		      .reset(reset),
		      .active(active),
		      .update(update),
		      .req_pr({req_hi_ivc, req_lo_ivc}),
		      .gnt_pr({gnt_hi_ivc, gnt_lo_ivc}),
		      .gnt(gnt_ivc));
		   
		   assign sel_ivc = gnt_ivc;
		   
		end
	      
	      wire [0:num_ports-1] flit_valid_hi_op;
	      c_select_mofn
		#(.num_ports(num_vcs),
		  .width(num_ports))
	      flit_valid_hi_op_sel
		(.select(gnt_hi_ivc),
		 .data_in(rf_route_ivc_op),
		 .data_out(flit_valid_hi_op));
	      
	      wire [0:num_ports-1] flit_valid_lo_op;
	      c_select_mofn
		#(.num_ports(num_vcs),
		  .width(num_ports))
	      flit_valid_lo_op_sel
		(.select(gnt_lo_ivc),
		 .data_in(rf_route_ivc_op),
		 .data_out(flit_valid_lo_op));
	      
	      wire 		   flit_head;
	      c_select_1ofn
		#(.num_ports(num_vcs),
		  .width(1))
	      flit_head_sel
		(.select(sel_ivc),
		 .data_in(flit_head_in_ivc),
		 .data_out(flit_head));
	      
	      wire 		   flit_tail;
	      c_select_1ofn
		#(.num_ports(num_vcs),
		  .width(1))
	      flit_tail_sel
		(.select(sel_ivc),
		 .data_in(flit_tail_in_ivc),
		 .data_out(flit_tail));
	      
	      wire [0:num_vcs-1]   flit_sel_ovc;
	      c_select_1ofn
		#(.num_ports(num_vcs),
		  .width(num_vcs))
	      flit_sel_ovc_sel
		(.select(sel_ivc),
		 .data_in(ivs_flit_sel_ivc_ovc),
		 .data_out(flit_sel_ovc));
	      
	      assign ial_flit_valid_hi_op = flit_valid_hi_op;
	      assign ial_flit_valid_lo_op = flit_valid_lo_op;
	      assign ial_flit_sel_ivc = sel_ivc;
	      assign ial_flit_head = flit_head;
	      assign ial_flit_tail = flit_tail;
	      assign ial_flit_sel_ovc = flit_sel_ovc;
	      assign ial_flit_sel_fast = flit_sel_fast;
	      
	      assign flit_sel_out_ivc = sel_ivc;	
	      assign flit_sent_out = oal_flit_sent & ~flit_kill;
	      
	   end
	   
	   
	   //-------------------------------------------------------------------
	   // generate activity signals for output side
	   //-------------------------------------------------------------------
	   
	   wire [0:num_vcs-1] active_ivc;
	   
	   wire [0:num_ports-1] route_op;
	   c_select_mofn
	     #(.num_ports(num_vcs),
	       .width(num_ports))
	   route_op_sel
	     (.select(active_ivc),
	      .data_in(rf_route_ivc_op),
	      .data_out(route_op));
	   
	   wire [0:num_ports-1] route_fast_op;
	   
	   if(dual_path_alloc)
	     begin
		
		assign active_ivc
		  = flit_valid_in_ivc | 
		    ({num_vcs{flit_valid_fast_in & ~flit_head_fast_in}} &
		     flit_sel_fast_in_ivc);
		
		assign route_fast_op
		  = {num_ports{flit_valid_fast_in & flit_head_fast_in}} &
		    route_fast_in_op;
		
	     end
	   else
	     begin
		assign active_ivc = flit_valid_in_ivc;
		assign route_fast_op = {num_ports{1'b0}};
	     end
	   
	   assign active_op = route_op | route_fast_op;
	   
	end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // connect input and output side
   //---------------------------------------------------------------------------
   
   wire [0:num_ports*num_ports-1] ial_flit_valid_hi_op_ip;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   ial_flit_valid_hi_op_ip_intl
     (.data_in(ial_flit_valid_hi_ip_op),
      .data_out(ial_flit_valid_hi_op_ip));
   
   wire [0:num_ports*num_ports-1] ial_flit_valid_lo_op_ip;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   ial_flit_valid_lo_op_ip_intl
     (.data_in(ial_flit_valid_lo_ip_op),
      .data_out(ial_flit_valid_lo_op_ip));
   
   wire [0:num_ports*num_ports-1] ifl_flit_valid_op_ip;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   ifl_flit_valid_op_ip_intl
     (.data_in(ifl_flit_valid_ip_op),
      .data_out(ifl_flit_valid_op_ip));
   
   wire [0:num_ports*num_ports-1] oal_flit_sent_op_ip;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   oal_flit_sent_ip_op_intl
     (.data_in(oal_flit_sent_op_ip),
      .data_out(oal_flit_sent_ip_op));
   
   wire [0:num_ports*num_ports-1] ofl_flit_sent_op_ip;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   ofl_flit_sent_ip_op_intl
     (.data_in(ofl_flit_sent_op_ip),
      .data_out(ofl_flit_sent_ip_op));
   
   wire [0:num_ports*num_ports-1] active_op_ip;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   active_op_ip_intl
     (.data_in(active_ip_op),
      .data_out(active_op_ip));
   
   
   //---------------------------------------------------------------------------
   // output side
   //---------------------------------------------------------------------------
   
   generate
      
      //------------------------------------------------------------------------
      // output ports
      //------------------------------------------------------------------------
      
      genvar 					  op;
      
      for(op = 0; op < num_ports; op = op + 1)
	begin:ops
	   
	   //-------------------------------------------------------------------
	   // connect inputs
	   //-------------------------------------------------------------------
	   
	   wire [0:num_ports-1] active_ip;
	   assign active_ip = active_op_ip[op*num_ports:(op+1)*num_ports-1];
	   
	   wire [0:num_vcs-1] 	elig_in_ovc;
	   assign elig_in_ovc = elig_in_op_ovc[op*num_vcs:(op+1)*num_vcs-1];
	   
	   wire [0:num_vcs-1] 	empty_in_ovc;
	   assign empty_in_ovc = empty_in_op_ovc[op*num_vcs:(op+1)*num_vcs-1];
	   
	   wire [0:num_vcs-1] 	full_in_ovc;
	   assign full_in_ovc = full_in_op_ovc[op*num_vcs:(op+1)*num_vcs-1];
	   
	   wire [0:num_ports-1] ial_flit_valid_hi_ip;
	   assign ial_flit_valid_hi_ip
	     = ial_flit_valid_hi_op_ip[op*num_ports:(op+1)*num_ports-1];
	   
	   wire [0:num_ports-1] ial_flit_valid_lo_ip;
	   assign ial_flit_valid_lo_ip
	     = ial_flit_valid_lo_op_ip[op*num_ports:(op+1)*num_ports-1];
	   
	   wire [0:num_ports-1] ifl_flit_valid_ip;
	   assign ifl_flit_valid_ip
	     = ifl_flit_valid_op_ip[op*num_ports:(op+1)*num_ports-1];
	   
	   
	   //-------------------------------------------------------------------
	   // connect outputs
	   //-------------------------------------------------------------------
	   
	   wire [0:num_vcs-1] 	nvs_next_elig_ovc;
	   assign nvs_next_elig_op_ovc[op*num_vcs:(op+1)*num_vcs-1]
	     = nvs_next_elig_ovc;
	   
	   wire [0:num_packet_classes-1] nvs_any_elig_opc;
	   assign nvs_any_elig_op_opc[op*num_packet_classes:
				      (op+1)*num_packet_classes-1]
	     = nvs_any_elig_opc;
	   
	   wire [0:num_ports-1] 	 oal_flit_sent_ip;
	   assign oal_flit_sent_op_ip[op*num_ports:(op+1)*num_ports-1]
	     = oal_flit_sent_ip;
	   
	   wire [0:num_ports-1] 	 ofl_flit_sent_ip;
	   assign ofl_flit_sent_op_ip[op*num_ports:(op+1)*num_ports-1]
	     = ofl_flit_sent_ip;
	   
	   wire 			 oxl_flit_sent;
	   assign oxl_flit_sent_op[op] = oxl_flit_sent;
	   
	   wire 			 flit_valid_out;
	   assign flit_valid_out_op[op] = flit_valid_out;
	   
	   wire 			 flit_head_out;
	   assign flit_head_out_op[op] = flit_head_out;
	   
	   wire 			 flit_tail_out;
	   assign flit_tail_out_op[op] = flit_tail_out;
	   
	   wire [0:num_vcs-1] 		 flit_sel_out_ovc;
	   assign flit_sel_out_op_ovc[op*num_vcs:(op+1)*num_vcs-1]
	     = flit_sel_out_ovc;
	   
	   wire [0:num_ports-1] 	 flit_sel_out_ip;
	   assign flit_sel_out_op_ip[op*num_ports:(op+1)*num_ports-1]
	     = flit_sel_out_ip;
	   
	   
	   //-------------------------------------------------------------------
	   // arbitration
	   //-------------------------------------------------------------------
	   
	   wire 			 active;
	   assign active = |active_ip;
	   
	   wire 			 oal_allocated;
	   wire 			 oal_flit_sent;
	   wire 			 oal_flit_head;
	   wire 			 oal_flit_tail;
	   wire [0:num_vcs-1] 		 oal_flit_sel_ovc;
	   wire 			 oal_flit_kill;
	   
	   if(1) begin:oal
	      
	      wire [0:num_ports-1] req_hi_ip;
	      assign req_hi_ip = ial_flit_valid_hi_ip;
	      
	      wire [0:num_ports-1] req_lo_ip;
	      assign req_lo_ip = ial_flit_valid_lo_ip;
	      
	      wire [0:num_ports-1] gnt_ip;
	      wire 		   flit_sent;
	      wire 		   allocated;
	      
	      if(precomp_ip_sel)
		begin
		   
		   wire [0:num_ports-1] prio_ip;
		   
		   wire [0:num_ports-1] mgnt_hi_ip;
		   c_prefix_arbiter_base
		     #(.num_ports(num_ports))
		   ohpab
		     (.prio_port(prio_ip),
		      .req(req_hi_ip),
		      .gnt(mgnt_hi_ip));
		   
		   wire [0:num_ports-1] mgnt_lo_ip;
		   c_prefix_arbiter_base
		     #(.num_ports(num_ports))
		   olpab
		     (.prio_port(prio_ip),
		      .req(req_lo_ip),
		      .gnt(mgnt_lo_ip));
		   
		   wire [0:num_ports-1] mgnt_ip;
		   assign mgnt_ip = (|req_hi_ip) ? mgnt_hi_ip : mgnt_lo_ip;
		   
		   wire [0:port_idx_width-1] next_port;
		   c_encode
		     #(.num_ports(num_ports))
		   next_port_enc
		     (.data_in(mgnt_ip),
		      .data_out(next_port));
		   
		   wire [0:num_ports-1]      req_ip;
		   assign req_ip = req_hi_ip | req_lo_ip;
		   
		   wire 		     update;
		   assign update = |req_ip;
		   
		   
		   wire [0:port_idx_width-1] presel_s, presel_q;
		   assign presel_s = update ? next_port : presel_q;
		   c_dff
		     #(.width(port_idx_width),
		       .reset_type(reset_type))
		   preselq
		     (.clk(clk),
		      .reset(reset),
		      .active(active),
		      .d(presel_s),
		      .q(presel_q));
		   
		   c_decode
		     #(.num_ports(num_ports),
		       .offset(num_ports-1))
		   prio_ip_dec
		     (.data_in(presel_q),
		      .data_out(prio_ip));
		   
		   wire [0:num_ports-1]      presel_ip;
		   c_decode
		     #(.num_ports(num_ports))
		   presel_ip_dec
		     (.data_in(presel_q),
		      .data_out(presel_ip));
		   
		   wire [0:num_ports-1]      gnt_presel_ip;
		   assign gnt_presel_ip = req_ip & presel_ip;
		   
		   wire [0:num_ports-1]      gnt_onehot_ip;
		   c_one_hot_filter
		     #(.width(num_ports))
		   oohf
		     (.data_in(req_ip),
		      .data_out(gnt_onehot_ip));
		   
		   wire 		     multi_hot;
		   c_multi_hot_det
		     #(.width(num_ports))
		   omhd
		     (.data(req_ip),
		      .multi_hot(multi_hot));
		   
		   // NOTE: If the request vector is one-hot, either both 
		   // methods will agree, or preselection will not generate a
		   // grant; on the other hand, if it is not one-hot, the one-
		   // hot filter will return a zero vector. In both cases, we
		   // can safely just OR the results together.
		   
		   assign gnt_ip = gnt_presel_ip | gnt_onehot_ip;
		   
		   assign flit_sent = (|req_ip & ~multi_hot) | (|gnt_presel_ip);
		   
		   c_select_1ofn
		     #(.num_ports(num_ports),
		       .width(1))
		   allocated_sel
		     (.select(gnt_ip),
		      .data_in(req_hi_ip),
		      .data_out(allocated));
		   
		end
	      else
		begin
		   
		   // NOTE: If a head flit wins output arbitration, but the 
		   // subsequent check for an eligible output VC to go to 
		   // fails, we still update the arbiter. This is so  we don't 
		   // get stuck on a single VC that is unable to acquire an 
		   // output VC trying over and over again to the exclusion of 
		   // all others.
		   
		   assign flit_sent = |(req_hi_ip | req_lo_ip);
		   
		   wire 		   update;
		   assign update = flit_sent;
		   
		   wire [0:num_ports-1]    gnt_hi_ip, gnt_lo_ip;
		   c_arbiter
		     #(.num_ports(num_ports),
		       .num_priorities(2),
		       .arbiter_type(sw_alloc_arbiter_type),
		       .reset_type(reset_type))
		   oarb
		     (.clk(clk),
		      .reset(reset),
		      .active(active),
		      .update(update),
		      .req_pr({req_hi_ip, req_lo_ip}),
		      .gnt_pr({gnt_hi_ip, gnt_lo_ip}),
		      .gnt(gnt_ip));
		   
		   assign allocated = |req_hi_ip;
		   
		end
	      
	      wire 			   flit_head;
	      c_select_1ofn
		#(.num_ports(num_ports),
		  .width(1))
	      flit_head_sel
		(.select(gnt_ip),
		 .data_in(ial_flit_head_ip),
		 .data_out(flit_head));
	      
	      wire 			   flit_tail;
	      c_select_1ofn
		#(.num_ports(num_ports),
		  .width(1))
	      flit_tail_sel
		(.select(gnt_ip),
		 .data_in(ial_flit_tail_ip),
		 .data_out(flit_tail));
	      
	      wire [0:num_vcs-1] 	   ial_flit_sel_ovc;
	      c_select_1ofn
		#(.num_ports(num_ports),
		  .width(num_vcs))
	      ial_flit_sel_ovc_sel
		(.select(gnt_ip),
		 .data_in(ial_flit_sel_ip_ovc),
		 .data_out(ial_flit_sel_ovc));
	      
	      wire [0:num_vcs-1] 	   flit_sel_ovc;
	      assign flit_sel_ovc
		= ial_flit_sel_ovc & ({num_vcs{allocated}} | nvs_next_elig_ovc);
	      
	      wire 			   flit_kill;
	      assign flit_kill
		= ~allocated & ~|(flit_sel_ovc & nvs_next_elig_ovc);
	      
	      assign oal_allocated = allocated;
	      assign oal_flit_sent_ip = gnt_ip;
	      assign oal_flit_sent = flit_sent;
	      assign oal_flit_head = flit_head;
	      assign oal_flit_tail = flit_tail;
	      assign oal_flit_sel_ovc = flit_sel_ovc;
	      assign oal_flit_kill = flit_kill;
	      
	   end
	   
	   
	   //-------------------------------------------------------------------
	   // fast-path arbitration
	   //-------------------------------------------------------------------
	   
	   wire 		      ofl_flit_sent;
	   wire 		      ofl_flit_head;
	   wire 		      ofl_flit_tail;
	   wire [0:num_vcs-1] 	      ofl_flit_sel_ovc;
	   wire 		      ofl_flit_kill;
	   
	   if(1) begin:ofl
	      
	      if(dual_path_alloc)
		begin
		   
		   wire [0:num_ports-1] req_ip;
		   assign req_ip = ifl_flit_valid_ip;
		   
		   wire [0:num_ports-1] gnt_ip;
		   wire 		flit_sent;
		   
		   if(dual_path_allow_conflicts)
		     begin
			
			// NOTE: If a head flit wins output arbitration, but 
			// the subsequent check for an eligible output VC to go 
			// to fails, we still update the arbiter.
			
			assign flit_sent = |req_ip;
			
			wire update;
			assign update = flit_sent;
			
			c_arbiter
			  #(.num_ports(num_ports),
			    .num_priorities(1),
			    .arbiter_type(sw_alloc_arbiter_type),
			    .reset_type(reset_type))
			oarb
			  (.clk(clk),
			   .reset(reset),
			   .active(active),
			   .update(update),
			   .req_pr(req_ip),
			   .gnt_pr(gnt_ip),
			   .gnt());
			
		     end
		   else
		     begin
			
			c_one_hot_filter
			  #(.width(num_ports))
			oohf
			  (.data_in(req_ip),
			   .data_out(gnt_ip));
			
			wire multi_hot;
			c_multi_hot_det
			  #(.width(num_ports))
			omhd
			  (.data(req_ip),
			   .multi_hot(multi_hot));
			
			assign flit_sent = |req_ip & ~multi_hot;
			
		     end
		   
		   wire      flit_head;
		   c_select_1ofn
		     #(.num_ports(num_ports),
		       .width(1))
		   flit_head_sel
		     (.select(gnt_ip),
		      .data_in(flit_head_fast_in_ip),
		      .data_out(flit_head));
		   
		   wire      flit_tail;
		   c_select_1ofn
		     #(.num_ports(num_ports),
		       .width(1))
		   flit_tail_sel
		     (.select(gnt_ip),
		      .data_in(flit_tail_fast_in_ip),
		      .data_out(flit_tail));
		   
		   wire [0:num_vcs-1] ifl_flit_sel_ovc;
		   c_select_1ofn
		     #(.num_ports(num_ports),
		       .width(num_vcs))
		   ifl_flit_sel_ovc_sel
		     (.select(gnt_ip),
		      .data_in(ifl_flit_sel_ip_ovc),
		      .data_out(ifl_flit_sel_ovc));
		   
		   wire [0:num_vcs-1] flit_sel_ovc;
		   assign flit_sel_ovc
		     = ifl_flit_sel_ovc & 
		       ({num_vcs{~flit_head}} | nvs_next_elig_ovc);
		   
		   wire 	      flit_kill;
		   assign flit_kill
		     = flit_head & ~|(flit_sel_ovc & nvs_next_elig_ovc);
		   
		   assign ofl_flit_sent_ip
		     = gnt_ip & {num_ports{~oal_flit_sent}};
		   assign ofl_flit_sent = flit_sent & ~oal_flit_sent;
		   assign ofl_flit_head = flit_head;
		   assign ofl_flit_tail = flit_tail;
		   assign ofl_flit_sel_ovc = flit_sel_ovc;
		   assign ofl_flit_kill = flit_kill;
		   
		end
	      else
		begin
		   assign ofl_flit_sent_ip = {num_ports{1'b0}};
		   assign ofl_flit_sent = 1'b0;
		   assign ofl_flit_head = 1'b0;
		   assign ofl_flit_tail = 1'b0;
		   assign ofl_flit_sel_ovc = {num_vcs{1'b0}};
		   assign ofl_flit_kill = 1'b0;
		end
	      
	   end
	   
	   
	   //-------------------------------------------------------------------
	   // generate crossbar control signals
	   //-------------------------------------------------------------------
	   
	   wire 		      valid_active;
	   assign valid_active = active | flit_valid_out;
	   
	   if(1) begin:xcl
	      
	      wire [0:num_ports-1] flit_sel_ip_s, flit_sel_ip_q;
	      assign flit_sel_ip_s = oal_flit_sent_ip | ofl_flit_sent_ip;
	      c_dff
		#(.width(num_ports),
		  .reset_type(reset_type))
	      flit_sel_ipq
		(.clk(clk),
		 .reset(reset),
		 .active(valid_active),
		 .d(flit_sel_ip_s),
		 .q(flit_sel_ip_q));
	      
	      assign flit_sel_out_ip = flit_sel_ip_q;
	      
	   end
	   
	   
	   //-------------------------------------------------------------------
	   // generate early flit sent signal
	   //-------------------------------------------------------------------
	   
	   assign oxl_flit_sent = oal_flit_sent | ofl_flit_sent;
	   
	   
	   //-------------------------------------------------------------------
	   // stage controls signals for output controllers
	   //-------------------------------------------------------------------
	   
	   wire 		   flit_valid_s, flit_valid_q;
	   assign flit_valid_s = (oal_flit_sent & ~oal_flit_kill) | 
				 (ofl_flit_sent & ~ofl_flit_kill);
	   c_dff
	     #(.width(1),
	       .reset_type(reset_type))
	   flit_validq
	     (.clk(clk),
	      .reset(reset),
	      .active(valid_active),
	      .d(flit_valid_s),
	      .q(flit_valid_q));
	   
	   assign flit_valid_out = flit_valid_q;
	   
	   wire 		   flit_head_s, flit_head_q;
	   assign flit_head_s = oal_flit_sent ? oal_flit_head : ofl_flit_head;
	   c_dff
	     #(.width(1),
	       .reset_type(reset_type))
	   flit_headq
	     (.clk(clk),
	      .reset(1'b0),
	      .active(active),
	      .d(flit_head_s),
	      .q(flit_head_q));
	   
	   assign flit_head_out = flit_head_q;
	   
	   wire 		   flit_tail_s, flit_tail_q;
	   assign flit_tail_s = oal_flit_sent ? oal_flit_tail : ofl_flit_tail;
	   c_dff
	     #(.width(1),
	       .reset_type(reset_type))
	   flit_tailq
	     (.clk(clk),
	      .reset(1'b0),
	      .active(active),
	      .d(flit_tail_s),
	      .q(flit_tail_q));
	   
	   assign flit_tail_out = flit_tail_q;
	   
	   wire [0:num_vcs-1] 	   flit_sel_ovc_s, flit_sel_ovc_q;
	   assign flit_sel_ovc_s
	     = oal_flit_sent ? oal_flit_sel_ovc : ofl_flit_sel_ovc;
	   c_dff
	     #(.width(num_vcs),
	       .reset_type(reset_type))
	   flit_sel_ovcq
	     (.clk(clk),
	      .reset(1'b0),
	      .active(active),
	      .d(flit_sel_ovc_s),
	      .q(flit_sel_ovc_q));
	   
	   assign flit_sel_out_ovc = flit_sel_ovc_q;
	   
	   
	   //-------------------------------------------------------------------
	   // determine next free VC for each class
	   //-------------------------------------------------------------------
	   
	   if(1) begin:nvs
	      
	      if(num_vcs_per_class == 1)
		begin
		   if(elig_mask == `ELIG_MASK_NONE)
		     begin
			assign nvs_next_elig_ovc = elig_in_ovc & ~full_in_ovc;
			assign nvs_any_elig_opc = elig_in_ovc & ~full_in_ovc;
		     end
		   else
		     begin
			assign nvs_next_elig_ovc = elig_in_ovc;
			assign nvs_any_elig_opc = elig_in_ovc;
		     end
		end
	      else if(num_vcs_per_class > 1)
		begin
		   
		   genvar opc;
		   
		   for(opc = 0; opc < num_packet_classes; opc = opc + 1)
		     begin:opcs
			
			wire [0:num_vcs_per_class-1] oal_flit_sel_ocvc;
			assign oal_flit_sel_ocvc
			  = oal_flit_sel_ovc[opc*num_vcs_per_class:
					     (opc+1)*num_vcs_per_class-1];
			
			wire [0:num_vcs_per_class-1] ofl_flit_sel_ocvc;
			assign ofl_flit_sel_ocvc
			  = ofl_flit_sel_ovc[opc*num_vcs_per_class:
					     (opc+1)*num_vcs_per_class-1];
			
			wire 			     update;
			assign update = oal_flit_sent ?
					(~oal_allocated & |oal_flit_sel_ocvc) :
					(ofl_flit_sent & ofl_flit_head & 
					 |ofl_flit_sel_ocvc);
			
			wire [0:num_vcs_per_class-1] elig_in_ocvc;
			assign elig_in_ocvc
			  = elig_in_ovc[opc*num_vcs_per_class:
					(opc+1)*num_vcs_per_class-1];
			
			wire [0:num_vcs_per_class-1] full_in_ocvc;
			assign full_in_ocvc
			  = full_in_ovc[opc*num_vcs_per_class:
					(opc+1)*num_vcs_per_class-1];
			
			wire [0:num_vcs_per_class-1] empty_in_ocvc;
			assign empty_in_ocvc
			  = empty_in_ovc[opc*num_vcs_per_class:
					 (opc+1)*num_vcs_per_class-1];
			
			wire [0:num_vcs_per_class-1] gnt_ocvc;
			
			if(((elig_mask == `ELIG_MASK_NONE) ||
			    (elig_mask == `ELIG_MASK_FULL)) &&
			   vc_alloc_prefer_empty)
			  begin
			     
			     wire [0:num_vcs_per_class-1] req_hi_ocvc;
			     assign req_hi_ocvc = elig_in_ocvc & empty_in_ocvc;
			     
			     wire [0:num_vcs_per_class-1] req_lo_ocvc;
			     if(elig_mask == `ELIG_MASK_NONE)
			       assign req_lo_ocvc
				 = elig_in_ocvc & ~full_in_ocvc;
			     else
			       assign req_lo_ocvc = elig_in_ocvc;
			     
			     wire [0:num_vcs_per_class-1] gnt_hi_ocvc;
			     wire [0:num_vcs_per_class-1] gnt_lo_ocvc;
			     c_arbiter
			       #(.num_ports(num_vcs_per_class),
				 .num_priorities(2),
				 .arbiter_type(vc_alloc_arbiter_type),
				 .reset_type(reset_type))
			     arb
			       (.clk(clk),
				.reset(reset),
				.active(active),
				.update(update),
				.req_pr({req_hi_ocvc, req_lo_ocvc}),
				.gnt_pr({gnt_hi_ocvc, gnt_lo_ocvc}),
				.gnt(gnt_ocvc));
			     
			  end
			else
			  begin
			     
			     wire [0:num_vcs_per_class-1] req_ocvc;
			     if(elig_mask == `ELIG_MASK_NONE)
			       assign req_ocvc = elig_in_ocvc & ~full_in_ocvc;
			     else
			       assign req_ocvc = elig_in_ocvc;
			     
			     c_arbiter
			       #(.num_ports(num_vcs_per_class),
				 .num_priorities(1),
				 .arbiter_type(vc_alloc_arbiter_type),
				 .reset_type(reset_type))
			     arb
			       (.clk(clk),
				.reset(reset),
				.active(active),
				.update(update),
				.req_pr(req_ocvc),
				.gnt_pr(gnt_ocvc),
				.gnt());
			     
			  end
			
			assign nvs_next_elig_ovc[opc*num_vcs_per_class:
						 (opc+1)*num_vcs_per_class-1]
			  = gnt_ocvc;
			
			if(elig_mask == `ELIG_MASK_NONE)
			  assign nvs_any_elig_opc[opc]
			    = |(elig_in_ocvc & ~full_in_ocvc);
			else
			  assign nvs_any_elig_opc[opc] = |elig_in_ocvc;
			
		     end
		   
		end
	      
	   end
	   
	end
      
   endgenerate
   
endmodule
