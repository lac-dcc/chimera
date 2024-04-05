// $Id: vcr_ivc_ctrl.v 5188 2012-08-30 00:31:31Z dub $

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
// input VC controller
//==============================================================================

module vcr_ivc_ctrl
  (clk, reset, router_address, flit_valid_in, flit_head_in, flit_tail_in, 
   flit_sel_in, header_info_in, fb_pop_tail, fb_pop_next_header_info, 
   almost_full_op_ovc, full_op_ovc, route_op, route_orc, vc_gnt, vc_sel_ovc, 
   sw_gnt, sw_sel, sw_gnt_op, flit_valid, flit_head, flit_tail, next_lar_info, 
   fb_almost_empty, fb_empty, allocated, free_nonspec, free_spec, errors);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
`include "vcr_constants.v"
   
   // number of message classes (e.g. request, reply)
   parameter num_message_classes = 2;
   
   // number of resource classes (e.g. minimal, adaptive)
   parameter num_resource_classes = 2;
   
   // width required to select individual resource class
   localparam resource_class_idx_width = clogb(num_resource_classes);
   
   // total number of packet classes
   localparam num_packet_classes = num_message_classes * num_resource_classes;
   
   // number of VCs available for each class
   parameter num_vcs_per_class = 1;
   
   // number of VCs available for each message class
   localparam num_vcs_per_message_class
     = num_resource_classes * num_vcs_per_class;
   
   // number of VCs
   localparam num_vcs = num_packet_classes * num_vcs_per_class;
   
   // width required to select individual VC
   localparam vc_idx_width = clogb(num_vcs);
   
   // number of routers in each dimension
   parameter num_routers_per_dim = 4;
   
   // number of dimensions in network
   parameter num_dimensions = 2;
   
   // number of nodes per router (a.k.a. consentration factor)
   parameter num_nodes_per_router = 1;
   
   // connectivity within each dimension
   parameter connectivity = `CONNECTIVITY_LINE;
   
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
   
   // select packet format
   parameter packet_format = `PACKET_FORMAT_EXPLICIT_LENGTH;
   
   // maximum payload length (in flits)
   // (note: only used if packet_format==`PACKET_FORMAT_EXPLICIT_LENGTH)
   parameter max_payload_length = 4;
   
   // minimum payload length (in flits)
   // (note: only used if packet_format==`PACKET_FORMAT_EXPLICIT_LENGTH)
   parameter min_payload_length = 1;
   
   // number of bits required to represent all possible payload sizes
   localparam payload_length_width
     = clogb(max_payload_length-min_payload_length+1);
   
   // width of counter for remaining flits
   localparam flit_ctr_width = clogb(max_payload_length);
   
   // width required to select individual router in a dimension
   localparam dim_addr_width = clogb(num_routers_per_dim);
   
   // width required to select individual router in network
   localparam router_addr_width = num_dimensions * dim_addr_width;
   
   // width required to select individual node at current router
   localparam node_addr_width = clogb(num_nodes_per_router);
   
   // width of global addresses
   localparam addr_width = router_addr_width + node_addr_width;
   
   // width of flit control signals
   localparam flit_ctrl_width
     = (packet_format == `PACKET_FORMAT_HEAD_TAIL) ? 
       (1 + vc_idx_width + 1 + 1) : 
       (packet_format == `PACKET_FORMAT_TAIL_ONLY) ? 
       (1 + vc_idx_width + 1) : 
       (packet_format == `PACKET_FORMAT_EXPLICIT_LENGTH) ? 
       (1 + vc_idx_width + 1) : 
       -1;
   
   // filter out illegal destination ports
   // (the intent is to allow synthesis to optimize away the logic associated 
   // with such turns)
   parameter restrict_turns = 1;
   
   // width required for lookahead routing information
   localparam lar_info_width = port_idx_width + resource_class_idx_width;
   
   // select routing function type
   parameter routing_type = `ROUTING_TYPE_PHASED_DOR;
   
   // total number of bits required for storing routing information
   localparam dest_info_width
     = (routing_type == `ROUTING_TYPE_PHASED_DOR) ? 
       (num_resource_classes * router_addr_width + node_addr_width) : 
       -1;
   
   // total number of bits required for routing-related information
   localparam route_info_width = lar_info_width + dest_info_width;
   
   // total number of bits of header information encoded in header flit payload
   localparam header_info_width
     = (packet_format == `PACKET_FORMAT_HEAD_TAIL) ? 
       route_info_width : 
       (packet_format == `PACKET_FORMAT_TAIL_ONLY) ? 
       route_info_width : 
       (packet_format == `PACKET_FORMAT_EXPLICIT_LENGTH) ? 
       (route_info_width + payload_length_width) : 
       -1;
   
   // select order of dimension traversal
   parameter dim_order = `DIM_ORDER_ASCENDING;
   
   // select whether to exclude full or non-empty VCs from VC allocation
   parameter elig_mask = `ELIG_MASK_NONE;
   
   // VC allocation is atomic
   localparam atomic_vc_allocation = (elig_mask == `ELIG_MASK_USED);
   
   // enable speculative switch allocation
   parameter sw_alloc_spec = 1;
   
   // select flit buffer management scheme
   parameter fb_mgmt_type = `FB_MGMT_TYPE_STATIC;
   
   // use explicit pipeline register between flit buffer and crossbar?
   parameter explicit_pipeline_register = 0;
   
   // ID of current input VC
   parameter vc_id = 0;
   
   // message class to which this VC belongs
   localparam message_class
     = (vc_id / num_vcs_per_message_class) % num_message_classes;
   
   // resource class to which this VC belongs
   localparam resource_class
     = (vc_id / num_vcs_per_class) % num_resource_classes;
   
   // ID of current input port
   parameter port_id = 0;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   
   // current router's address
   input [0:router_addr_width-1] router_address;
   
   // incoming flit valid
   input 			 flit_valid_in;
   
   // incoming flit is head flit
   input 			 flit_head_in;
   
   // incoming flit is tail
   input 			 flit_tail_in;
   
   // incoming flit is for current VC
   input 			 flit_sel_in;
   
   // header info for incoming flit
   // (NOTE: only valid if flit_head_in=1)
   input [0:header_info_width-1] header_info_in;
   
   // tail indicator for frontmost flit in buffer (if any)
   input 			 fb_pop_tail;
   
   // header info from next flit in buffer
   // (NOTE: only valid if buffer contains at least two entries)
   input [0:header_info_width-1] fb_pop_next_header_info;
   
   // which output VC have only a single credit left?
   input [0:num_ports*num_vcs-1]   almost_full_op_ovc;
   
   // which output VC have no credit left?
   input [0:num_ports*num_vcs-1]   full_op_ovc;
   
   // destination port (1-hot)
   output [0:num_ports-1] 	   route_op;
   wire [0:num_ports-1] 	   route_op;
   
   // select next resource class
   output [0:num_resource_classes-1] route_orc;
   wire [0:num_resource_classes-1]   route_orc;
   
   // VC allocation successful
   input 			     vc_gnt;
   
   // granted output VC
   input [0:num_vcs-1] 		     vc_sel_ovc;
   
   // switch allocator grants
   input 			     sw_gnt;
   
   // switch allocator grant is for this VC
   input 			     sw_sel;
   
   // switch grant for output ports
   input [0:num_ports-1] 	     sw_gnt_op;
   
   // outgoing flit is available
   output 			     flit_valid;
   wire 			     flit_valid;
   
   // outgoing flit is head flit
   output 			     flit_head;
   wire 			     flit_head;
   
   // outgoing flit is tail flit
   output 			     flit_tail;
   wire 			     flit_tail;
   
   // updated lookahead routing info
   // (NOTE: only valid if the current flit is a head flit)
   output [0:lar_info_width-1] 	     next_lar_info;
   wire [0:lar_info_width-1] 	     next_lar_info;
   
   // flit buffer has a single valid entry left
   input 			     fb_almost_empty;
   
   // flit buffer does not have any valid entries
   input 			     fb_empty;
   
   // has an output VC been assigned to this input VC?
   output 			     allocated;
   wire 			     allocated;
   
   // credit availability if VC has been assigned
   output 			     free_nonspec;
   wire 			     free_nonspec;
   
   // credit availability if no VC has been assigned yet
   output 			     free_spec;
   wire 			     free_spec;
   
   // internal error condition detected
   output [0:2] 		     errors;
   wire [0:2] 			     errors;
   
   
   //---------------------------------------------------------------------------
   // keep track of VC allocation status
   //---------------------------------------------------------------------------
   
   wire 			     flit_valid_sel_in;
   assign flit_valid_sel_in = flit_valid_in & flit_sel_in;
   
   assign flit_valid = flit_valid_sel_in | ~fb_empty;
   
   wire 			     pop_active;
   assign pop_active = flit_valid_in | ~fb_empty;
   
   wire 			     flit_sent;
   
   wire 			     flit_sent_tail;
   assign flit_sent_tail = flit_sent & flit_tail;
   
   wire 			     flit_valid_sel_head_in;
   assign flit_valid_sel_head_in = flit_valid_sel_in & flit_head_in;
   
   wire 			     vc_allocated_s, vc_allocated_q;
   generate
      if(atomic_vc_allocation)
	begin
	   assign vc_allocated_s
	     = (vc_allocated_q & ~flit_valid_sel_head_in) | vc_gnt;
	   assign allocated = vc_allocated_q & ~flit_valid_sel_head_in;
	end
      else
	begin
	   assign vc_allocated_s = (vc_allocated_q | vc_gnt) & ~flit_sent_tail;
	   assign allocated = vc_allocated_q;
	end
   endgenerate
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   vc_allocatedq
     (.clk(clk),
      .reset(reset),
      .active(pop_active),
      .d(vc_allocated_s),
      .q(vc_allocated_q));
   
   wire [0:num_vcs_per_message_class-1] vc_allocated_next_orc_ocvc;
   
   generate
      
      if(num_vcs_per_message_class == 1)
	assign vc_allocated_next_orc_ocvc = 1'b1;
      else if(num_vcs_per_message_class > 1)
	begin
	   
	   wire [0:num_vcs_per_message_class-1] vc_sel_orc_ocvc;
	   assign vc_sel_orc_ocvc
	     = vc_sel_ovc[message_class*num_vcs_per_message_class:
	                  (message_class+1)*num_vcs_per_message_class-1];
	   
	   wire [0:num_vcs_per_message_class-1] vc_allocated_orc_ocvc_q;
	   
	   assign vc_allocated_next_orc_ocvc
	     = allocated ? vc_allocated_orc_ocvc_q : vc_sel_orc_ocvc;
	   
	   wire [0:num_vcs_per_message_class-1] vc_allocated_orc_ocvc_s;
	   assign vc_allocated_orc_ocvc_s = vc_allocated_next_orc_ocvc;
	   c_dff
	     #(.width(num_vcs_per_message_class),
	       .reset_type(reset_type))
	   vc_allocated_orc_ocvcq
	     (.clk(clk),
	      .reset(1'b0),
	      .active(pop_active),
	      .d(vc_allocated_orc_ocvc_s),
	      .q(vc_allocated_orc_ocvc_q));
	   
	end
      
   endgenerate
   
   wire [0:num_vcs-1] vc_allocated_next_ovc;
   c_align
     #(.in_width(num_vcs_per_message_class),
       .out_width(num_vcs),
       .offset(message_class*num_vcs_per_message_class))
   vc_allocated_next_ovc_agn
     (.data_in(vc_allocated_next_orc_ocvc),
      .dest_in({num_vcs{1'b0}}),
      .data_out(vc_allocated_next_ovc));
   
   
   //---------------------------------------------------------------------------
   // generate head and tail indicators
   //---------------------------------------------------------------------------
   
   assign flit_tail = fb_empty ? flit_tail_in : fb_pop_tail;
   
   wire 	      htr_flit_head_s, htr_flit_head_q;
   assign htr_flit_head_s = flit_sent ? flit_tail : htr_flit_head_q;
   c_dff
     #(.width(1),
       .reset_type(reset_type),
       .reset_value(1'b1))
   htr_flit_headq
     (.clk(clk),
      .reset(reset),
      .active(pop_active),
      .d(htr_flit_head_s),
      .q(htr_flit_head_q));
   
   assign flit_head = fb_empty ? flit_head_in : htr_flit_head_q;
   
   
   //---------------------------------------------------------------------------
   // header info register
   //---------------------------------------------------------------------------
   
   wire [0:route_info_width-1] route_info_in;
   assign route_info_in = header_info_in[0:route_info_width-1];
   
   wire 		       hdr_active;
   wire 		       hdr_capture;
   generate
      if(atomic_vc_allocation)
	begin
	   assign hdr_active = flit_valid_in & flit_head_in;
	   assign hdr_capture = flit_valid_sel_head_in;
	end
      else
	begin
	   assign hdr_active = ~fb_empty | (flit_valid_in & flit_head_in);
	   assign hdr_capture = (fb_empty & flit_valid_sel_head_in) | 
				flit_sent_tail;
	end
   endgenerate
   
   wire two_plus_flits;
   assign two_plus_flits = ~fb_empty & ~fb_almost_empty;
   
   wire [0:route_info_width-1] fb_pop_next_route_info;
   assign fb_pop_next_route_info
     = fb_pop_next_header_info[0:route_info_width-1];
   
   wire [0:lar_info_width-1]   lar_info_in;
   assign lar_info_in = route_info_in[0:lar_info_width-1];
   
   wire [0:lar_info_width-1]   hdr_lar_info_s, hdr_lar_info_q;
   generate
      if(atomic_vc_allocation)
	assign hdr_lar_info_s = hdr_capture ? lar_info_in : hdr_lar_info_q;
      else
	begin
	   
	   wire [0:lar_info_width-1] fb_pop_next_lar_info;
	   assign fb_pop_next_lar_info
	     = fb_pop_next_route_info[0:lar_info_width-1];
	   
	   assign hdr_lar_info_s
	     = hdr_capture ?
	       (two_plus_flits ? fb_pop_next_lar_info : lar_info_in) :
	       hdr_lar_info_q;
	   
	end
   endgenerate
   c_dff
     #(.width(lar_info_width),
       .reset_type(reset_type))
   hdr_lar_infoq
     (.clk(clk),
      .reset(1'b0),
      .active(hdr_active),
      .d(hdr_lar_info_s),
      .q(hdr_lar_info_q));
   
   wire [0:dest_info_width-1] 	     dest_info_in;
   assign dest_info_in = route_info_in[lar_info_width:
				       lar_info_width+dest_info_width-1];
   
   wire [0:dest_info_width-1] 	     hdr_dest_info_s, hdr_dest_info_q;
   generate
      if(atomic_vc_allocation)
	assign hdr_dest_info_s = hdr_capture ? dest_info_in : hdr_dest_info_q;
      else
	begin
	   
	   wire [0:dest_info_width-1] fb_pop_next_dest_info;
	   assign fb_pop_next_dest_info
	     = fb_pop_next_route_info[lar_info_width:
				      lar_info_width+dest_info_width-1];
	   
	   assign hdr_dest_info_s
	     = hdr_capture ?
	       (two_plus_flits ? fb_pop_next_dest_info : dest_info_in) :
	       hdr_dest_info_q;
	   
	end
   endgenerate
   c_dff
     #(.width(dest_info_width),
       .reset_type(reset_type))
   hdr_dest_infoq
     (.clk(clk),
      .reset(1'b0),
      .active(hdr_active),
      .d(hdr_dest_info_s),
      .q(hdr_dest_info_q));
   
   
   //---------------------------------------------------------------------------
   // decode lookahead routing information
   //---------------------------------------------------------------------------
   
   wire [0:port_idx_width-1] 	      route_port_in;
   assign route_port_in = lar_info_in[0:port_idx_width-1];
   
   wire [0:num_ports-1] 	      route_in_op;
   c_decode
     #(.num_ports(num_ports))
   route_in_op_dec
     (.data_in(route_port_in),
      .data_out(route_in_op));
   
   wire [0:port_idx_width-1] 	      hdr_route_port;
   assign hdr_route_port = hdr_lar_info_q[0:port_idx_width-1];
   
   wire [0:num_ports-1] 	      hdr_route_op;
   c_decode
     #(.num_ports(num_ports))
   hdr_route_op_dec
     (.data_in(hdr_route_port),
      .data_out(hdr_route_op));
   
   wire 			      bypass_route_info;
   generate
      if(atomic_vc_allocation)
	assign bypass_route_info = flit_valid_sel_head_in;
      else
	assign bypass_route_info = fb_empty & flit_valid_sel_head_in;
   endgenerate
   
   wire [0:num_ports-1] 	      route_unmasked_op;
   assign route_unmasked_op = bypass_route_info ? route_in_op : hdr_route_op;
   
   wire [0:num_resource_classes-1]    route_unmasked_orc;
   
   generate
      
      if(num_resource_classes == 1)
	assign route_unmasked_orc = 1'b1;
      else if(num_resource_classes > 1)
	begin
	   
	   wire [0:resource_class_idx_width-1] route_rcsel_in;
	   assign route_rcsel_in
	     = lar_info_in[port_idx_width:
			   port_idx_width+resource_class_idx_width-1];
	   
	   wire [0:num_resource_classes-1]     route_in_orc;
	   c_decode
	     #(.num_ports(num_resource_classes))
	   route_in_orc_dec
	     (.data_in(route_rcsel_in),
	      .data_out(route_in_orc));
	   
	   wire [0:resource_class_idx_width-1] hdr_route_rcsel;
	   assign hdr_route_rcsel
	     = hdr_lar_info_q[port_idx_width:
				   port_idx_width+resource_class_idx_width-1];
	   
	   wire [0:num_resource_classes-1]     hdr_route_orc;
	   c_decode
	     #(.num_ports(num_resource_classes))
	   hdr_route_orc_dec
	     (.data_in(hdr_route_rcsel),
	      .data_out(hdr_route_orc));
	   
	   assign route_unmasked_orc
	     = bypass_route_info ? route_in_orc : hdr_route_orc;
	   
	end
      
   endgenerate
   
   wire [0:1] 				       rf_errors;
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
       .port_id(port_id),
       .vc_id(vc_id))
   rf
     (.clk(clk),
      .route_valid(flit_valid),
      .route_in_op(route_unmasked_op),
      .route_in_orc(route_unmasked_orc),
      .route_out_op(route_op),
      .route_out_orc(route_orc),
      .errors(rf_errors));
   
   wire 				       error_invalid_port;
   assign error_invalid_port = rf_errors[0];
   
   wire 				       error_invalid_class;
   assign error_invalid_class = rf_errors[1];
   
   
   //---------------------------------------------------------------------------
   // update lookahead routing information for next hop
   //---------------------------------------------------------------------------
   
   wire [0:dest_info_width-1] 		       dest_info;
   assign dest_info = bypass_route_info ? dest_info_in : hdr_dest_info_q;
   
   wire [0:lar_info_width-1] 		       lar_info;
   assign lar_info = bypass_route_info ? lar_info_in : hdr_lar_info_q;
   
   wire [0:router_addr_width-1] 	       next_router_address;
   rtr_next_hop_addr
     #(.num_resource_classes(num_resource_classes),
       .num_routers_per_dim(num_routers_per_dim),
       .num_dimensions(num_dimensions),
       .num_nodes_per_router(num_nodes_per_router),
       .connectivity(connectivity),
       .routing_type(routing_type))
   nha
     (.router_address(router_address),
      .dest_info(dest_info),
      .lar_info(lar_info),
      .next_router_address(next_router_address));
   
   wire [0:num_message_classes-1] 	       sel_mc;
   c_align
     #(.in_width(1),
       .out_width(num_message_classes),
       .offset(message_class))
   sel_mc_agn
     (.data_in(1'b1),
      .dest_in({num_message_classes{1'b0}}),
      .data_out(sel_mc));
   
   wire [0:num_ports-1] 		       next_route_op;
   wire [0:num_resource_classes-1] 	       next_route_orc;
   rtr_routing_logic
     #(.num_message_classes(num_message_classes),
       .num_resource_classes(num_resource_classes),
       .num_routers_per_dim(num_routers_per_dim),
       .num_dimensions(num_dimensions),
       .num_nodes_per_router(num_nodes_per_router),
       .connectivity(connectivity),
       .routing_type(routing_type),
       .dim_order(dim_order))
   rtl
     (.router_address(next_router_address),
      .sel_mc(sel_mc),
      .sel_irc(route_orc),
      .dest_info(dest_info),
      .route_op(next_route_op),
      .route_orc(next_route_orc));
   
   wire [0:port_idx_width-1] 		       next_route_port;
   c_encode
     #(.num_ports(num_ports))
   next_route_port_enc
     (.data_in(next_route_op),
      .data_out(next_route_port));
   
   assign next_lar_info[0:port_idx_width-1] = next_route_port;
   
   generate
      
      if(num_resource_classes > 1)
	begin
	   
	   wire [0:resource_class_idx_width-1] next_route_rcsel;
	   c_encode
	     #(.num_ports(num_resource_classes))
	   next_route_rcsel_enc
	     (.data_in(next_route_orc),
	      .data_out(next_route_rcsel));
	   
	   assign next_lar_info[port_idx_width:
				port_idx_width+resource_class_idx_width-1]
	     = next_route_rcsel;
	   
	end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // credit tracking
   //---------------------------------------------------------------------------
   
   wire 				       cred_track_active;
   assign cred_track_active = pop_active | allocated;
   
   wire [0:num_vcs-1] 			       almost_full_ovc;
   c_select_1ofn
     #(.num_ports(num_ports),
       .width(num_vcs))
   almost_full_ovc_sel
     (.select(route_op),
      .data_in(almost_full_op_ovc),
      .data_out(almost_full_ovc));
   
   wire [0:num_vcs-1] 			       full_ovc;
   c_select_1ofn
     #(.num_ports(num_ports),
       .width(num_vcs))
   full_ovc_sel
     (.select(route_op),
      .data_in(full_op_ovc),
      .data_out(full_ovc));
   
   wire 				       reduce;
   
   generate
      
      if(fb_mgmt_type == `FB_MGMT_TYPE_STATIC)
	assign reduce = flit_sent;
      else
	begin
	   
	   c_select_1ofn
	     #(.num_ports(num_ports),
	       .width(1))
	   reduce_sel
	     (.select(route_op),
	      .data_in(sw_gnt_op),
	      .data_out(reduce));
	   
	end
      
   endgenerate
   
   wire [0:num_vcs-1] 			       next_free_ovc;
   assign next_free_ovc = ~full_ovc & ~(almost_full_ovc & {num_vcs{reduce}});
   
   wire [0:num_vcs_per_message_class-1]        next_free_orc_ocvc;
   assign next_free_orc_ocvc
     = next_free_ovc[message_class*num_vcs_per_message_class:
		     (message_class+1)*num_vcs_per_message_class-1];
   
   wire 				       free_nonspec_muxed;
   c_select_1ofn
     #(.num_ports(num_vcs_per_message_class),
       .width(1))
   free_nonspec_muxed_sel
     (.select(vc_allocated_next_orc_ocvc),
      .data_in(next_free_orc_ocvc),
      .data_out(free_nonspec_muxed));
   
   wire 				       free_nonspec_s, free_nonspec_q;
   assign free_nonspec_s = free_nonspec_muxed;
   c_dff
     #(.width(1),
       .reset_value(1'b1),
       .reset_type(reset_type))
   free_nonspecq
     (.clk(clk),
      .reset(1'b0),
      .active(cred_track_active),
      .d(free_nonspec_s),
      .q(free_nonspec_q));
   
   assign free_nonspec = free_nonspec_q;
   
   wire [0:num_vcs-1] 			       free_spec_ovc;
   assign free_spec_ovc = ~full_ovc;
   
   c_select_1ofn
     #(.num_ports(num_vcs),
       .width(1))
   free_spec_sel
     (.select(vc_sel_ovc),
      .data_in(free_spec_ovc),
      .data_out(free_spec));
   
   wire 				       sw_gnt_sel;
   assign sw_gnt_sel = sw_gnt & sw_sel;
   
   generate
      
      if(sw_alloc_spec)
	begin
	   if(elig_mask == `ELIG_MASK_NONE)
	     assign flit_sent = sw_gnt_sel & ((vc_gnt & free_spec) | allocated);
	   else
	     assign flit_sent = sw_gnt_sel & (vc_gnt | allocated);
	end
      else
	assign flit_sent = sw_gnt_sel;
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // error checking
   //---------------------------------------------------------------------------
   
   wire ftc_active;
   assign ftc_active = flit_valid_in;
   
   wire error_invalid_flit_type;
   rtr_flit_type_check
     #(.reset_type(reset_type))
   ftc
     (.clk(clk),
      .reset(reset),
      .active(ftc_active),
      .flit_valid(flit_valid_sel_in),
      .flit_head(flit_head_in),
      .flit_tail(flit_tail_in),
      .error(error_invalid_flit_type));
   
   assign errors[0] = error_invalid_port;
   assign errors[1] = error_invalid_class;
   assign errors[2] = error_invalid_flit_type;
   
endmodule
