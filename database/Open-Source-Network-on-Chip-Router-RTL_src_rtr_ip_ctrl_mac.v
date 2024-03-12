// $Id: rtr_ip_ctrl_mac.v 5188 2012-08-30 00:31:31Z dub $

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
// input port controller
//==============================================================================

module rtr_ip_ctrl_mac
  (clk, reset, router_address, channel_in, route_out_ivc_op, route_out_ivc_orc, 
   flit_valid_out_ivc, flit_last_out_ivc, flit_head_out_ivc, flit_tail_out_ivc, 
   route_fast_out_op, route_fast_out_orc, flit_valid_fast_out, 
   flit_head_fast_out, flit_tail_fast_out, flit_sel_fast_out_ivc, 
   flit_data_out, flit_sel_in_ivc, flit_sent_in, flit_sel_fast_in, 
   flit_sent_fast_in, flow_ctrl_out, error);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
   
   
   //---------------------------------------------------------------------------
   // parameters
   //---------------------------------------------------------------------------
   
   // total buffer size per port in flits
   parameter buffer_size = 32;
   
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
   
   // select packet format
   parameter packet_format = `PACKET_FORMAT_EXPLICIT_LENGTH;
   
   // select type of flow control
   parameter flow_ctrl_type = `FLOW_CTRL_TYPE_CREDIT;
   
   // maximum payload length (in flits)
   // (note: only used if packet_format==`PACKET_FORMAT_EXPLICIT_LENGTH)
   parameter max_payload_length = 4;
   
   // minimum payload length (in flits)
   // (note: only used if packet_format==`PACKET_FORMAT_EXPLICIT_LENGTH)
   parameter min_payload_length = 1;
   
   // enable link power management
   parameter enable_link_pm = 1;
   
   // width of flit payload data
   parameter flit_data_width = 64;
   
   // filter out illegal destination ports
   // (the intent is to allow synthesis to optimize away the logic associated 
   // with such turns)
   parameter restrict_turns = 1;
   
   // store lookahead routing info in pre-decoded form
   // (only useful with dual-path routing enable)
   parameter predecode_lar_info = 1;
   
   // select routing function type
   parameter routing_type = `ROUTING_TYPE_PHASED_DOR;
   
   // select order of dimension traversal
   parameter dim_order = `DIM_ORDER_ASCENDING;
   
   // select implementation variant for flit buffer register file
   parameter fb_regfile_type = `REGFILE_TYPE_FF_2D;
   
   // select flit buffer management scheme
   parameter fb_mgmt_type = `FB_MGMT_TYPE_STATIC;
   
   // improve timing for peek access
   parameter fb_fast_peek = 1;
   
   // select whether to exclude full or non-empty VCs from VC allocation
   parameter elig_mask = `ELIG_MASK_NONE;
   
   // use explicit pipeline register between flit buffer and crossbar?
   parameter explicit_pipeline_register = 1;
   
   // gate flit buffer write port if bypass succeeds
   // (requires explicit pipeline register; may increase cycle time)
   parameter gate_buffer_write = 0;
   
   // enable dual-path allocation
   parameter dual_path_alloc = 0;
   
   // configure error checking logic
   parameter error_capture_mode = `ERROR_CAPTURE_MODE_NO_HOLD;
   
   // ID of current input port
   parameter port_id = 0;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   
   //---------------------------------------------------------------------------
   // derived parameters
   //---------------------------------------------------------------------------
   
   // width required to select individual resource class
   localparam resource_class_idx_width = clogb(num_resource_classes);
   
   // total number of packet classes
   localparam num_packet_classes = num_message_classes * num_resource_classes;
   
   // number of VCs
   localparam num_vcs = num_packet_classes * num_vcs_per_class;
   
   // width required to select individual VC
   localparam vc_idx_width = clogb(num_vcs);
   
   // width required to select individual router in a dimension
   localparam dim_addr_width = clogb(num_routers_per_dim);
   
   // width required to select individual router in entire network
   localparam router_addr_width = num_dimensions * dim_addr_width;
   
   // width required to select individual node at current router
   localparam node_addr_width = clogb(num_nodes_per_router);
   
   // width of global addresses
   localparam addr_width = router_addr_width + node_addr_width;
   
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
   
   // width of flow control signals
   localparam flow_ctrl_width
     = (flow_ctrl_type == `FLOW_CTRL_TYPE_CREDIT) ? (1 + vc_idx_width) :
       -1;
   
   // number of bits required to represent all possible payload sizes
   localparam payload_length_width
     = clogb(max_payload_length-min_payload_length+1);
   
   // width required for lookahead routing information
   localparam lar_info_width = port_idx_width + resource_class_idx_width;
   
   // total number of bits required for storing routing information
   localparam dest_info_width
     = (routing_type == `ROUTING_TYPE_PHASED_DOR) ? 
       (num_resource_classes * router_addr_width + node_addr_width) : 
       -1;
   
   // total number of bits required for routing-related information
   localparam route_info_width = lar_info_width + dest_info_width;
   
   // width of link management signals
   localparam link_ctrl_width = enable_link_pm ? 1 : 0;
   
   // width of flit control signals
   localparam flit_ctrl_width
     = (packet_format == `PACKET_FORMAT_HEAD_TAIL) ? 
       (1 + vc_idx_width + 1 + 1) : 
       (packet_format == `PACKET_FORMAT_TAIL_ONLY) ? 
       (1 + vc_idx_width + 1) : 
       (packet_format == `PACKET_FORMAT_EXPLICIT_LENGTH) ? 
       (1 + vc_idx_width + 1) : 
       -1;
   
   // channel width
   localparam channel_width
     = link_ctrl_width + flit_ctrl_width + flit_data_width;
   
   // total number of bits of header information encoded in header flit payload
   localparam header_info_width
     = (packet_format == `PACKET_FORMAT_HEAD_TAIL) ? 
       route_info_width : 
       (packet_format == `PACKET_FORMAT_TAIL_ONLY) ? 
       route_info_width : 
       (packet_format == `PACKET_FORMAT_EXPLICIT_LENGTH) ? 
       (route_info_width + payload_length_width) : 
       -1;
   
   // VC allocation is atomic
   localparam atomic_vc_allocation = (elig_mask == `ELIG_MASK_USED);
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   input clk;
   input reset;
   
   // current router's address
   input [0:router_addr_width-1] router_address;
   
   // incoming channel
   input [0:channel_width-1] 	 channel_in;
   
   // selected output port
   output [0:num_vcs*num_ports-1] route_out_ivc_op;
   wire [0:num_vcs*num_ports-1]   route_out_ivc_op;
   
   // selected output resource class
   output [0:num_vcs*num_resource_classes-1] route_out_ivc_orc;
   wire [0:num_vcs*num_resource_classes-1]   route_out_ivc_orc;
   
   // flit is present
   output [0:num_vcs-1] 		     flit_valid_out_ivc;
   wire [0:num_vcs-1] 			     flit_valid_out_ivc;
   
   // flit is last remaining flit
   output [0:num_vcs-1] 		     flit_last_out_ivc;
   wire [0:num_vcs-1] 			     flit_last_out_ivc;
   
   // flit is head flit
   output [0:num_vcs-1] 		     flit_head_out_ivc;
   wire [0:num_vcs-1] 			     flit_head_out_ivc;
   
   // flit is tail flit
   output [0:num_vcs-1] 		     flit_tail_out_ivc;
   wire [0:num_vcs-1] 			     flit_tail_out_ivc;
   
   // 
   output [0:num_ports-1] 		     route_fast_out_op;
   wire [0:num_ports-1] 		     route_fast_out_op;
   
   // 
   output [0:num_resource_classes-1] 	     route_fast_out_orc;
   wire [0:num_resource_classes-1] 	     route_fast_out_orc;
   
   // 
   output 				     flit_valid_fast_out;
   wire 				     flit_valid_fast_out;
   
   // 
   output 				     flit_head_fast_out;
   wire 				     flit_head_fast_out;
   
   // 
   output 				     flit_tail_fast_out;
   wire 				     flit_tail_fast_out;
   
   // 
   output [0:num_vcs-1] 		     flit_sel_fast_out_ivc;
   wire [0:num_vcs-1] 			     flit_sel_fast_out_ivc;
   
   // outgoing flit data
   output [0:flit_data_width-1] 	     flit_data_out;
   wire [0:flit_data_width-1] 		     flit_data_out;
   
   // indicate which VC is candidate for being sent
   input [0:num_vcs-1] 			     flit_sel_in_ivc;
   
   // flit was sent
   input 				     flit_sent_in;
   
   //
   input 				     flit_sel_fast_in;
   
   //
   input 				     flit_sent_fast_in;
   
   // outgoing flow control signals
   output [0:flow_ctrl_width-1] 	     flow_ctrl_out;
   wire [0:flow_ctrl_width-1] 		     flow_ctrl_out;
   
   // internal error condition detected
   output 				     error;
   wire 				     error;
   
   
   //---------------------------------------------------------------------------
   // channel input staging
   //---------------------------------------------------------------------------
   
   wire 				     fb_full;
   
   wire 				     chi_active;
   assign chi_active = ~fb_full;
   
   wire 				     chi_flit_valid;
   wire 				     chi_flit_head;
   wire [0:num_vcs-1] 			     chi_flit_head_ivc;
   wire 				     chi_flit_tail;
   wire [0:num_vcs-1] 			     chi_flit_tail_ivc;
   wire [0:flit_data_width-1] 		     chi_flit_data;
   wire [0:num_vcs-1] 			     chi_flit_sel_ivc;
   rtr_channel_input
     #(.num_vcs(num_vcs),
       .packet_format(packet_format),
       .max_payload_length(max_payload_length),
       .min_payload_length(min_payload_length),
       .route_info_width(route_info_width),
       .enable_link_pm(enable_link_pm),
       .flit_data_width(flit_data_width),
       .reset_type(reset_type))
   chi
     (.clk(clk),
      .reset(reset),
      .active(chi_active),
      .channel_in(channel_in),
      .flit_valid_out(chi_flit_valid),
      .flit_head_out(chi_flit_head),
      .flit_head_out_ivc(chi_flit_head_ivc),
      .flit_tail_out(chi_flit_tail),
      .flit_tail_out_ivc(chi_flit_tail_ivc),
      .flit_data_out(chi_flit_data),
      .flit_sel_out_ivc(chi_flit_sel_ivc));
   
   wire [0:header_info_width-1] 	     chi_header_info;
   assign chi_header_info = chi_flit_data[0:header_info_width-1];
   
   wire [0:route_info_width-1] 		     chi_route_info;
   assign chi_route_info = chi_header_info[0:route_info_width-1];
   
   wire [0:lar_info_width-1] 		     chi_lar_info;
   assign chi_lar_info = chi_route_info[0:lar_info_width-1];
   
   wire [0:dest_info_width-1] 		     chi_dest_info;
   assign chi_dest_info = chi_route_info[lar_info_width:
					 lar_info_width+dest_info_width-1];
   
   
   //---------------------------------------------------------------------------
   // global lookahead routing information decoder
   //---------------------------------------------------------------------------
   
   wire [0:num_ports-1] 		     gld_route_op;
   wire [0:num_resource_classes-1] 	     gld_route_orc;
   
   generate
      
      if(1) begin:gld
	 
	 wire [0:port_idx_width-1] route_port;
	 assign route_port = chi_lar_info[0:port_idx_width-1];
	 
	 wire [0:num_ports-1] 	   route_op;
	 c_decode
	   #(.num_ports(num_ports))
	 route_op_dec
	   (.data_in(route_port),
	    .data_out(route_op));
	 
	 wire [0:num_resource_classes-1] route_orc;
	 
	 if(num_resource_classes == 1)
	   assign route_orc = 1'b1;
	 else if(num_resource_classes > 1)
	   begin
	      
	      wire [0:resource_class_idx_width-1] route_rcsel;
	      assign route_rcsel
		= chi_lar_info[port_idx_width:
				    port_idx_width+resource_class_idx_width-1];
	      
	      c_decode
		#(.num_ports(num_resource_classes))
	      route_orc_dec
		(.data_in(route_rcsel),
		 .data_out(route_orc));
	      
	   end
	 
	 assign gld_route_op = route_op;
	 assign gld_route_orc = route_orc;
	 
      end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // global lookahead routing information update logic
   //---------------------------------------------------------------------------
   
   wire [0:lar_info_width-1] 			  glu_lar_info;
   
   generate
      
      if(1) begin:glu
	 
	 wire [0:router_addr_width-1] next_router_address;
	 rtr_next_hop_addr
	   #(.num_resource_classes(num_resource_classes),
	     .num_routers_per_dim(num_routers_per_dim),
	     .num_dimensions(num_dimensions),
	     .num_nodes_per_router(num_nodes_per_router),
	     .connectivity(connectivity),
	     .routing_type(routing_type))
	 nha
	   (.router_address(router_address),
	    .dest_info(chi_dest_info),
	    .lar_info(chi_lar_info),
	    .next_router_address(next_router_address));
	 
	 wire [0:num_message_classes-1] sel_mc;
	 c_reduce_bits
	   #(.num_ports(num_message_classes),
	     .width(num_resource_classes*num_vcs_per_class),
	     .op(`BINARY_OP_OR))
	 sel_mc_rb
	   (.data_in(chi_flit_sel_ivc),
	    .data_out(sel_mc));
	 
	 wire [0:num_ports-1] 		route_op;
	 wire [0:num_resource_classes-1] route_orc;
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
	    .sel_irc(gld_route_orc),
	    .dest_info(chi_dest_info),
	    .route_op(route_op),
	    .route_orc(route_orc));
	 
	 wire [0:port_idx_width-1] 	 route_port;
	 c_encode
	   #(.num_ports(num_ports))
	 route_port_enc
	   (.data_in(route_op),
	    .data_out(route_port));
	 
	 wire [0:lar_info_width-1]  lar_info;
	 assign lar_info[0:port_idx_width-1] = route_port;
	 
	 if(num_resource_classes > 1)
	   begin
	      
	      wire [0:resource_class_idx_width-1] route_rcsel;
	      c_encode
		#(.num_ports(num_resource_classes))
	      route_rcsel_enc
		(.data_in(route_orc),
		 .data_out(route_rcsel));
	      
	      assign lar_info[port_idx_width:
				   port_idx_width+resource_class_idx_width-1]
		= route_rcsel;
	      
	   end
	 
	 assign glu_lar_info = lar_info;
	 
      end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // input vc controllers
   //---------------------------------------------------------------------------
   
   wire [0:num_vcs-1] 				  fb_pop_tail_ivc;
   wire [0:header_info_width-1] 		  fb_pop_next_header_info;
   wire [0:num_vcs-1] 				  fb_almost_empty_ivc;
   wire [0:num_vcs-1] 				  fb_empty_ivc;
   wire [0:num_vcs*lar_info_width-1] 		  llu_lar_info_ivc;
   wire [0:num_vcs*3-1] 			  ivcc_errors_ivc;
   
   genvar 					  ivc;
   
   generate
      
      for(ivc = 0; ivc < num_vcs; ivc = ivc + 1)
	begin:ivcs
	   
	   //-------------------------------------------------------------------
	   // connect inputs
	   //-------------------------------------------------------------------
	   
	   wire chi_flit_sel;
	   assign chi_flit_sel = chi_flit_sel_ivc[ivc];
	   
	   wire chi_flit_head;
	   assign chi_flit_head = chi_flit_head_ivc[ivc];
	   
	   wire chi_flit_tail;
	   assign chi_flit_tail = chi_flit_tail_ivc[ivc];
	   
	   wire flit_sel_in;
	   assign flit_sel_in = flit_sel_in_ivc[ivc];
	   
	   wire fb_almost_empty;
	   assign fb_almost_empty = fb_almost_empty_ivc[ivc];
	   
	   wire fb_pop_tail;
	   assign fb_pop_tail = fb_pop_tail_ivc[ivc];
	   
	   wire fb_empty;
	   assign fb_empty = fb_empty_ivc[ivc];
	   
	   
	   //-------------------------------------------------------------------
	   // connect outputs
	   //-------------------------------------------------------------------
	   
	   wire 		    flit_valid_out;
	   assign flit_valid_out_ivc[ivc] = flit_valid_out;
	   
	   wire 		    flit_last_out;
	   assign flit_last_out_ivc[ivc] = flit_last_out;
	   
	   wire 		    flit_head_out;
	   assign flit_head_out_ivc[ivc] = flit_head_out;
	   
	   wire 		    flit_tail_out;
	   assign flit_tail_out_ivc[ivc] = flit_tail_out;
	   
	   wire [0:lar_info_width-1] llu_lar_info;
	   assign llu_lar_info_ivc[ivc*lar_info_width:(ivc+1)*lar_info_width-1]
	     = llu_lar_info;
	   
	   wire [0:num_ports-1]      route_out_op;
	   assign route_out_ivc_op[ivc*num_ports:(ivc+1)*num_ports-1]
	     = route_out_op;
	   
	   wire [0:num_resource_classes-1] route_out_orc;
	   assign route_out_ivc_orc[ivc*num_resource_classes:
				    (ivc+1)*num_resource_classes-1]
	     = route_out_orc;
	   
	   wire [0:2] 			   ivcc_errors;
	   assign ivcc_errors_ivc[ivc*3:(ivc+1)*3-1] = ivcc_errors;
	   
	   
	   //-------------------------------------------------------------------
	   // flit buffer state
	   //-------------------------------------------------------------------
	   
	   wire 			   chi_flit_valid_sel;
	   assign chi_flit_valid_sel = chi_flit_valid & chi_flit_sel;
	   
	   wire 			   chi_flit_valid_sel_head;
	   assign chi_flit_valid_sel_head = chi_flit_valid_sel & chi_flit_head;
	   
	   if(dual_path_alloc)
	     begin
		assign flit_valid_out = ~fb_empty;
		assign flit_last_out = fb_almost_empty;
	     end
	   else
	     begin
		assign flit_valid_out = chi_flit_valid_sel | ~fb_empty;
		assign flit_last_out
		  = chi_flit_valid_sel ? fb_empty : fb_almost_empty;
	     end
	   
	   
	   //-------------------------------------------------------------------
	   // track whether frontmost flit is head or tail
	   //-------------------------------------------------------------------
	   
	   wire flit_sent_sel_in;
	   assign flit_sent_sel_in = flit_sent_in & flit_sel_in;
	   
	   wire flit_sent_sel_fast_in;
	   assign flit_sent_sel_fast_in = flit_sent_fast_in & chi_flit_sel;
	   
	   wire ht_flit_head;
	   
	   if(1) begin:ht
	      
	      wire pop_active;
	      assign pop_active = chi_flit_valid | ~fb_empty;
	      
	      wire flit_head_s, flit_head_q;
	      if(dual_path_alloc)
		assign flit_head_s
		  = flit_sent_sel_in ? flit_tail_out : 
		    flit_sent_sel_fast_in ? flit_tail_fast_out :
		    flit_head_q;
	      else
		assign flit_head_s
		  = flit_sent_sel_in ? flit_tail_out : flit_head_q;
	      c_dff
		#(.width(1),
		  .reset_type(reset_type),
		  .reset_value(1'b1))
	      flit_headq
		(.clk(clk),
		 .reset(reset),
		 .active(pop_active),
		 .d(flit_head_s),
		 .q(flit_head_q));
	      
	      assign ht_flit_head = flit_head_q;
	      
	   end
	   
	   if(dual_path_alloc)
	     begin
		assign flit_head_out = ht_flit_head;
		assign flit_tail_out = fb_pop_tail;
	     end
	   else
	     begin
		assign flit_head_out = fb_empty ? chi_flit_head : ht_flit_head;
		assign flit_tail_out = fb_empty ? chi_flit_tail : fb_pop_tail;
	     end
	   
	   
	   //-------------------------------------------------------------------
	   // track header information for frontmost packet
	   //-------------------------------------------------------------------
	   
	   wire [0:num_ports-1] hit_route_op;
	   wire [0:num_resource_classes-1] hit_route_orc;
	   wire [0:lar_info_width-1] 	   hit_lar_info;
	   wire [0:dest_info_width-1] 	   hit_dest_info;
	   
	   if(1) begin:hit
	      
	      wire active;
	      wire capture;
	      if(atomic_vc_allocation)
		begin
		   assign active = chi_flit_valid & chi_flit_head;
		   assign capture = chi_flit_valid_sel_head;
		end
	      else
		begin
		   assign active = ~fb_empty | (chi_flit_valid & chi_flit_head);
		   assign capture = (fb_empty & chi_flit_valid_sel_head) |
				    (flit_sent_sel_in & flit_tail_out);
		end
	      
	      wire two_plus_flits;
	      assign two_plus_flits = ~fb_empty & ~fb_almost_empty;
	      
	      wire [0:route_info_width-1] fb_pop_next_route_info;
	      assign fb_pop_next_route_info
		= fb_pop_next_header_info[0:route_info_width-1];
	      
	      wire [0:lar_info_width-1]   fb_pop_next_lar_info;
	      assign fb_pop_next_lar_info
		= fb_pop_next_route_info[0:lar_info_width-1];
	      
	      wire [0:num_ports-1] 	  route_op;
	      wire [0:num_resource_classes-1] route_orc;
	      wire [0:lar_info_width-1]       lar_info;
	      
	      if(dual_path_alloc && predecode_lar_info)
		begin
		   
		   // NOTE: For dual-path routing, we never have to bypass the
		   // selected output port from the channel input (which would
		   // have to go through a decoder first); thus, it makes sense
		   // to store the port in one-hot form here in order to improve
		   // timing.
		   
		   wire [0:num_ports-1] route_op_s, route_op_q;
		   if(atomic_vc_allocation)
		     assign route_op_s = capture ? gld_route_op : route_op_q;
		   else
		     begin
			
			wire [0:port_idx_width-1] fb_pop_next_route_port;
			assign fb_pop_next_route_port
			  = fb_pop_next_lar_info[0:port_idx_width-1];
			
			wire [0:num_ports-1] 	  pop_next_route_op;
			c_decode
			  #(.num_ports(num_ports))
			pop_next_route_op_dec
			  (.data_in(fb_pop_next_route_port),
			   .data_out(pop_next_route_op));
			
			assign route_op_s = capture ?
					    (two_plus_flits ? 
					     pop_next_route_op : 
					     gld_route_op) :
					    route_op_q;
			
		     end
		   c_dff
		     #(.width(num_ports),
		       .reset_type(reset_type))
		   route_opq
		     (.clk(clk),
		      .reset(1'b0),
		      .active(active),
		      .d(route_op_s),
		      .q(route_op_q));
		   
		   assign route_op = route_op_q;
		   
		   wire [0:port_idx_width-1] route_port;
		   c_encode
		     #(.num_ports(num_ports))
		   route_port_enc
		     (.data_in(route_op_q),
		      .data_out(route_port));
		   
		   assign lar_info[0:port_idx_width-1] = route_port;
		   
		   if(num_resource_classes == 1)
		     assign route_orc = 1'b1;
		   else if(num_resource_classes > 1)
		     begin
			
			wire [0:num_resource_classes-1] route_orc_s;
			wire [0:num_resource_classes-1] route_orc_q;
			if(atomic_vc_allocation)
			  assign route_orc_s
			    = capture ? gld_route_orc : route_orc_q;
			else
			  begin
			     
			     wire [0:resource_class_idx_width-1] 
			       fb_pop_next_route_rcsel;
			     assign fb_pop_next_route_rcsel
			       = fb_pop_next_lar_info[port_idx_width:
						      port_idx_width+
						      resource_class_idx_width-
						      1];
			     
			     wire [0:num_resource_classes-1] pop_next_route_orc;
			     c_decode
			       #(.num_ports(num_resource_classes))
			     pop_next_route_orc_dec
			       (.data_in(fb_pop_next_route_rcsel),
				.data_out(pop_next_route_orc));
			     
			     assign route_orc_s = capture ?
						  (two_plus_flits ? 
						   pop_next_route_orc : 
						   gld_route_orc) :
						  route_orc_q;
			     
			  end
			c_dff
			  #(.width(num_resource_classes),
			    .reset_type(reset_type))
			route_orcq
			  (.clk(clk),
			   .reset(1'b0),
			   .active(active),
			   .d(route_orc_s),
			   .q(route_orc_q));
			
			assign route_orc = route_orc_q;
			
			wire [0:resource_class_idx_width-1] route_rcsel;
			c_encode
			  #(.num_ports(num_resource_classes))
			route_rcsel_enc
			  (.data_in(route_orc_q),
			   .data_out(route_rcsel));
			
			assign lar_info[port_idx_width:
					     port_idx_width+
					     resource_class_idx_width-1]
			  = route_rcsel;
			
		     end
		   
		end
	      else
		begin
		   
		   wire [0:lar_info_width-1] lar_info_s, lar_info_q;
		   if(atomic_vc_allocation)
		     assign lar_info_s = capture ? chi_lar_info : lar_info_q;
		   else
		     assign lar_info_s = capture ?
					 (two_plus_flits ? 
					  fb_pop_next_lar_info : 
					  chi_lar_info) :
					 lar_info_q;
		   c_dff
		     #(.width(lar_info_width),
		       .reset_type(reset_type))
		   lar_infoq
		     (.clk(clk),
		      .reset(1'b0),
		      .active(active),
		      .d(lar_info_s),
		      .q(lar_info_q));
		   
		   assign lar_info = lar_info_q;
		   
		   wire [0:port_idx_width-1] route_port;
		   assign route_port = lar_info_q[0:port_idx_width-1];
		   
		   c_decode
		     #(.num_ports(num_ports))
		   route_op_dec
		     (.data_in(route_port),
		      .data_out(route_op));
		   
		   if(num_resource_classes == 1)
		     assign route_orc = 1'b1;
		   else if(num_resource_classes > 1)
		     begin
			
			wire [0:resource_class_idx_width-1] route_rcsel;
			assign route_rcsel
			  = lar_info_q[port_idx_width:
				       port_idx_width+
				       resource_class_idx_width-1];
			
			c_decode
			  #(.num_ports(num_resource_classes))
			route_orc_dec
			  (.data_in(route_rcsel),
			   .data_out(route_orc));
			
		     end
		   
		end
	      
	      wire [0:dest_info_width-1] dest_info_s, dest_info_q;
	      if(atomic_vc_allocation)
		assign dest_info_s = capture ? chi_dest_info : dest_info_q;
	      else
		begin
		   
		   wire [0:dest_info_width-1] fb_pop_next_dest_info;
		   assign fb_pop_next_dest_info
		     = fb_pop_next_route_info[lar_info_width:
					      lar_info_width+dest_info_width-1];
		   
		   assign dest_info_s = capture ?
					(two_plus_flits ? 
					 fb_pop_next_dest_info : 
					 chi_dest_info) :
					dest_info_q;
		   
		end
	      c_dff
		#(.width(dest_info_width),
		  .reset_type(reset_type))
	      dest_infoq
		(.clk(clk),
		 .reset(1'b0),
		 .active(active),
		 .d(dest_info_s),
		 .q(dest_info_q));
	      
	      assign hit_route_op = route_op;
	      assign hit_route_orc = route_orc;
	      assign hit_lar_info = lar_info;
	      assign hit_dest_info = dest_info_q;
	      
	   end
	   
	   
	   //-------------------------------------------------------------------
	   // generate routing control signals
	   //-------------------------------------------------------------------
	   
	   wire [0:num_ports-1] 		       route_unmasked_op;
	   wire [0:num_resource_classes-1] 	       route_unmasked_orc;
	   
	   if(dual_path_alloc)
	     begin
		assign route_unmasked_op = hit_route_op;
		assign route_unmasked_orc = hit_route_orc;
	     end
	   else
	     begin
		
		wire bypass_route_info;
		if(atomic_vc_allocation)
		  assign bypass_route_info = chi_flit_valid_sel_head;
		else
		  assign bypass_route_info = fb_empty & chi_flit_valid_sel_head;
		
		assign route_unmasked_op
		  = bypass_route_info ? gld_route_op : hit_route_op;
		assign route_unmasked_orc
		  = bypass_route_info ? gld_route_orc : hit_route_orc;
		
	     end
	   
	   wire [0:1] rf_errors;
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
	       .vc_id(ivc))
	   rf
	     (.clk(clk),
	      .route_valid(flit_valid_out),
	      .route_in_op(route_unmasked_op),
	      .route_in_orc(route_unmasked_orc),
	      .route_out_op(route_out_op),
	      .route_out_orc(route_out_orc),
	      .errors(rf_errors));
	   
	   wire       error_invalid_port;
	   assign error_invalid_port =  rf_errors[0];
	   
	   wire       error_invalid_class;
	   assign error_invalid_class = rf_errors[1];
	   
	   
	   //-------------------------------------------------------------------
	   // local lookahead routing information update logic
	   //-------------------------------------------------------------------
	   
	   if(1) begin:llu
	      
	      wire [0:router_addr_width-1] next_router_address;
	      rtr_next_hop_addr
		#(.num_resource_classes(num_resource_classes),
		  .num_routers_per_dim(num_routers_per_dim),
		  .num_dimensions(num_dimensions),
		  .num_nodes_per_router(num_nodes_per_router),
		  .connectivity(connectivity),
		  .routing_type(routing_type))
	      nha
		(.router_address(router_address),
		 .dest_info(hit_dest_info),
		 .lar_info(hit_lar_info),
		 .next_router_address(next_router_address));
	      
	      wire [0:num_message_classes-1] sel_mc;
	      c_align
		#(.in_width(1),
		  .out_width(num_message_classes),
		  .offset((ivc / (num_resource_classes*num_vcs_per_class)) %
			  num_message_classes))
	      sel_mc_agn
		(.data_in(1'b1),
		 .dest_in({num_message_classes{1'b0}}),
		 .data_out(sel_mc));
	      
	      wire [0:num_ports-1] 	     route_op;
	      wire [0:num_resource_classes-1] route_orc;
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
		 .sel_irc(hit_route_orc),
		 .dest_info(hit_dest_info),
		 .route_op(route_op),
		 .route_orc(route_orc));
	      
	      wire [0:port_idx_width-1]       route_port;
	      c_encode
		#(.num_ports(num_ports))
	      route_port_enc
		(.data_in(route_op),
		 .data_out(route_port));
	      
	      wire [0:lar_info_width-1]       lar_info;
	      assign lar_info[0:port_idx_width-1] = route_port;
	      
	      if(num_resource_classes > 1)
		begin
		   
		   wire [0:resource_class_idx_width-1] route_rcsel;
		   c_encode
		     #(.num_ports(num_resource_classes))
		   route_rcsel_enc
		     (.data_in(route_orc),
		      .data_out(route_rcsel));
		   
		   assign lar_info[port_idx_width:
				   port_idx_width+resource_class_idx_width-1]
		     = route_rcsel;
		   
		end
	      
	      assign llu_lar_info = lar_info;
	      
	   end
	   
	   
	   //-------------------------------------------------------------------
	   // error checking
	   //-------------------------------------------------------------------
	   
	   wire 				       ftc_active;
	   assign ftc_active = chi_flit_valid;
	   
	   wire 				       error_invalid_flit_type;
	   rtr_flit_type_check
	     #(.reset_type(reset_type))
	   ftc
	     (.clk(clk),
	      .reset(reset),
	      .active(ftc_active),
	      .flit_valid(chi_flit_valid_sel),
	      .flit_head(chi_flit_head),
	      .flit_tail(chi_flit_tail),
	      .error(error_invalid_flit_type));
	   
	   assign ivcc_errors[0] = error_invalid_port;
	   assign ivcc_errors[1] = error_invalid_class;
	   assign ivcc_errors[2] = error_invalid_flit_type;
	   
	end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // flit buffer
   //---------------------------------------------------------------------------
   
   wire 					       fb_all_empty;
   assign fb_all_empty = &fb_empty_ivc;
   
   wire 				    alloc_active;
   assign alloc_active = chi_flit_valid | ~fb_all_empty;
   
   wire 				    fb_push_active;
   assign fb_push_active = chi_flit_valid;
   
   wire 				    fb_push_valid;
   assign fb_push_valid = chi_flit_valid;
   
   wire 				    fb_push_head;
   assign fb_push_head = chi_flit_head;
   
   wire 				    fb_push_tail;
   assign fb_push_tail = chi_flit_tail;
   
   wire [0:num_vcs-1] 			    fb_push_sel_ivc;
   assign fb_push_sel_ivc = chi_flit_sel_ivc;
   
   wire [0:flit_data_width-1] 		    fb_push_data;
   assign fb_push_data = chi_flit_data;
   
   wire 				    fb_pop_active;
   assign fb_pop_active = alloc_active;
   
   wire 				    fb_pop_valid;
   wire [0:num_vcs-1] 			    fb_pop_sel_ivc;
   
   generate
      if(dual_path_alloc)
	begin
	   assign fb_pop_valid = flit_sent_in | flit_sent_fast_in;
	   assign fb_pop_sel_ivc
	     = flit_sel_fast_in ? chi_flit_sel_ivc : flit_sel_in_ivc;
	end
      else
	begin
	   assign fb_pop_valid = flit_sent_in;
	   assign fb_pop_sel_ivc = flit_sel_in_ivc;
	end
   endgenerate
   
   wire [0:flit_data_width-1] 		    fb_pop_data;
   wire [0:num_vcs*2-1] 		    fb_errors_ivc;
   rtr_flit_buffer
     #(.num_vcs(num_vcs),
       .buffer_size(buffer_size),
       .flit_data_width(flit_data_width),
       .header_info_width(header_info_width),
       .regfile_type(fb_regfile_type),
       .explicit_pipeline_register(explicit_pipeline_register),
       .gate_buffer_write(gate_buffer_write),
       .mgmt_type(fb_mgmt_type),
       .fast_peek(fb_fast_peek),
       .atomic_vc_allocation(atomic_vc_allocation),
       .enable_bypass(1),
       .reset_type(reset_type))
   fb
     (.clk(clk),
      .reset(reset),
      .push_active(fb_push_active),
      .push_valid(fb_push_valid),
      .push_head(fb_push_head),
      .push_tail(fb_push_tail),
      .push_sel_ivc(fb_push_sel_ivc),
      .push_data(fb_push_data),
      .pop_active(fb_pop_active),
      .pop_valid(fb_pop_valid),
      .pop_sel_ivc(fb_pop_sel_ivc),
      .pop_data(fb_pop_data),
      .pop_tail_ivc(fb_pop_tail_ivc),
      .pop_next_header_info(fb_pop_next_header_info),
      .almost_empty_ivc(fb_almost_empty_ivc),
      .empty_ivc(fb_empty_ivc),
      .full(fb_full),
      .errors_ivc(fb_errors_ivc));
   
   
   //---------------------------------------------------------------------------
   // generate fast-path control signals
   //---------------------------------------------------------------------------
   
   generate
      
      if(dual_path_alloc)
	begin:fpc
	   
	   assign route_fast_out_op = gld_route_op;
	   assign route_fast_out_orc = gld_route_orc;
	   
	   assign flit_valid_fast_out = chi_flit_valid;
	   assign flit_head_fast_out = chi_flit_head;
	   assign flit_tail_fast_out = chi_flit_tail;
	   assign flit_sel_fast_out_ivc = chi_flit_sel_ivc;
	   
	end
      else
	begin
	   
	   assign route_fast_out_op = {num_ports{1'b0}};
	   assign route_fast_out_orc = {num_resource_classes{1'b0}};
	   
	   assign flit_valid_fast_out = 1'b0;
	   assign flit_head_fast_out = 1'b0;
	   assign flit_tail_fast_out = 1'b0;
	   assign flit_sel_fast_out_ivc = {num_vcs{1'b0}};
	   
	end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // flit buffer read path
   //---------------------------------------------------------------------------
   
   wire flit_head_out;
   c_select_1ofn
     #(.num_ports(num_vcs),
       .width(1))
   flit_head_out_sel
     (.select(flit_sel_in_ivc),
      .data_in(flit_head_out_ivc),
      .data_out(flit_head_out));
   
   wire [0:num_vcs-1] flit_sel_ivc;
   wire 	      flit_sent;
   wire 	      flit_head;
   wire 	      bypass;
   
   generate
      
      if(dual_path_alloc)
	begin
	   assign flit_sel_ivc
	     = flit_sel_fast_in ? chi_flit_sel_ivc : flit_sel_in_ivc;
	   assign flit_sent = flit_sent_in | flit_sent_fast_in;
	   assign flit_head = flit_sel_fast_in ? chi_flit_head : flit_head_out;
	   assign bypass = flit_sel_fast_in;
	end
      else
	begin
	   assign flit_sel_ivc = flit_sel_in_ivc;
	   assign flit_sent = flit_sent_in;
	   assign flit_head = flit_head_out;

	   c_select_1ofn
	     #(.num_ports(num_vcs),
	       .width(1))
	   bypass_sel
	     (.select(flit_sel_in_ivc),
	      .data_in(fb_empty_ivc),
	      .data_out(bypass));
	   
	end
      
   endgenerate
   
   wire [0:lar_info_width-1]  llu_lar_info;
   c_select_1ofn
     #(.num_ports(num_vcs),
       .width(lar_info_width))
   llu_lar_info_sel
     (.select(flit_sel_in_ivc),
      .data_in(llu_lar_info_ivc),
      .data_out(llu_lar_info));
   
   wire flit_head_s, flit_head_q;
   assign flit_head_s = flit_head;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   flit_headq
     (.clk(clk),
      .reset(1'b0),
      .active(alloc_active),
      .d(flit_head_s),
      .q(flit_head_q));
   
   wire [0:lar_info_width-1] lar_info_s, lar_info_q;
   assign lar_info_s
     = flit_head ? (bypass ? glu_lar_info : llu_lar_info) : lar_info_q;
   c_dff
     #(.width(lar_info_width),
       .reset_type(reset_type))
   lar_infoq
     (.clk(clk),
      .reset(1'b0),
      .active(alloc_active),
      .d(lar_info_s),
      .q(lar_info_q));
   
   assign flit_data_out[0:lar_info_width-1]
     = flit_head_q ? lar_info_q : fb_pop_data[0:lar_info_width-1];
   assign flit_data_out[lar_info_width:flit_data_width-1]
     = fb_pop_data[lar_info_width:flit_data_width-1];
      
   
   //---------------------------------------------------------------------------
   // generate outgoing flow control signals
   //---------------------------------------------------------------------------
   
   rtr_flow_ctrl_output
     #(.num_vcs(num_vcs),
       .flow_ctrl_type(flow_ctrl_type),
       .reset_type(reset_type))
   fco
     (.clk(clk),
      .reset(reset),
      .active(alloc_active),
      .fc_event_valid_in(flit_sent),
      .fc_event_sel_in_ivc(flit_sel_ivc),
      .flow_ctrl_out(flow_ctrl_out));
   
   
   //---------------------------------------------------------------------------
   // error checking
   //---------------------------------------------------------------------------
   
   generate
      
      if(error_capture_mode != `ERROR_CAPTURE_MODE_NONE)
	begin
	   
	   wire [0:num_vcs*3+num_vcs*2-1] errors_s, errors_q;
	   assign errors_s = {ivcc_errors_ivc, fb_errors_ivc};
	   c_err_rpt
	     #(.num_errors(num_vcs*3+num_vcs*2),
	       .capture_mode(error_capture_mode),
	       .reset_type(reset_type))
	   chk
	     (.clk(clk),
	      .reset(reset),
	      .active(1'b1),
	      .errors_in(errors_s),
	      .errors_out(errors_q));
	   
	   assign error = |errors_q;
	   
	end
      else
	assign error = 1'bx;
      
   endgenerate
   
endmodule
