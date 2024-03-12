// $Id: whr_ip_ctrl_mac.v 5188 2012-08-30 00:31:31Z dub $

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

module whr_ip_ctrl_mac
  (clk, reset, router_address, channel_in, route_op, req, req_head, req_tail, 
   gnt, flit_data_out, flow_ctrl_out, error);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
`include "whr_constants.v"
   
   // total buffer size per port in flits
   parameter buffer_size = 8;
   
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
   
   // width of global addresses
   localparam addr_width = router_addr_width + node_addr_width;
   
   // select packet format
   parameter packet_format = `PACKET_FORMAT_EXPLICIT_LENGTH;
   
   // select type of flow control
   parameter flow_ctrl_type = `FLOW_CTRL_TYPE_CREDIT;
   
   // width of flow control signals
   localparam flow_ctrl_width
     = (flow_ctrl_type == `FLOW_CTRL_TYPE_CREDIT) ? 1 :
       -1;
   
   // select whether to exclude full or non-empty VCs from VC allocation
   parameter elig_mask = `ELIG_MASK_NONE;
   
   // VC allocation is atomic
   localparam atomic_vc_allocation = (elig_mask == `ELIG_MASK_USED);
   
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
   
   // enable link power management
   parameter enable_link_pm = 1;
   
   // width of link management signals
   localparam link_ctrl_width = enable_link_pm ? 1 : 0;
   
   // width of flit control signals
   localparam flit_ctrl_width
     = (packet_format == `PACKET_FORMAT_HEAD_TAIL) ? 
       (1 + 1 + 1) : 
       (packet_format == `PACKET_FORMAT_TAIL_ONLY) ? 
       (1 + 1) : 
       (packet_format == `PACKET_FORMAT_EXPLICIT_LENGTH) ? 
       (1 + 1) : 
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
   localparam lar_info_width = port_idx_width;
   
   // select routing function type
   parameter routing_type = `ROUTING_TYPE_PHASED_DOR;
   
   // total number of bits required for storing routing information
   localparam dest_info_width
     = (routing_type == `ROUTING_TYPE_PHASED_DOR) ? 
       (router_addr_width + node_addr_width) : 
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
   
   // use input register as part of the flit buffer
   parameter input_stage_can_hold = 0;
   
   // number of entries in flit buffer
   localparam fb_depth
     = input_stage_can_hold ? (buffer_size - 1) : buffer_size;
   
   // select implementation variant for flit buffer register file
   parameter fb_regfile_type = `REGFILE_TYPE_FF_2D;
   
   // improve timing for peek access
   parameter fb_fast_peek = 1;
   
   // use explicit pipeline register between flit buffer and crossbar?
   parameter explicit_pipeline_register = 0;
   
   // gate flit buffer write port if bypass succeeds
   // (requires explicit pipeline register; may increase cycle time)
   parameter gate_buffer_write = 0;
   
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
   
   // destination output port
   output [0:num_ports-1] 	 route_op;
   wire [0:num_ports-1] 	 route_op;
   
   // request allocation
   output 			 req;
   wire 			 req;
   
   // current flit is head flit
   output 			 req_head;
   wire 			 req_head;
   
   // current flit is tail flit
   output 			 req_tail;
   wire 			 req_tail;
   
   // output port granted
   input 			 gnt;
   
   // outgoing flit data
   output [0:flit_data_width-1]  flit_data_out;
   wire [0:flit_data_width-1] 	 flit_data_out;
   
   // outgoing flow control signals
   output [0:flow_ctrl_width-1]  flow_ctrl_out;
   wire [0:flow_ctrl_width-1] 	 flow_ctrl_out;
   
   // internal error condition detected
   output 			 error;
   wire 			 error;
   
   
   //---------------------------------------------------------------------------
   // input stage
   //---------------------------------------------------------------------------
   
   wire 			 flit_valid_in;
   wire 			 fb_empty;
   
   wire 			 flit_valid;
   assign flit_valid = flit_valid_in | ~fb_empty;
   
   wire 			 flit_valid_out;
   assign flit_valid_out = gnt;
   
   wire 			 fb_full;
   
   wire 			 hold_input_enable;
   
   generate
      
      if(input_stage_can_hold)
	assign hold_input_enable = fb_full;
      else
	assign hold_input_enable = 1'b0;
      
   endgenerate
   
   wire 	flit_valid_thru;
   assign flit_valid_thru = flit_valid_in & ~hold_input_enable;
   
   wire 	hold_input_stage_b;
   assign hold_input_stage_b = ~(flit_valid_in & hold_input_enable);
   
   wire 	chi_active;
   assign chi_active = hold_input_stage_b;
   
   wire 	flit_head_in;
   wire 	flit_head_in_ivc;
   wire 	flit_tail_in;
   wire 	flit_tail_in_ivc;
   wire [0:flit_data_width-1] flit_data_in;
   wire 		      flit_sel_in_ivc;
   rtr_channel_input
     #(.num_vcs(1),
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
      .flit_valid_out(flit_valid_in),
      .flit_head_out(flit_head_in),
      .flit_head_out_ivc(flit_head_in_ivc),
      .flit_tail_out(flit_tail_in),
      .flit_tail_out_ivc(flit_tail_in_ivc),
      .flit_data_out(flit_data_in),
      .flit_sel_out_ivc(flit_sel_in_ivc));
   
   wire [0:header_info_width-1] header_info_in;
   assign header_info_in = flit_data_in[0:header_info_width-1];
   
   wire [0:route_info_width-1] 	route_info_in;
   assign route_info_in = header_info_in[0:route_info_width-1];
   
   wire [0:lar_info_width-1] lar_info_in;
   assign lar_info_in = route_info_in[0:lar_info_width-1];
   
   wire [0:dest_info_width-1] 	  dest_info_in;
   assign dest_info_in = route_info_in[lar_info_width:
				       lar_info_width+dest_info_width-1];
   
   
   //---------------------------------------------------------------------------
   // flit buffer
   //---------------------------------------------------------------------------
   
   wire 			  fb_push_active;
   assign fb_push_active = flit_valid_thru;
   
   wire 			  fb_push_valid;
   assign fb_push_valid = flit_valid_thru;
   
   wire 			  fb_push_head;
   assign fb_push_head = flit_head_in;
   
   wire 			  fb_push_tail;
   assign fb_push_tail = flit_tail_in;
   
   wire [0:flit_data_width-1] 	  fb_push_data;
   assign fb_push_data = flit_data_in;
   
   wire 			  fb_pop_active;
   assign fb_pop_active = flit_valid;
   
   wire 			  fb_pop_valid;
   assign fb_pop_valid = flit_valid_out;
   
   wire [0:flit_data_width-1] 	  fb_pop_data;
   wire 			  fb_pop_tail;
   wire [0:header_info_width-1]   fb_pop_next_header_info;
   wire 			  fb_almost_empty;
   wire [0:1] 			  fb_errors;
   rtr_flit_buffer
     #(.num_vcs(1),
       .buffer_size(fb_depth),
       .flit_data_width(flit_data_width),
       .header_info_width(header_info_width),
       .regfile_type(fb_regfile_type),
       .explicit_pipeline_register(explicit_pipeline_register),
       .gate_buffer_write(gate_buffer_write),
       .mgmt_type(`FB_MGMT_TYPE_STATIC),
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
      .push_sel_ivc(1'b1),
      .push_data(fb_push_data),
      .pop_active(fb_pop_active),
      .pop_valid(fb_pop_valid),
      .pop_sel_ivc(1'b1),
      .pop_data(fb_pop_data),
      .pop_tail_ivc(fb_pop_tail),
      .pop_next_header_info(fb_pop_next_header_info),
      .almost_empty_ivc(fb_almost_empty),
      .empty_ivc(fb_empty),
      .full(fb_full),
      .errors_ivc(fb_errors));
   
   wire 			  error_fb_underflow;
   assign error_fb_underflow = fb_errors[0];
   
   wire 			  error_fb_overflow;
   assign error_fb_overflow = fb_errors[1];
   
   
   //---------------------------------------------------------------------------
   // generate head and tail indicators
   //---------------------------------------------------------------------------
   
   wire 			  pop_active;
   assign pop_active = flit_valid;
   
   wire 			  flit_tail_out;
   assign flit_tail_out = fb_empty ? flit_tail_in : fb_pop_tail;
   
   wire 			  htr_flit_head_s, htr_flit_head_q;
   assign htr_flit_head_s = flit_valid_out ? flit_tail_out : htr_flit_head_q;
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
   
   wire 			  flit_head_out;
   assign flit_head_out = fb_empty ? flit_head_in : htr_flit_head_q;
   
   
   //---------------------------------------------------------------------------
   // head register
   //---------------------------------------------------------------------------
   
   wire 			  hdr_active;
   wire 			  hdr_capture;
   generate
      if(atomic_vc_allocation)
	begin
	   assign hdr_active = flit_valid_in & flit_head_in;
	   assign hdr_capture = flit_valid_in & flit_head_in;
	end
      else
	begin
	   assign hdr_active = ~fb_empty | (flit_valid_in & flit_head_in);
	   assign hdr_capture = (fb_empty & flit_valid_in & flit_head_in) | 
				(flit_valid_out & flit_tail_out);
	end
   endgenerate
   
   wire two_plus_flits;
   assign two_plus_flits = ~fb_empty & ~fb_almost_empty;
   
   wire [0:route_info_width-1] fb_pop_next_route_info;
   assign fb_pop_next_route_info
     = fb_pop_next_header_info[0:route_info_width-1];
   
   wire [0:lar_info_width-1] hdr_lar_info_s, hdr_lar_info_q;
   generate
      if(atomic_vc_allocation)
	assign hdr_lar_info_s
	  = hdr_capture ? lar_info_in : hdr_lar_info_q;
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
   
   wire [0:dest_info_width-1] 	     hdr_dest_info_s, hdr_dest_info_q;
   generate
      if(atomic_vc_allocation)
	assign hdr_dest_info_s
	  = hdr_capture ? dest_info_in : hdr_dest_info_q;
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
   
   wire [0:port_idx_width-1] 	       route_port_in;
   assign route_port_in = lar_info_in[0:port_idx_width-1];
   
   wire [0:num_ports-1] 	       route_in_op;
   c_decode
     #(.num_ports(num_ports))
   route_in_op_dec
     (.data_in(route_port_in),
      .data_out(route_in_op));
   
   wire [0:port_idx_width-1] 	       hdr_route_port;
   assign hdr_route_port = hdr_lar_info_q[0:port_idx_width-1];
   
   wire [0:num_ports-1] 	       hdr_route_op;
   c_decode
     #(.num_ports(num_ports))
   hdr_route_op_dec
     (.data_in(hdr_route_port),
      .data_out(hdr_route_op));
   
   wire 			       bypass_route_info;
   generate
      if(atomic_vc_allocation)
	assign bypass_route_info = flit_valid_in & flit_head_in;
      else
	assign bypass_route_info = fb_empty & flit_valid_in & flit_head_in;
   endgenerate
   
   wire [0:num_ports-1] 	       route_unmasked_op;
   assign route_unmasked_op = bypass_route_info ? route_in_op : hdr_route_op;
   
   wire 			       route_orc;
   wire [0:1] 			       rf_errors;
   rtr_route_filter
     #(.num_message_classes(1),
       .num_resource_classes(1),
       .num_vcs_per_class(1),
       .num_ports(num_ports),
       .num_neighbors_per_dim(num_neighbors_per_dim),
       .num_nodes_per_router(num_nodes_per_router),
       .restrict_turns(restrict_turns),
       .connectivity(connectivity),
       .routing_type(routing_type),
       .dim_order(dim_order),
       .port_id(port_id),
       .vc_id(0))
   rf
     (.clk(clk),
      .route_valid(flit_valid),
      .route_in_op(route_unmasked_op),
      .route_in_orc(1'b1),
      .route_out_op(route_op),
      .route_out_orc(route_orc),
      .errors(rf_errors));
   
   wire 			       error_invalid_port;
   assign error_invalid_port = rf_errors[0];
   
   wire 			       error_invalid_class;
   assign error_invalid_class = rf_errors[1];
   
   
   //---------------------------------------------------------------------------
   // update lookahead routing information for next hop
   //---------------------------------------------------------------------------
   
   wire [0:dest_info_width-1] 	       dest_info;
   assign dest_info = bypass_route_info ? dest_info_in : hdr_dest_info_q;
   
   wire [0:lar_info_width-1] 	       lar_info;
   assign lar_info = bypass_route_info ? lar_info_in : hdr_lar_info_q;
   
   wire [0:router_addr_width-1]        next_router_address;
   rtr_next_hop_addr
     #(.num_resource_classes(1),
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
   
   wire [0:num_ports-1] 	       next_route_op;
   wire 			       next_route_orc;
   rtr_routing_logic
     #(.num_message_classes(1),
       .num_resource_classes(1),
       .num_routers_per_dim(num_routers_per_dim),
       .num_dimensions(num_dimensions),
       .num_nodes_per_router(num_nodes_per_router),
       .connectivity(connectivity),
       .routing_type(routing_type),
       .dim_order(dim_order))
   rtl
     (.router_address(next_router_address),
      .sel_mc(1'b1),
      .sel_irc(1'b1),
      .dest_info(dest_info),
      .route_op(next_route_op),
      .route_orc(next_route_orc));
   
   wire [0:port_idx_width-1] 	       next_route_port;
   c_encode
     #(.num_ports(num_ports))
   next_route_port_enc
     (.data_in(next_route_op),
      .data_out(next_route_port));
   
   wire [0:lar_info_width-1] 	       next_lar_info;
   assign next_lar_info = next_route_port;
   
   
   //---------------------------------------------------------------------------
   // generate output data
   //---------------------------------------------------------------------------
   
   wire [0:lar_info_width-1] 	       lar_info_s, lar_info_q;
   assign lar_info_s = flit_head_out ? next_lar_info : lar_info_q;
   c_dff
     #(.width(lar_info_width),
       .reset_type(reset_type))
   lar_infoq
     (.clk(clk),
      .reset(1'b0),
      .active(pop_active),
      .d(lar_info_s),
      .q(lar_info_q));
   
   wire 			       flit_head_prev_s, flit_head_prev_q;
   assign flit_head_prev_s = flit_head_out;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   flit_head_prevq
     (.clk(clk),
      .reset(1'b0),
      .active(pop_active),
      .d(flit_head_prev_s),
      .q(flit_head_prev_q));
   
   assign flit_data_out[0:lar_info_width-1]
     = flit_head_prev_q ? lar_info_q : fb_pop_data[0:lar_info_width-1];
   assign flit_data_out[lar_info_width:flit_data_width-1]
     = fb_pop_data[lar_info_width:flit_data_width-1];
   
   
   //---------------------------------------------------------------------------
   // generate control signals to switch allocator
   //---------------------------------------------------------------------------
   
   assign req = flit_valid;
   assign req_head = flit_head_out;
   assign req_tail = flit_tail_out;
   
   
   //---------------------------------------------------------------------------
   // generate outgoing credits
   //---------------------------------------------------------------------------
   
   wire 				  flow_ctrl_active;
   assign flow_ctrl_active = flit_valid;
   
   rtr_flow_ctrl_output
     #(.num_vcs(1),
       .flow_ctrl_type(flow_ctrl_type),
       .reset_type(reset_type))
   fco
     (.clk(clk),
      .reset(reset),
      .active(flow_ctrl_active),
      .fc_event_valid_in(flit_valid_out),
      .fc_event_sel_in_ivc(1'b1),
      .flow_ctrl_out(flow_ctrl_out));
   
   
   //---------------------------------------------------------------------------
   // error checking
   //---------------------------------------------------------------------------
   
   wire 				  ftc_active;
   assign ftc_active = flit_valid_in;
   
   wire 				  error_invalid_flit_type;
   rtr_flit_type_check
     #(.reset_type(reset_type))
   ftc
     (.clk(clk),
      .reset(reset),
      .active(ftc_active),
      .flit_valid(flit_valid_thru),
      .flit_head(flit_head_in),
      .flit_tail(flit_tail_in),
      .error(error_invalid_flit_type));
   
   generate
      
      if(error_capture_mode != `ERROR_CAPTURE_MODE_NONE)
	begin

	   wire [0:4] errors_s, errors_q;
	   assign errors_s[0] = error_fb_underflow;
	   assign errors_s[1] = error_fb_overflow;
	   assign errors_s[2] = error_invalid_port;
	   assign errors_s[3] = error_invalid_class;
	   assign errors_s[4] = error_invalid_flit_type;
	   c_err_rpt
	     #(.num_errors(5),
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
