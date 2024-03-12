// $Id: vcr_ip_ctrl_mac.v 5188 2012-08-30 00:31:31Z dub $

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

module vcr_ip_ctrl_mac
  (clk, reset, router_address, channel_in, route_ivc_op, route_ivc_orc, 
   allocated_ivc, flit_valid_ivc, flit_head_ivc, flit_tail_ivc, 
   free_nonspec_ivc, vc_gnt_ivc, vc_sel_ivc_ovc, sw_gnt, sw_sel_ivc, sw_gnt_op, 
   almost_full_op_ovc, full_op_ovc, flit_data, flow_ctrl_out, error);
   
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
   
   // width required to select individual resource class
   localparam resource_class_idx_width = clogb(num_resource_classes);
   
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
   
   // number of nodes per router (a.k.a. consentration factor)
   parameter num_nodes_per_router = 1;
   
   // width required to select individual node at current router
   localparam node_addr_width = clogb(num_nodes_per_router);
   
   // width of global addresses
   localparam addr_width = router_addr_width + node_addr_width;
   
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
   
   // select type of flow control
   parameter flow_ctrl_type = `FLOW_CTRL_TYPE_CREDIT;
   
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
   
   // number of bits required to represent all possible payload sizes
   localparam payload_length_width
     = clogb(max_payload_length-min_payload_length+1);

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
   
    // select implementation variant for flit buffer register file
   parameter fb_regfile_type = `REGFILE_TYPE_FF_2D;
   
   // select flit buffer management scheme
   parameter fb_mgmt_type = `FB_MGMT_TYPE_STATIC;
   
   // improve timing for peek access
   parameter fb_fast_peek = 1;
   
   // use explicit pipeline register between flit buffer and crossbar?
   parameter explicit_pipeline_register = 0;
   
   // gate flit buffer write port if bypass succeeds
   // (requires explicit pipeline register; may increase cycle time)
   parameter gate_buffer_write = 0;
   
   // enable speculative switch allocation
   parameter sw_alloc_spec = 1;
   
   // select whether to exclude full or non-empty VCs from VC allocation
   parameter elig_mask = `ELIG_MASK_NONE;
   
   // VC allocation is atomic
   localparam atomic_vc_allocation = (elig_mask == `ELIG_MASK_USED);
   
   // configure error checking logic
   parameter error_capture_mode = `ERROR_CAPTURE_MODE_NO_HOLD;
   
   // ID of current input port
   parameter port_id = 0;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
      
   input clk;
   input reset;
   
   // current router's address
   input [0:router_addr_width-1] router_address;
   
   // incoming channel
   input [0:channel_width-1] 	 channel_in;
   
   // destination port
   output [0:num_vcs*num_ports-1] route_ivc_op;
   wire [0:num_vcs*num_ports-1]   route_ivc_op;
   
   // select next resource class
   output [0:num_vcs*num_resource_classes-1] route_ivc_orc;
   wire [0:num_vcs*num_resource_classes-1]   route_ivc_orc;
   
   // VC has an output VC allocated to it
   output [0:num_vcs-1] 		     allocated_ivc;
   wire [0:num_vcs-1] 			     allocated_ivc;
   
   // VC has a flit available
   output [0:num_vcs-1] 		     flit_valid_ivc;
   wire [0:num_vcs-1] 			     flit_valid_ivc;
   
   // flit is head flit
   output [0:num_vcs-1] 		     flit_head_ivc;
   wire [0:num_vcs-1] 			     flit_head_ivc;
   
   // flit is tail flit
   output [0:num_vcs-1] 		     flit_tail_ivc;
   wire [0:num_vcs-1] 			     flit_tail_ivc;
   
   // credit availability if output VC has been allocated
   output [0:num_vcs-1] 		     free_nonspec_ivc;
   wire [0:num_vcs-1] 			     free_nonspec_ivc;
   
   // VC allocation successful
   input [0:num_vcs-1] 			     vc_gnt_ivc;
   
   // granted output VC
   input [0:num_vcs*num_vcs-1] 		     vc_sel_ivc_ovc;
   
   // switch grant
   input 				     sw_gnt;
   
   // select VC for switch grant
   input [0:num_vcs-1] 			     sw_sel_ivc;
   
   // switch grant for output ports
   input [0:num_ports-1] 		     sw_gnt_op;
   
   // which output VC have only a single credit left?
   input [0:num_ports*num_vcs-1] 	     almost_full_op_ovc;
   
   // which output VC have no credit left?
   input [0:num_ports*num_vcs-1] 	     full_op_ovc;
   
   // outgoing flit data
   output [0:flit_data_width-1] 	     flit_data;
   wire [0:flit_data_width-1] 		     flit_data;
   
   // outgoing flow control signals
   output [0:flow_ctrl_width-1] 	     flow_ctrl_out;
   wire [0:flow_ctrl_width-1] 		     flow_ctrl_out;
   
   // internal error condition detected
   output 				     error;
   wire 				     error;
   
   
   //---------------------------------------------------------------------------
   // input stage
   //---------------------------------------------------------------------------
   
   wire 				     fb_full;
   
   wire 				     input_stage_active;
   assign input_stage_active = ~fb_full;
   
   wire 				     flit_valid_in;
   wire 				     flit_head_in;
   wire [0:num_vcs-1] 			     flit_head_in_ivc;
   wire 				     flit_tail_in;
   wire [0:num_vcs-1] 			     flit_tail_in_ivc;
   wire [0:flit_data_width-1] 		     flit_data_in;
   wire [0:num_vcs-1] 			     flit_sel_in_ivc;
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
      .active(input_stage_active),
      .channel_in(channel_in),
      .flit_valid_out(flit_valid_in),
      .flit_head_out(flit_head_in),
      .flit_head_out_ivc(flit_head_in_ivc),
      .flit_tail_out(flit_tail_in),
      .flit_tail_out_ivc(flit_tail_in_ivc),
      .flit_data_out(flit_data_in),
      .flit_sel_out_ivc(flit_sel_in_ivc));
   
   wire [0:header_info_width-1] 	     header_info_in;
   assign header_info_in = flit_data_in[0:header_info_width-1];
   
   
   //---------------------------------------------------------------------------
   // switch allocation
   //---------------------------------------------------------------------------
   
   wire [0:num_vcs-1] 			     free_spec_ivc;
   
   wire 				     flit_sent;
   
   generate
      
      if(sw_alloc_spec)
	begin
	   
	   wire [0:num_vcs-1] spec_mask_ivc;
	   
	   if(elig_mask == `ELIG_MASK_NONE)
	     assign spec_mask_ivc
	       = allocated_ivc | (vc_gnt_ivc & free_spec_ivc);
	   else
	     assign spec_mask_ivc = allocated_ivc | vc_gnt_ivc;
	   
	   wire 	      spec_mask;
	   c_select_1ofn
	     #(.num_ports(num_vcs),
	       .width(1))
	   spec_mask_sel
	     (.select(sw_sel_ivc),
	      .data_in(spec_mask_ivc),
	      .data_out(spec_mask));
	   
	   assign flit_sent = sw_gnt & spec_mask;
	   
	end
      else
	assign flit_sent = sw_gnt;
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // input vc controllers
   //---------------------------------------------------------------------------
   
   wire [0:num_vcs-1] 	      fb_pop_tail_ivc;
   wire [0:header_info_width-1] fb_pop_next_header_info;
   wire [0:num_vcs-1] 		    fb_almost_empty_ivc;
   wire [0:num_vcs-1] 		    fb_empty_ivc;
   
   wire [0:num_vcs*lar_info_width-1] next_lar_info_ivc;
   wire [0:num_vcs*3-1] 	     ivcc_errors_ivc;
   
   genvar 			     ivc;
   
   generate
      
      for(ivc = 0; ivc < num_vcs; ivc = ivc + 1)
	begin:ivcs
	   
	   //-------------------------------------------------------------------
	   // connect inputs
	   //-------------------------------------------------------------------
	   
	   wire flit_sel_in;
	   assign flit_sel_in = flit_sel_in_ivc[ivc];
	   
	   wire flit_head_in;
	   assign flit_head_in = flit_head_in_ivc[ivc];
	   
	   wire flit_tail_in;
	   assign flit_tail_in = flit_tail_in_ivc[ivc];
	   
	   wire vc_gnt;
	   assign vc_gnt = vc_gnt_ivc[ivc];
	   
	   wire [0:num_vcs-1] vc_sel_ovc;
	   assign vc_sel_ovc = vc_sel_ivc_ovc[ivc*num_vcs:(ivc+1)*num_vcs-1];
	   
	   wire 	      sw_sel;
	   assign sw_sel = sw_sel_ivc[ivc];
	   
	   wire 	      fb_pop_tail;
	   assign fb_pop_tail = fb_pop_tail_ivc[ivc];
	   
	   wire 	      fb_almost_empty;
	   assign fb_almost_empty = fb_almost_empty_ivc[ivc];
	   
	   
	   //-------------------------------------------------------------------
	   // input VC controller
	   //-------------------------------------------------------------------
	   
	   wire 			    fb_empty;
	   assign fb_empty = fb_empty_ivc[ivc];
	   
	   wire [0:num_ports-1] 	    route_op;
	   wire [0:num_resource_classes-1]  route_orc;
	   wire 			    flit_valid;
	   wire 			    flit_head;
	   wire 			    flit_tail;
	   wire [0:lar_info_width-1] 	    next_lar_info;
	   wire 			    allocated;
	   wire 			    free_nonspec;
	   wire 			    free_spec;
	   wire [0:2] 			    ivcc_errors;
	   vcr_ivc_ctrl
	     #(.num_message_classes(num_message_classes),
	       .num_resource_classes(num_resource_classes),
	       .num_vcs_per_class(num_vcs_per_class),
	       .num_routers_per_dim(num_routers_per_dim),
	       .num_dimensions(num_dimensions),
	       .num_nodes_per_router(num_nodes_per_router),
	       .connectivity(connectivity),
	       .packet_format(packet_format),
	       .max_payload_length(max_payload_length),
	       .min_payload_length(min_payload_length),
	       .restrict_turns(restrict_turns),
	       .routing_type(routing_type),
	       .dim_order(dim_order),
	       .elig_mask(elig_mask),
	       .sw_alloc_spec(sw_alloc_spec),
	       .fb_mgmt_type(fb_mgmt_type),
	       .explicit_pipeline_register(explicit_pipeline_register),
	       .vc_id(ivc),
	       .port_id(port_id),
	       .reset_type(reset_type))
	   ivcc
	     (.clk(clk),
	      .reset(reset),
	      .router_address(router_address),
	      .flit_valid_in(flit_valid_in),
	      .flit_head_in(flit_head_in),
	      .flit_tail_in(flit_tail_in),
	      .flit_sel_in(flit_sel_in),
	      .header_info_in(header_info_in),
	      .fb_pop_tail(fb_pop_tail),
	      .fb_pop_next_header_info(fb_pop_next_header_info),
	      .almost_full_op_ovc(almost_full_op_ovc),
	      .full_op_ovc(full_op_ovc),
	      .route_op(route_op),
	      .route_orc(route_orc),
	      .vc_gnt(vc_gnt),
	      .vc_sel_ovc(vc_sel_ovc),
	      .sw_gnt(sw_gnt),
	      .sw_sel(sw_sel),
	      .sw_gnt_op(sw_gnt_op),
	      .flit_valid(flit_valid),
	      .flit_head(flit_head),
	      .flit_tail(flit_tail),
	      .next_lar_info(next_lar_info),
	      .fb_almost_empty(fb_almost_empty),
	      .fb_empty(fb_empty),
	      .allocated(allocated),
	      .free_nonspec(free_nonspec),
	      .free_spec(free_spec),
	      .errors(ivcc_errors));
	   
	   
	   //-------------------------------------------------------------------
	   // connect outputs
	   //-------------------------------------------------------------------
	   
	   assign route_ivc_op[ivc*num_ports:(ivc+1)*num_ports-1] = route_op;
	   assign route_ivc_orc[ivc*num_resource_classes:
				(ivc+1)*num_resource_classes-1] = route_orc;
	   assign flit_valid_ivc[ivc] = flit_valid;
	   assign flit_head_ivc[ivc] = flit_head;
	   assign flit_tail_ivc[ivc] = flit_tail;
	   assign next_lar_info_ivc[ivc*lar_info_width:(ivc+1)*lar_info_width-1]
	     = next_lar_info;
	   assign allocated_ivc[ivc] = allocated;
	   assign free_nonspec_ivc[ivc] = free_nonspec;
	   assign free_spec_ivc[ivc] = free_spec;
	   assign ivcc_errors_ivc[ivc*3:(ivc+1)*3-1] = ivcc_errors;
	   
	end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // flit buffer
   //---------------------------------------------------------------------------
   
   wire 				    fb_push_active;
   assign fb_push_active = flit_valid_in;
   
   wire 				    fb_push_valid;
   assign fb_push_valid = flit_valid_in;
   
   wire 				    fb_push_head;
   assign fb_push_head = flit_head_in;
   
   wire 				    fb_push_tail;
   assign fb_push_tail = flit_tail_in;
   
   wire [0:num_vcs-1] 			    fb_push_sel_ivc;
   assign fb_push_sel_ivc = flit_sel_in_ivc;
   
   wire [0:flit_data_width-1] 		    fb_push_data;
   assign fb_push_data = flit_data_in;
   
   wire 				    alloc_active;
   assign alloc_active = flit_valid_in | ~&fb_empty_ivc;
   
   wire 				    fb_pop_active;
   assign fb_pop_active = alloc_active;
   
   wire 				    fb_pop_valid;
   assign fb_pop_valid = flit_sent;
   
   wire [0:num_vcs-1] 			    fb_pop_sel_ivc;
   assign fb_pop_sel_ivc = sw_sel_ivc;
   
   wire [0:flit_data_width-1] 		    fb_pop_data;
   wire [0:num_vcs*2-1] 		    fb_errors_ivc;
   rtr_flit_buffer
     #(.num_vcs(num_vcs),
       .buffer_size(buffer_size),
       .flit_data_width(flit_data_width),
       .header_info_width(header_info_width),
       .regfile_type(fb_regfile_type),
       .mgmt_type(fb_mgmt_type),
       .fast_peek(fb_fast_peek),
       .explicit_pipeline_register(explicit_pipeline_register),
       .gate_buffer_write(gate_buffer_write),
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
   // update lookahead routing info
   //---------------------------------------------------------------------------
   
   wire [0:lar_info_width-1] 	      next_lar_info;
   c_select_1ofn
     #(.num_ports(num_vcs),
       .width(lar_info_width))
   netx_lar_info_sel
     (.select(sw_sel_ivc),
      .data_in(next_lar_info_ivc),
      .data_out(next_lar_info));
   
   wire 			      flit_head;
   
   wire [0:lar_info_width-1] 	      lar_info_s, lar_info_q;
   assign lar_info_s = flit_head ? next_lar_info : lar_info_q;
   c_dff
     #(.width(lar_info_width),
       .reset_type(reset_type))
   lar_infoq
     (.clk(clk),
      .reset(1'b0),
      .active(alloc_active),
      .d(lar_info_s),
      .q(lar_info_q));
   
   wire 			      flit_head_prev;
   
   assign flit_data[0:lar_info_width-1]
     = flit_head_prev ? lar_info_q : fb_pop_data[0:lar_info_width-1];
   assign flit_data[lar_info_width:flit_data_width-1]
     = fb_pop_data[lar_info_width:flit_data_width-1];
   
   
   //---------------------------------------------------------------------------
   // generate signals to crossbar module
   //---------------------------------------------------------------------------
   
   // NOTE: Because we need to clear it in the cycle after a flit / credit has 
   // been transmitted, this register cannot be included in any of the other 
   // clock gating domains. If we could change things such that flits are 
   // transmitted using edge-based signaling (i.e., transitions), they could be 
   // included in the clock gating domain controlled by alloc_active.
   // Alternatively, we could include the flit_sent_prev term in alloc_active;
   // this would allow us to include flit_validq in the gating domain at 
   // the cost of some unnecessary activity. As synthesis will probably not 
   // create a clock gating domain for just these two registers, they currently 
   // will most likely end up being free-running, so this may be a reasonable 
   // tradeoff.
   
   wire 			      flit_sent_prev;
   
   wire 			      flit_valid_active;
   assign flit_valid_active = alloc_active | flit_sent_prev;
   
   wire 			      flit_valid_s, flit_valid_q;
   assign flit_valid_s = flit_sent;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   flit_validq
     (.clk(clk),
      .reset(reset),
      .active(flit_valid_active),
      .d(flit_valid_s),
      .q(flit_valid_q));
   
   assign flit_sent_prev = flit_valid_q;
   
   c_select_1ofn
     #(.num_ports(num_vcs),
       .width(1))
   flit_head_sel
     (.select(sw_sel_ivc),
      .data_in(flit_head_ivc),
      .data_out(flit_head));
   
   wire 			      flit_head_s, flit_head_q;
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
   
   assign flit_head_prev = flit_head_q;
   
   
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
      .fc_event_sel_in_ivc(sw_sel_ivc),
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
