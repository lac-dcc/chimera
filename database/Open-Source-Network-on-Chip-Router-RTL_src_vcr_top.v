// $Id: vcr_top.v 5188 2012-08-30 00:31:31Z dub $

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
// top-level module for virtual channel router
//==============================================================================

module vcr_top
  (clk, reset, router_address, channel_in_ip, flow_ctrl_out_ip, channel_out_op, 
   flow_ctrl_in_op, error);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
`include "vcr_constants.v"
   
   // total buffer size per port in flits
   parameter buffer_size = 32;
   
   // number of message classes (e.g. request, reply)
   parameter num_message_classes = 2;
   
   // number of resource classes (e.g. minimal, adaptive)
   parameter num_resource_classes = 2;
   
   // total number of packet classes
   localparam num_packet_classes = num_message_classes * num_resource_classes;
   
   // number of VCs per class
   parameter num_vcs_per_class = 1;
   
   // number of VCs
   localparam num_vcs = num_packet_classes * num_vcs_per_class;
   
   // width required to select individual VC
   localparam vc_idx_width = clogb(num_vcs);
   
   // number of routers in each dimension
   parameter num_routers_per_dim = 4;
   
   // width required to select individual router in a dimension
   localparam dim_addr_width = clogb(num_routers_per_dim);
   
   // number of dimensions in network
   parameter num_dimensions = 2;
   
   // width required to select individual router in entire network
   localparam router_addr_width = num_dimensions * dim_addr_width;
   
   // number of nodes per router (a.k.a. concentration factor)
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
   
   // select packet format
   parameter packet_format = `PACKET_FORMAT_EXPLICIT_LENGTH;
   
   // select type of flow control
   parameter flow_ctrl_type = `FLOW_CTRL_TYPE_CREDIT;
   
   // make incoming flow control signals bypass the output VC state tracking 
   // logic
   parameter flow_ctrl_bypass = 1;
   
   // width of flow control signals
   localparam flow_ctrl_width
     = (flow_ctrl_type == `FLOW_CTRL_TYPE_CREDIT) ? (1 + vc_idx_width) :
       -1;
   
   // maximum payload length (in flits)
   // (note: only used if packet_format==`PACKET_FORMAT_EXPLICIT_LENGTH)
   parameter max_payload_length = 4;
   
   // minimum payload length (in flits)
   // (note: only used if packet_format==`PACKET_FORMAT_EXPLICIT_LENGTH)
   parameter min_payload_length = 1;
   
   // enable link power management
   parameter enable_link_pm = 1;
   
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
   
   // width of flit payload data
   parameter flit_data_width = 64;
   
   // channel width
   localparam channel_width
     = link_ctrl_width + flit_ctrl_width + flit_data_width;
   
   // configure error checking logic
   parameter error_capture_mode = `ERROR_CAPTURE_MODE_NO_HOLD;
   
   // filter out illegal destination ports
   // (the intent is to allow synthesis to optimize away the logic associated 
   // with such turns)
   parameter restrict_turns = 1;
   
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
   
   // select whether to exclude full or non-empty VCs from VC allocation
   parameter elig_mask = `ELIG_MASK_NONE;
   
   // select implementation variant for VC allocator
   parameter vc_alloc_type = `VC_ALLOC_TYPE_SEP_IF;
   
   // select which arbiter type to use for VC allocator
   parameter vc_alloc_arbiter_type = `ARBITER_TYPE_ROUND_ROBIN_BINARY;
   
   // select implementation variant for switch allocator
   parameter sw_alloc_type = `SW_ALLOC_TYPE_SEP_IF;
   
   // select which arbiter type to use for switch allocator
   parameter sw_alloc_arbiter_type = `ARBITER_TYPE_ROUND_ROBIN_BINARY;
   
   // select speculation type for switch allocator
   parameter sw_alloc_spec_type = `SW_ALLOC_SPEC_TYPE_REQ;
   
   // select implementation variant for crossbar
   parameter crossbar_type = `CROSSBAR_TYPE_MUX;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
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
   
   wire [0:num_ports*num_vcs*num_ports-1] route_ip_ivc_op;
   wire [0:num_ports*num_vcs*num_resource_classes-1] route_ip_ivc_orc;
   wire [0:num_ports*num_vcs-1] 		     allocated_ip_ivc;
   wire [0:num_ports*num_vcs-1] 		     flit_valid_ip_ivc;
   wire [0:num_ports*num_vcs-1] 		     flit_head_ip_ivc;
   wire [0:num_ports*num_vcs-1] 		     flit_tail_ip_ivc;
   wire [0:num_ports*num_vcs-1] 		     free_nonspec_ip_ivc;
   
   wire [0:num_ports*num_vcs-1] 		     vc_gnt_ip_ivc;
   wire [0:num_ports*num_vcs*num_vcs-1] 	     vc_sel_ip_ivc_ovc;
   
   wire [0:num_ports-1] 			     sw_gnt_ip;
   wire [0:num_ports*num_vcs-1] 		     sw_sel_ip_ivc;
   wire [0:num_ports-1] 			     sw_gnt_op;
   
   wire [0:num_ports*flit_data_width-1] 	     xbr_data_in_ip;
   
   wire [0:num_ports*num_vcs-1] 		     almost_full_op_ovc;
   wire [0:num_ports*num_vcs-1] 		     full_op_ovc;
   
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
	   
	   wire [0:num_vcs-1] 	    vc_gnt_ivc;
	   assign vc_gnt_ivc = vc_gnt_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1];
	   
	   wire [0:num_vcs*num_vcs-1] vc_sel_ivc_ovc;
	   assign vc_sel_ivc_ovc
	     = vc_sel_ip_ivc_ovc[ip*num_vcs*num_vcs:(ip+1)*num_vcs*num_vcs-1];
	   
	   wire 		      sw_gnt;
	   assign sw_gnt = sw_gnt_ip[ip];
	   
	   wire [0:num_vcs-1] 	      sw_sel_ivc;
	   assign sw_sel_ivc = sw_sel_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1];
	   
	   wire [0:num_vcs*num_ports-1] route_ivc_op;
	   wire [0:num_vcs*num_resource_classes-1] route_ivc_orc;
	   wire [0:num_vcs-1] 			   allocated_ivc;
	   wire [0:num_vcs-1] 			   flit_valid_ivc;
	   wire [0:num_vcs-1] 			   flit_head_ivc;
	   wire [0:num_vcs-1] 			   flit_tail_ivc;
	   wire [0:num_vcs-1] 			   free_nonspec_ivc;
	   wire [0:flit_data_width-1] 		   flit_data;
	   wire [0:flow_ctrl_width-1] 		   flow_ctrl_out;
	   wire 				   ipc_error;
	   vcr_ip_ctrl_mac
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
	       .routing_type(routing_type),
	       .dim_order(dim_order),
	       .fb_regfile_type(fb_regfile_type),
	       .fb_mgmt_type(fb_mgmt_type),
	       .fb_fast_peek(fb_fast_peek),
	       .explicit_pipeline_register(explicit_pipeline_register),
	       .gate_buffer_write(gate_buffer_write),
	       .elig_mask(elig_mask),
	       .sw_alloc_spec(sw_alloc_spec_type != `SW_ALLOC_SPEC_TYPE_NONE),
	       .error_capture_mode(error_capture_mode),
	       .port_id(ip),
	       .reset_type(reset_type))
	   ipc
	     (.clk(clk),
	      .reset(reset),
	      .router_address(router_address),
	      .channel_in(channel_in),
	      .route_ivc_op(route_ivc_op),
	      .route_ivc_orc(route_ivc_orc),
	      .allocated_ivc(allocated_ivc),
	      .flit_valid_ivc(flit_valid_ivc),
	      .flit_head_ivc(flit_head_ivc),
	      .flit_tail_ivc(flit_tail_ivc),
	      .free_nonspec_ivc(free_nonspec_ivc),
	      .vc_gnt_ivc(vc_gnt_ivc),
	      .vc_sel_ivc_ovc(vc_sel_ivc_ovc),
	      .sw_gnt(sw_gnt),
	      .sw_sel_ivc(sw_sel_ivc),
	      .sw_gnt_op(sw_gnt_op),
	      .almost_full_op_ovc(almost_full_op_ovc),
	      .full_op_ovc(full_op_ovc),
	      .flit_data(flit_data),
	      .flow_ctrl_out(flow_ctrl_out),
	      .error(ipc_error));
	   
	   assign route_ip_ivc_op[ip*num_vcs*num_ports:
				  (ip+1)*num_vcs*num_ports-1]
	     = route_ivc_op;
	   assign route_ip_ivc_orc[ip*num_vcs*num_resource_classes:
				   (ip+1)*num_vcs*num_resource_classes-1]
	     = route_ivc_orc;
	   assign allocated_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1]
	     = allocated_ivc;
	   assign flit_valid_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1]
	     = flit_valid_ivc;
	   assign flit_head_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1]
	     = flit_head_ivc;
	   assign flit_tail_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1]
	     = flit_tail_ivc;
	   assign free_nonspec_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1]
	     = free_nonspec_ivc;
	   
	   assign xbr_data_in_ip[ip*flit_data_width:(ip+1)*flit_data_width-1]
	     = flit_data;
	   
	   assign flow_ctrl_out_ip[ip*flow_ctrl_width:
				   (ip+1)*flow_ctrl_width-1]
	     = flow_ctrl_out;
	   
	   assign ipc_error_ip[ip] = ipc_error;
	   
	end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // VC and switch allocator
   //---------------------------------------------------------------------------
   
   wire [0:num_ports*num_vcs-1] 		elig_op_ovc;
   
   wire [0:num_ports-1] 			vc_active_op;
   wire [0:num_ports*num_vcs-1] 		vc_gnt_op_ovc;
   wire [0:num_ports*num_vcs*num_ports-1] 	vc_sel_op_ovc_ip;
   wire [0:num_ports*num_vcs*num_vcs-1] 	vc_sel_op_ovc_ivc;
   wire [0:num_ports-1] 			sw_active_op;
   wire [0:num_ports*num_ports-1] 		sw_sel_op_ip;
   wire [0:num_ports*num_vcs-1] 		sw_sel_op_ivc;
   wire [0:num_ports-1] 			flit_head_op;
   wire [0:num_ports-1] 			flit_tail_op;
   wire [0:num_ports*num_ports-1] 		xbr_ctrl_op_ip;
   vcr_alloc_mac
     #(.num_message_classes(num_message_classes),
       .num_resource_classes(num_resource_classes),
       .num_vcs_per_class(num_vcs_per_class),
       .num_ports(num_ports),
       .vc_allocator_type(vc_alloc_type),
       .vc_arbiter_type(vc_alloc_arbiter_type),
       .sw_allocator_type(sw_alloc_type),
       .sw_arbiter_type(sw_alloc_arbiter_type),
       .spec_type(sw_alloc_spec_type),
       .reset_type(reset_type))
   alo
     (.clk(clk),
      .reset(reset),
      .route_ip_ivc_op(route_ip_ivc_op),
      .route_ip_ivc_orc(route_ip_ivc_orc),
      .allocated_ip_ivc(allocated_ip_ivc),
      .flit_valid_ip_ivc(flit_valid_ip_ivc),
      .flit_head_ip_ivc(flit_head_ip_ivc),
      .flit_tail_ip_ivc(flit_tail_ip_ivc),
      .elig_op_ovc(elig_op_ovc),
      .free_nonspec_ip_ivc(free_nonspec_ip_ivc),
      .vc_active_op(vc_active_op),
      .vc_gnt_ip_ivc(vc_gnt_ip_ivc),
      .vc_sel_ip_ivc_ovc(vc_sel_ip_ivc_ovc),
      .vc_gnt_op_ovc(vc_gnt_op_ovc),
      .vc_sel_op_ovc_ip(vc_sel_op_ovc_ip),
      .vc_sel_op_ovc_ivc(vc_sel_op_ovc_ivc),
      .sw_active_op(sw_active_op),
      .sw_gnt_ip(sw_gnt_ip),
      .sw_sel_ip_ivc(sw_sel_ip_ivc),
      .sw_gnt_op(sw_gnt_op),
      .sw_sel_op_ip(sw_sel_op_ip),
      .sw_sel_op_ivc(sw_sel_op_ivc),
      .flit_head_op(flit_head_op),
      .flit_tail_op(flit_tail_op),
      .xbr_ctrl_op_ip(xbr_ctrl_op_ip));
   
   
   //---------------------------------------------------------------------------
   // crossbars
   //---------------------------------------------------------------------------
   
   wire [0:num_ports*flit_data_width-1]     xbr_data_out_op;
   rtr_crossbar_mac
     #(.num_ports(num_ports),
       .width(flit_data_width),
       .crossbar_type(crossbar_type))
   xbr
     (.ctrl_in_op_ip(xbr_ctrl_op_ip),
      .data_in_ip(xbr_data_in_ip),
      .data_out_op(xbr_data_out_op));
   
   
   //---------------------------------------------------------------------------
   // output ports
   //---------------------------------------------------------------------------
   
   wire [0:num_ports-1] 		    opc_error_op;
   
   generate
      
      genvar 				    op;
      
      for(op = 0; op < num_ports; op = op + 1)
	begin:ops
	   
	   
	   //-------------------------------------------------------------------
	   // output controller
	   //-------------------------------------------------------------------
	   
	   wire [0:flit_data_width-1] flit_data;
	   assign flit_data
	     = xbr_data_out_op[op*flit_data_width:(op+1)*flit_data_width-1];
	   
	   wire [0:flow_ctrl_width-1] flow_ctrl_in;
	   assign flow_ctrl_in
	     = flow_ctrl_in_op[op*flow_ctrl_width:(op+1)*flow_ctrl_width-1];
	   
	   wire 		      vc_active;
	   assign vc_active = vc_active_op[op];
	   
	   wire [0:num_vcs-1] 	      vc_gnt_ovc;
	   assign vc_gnt_ovc = vc_gnt_op_ovc[op*num_vcs:(op+1)*num_vcs-1];
	   
	   wire [0:num_vcs*num_ports-1] vc_sel_ovc_ip;
	   assign vc_sel_ovc_ip = vc_sel_op_ovc_ip[op*num_vcs*num_ports:
						   (op+1)*num_vcs*num_ports-1];
	   
	   wire [0:num_vcs*num_vcs-1] 	vc_sel_ovc_ivc;
	   assign vc_sel_ovc_ivc
	     = vc_sel_op_ovc_ivc[op*num_vcs*num_vcs:(op+1)*num_vcs*num_vcs-1];
	   
	   wire 			sw_active;
	   assign sw_active = sw_active_op[op];
	   
	   wire 			sw_gnt;
	   assign sw_gnt = sw_gnt_op[op];
	   
	   wire [0:num_ports-1] 	sw_sel_ip;
	   assign sw_sel_ip = sw_sel_op_ip[op*num_ports:(op+1)*num_ports-1];
	   
	   wire [0:num_vcs-1] 		sw_sel_ivc;
	   assign sw_sel_ivc = sw_sel_op_ivc[op*num_vcs:(op+1)*num_vcs-1];
	   
	   wire 			flit_head;
	   assign flit_head = flit_head_op[op];
	   
	   wire 			flit_tail;
	   assign flit_tail = flit_tail_op[op];
	   
	   wire [0:num_ports-1] 	xbr_ctrl_ip;
	   assign xbr_ctrl_ip = xbr_ctrl_op_ip[op*num_ports:(op+1)*num_ports-1];
	   
	   wire [0:num_vcs-1] 		almost_full_ovc;
	   wire [0:num_vcs-1] 		full_ovc;
	   wire [0:channel_width-1] 	channel_out;
	   wire [0:num_vcs-1] 		elig_ovc;
	   wire 			opc_error;
	   vcr_op_ctrl_mac
	     #(.buffer_size(buffer_size),
	       .num_message_classes(num_message_classes),
	       .num_resource_classes(num_resource_classes),
	       .num_vcs_per_class(num_vcs_per_class),
	       .num_ports(num_ports),
	       .packet_format(packet_format),
	       .flow_ctrl_type(flow_ctrl_type),
	       .flow_ctrl_bypass(flow_ctrl_bypass),
	       .enable_link_pm(enable_link_pm),
	       .flit_data_width(flit_data_width),
	       .error_capture_mode(error_capture_mode),
	       .fb_mgmt_type(fb_mgmt_type),
	       .disable_static_reservations(disable_static_reservations),
	       .elig_mask(elig_mask),
	       .sw_alloc_spec(sw_alloc_spec_type != `SW_ALLOC_SPEC_TYPE_NONE),
	       .reset_type(reset_type))
	   opc
	     (.clk(clk),
	      .reset(reset),
	      .flow_ctrl_in(flow_ctrl_in),
	      .vc_active(vc_active),
	      .vc_gnt_ovc(vc_gnt_ovc),
	      .vc_sel_ovc_ip(vc_sel_ovc_ip),
	      .vc_sel_ovc_ivc(vc_sel_ovc_ivc),
	      .sw_active(sw_active),
	      .sw_gnt(sw_gnt),
	      .sw_sel_ip(sw_sel_ip),
	      .sw_sel_ivc(sw_sel_ivc),
	      .flit_head(flit_head),
	      .flit_tail(flit_tail),
	      .flit_data(flit_data),
	      .channel_out(channel_out),
	      .almost_full_ovc(almost_full_ovc),
	      .full_ovc(full_ovc),
	      .elig_ovc(elig_ovc),
	      .error(opc_error));
	   
	   assign channel_out_op[op*channel_width:(op+1)*channel_width-1]
		    = channel_out;
	   
	   assign almost_full_op_ovc[op*num_vcs:(op+1)*num_vcs-1]
	     = almost_full_ovc;
	   assign full_op_ovc[op*num_vcs:(op+1)*num_vcs-1] = full_ovc;
	   
	   assign elig_op_ovc[op*num_vcs:(op+1)*num_vcs-1] = elig_ovc;
	   
	   assign opc_error_op[op] = opc_error;
	   
	end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // error reporting
   //---------------------------------------------------------------------------
   
   generate
      
      if(error_capture_mode != `ERROR_CAPTURE_MODE_NONE)
	begin
	   
	   wire [0:num_ports+num_ports-1] errors_s, errors_q;
	   assign errors_s = {ipc_error_ip, opc_error_op};
	   c_err_rpt
	     #(.num_errors(num_ports+num_ports),
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
