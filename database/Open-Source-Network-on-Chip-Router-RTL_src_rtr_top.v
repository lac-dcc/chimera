// $Id: rtr_top.v 5188 2012-08-30 00:31:31Z dub $

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
// top-level module for router
//==============================================================================

module rtr_top
  (clk, reset, router_address, channel_in_ip, flow_ctrl_out_ip, channel_out_op, 
   flow_ctrl_in_op, error);
   
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
   
   // number of nodes per router (a.k.a. concentration factor)
   parameter num_nodes_per_router = 1;
   
   // connectivity within each dimension
   parameter connectivity = `CONNECTIVITY_LINE;
   
   // select packet format
   parameter packet_format = `PACKET_FORMAT_EXPLICIT_LENGTH;
   
   // select type of flow control
   parameter flow_ctrl_type = `FLOW_CTRL_TYPE_CREDIT;
   
   // make incoming flow control signals bypass the output VC state tracking 
   // logic
   parameter flow_ctrl_bypass = 1;
   
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
   
   // configure error checking logic
   parameter error_capture_mode = `ERROR_CAPTURE_MODE_NO_HOLD;
   
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
   
   // EXPERIMENTAL:
   // for dynamic buffer management, only reserve a buffer slot for a VC while 
   // it is active (i.e., while a packet is partially transmitted)
   // (NOTE: This is currently broken!)
   parameter disable_static_reservations = 0;
   
   // use explicit pipeline register between flit buffer and crossbar?
   parameter explicit_pipeline_register = 0;
   
   // gate flit buffer write port if bypass succeeds
   // (requires explicit pipeline register; may increase cycle time)
   parameter gate_buffer_write = 0;
   
   // enable dual-path allocation
   parameter dual_path_alloc = 1;
   
   // resolve output conflicts when using dual-path allocation via arbitration
   // (otherwise, kill if more than one fast-path request per output port)
   parameter dual_path_allow_conflicts = 0;
   
   // only mask fast-path requests if any slow path requests are ready
   parameter dual_path_mask_on_ready = 1;
   
   // precompute input-side arbitration decision one cycle ahead
   parameter precomp_ivc_sel = 1;
   
   // precompute output-side arbitration decision one cycle ahead
   parameter precomp_ip_sel = 1;
   
   // select whether to exclude full or non-empty VCs from VC allocation
   parameter elig_mask = `ELIG_MASK_NONE;
   
   // select which arbiter type to use for switch allocation
   parameter sw_alloc_arbiter_type = `ARBITER_TYPE_ROUND_ROBIN_BINARY;
   
   // select which arbiter type to use for VC allocation
   parameter vc_alloc_arbiter_type = `ARBITER_TYPE_ROUND_ROBIN_BINARY;
   
   // prefer empty VCs over non-empty ones in VC allocation
   parameter vc_alloc_prefer_empty = 0;
   
   // select implementation variant for crossbar
   parameter crossbar_type = `CROSSBAR_TYPE_MUX;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   
   //---------------------------------------------------------------------------
   // derived parameters
   //---------------------------------------------------------------------------
   
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
   
   // width of flow control signals
   localparam flow_ctrl_width
     = (flow_ctrl_type == `FLOW_CTRL_TYPE_CREDIT) ? (1 + vc_idx_width) :
       -1;
   
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
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   input clk;
   input reset;
   
   // current router's address
   input [0:router_addr_width-1] router_address;
   
   // incoming channels
   input [0:num_ports*channel_width-1] channel_in_ip;
   
   // outgoing flow control signals
   output [0:num_ports*flow_ctrl_width-1] flow_ctrl_out_ip;
   wire [0:num_ports*flow_ctrl_width-1]   flow_ctrl_out_ip;
   
   // outgoing channels
   output [0:num_ports*channel_width-1]   channel_out_op;
   wire [0:num_ports*channel_width-1] 	  channel_out_op;
   
   // incoming flow control signals
   input [0:num_ports*flow_ctrl_width-1]  flow_ctrl_in_op;
   
   // internal error condition detected
   output 				  error;
   wire 				  error;
   
   
   //---------------------------------------------------------------------------
   // input ports
   //---------------------------------------------------------------------------
   
   wire [0:num_ports*num_vcs-1] 	  alo_flit_sel_ip_ivc;
   wire [0:num_ports-1] 		  alo_flit_sent_ip;
   wire [0:num_ports-1] 		  alo_flit_sel_fast_ip;
   wire [0:num_ports-1] 		  alo_flit_sent_fast_ip;
   
   wire [0:num_ports*num_vcs*num_ports-1] ipc_route_ip_ivc_op;
   wire [0:num_ports*num_vcs*num_resource_classes-1] ipc_route_ip_ivc_orc;
   wire [0:num_ports*num_vcs-1] 		     ipc_flit_valid_ip_ivc;
   wire [0:num_ports*num_vcs-1] 		     ipc_flit_last_ip_ivc;
   wire [0:num_ports*num_vcs-1] 		     ipc_flit_head_ip_ivc;
   wire [0:num_ports*num_vcs-1] 		     ipc_flit_tail_ip_ivc;
   wire [0:num_ports*num_ports-1] 		     ipc_route_fast_ip_op;
   wire [0:num_ports*num_resource_classes-1] 	     ipc_route_fast_ip_orc;
   wire [0:num_ports-1] 			     ipc_flit_valid_fast_ip;
   wire [0:num_ports-1] 			     ipc_flit_head_fast_ip;
   wire [0:num_ports-1] 			     ipc_flit_tail_fast_ip;
   wire [0:num_ports*num_vcs-1] 		     ipc_flit_sel_fast_ip_ivc;
   wire [0:num_ports*flit_data_width-1] 	     ipc_flit_data_ip;
   wire [0:num_ports-1] 			     ipc_error_ip;
   
   generate
      
      genvar 					     ip;
      
      for (ip = 0; ip < num_ports; ip = ip + 1)
	begin:ips
	   
	   
	   //-------------------------------------------------------------------
	   // input controller
	   //-------------------------------------------------------------------
	   
	   wire [0:channel_width-1] channel_in;
	   assign channel_in
	     = channel_in_ip[ip*channel_width:(ip+1)*channel_width-1];
	   
	   wire [0:num_vcs-1] 	    alo_flit_sel_ivc;
	   assign alo_flit_sel_ivc
	     = alo_flit_sel_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1];
	   
	   wire 		    alo_flit_sent;
	   assign alo_flit_sent = alo_flit_sent_ip[ip];
	   
	   wire 		    alo_flit_sel_fast;
	   assign alo_flit_sel_fast = alo_flit_sel_fast_ip[ip];
	   
	   wire 		    alo_flit_sent_fast;
	   assign alo_flit_sent_fast = alo_flit_sent_fast_ip[ip];
	   
	   wire [0:num_vcs*num_ports-1] ipc_route_ivc_op;
	   wire [0:num_vcs*num_resource_classes-1] ipc_route_ivc_orc;
	   wire [0:num_vcs-1] 			   ipc_flit_valid_ivc;
	   wire [0:num_vcs-1] 			   ipc_flit_last_ivc;
	   wire [0:num_vcs-1] 			   ipc_flit_head_ivc;
	   wire [0:num_vcs-1] 			   ipc_flit_tail_ivc;
	   wire [0:num_ports-1] 		   ipc_route_fast_op;
	   wire [0:num_resource_classes-1] 	   ipc_route_fast_orc;
	   wire 				   ipc_flit_valid_fast;
	   wire 				   ipc_flit_head_fast;
	   wire 				   ipc_flit_tail_fast;
	   wire [0:num_vcs-1] 			   ipc_flit_sel_fast_ivc;
	   wire [0:flit_data_width-1] 		   ipc_flit_data;
	   wire [0:flow_ctrl_width-1] 		   flow_ctrl_out;
	   wire 				   ipc_error;
	   rtr_ip_ctrl_mac
	     #(.buffer_size(buffer_size),
	       .num_message_classes(num_message_classes),
	       .num_resource_classes(num_resource_classes),
	       .num_vcs_per_class(num_vcs_per_class),
	       .num_routers_per_dim(num_routers_per_dim),
	       .num_dimensions(num_dimensions),
	       .num_nodes_per_router(num_nodes_per_router),
	       .connectivity(connectivity),
	       .packet_format(packet_format),
	       .flow_ctrl_type(flow_ctrl_type),
	       .max_payload_length(max_payload_length),
	       .min_payload_length(min_payload_length),
	       .enable_link_pm(enable_link_pm),
	       .flit_data_width(flit_data_width),
	       .restrict_turns(restrict_turns),
	       .predecode_lar_info(predecode_lar_info),
	       .routing_type(routing_type),
	       .dim_order(dim_order),
	       .fb_regfile_type(fb_regfile_type),
	       .fb_mgmt_type(fb_mgmt_type),
	       .fb_fast_peek(fb_fast_peek),
	       .elig_mask(elig_mask),
	       .explicit_pipeline_register(explicit_pipeline_register),
	       .gate_buffer_write(gate_buffer_write),
	       .dual_path_alloc(dual_path_alloc),
	       .error_capture_mode(error_capture_mode),
	       .port_id(ip),
	       .reset_type(reset_type))
	   ipc
	     (.clk(clk),
	      .reset(reset),
	      .router_address(router_address),
	      .channel_in(channel_in),
	      .route_out_ivc_op(ipc_route_ivc_op),
	      .route_out_ivc_orc(ipc_route_ivc_orc),
	      .flit_valid_out_ivc(ipc_flit_valid_ivc),
	      .flit_last_out_ivc(ipc_flit_last_ivc),
	      .flit_head_out_ivc(ipc_flit_head_ivc),
	      .flit_tail_out_ivc(ipc_flit_tail_ivc),
	      .route_fast_out_op(ipc_route_fast_op),
	      .route_fast_out_orc(ipc_route_fast_orc),
	      .flit_valid_fast_out(ipc_flit_valid_fast),
	      .flit_head_fast_out(ipc_flit_head_fast),
	      .flit_tail_fast_out(ipc_flit_tail_fast),
	      .flit_sel_fast_out_ivc(ipc_flit_sel_fast_ivc),
	      .flit_data_out(ipc_flit_data),
	      .flit_sel_in_ivc(alo_flit_sel_ivc),
	      .flit_sent_in(alo_flit_sent),
	      .flit_sel_fast_in(alo_flit_sel_fast),
	      .flit_sent_fast_in(alo_flit_sent_fast),
	      .flow_ctrl_out(flow_ctrl_out),
	      .error(ipc_error));
	   
	   assign ipc_route_ip_ivc_op[ip*num_vcs*num_ports:
				      (ip+1)*num_vcs*num_ports-1]
	     = ipc_route_ivc_op;
	   assign ipc_route_ip_ivc_orc[ip*num_vcs*num_resource_classes:
				       (ip+1)*num_vcs*num_resource_classes-1]
	     = ipc_route_ivc_orc;
	   
	   assign ipc_flit_valid_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1]
	     = ipc_flit_valid_ivc;
	   assign ipc_flit_last_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1]
	     = ipc_flit_last_ivc;
	   assign ipc_flit_head_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1]
	     = ipc_flit_head_ivc;
	   assign ipc_flit_tail_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1]
	     = ipc_flit_tail_ivc;
	   
	   assign ipc_route_fast_ip_op[ip*num_ports:(ip+1)*num_ports-1]
	     = ipc_route_fast_op;
	   assign ipc_route_fast_ip_orc[ip*num_resource_classes:
					(ip+1)*num_resource_classes-1]
	     = ipc_route_fast_orc;
	   
	   assign ipc_flit_valid_fast_ip[ip] = ipc_flit_valid_fast;
	   assign ipc_flit_head_fast_ip[ip] = ipc_flit_head_fast;
	   assign ipc_flit_tail_fast_ip[ip] = ipc_flit_tail_fast;
	   
	   assign ipc_flit_sel_fast_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1]
	     = ipc_flit_sel_fast_ivc;
	   
	   assign ipc_flit_data_ip[ip*flit_data_width:(ip+1)*flit_data_width-1]
	     = ipc_flit_data;
	   
	   assign flow_ctrl_out_ip[ip*flow_ctrl_width:(ip+1)*flow_ctrl_width-1]
	     = flow_ctrl_out;
	   
	   assign ipc_error_ip[ip] = ipc_error;
	   
	end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // allocator logic
   //---------------------------------------------------------------------------
   
   wire [0:num_ports*num_vcs-1] 		   opc_elig_op_ovc;
   wire [0:num_ports*num_vcs-1] 		   opc_empty_op_ovc;
   wire [0:num_ports*num_vcs-1] 		   opc_almost_full_op_ovc;
   wire [0:num_ports*num_vcs-1] 		   opc_full_op_ovc;
   
   wire [0:num_ports*num_ports-1] 		   alo_flit_sel_op_ip;
   wire [0:num_ports-1] 			   alo_flit_valid_op;
   wire [0:num_ports-1] 			   alo_flit_head_op;
   wire [0:num_ports-1] 			   alo_flit_tail_op;
   wire [0:num_ports*num_vcs-1] 		   alo_flit_sel_op_ovc;
   
   rtr_alloc_mac
     #(.num_message_classes(num_message_classes),
       .num_resource_classes(num_resource_classes),
       .num_vcs_per_class(num_vcs_per_class),
       .num_routers_per_dim(num_routers_per_dim),
       .num_dimensions(num_dimensions),
       .num_nodes_per_router(num_nodes_per_router),
       .connectivity(connectivity),
       .flow_ctrl_type(flow_ctrl_type),
       .restrict_turns(restrict_turns),
       .routing_type(routing_type),
       .dim_order(dim_order),
       .precomp_ivc_sel(precomp_ivc_sel),
       .precomp_ip_sel(precomp_ip_sel),
       .fb_mgmt_type(fb_mgmt_type),
       .elig_mask(elig_mask),
       .sw_alloc_arbiter_type(sw_alloc_arbiter_type),
       .vc_alloc_arbiter_type(vc_alloc_arbiter_type),
       .vc_alloc_prefer_empty(vc_alloc_prefer_empty),
       .dual_path_alloc(dual_path_alloc),
       .dual_path_allow_conflicts(dual_path_allow_conflicts),
       .dual_path_mask_on_ready(dual_path_mask_on_ready),
       .reset_type(reset_type))
   alo
     (.clk(clk),
      .reset(reset),
      .route_in_ip_ivc_op(ipc_route_ip_ivc_op),
      .route_in_ip_ivc_orc(ipc_route_ip_ivc_orc),
      .flit_valid_in_ip_ivc(ipc_flit_valid_ip_ivc),
      .flit_last_in_ip_ivc(ipc_flit_last_ip_ivc),
      .flit_head_in_ip_ivc(ipc_flit_head_ip_ivc),
      .flit_tail_in_ip_ivc(ipc_flit_tail_ip_ivc),
      .route_fast_in_ip_op(ipc_route_fast_ip_op),
      .route_fast_in_ip_orc(ipc_route_fast_ip_orc),
      .flit_valid_fast_in_ip(ipc_flit_valid_fast_ip),
      .flit_head_fast_in_ip(ipc_flit_head_fast_ip),
      .flit_tail_fast_in_ip(ipc_flit_tail_fast_ip),
      .flit_sel_fast_in_ip_ivc(ipc_flit_sel_fast_ip_ivc),
      .flit_sel_out_ip_ivc(alo_flit_sel_ip_ivc),
      .flit_sent_out_ip(alo_flit_sent_ip),
      .flit_sel_fast_out_ip(alo_flit_sel_fast_ip),
      .flit_sent_fast_out_ip(alo_flit_sent_fast_ip),
      .flit_sel_out_op_ip(alo_flit_sel_op_ip),
      .flit_valid_out_op(alo_flit_valid_op),
      .flit_head_out_op(alo_flit_head_op),
      .flit_tail_out_op(alo_flit_tail_op),
      .flit_sel_out_op_ovc(alo_flit_sel_op_ovc),
      .elig_in_op_ovc(opc_elig_op_ovc),
      .empty_in_op_ovc(opc_empty_op_ovc),
      .almost_full_in_op_ovc(opc_almost_full_op_ovc),
      .full_in_op_ovc(opc_full_op_ovc));
   
   
   //---------------------------------------------------------------------------
   // crossbar
   //---------------------------------------------------------------------------
   
   wire [0:num_ports*flit_data_width-1] 	   xbr_flit_data_op;
   rtr_crossbar_mac
     #(.num_ports(num_ports),
       .width(flit_data_width),
       .crossbar_type(crossbar_type))
   xbr
     (.ctrl_in_op_ip(alo_flit_sel_op_ip),
      .data_in_ip(ipc_flit_data_ip),
      .data_out_op(xbr_flit_data_op));
   
   
   //---------------------------------------------------------------------------
   // output ports
   //---------------------------------------------------------------------------
   
   wire [0:num_ports-1] 			   opc_error_op;
   
   generate
      
      genvar 					   op;
      
      for(op = 0; op < num_ports; op = op + 1)
	begin:ops
	   
	   
	   //-------------------------------------------------------------------
	   // output controller
	   //-------------------------------------------------------------------
	   
	   wire [0:flow_ctrl_width-1] flow_ctrl_in;
	   assign flow_ctrl_in
	     = flow_ctrl_in_op[op*flow_ctrl_width:(op+1)*flow_ctrl_width-1];
	   
	   wire 		      alo_flit_valid;
	   assign alo_flit_valid = alo_flit_valid_op[op];
	   
	   wire 		      alo_flit_head;
	   assign alo_flit_head = alo_flit_head_op[op];
	   
	   wire 		      alo_flit_tail;
	   assign alo_flit_tail = alo_flit_tail_op[op];
	   
	   wire [0:num_vcs-1] 	      alo_flit_sel_ovc;
	   assign alo_flit_sel_ovc
	     = alo_flit_sel_op_ovc[op*num_vcs:(op+1)*num_vcs-1];
	   
	   wire [0:flit_data_width-1] xbr_flit_data;
	   assign xbr_flit_data
	     = xbr_flit_data_op[op*flit_data_width:(op+1)*flit_data_width-1];
	   
	   wire [0:channel_width-1]   channel_out;
	   wire [0:num_vcs-1] 	      opc_elig_ovc;
	   wire [0:num_vcs-1] 	      opc_empty_ovc;
	   wire [0:num_vcs-1] 	      opc_almost_full_ovc;
	   wire [0:num_vcs-1] 	      opc_full_ovc;
	   wire 		      opc_error;
	   rtr_op_ctrl_mac
	     #(.buffer_size(buffer_size),
	       .num_vcs(num_vcs),
	       .num_ports(num_ports),
	       .packet_format(packet_format),
	       .flow_ctrl_type(flow_ctrl_type),
	       .flow_ctrl_bypass(flow_ctrl_bypass),
	       .fb_mgmt_type(fb_mgmt_type),
	       .disable_static_reservations(disable_static_reservations),
	       .elig_mask(elig_mask),
	       .vc_alloc_prefer_empty(vc_alloc_prefer_empty),
	       .enable_link_pm(enable_link_pm),
	       .flit_data_width(flit_data_width),
	       .reset_type(reset_type))
	   opc
	     (.clk(clk),
	      .reset(reset),
	      .flow_ctrl_in(flow_ctrl_in),
	      .flit_valid_in(alo_flit_valid),
	      .flit_head_in(alo_flit_head),
	      .flit_tail_in(alo_flit_tail),
	      .flit_sel_in_ovc(alo_flit_sel_ovc),
	      .flit_data_in(xbr_flit_data),
	      .channel_out(channel_out),
	      .elig_out_ovc(opc_elig_ovc),
	      .empty_out_ovc(opc_empty_ovc),
	      .almost_full_out_ovc(opc_almost_full_ovc),
	      .full_out_ovc(opc_full_ovc),
	      .error(opc_error));
	   
	   assign channel_out_op[op*channel_width:(op+1)*channel_width-1]
		    = channel_out;
	   
	   assign opc_elig_op_ovc[op*num_vcs:(op+1)*num_vcs-1] = opc_elig_ovc;
	   assign opc_empty_op_ovc[op*num_vcs:(op+1)*num_vcs-1] = opc_empty_ovc;
	   assign opc_almost_full_op_ovc[op*num_vcs:(op+1)*num_vcs-1] 
		    = opc_almost_full_ovc;
	   assign opc_full_op_ovc[op*num_vcs:(op+1)*num_vcs-1] = opc_full_ovc;
	   
	   assign opc_error_op[op] = opc_error;
	   
	end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // error reporting
   //---------------------------------------------------------------------------
   
   generate
      
      if(error_capture_mode != `ERROR_CAPTURE_MODE_NONE)
	begin
	   
	   wire [0:2*num_ports-1] errors_s, errors_q;
	   assign errors_s = {ipc_error_ip, opc_error_op};
	   c_err_rpt
	     #(.num_errors(2*num_ports),
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
