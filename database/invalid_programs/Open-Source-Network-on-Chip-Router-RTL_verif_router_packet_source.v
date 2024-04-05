// $Id: packet_source.v 5188 2012-08-30 00:31:31Z dub $

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
// pseudo-random packet source
//==============================================================================

module packet_source
  (clk, reset, router_address, channel, flit_valid, flow_ctrl, run, error);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
`include "vcr_constants.v"
   
   parameter initial_seed = 0;
   
   // maximum number of packets to generate (-1 = no limit)
   parameter max_packet_count = 1000;
   
   // packet injection rate (percentage of cycles)
   parameter packet_rate = 25;
   
   // width of packet count register
   parameter packet_count_reg_width = 32;

   // select packet length mode (0: uniform random, 1: bimodal)
   parameter packet_length_mode = 0;
   
   // select network topology
   parameter topology = `TOPOLOGY_FBFLY;
   
   // total buffer size per port in flits
   parameter buffer_size = 32;
   
   // number of message classes (e.g. request, reply)
   parameter num_message_classes = 2;
   
   // nuber of resource classes (e.g. minimal, adaptive)
   parameter num_resource_classes = 2;
   
   // width required to select individual resource class
   localparam resource_class_idx_width = clogb(num_resource_classes);
   
   // total number of packet classes
   localparam num_packet_classes = num_message_classes * num_resource_classes;
   
   // number of VCs per class
   parameter num_vcs_per_class = 2;
   
   // number of VCs
   localparam num_vcs = num_packet_classes * num_vcs_per_class;
   
   // width required to select individual VC
   localparam vc_idx_width = clogb(num_vcs);
   
   // total number of nodes
   parameter num_nodes = 64;
   
   // number of dimensions in network
   parameter num_dimensions = 2;
   
   // number of nodes per router (a.k.a. concentration factor)
   parameter num_nodes_per_router = 4;

   // total number of routers
   localparam num_routers
     = (num_nodes + num_nodes_per_router - 1) / num_nodes_per_router;
   
   // number of routers in each dimension
   localparam num_routers_per_dim = croot(num_routers, num_dimensions);
   
   // width required to select individual router in a dimension
   localparam dim_addr_width = clogb(num_routers_per_dim);
   
   // width required to select individual router in entire network
   localparam router_addr_width = num_dimensions * dim_addr_width;
   
   // connectivity within each dimension
   localparam connectivity
     = (topology == `TOPOLOGY_MESH) ?
       `CONNECTIVITY_LINE :
       (topology == `TOPOLOGY_TORUS) ?
       `CONNECTIVITY_RING :
       (topology == `TOPOLOGY_FBFLY) ?
       `CONNECTIVITY_FULL :
       -1;
   
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
   
   // width required to select individual port
   localparam port_idx_width = clogb(num_ports);
   
   // width required to select individual node at current router
   localparam node_addr_width = clogb(num_nodes_per_router);
   
   // width of global addresses
   localparam addr_width = router_addr_width + node_addr_width;
   
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
   parameter max_payload_length = 4;
   
   // minimum payload length (in flits)
   parameter min_payload_length = 0;
   
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
   
   // total number of bits required for storing header information
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
   
   // select flit buffer management scheme
   parameter fb_mgmt_type = `FB_MGMT_TYPE_STATIC;
   
   // EXPERIMENTAL:
   // for dynamic buffer management, only reserve a buffer slot for a VC while 
   // it is active (i.e., while a packet is partially transmitted)
   // (NOTE: This is currently broken!)
   parameter disable_static_reservations = 0;
   
   // select whether to exclude full or non-empty VCs from VC allocation
   parameter elig_mask = `ELIG_MASK_NONE;
   
   // which router port is this packet source attached to?
   parameter port_id = 0;
   
   // which dimension does the current input port belong to?
   localparam curr_dim = port_id / num_neighbors_per_dim;
   
   // maximum packet length (in flits)
   localparam max_packet_length = 1 + max_payload_length;
   
   // total number of bits required to represent maximum packet length
   localparam packet_length_width = clogb(max_packet_length);
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   
   input [0:router_addr_width-1] router_address;
   
   output [0:channel_width-1] 	 channel;
   wire [0:channel_width-1] 	 channel;
   
   output 			 flit_valid;
   wire 			 flit_valid;
   
   input [0:flow_ctrl_width-1] 	 flow_ctrl;
   
   input 			 run;
   
   output 			 error;
   wire 			 error;
   
   integer 			 seed = initial_seed;
   
   integer 			 i;
   
   reg 				 new_packet;   
   
   always @(posedge clk, posedge reset)
     begin
	new_packet
	  <= ($dist_uniform(seed, 0, 99) < packet_rate) && run && !reset;
     end
   
   wire waiting_packet_count_zero;
   
   wire packet_ready;
   assign packet_ready = new_packet & ~waiting_packet_count_zero;
   
   generate
      
      if(max_packet_count >= 0)
	begin
	   
	   wire [0:packet_count_reg_width-1] waiting_packet_count_s;
	   wire [0:packet_count_reg_width-1] waiting_packet_count_q;
	   assign waiting_packet_count_s
	     = waiting_packet_count_q - packet_ready;
	   c_dff
	     #(.width(packet_count_reg_width),
	       .reset_value(max_packet_count),
	       .reset_type(reset_type))
	   waiting_packet_countq
	     (.clk(clk),
	      .reset(reset),
	      .active(1'b1),
	      .d(waiting_packet_count_s),
	      .q(waiting_packet_count_q));
	   
	   assign waiting_packet_count_zero = ~|waiting_packet_count_q;
	   
	end
      else
	assign waiting_packet_count_zero = 1'b0;
      
   endgenerate
   
   wire 				 packet_sent;
   
   wire 				 ready_packet_count_zero;
   wire [0:packet_count_reg_width-1] 	 ready_packet_count_s;
   wire [0:packet_count_reg_width-1] 	 ready_packet_count_q;
   assign ready_packet_count_s
     = run ?
       ready_packet_count_q - (packet_sent & ~ready_packet_count_zero) + 
       packet_ready :
       {packet_count_reg_width{1'b0}};
   c_dff
     #(.width(packet_count_reg_width),
       .reset_type(reset_type))
   ready_packet_countq
     (.clk(clk),
      .reset(reset),
      .active(1'b1),
      .d(ready_packet_count_s),
      .q(ready_packet_count_q));
   
   assign ready_packet_count_zero = ~|ready_packet_count_q;
   
   wire 				 flit_head;
   wire 				 flit_tail;
   wire [0:flit_data_width-1] 		 flit_data;
   wire [0:num_vcs-1] 			 sel_ovc;
   rtr_channel_output
     #(.num_vcs(num_vcs),
       .packet_format(packet_format),
       .enable_link_pm(enable_link_pm),
       .flit_data_width(flit_data_width),
       .reset_type(reset_type))
   cho
     (.clk(clk),
      .reset(reset),
      .active(flit_valid),
      .flit_valid_in(flit_valid),
      .flit_head_in(flit_head),
      .flit_tail_in(flit_tail),
      .flit_data_in(flit_data),
      .flit_sel_in_ovc(sel_ovc),
      .channel_out(channel));
   
   wire 				 fc_event_valid;
   wire [0:num_vcs-1] 			 fc_event_sel_ovc;
   rtr_flow_ctrl_input
     #(.num_vcs(num_vcs),
       .flow_ctrl_type(flow_ctrl_type),
       .reset_type(reset_type))
   fci
     (.clk(clk),
      .reset(reset),
      .active(1'b1),
      .flow_ctrl_in(flow_ctrl),
      .fc_event_valid_out(fc_event_valid),
      .fc_event_sel_out_ovc(fc_event_sel_ovc));
   
   wire 				 flit_valid_s, flit_valid_q;
   assign flit_valid_s = flit_valid;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   flit_validq
     (.clk(clk),
      .reset(reset),
      .active(1'b1),
      .d(flit_valid_s),
      .q(flit_valid_q));
   
   wire 				 flit_head_s, flit_head_q;
   assign flit_head_s = flit_head;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   flit_headq
     (.clk(clk),
      .reset(reset),
      .active(1'b1),
      .d(flit_head_s),
      .q(flit_head_q));
   
   wire 				 flit_tail_s, flit_tail_q;
   assign flit_tail_s = flit_tail;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   flit_tailq
     (.clk(clk),
      .reset(reset),
      .active(1'b1),
      .d(flit_tail_s),
      .q(flit_tail_q));
   
   wire [0:num_vcs-1] 			 flit_sel_ovc_s, flit_sel_ovc_q;
   assign flit_sel_ovc_s = sel_ovc;
   c_dff
     #(.width(num_vcs),
       .reset_type(reset_type))
   flit_sel_ovcq
     (.clk(clk),
      .reset(reset),
      .active(1'b1),
      .d(flit_sel_ovc_s),
      .q(flit_sel_ovc_q));
   
   wire 				 fc_active;
   wire [0:num_vcs-1] 			 empty_ovc;
   wire [0:num_vcs-1] 			 almost_full_ovc;
   wire [0:num_vcs-1] 			 full_ovc;
   wire [0:num_vcs-1] 			 full_prev_ovc;
   wire [0:num_vcs*2-1] 		 fcs_errors_ovc;
   rtr_fc_state
     #(.num_vcs(num_vcs),
       .buffer_size(buffer_size),
       .flow_ctrl_type(flow_ctrl_type),
       .flow_ctrl_bypass(flow_ctrl_bypass),
       .mgmt_type(fb_mgmt_type),
       .disable_static_reservations(disable_static_reservations),
       .reset_type(reset_type))
   fcs
     (.clk(clk),
      .reset(reset),
      .active(1'b1),
      .flit_valid(flit_valid_q),
      .flit_head(flit_head_q),
      .flit_tail(flit_tail_q),
      .flit_sel_ovc(flit_sel_ovc_q),
      .fc_event_valid(fc_event_valid),
      .fc_event_sel_ovc(fc_event_sel_ovc),
      .fc_active(fc_active),
      .empty_ovc(empty_ovc),
      .almost_full_ovc(almost_full_ovc),
      .full_ovc(full_ovc),
      .full_prev_ovc(full_prev_ovc),
      .errors_ovc(fcs_errors_ovc));
   
   wire [0:num_vcs-1] 			 elig_ovc;
   
   genvar 				 ovc;
   
   generate
      
      for(ovc = 0; ovc < num_vcs; ovc = ovc + 1)
	begin:ovcs
	   
	   wire allocated;
	   
	   wire allocated_s, allocated_q;
	   assign allocated_s = allocated;
	   c_dff
	     #(.width(1),
	       .reset_type(reset_type))
	   allocatedq
	     (.clk(clk),
	      .reset(reset),
	      .active(1'b1),
	      .d(allocated_s),
	      .q(allocated_q));
	   
	   wire flit_sent;
	   assign flit_sent = flit_valid_q & flit_sel_ovc_q[ovc];
	   
	   assign allocated = flit_sent ? ~flit_tail_q : allocated_q;
	   
	   wire empty;
	   assign empty = empty_ovc[ovc];
	   
	   wire full;
	   assign full = full_ovc[ovc];
	   
	   wire elig;
	   
	   case(elig_mask)
	     
	     `ELIG_MASK_NONE:
	       assign elig = ~allocated;
	     
	     `ELIG_MASK_FULL:
	       assign elig = ~allocated & ~full;
	     
	     `ELIG_MASK_USED:
	       assign elig = ~allocated & empty;
	     
	   endcase
	   
	   assign elig_ovc[ovc] = elig;
	   
	end
      
   endgenerate
   
   wire 	full;
   c_select_1ofn
     #(.num_ports(num_vcs),
       .width(1))
   full_sel
     (.select(sel_ovc),
      .data_in(full_ovc),
      .data_out(full));
   
   wire 	elig;
   c_select_1ofn
     #(.num_ports(num_vcs),
       .width(1))
   elig_sel
     (.select(sel_ovc),
      .data_in(elig_ovc),
      .data_out(elig));
   
   wire 	flit_pending_q;
   
   wire 	flit_sent;
   assign flit_sent = flit_pending_q & ~full & (elig | ~flit_head);
   
   wire 	flit_kill;
   
   assign flit_valid = flit_sent & ~flit_kill;
   
   assign packet_sent = flit_tail & flit_sent;
   
   wire 	flit_pending_s;
   assign flit_pending_s
     = (flit_pending_q & ~packet_sent) | ~ready_packet_count_zero;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   flit_pendingq
     (.clk(clk),
      .reset(reset),
      .active(1'b1),
      .d(flit_pending_s),
      .q(flit_pending_q));
   
   reg [0:flit_data_width-1] data_q;
   always @(posedge clk, posedge reset)
     begin
	if(reset | flit_valid)
	  for(i = 0; i < flit_data_width; i = i + 1)
	    data_q[i] <= $dist_uniform(seed, 0, 1);
     end
   
   wire [0:header_info_width-1] header_info;
   
   assign flit_data[0:header_info_width-1]
     = flit_head ? header_info : data_q[0:header_info_width-1];
   assign flit_data[header_info_width:flit_data_width-1]
     = data_q[header_info_width:flit_data_width-1];
   
   reg [0:dest_info_width-1] dest_info;
   
   wire [0:num_message_classes*num_resource_classes-1] sel_mc_orc;
   c_mat_mult
     #(.dim1_width(num_message_classes*num_resource_classes),
       .dim2_width(num_vcs_per_class),
       .dim3_width(1),
       .prod_op(`BINARY_OP_AND),
       .sum_op(`BINARY_OP_OR))
   sel_mc_orc_mmult
     (.input_a(sel_ovc),
      .input_b({num_vcs_per_class{1'b1}}),
      .result(sel_mc_orc));
   
   wire [0:num_message_classes-1] 		       sel_mc;
   c_mat_mult
     #(.dim1_width(num_message_classes),
       .dim2_width(num_resource_classes),
       .dim3_width(1),
       .prod_op(`BINARY_OP_AND),
       .sum_op(`BINARY_OP_OR))
   sel_mc_mmult
     (.input_a(sel_mc_orc),
      .input_b({num_resource_classes{1'b1}}),
      .result(sel_mc));
   
   wire [0:num_resource_classes*num_message_classes-1] sel_orc_mc;
   c_interleave
     #(.width(num_message_classes*num_resource_classes),
       .num_blocks(num_message_classes))
   sel_orc_mc_intl
     (.data_in(sel_mc_orc),
      .data_out(sel_orc_mc));
   
   wire [0:num_resource_classes-1] 		       sel_orc;
   c_mat_mult
     #(.dim1_width(num_resource_classes),
       .dim2_width(num_message_classes),
       .dim3_width(1),
       .prod_op(`BINARY_OP_AND),
       .sum_op(`BINARY_OP_OR))
   sel_orc_mmult
     (.input_a(sel_orc_mc),
      .input_b({num_message_classes{1'b1}}),
      .result(sel_orc));
   
   wire [0:num_ports-1] 			       route_op;
   wire [0:num_resource_classes-1] 		       route_orc;
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
     (.router_address(router_address),
      .sel_mc(sel_mc),
      .sel_irc(sel_orc),
      .dest_info(dest_info),
      .route_op(route_op),
      .route_orc(route_orc));
   
   wire [0:port_idx_width-1] 			       route_port;
   c_encode
     #(.num_ports(num_ports))
   route_port_enc
     (.data_in(route_op),
      .data_out(route_port));
   
   wire [0:lar_info_width-1] 		       lar_info;
   assign lar_info[0:port_idx_width-1] = route_port;
   
   generate
      
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
      
   endgenerate
   
   assign header_info[0:lar_info_width-1] = lar_info;
   
   wire [0:num_resource_classes*router_addr_width-1] dest_info_addresses;
   assign dest_info_addresses
     = dest_info[0:num_resource_classes*router_addr_width-1];
   
   wire [0:router_addr_width-1] 		     rc_dest;
   c_select_1ofn
     #(.num_ports(num_resource_classes),
       .width(router_addr_width))
   rc_dest_sel
     (.select(sel_orc),
      .data_in(dest_info_addresses),
      .data_out(rc_dest));
   
   wire [0:addr_width-1] 			     source_address;
   assign source_address[0:router_addr_width-1] = router_address;
   
   wire [0:router_addr_width-1] 		     curr_dest_addr;
   
   generate
      
      case(routing_type)
	
	`ROUTING_TYPE_PHASED_DOR:
	  begin
	     
	     if(port_id >= (num_ports - num_nodes_per_router))
	       begin
		  
		  assign flit_kill
		    = (dest_info[dest_info_width-addr_width:
				  dest_info_width-1] ==
		       source_address);
		  
	       end
	     else
	       begin
		  
		  case(connectivity)
		    
		    `CONNECTIVITY_LINE, `CONNECTIVITY_RING:
		      begin
			 
			 wire flit_kill_base;
			 if(connectivity == `CONNECTIVITY_LINE)
			   assign flit_kill_base
			     = (((port_id % 2) == 0) && 
				(rc_dest[curr_dim*dim_addr_width:
					 (curr_dim+1)*dim_addr_width-1] <
				 router_address[curr_dim*
						dim_addr_width:
						(curr_dim+1)*
						dim_addr_width-1])) ||
			       (((port_id % 2) == 1) && 
				(rc_dest[curr_dim*dim_addr_width:
					 (curr_dim+1)*dim_addr_width-1] >
				 router_address[curr_dim*
						dim_addr_width:
						(curr_dim+1)*
						dim_addr_width-1]));
			 else
			   assign flit_kill_base = 1'b0;
			 
			 if((dim_order == `DIM_ORDER_ASCENDING) && 
			    (curr_dim > 0))
 			   begin
			      
			      assign flit_kill
				= (rc_dest[0:curr_dim*dim_addr_width-1] !=
				   router_address[0:curr_dim*
						  dim_addr_width-1]) ||
				  flit_kill_base;
			      
			   end
			 else if((dim_order == `DIM_ORDER_DESCENDING) &&
				 (curr_dim < (num_dimensions - 1)))
			   begin
			      
			      assign flit_kill
				= (rc_dest[(curr_dim+1)*dim_addr_width:
					   router_addr_width-1] !=
				   router_address[(curr_dim+1)*dim_addr_width:
						  router_addr_width-1]) ||
				  flit_kill_base;
			      
			   end
			 else if(dim_order == `DIM_ORDER_BY_CLASS)
			   begin
			      
			      // FIXME: add implementation here!
			      
			      initial
				begin
				   $display({"ERROR: The packet source module ",
					     "does not properly support class-",
					     "based dimension order traversal ",
					     "in the flit kill logic yet."});
				   $stop;
				end
			      
			   end
			 else
			   begin
			      
			      assign flit_kill = flit_kill_base;
			      
			   end
			 
		      end
		    
		    `CONNECTIVITY_FULL:
		      begin
			 
			 assign flit_kill
			   = ((dim_order == `DIM_ORDER_ASCENDING) &&
			      (rc_dest[0:(curr_dim+1)*dim_addr_width-1] !=
			       router_address[0:(curr_dim+1)*dim_addr_width-1])) ||
			     ((dim_order == `DIM_ORDER_DESCENDING) &&
			      (rc_dest[curr_dim*dim_addr_width:
				       router_addr_width-1] !=
			       router_address[curr_dim*dim_addr_width:
					      router_addr_width-1]));
			 
		      end
		    
		  endcase
		  
	       end
	     
	  end
	
      endcase
      
   endgenerate
   
   reg [0:router_addr_width-1] random_router_address;
   
   integer 		       d;
   
   generate
      
      if(num_nodes_per_router > 1)
	begin
	   
	   wire [0:node_addr_width-1] node_address;
	   
	   if(port_id >= (num_ports - num_nodes_per_router))
	     assign node_address = port_id - (num_ports - num_nodes_per_router);
	   else
	     assign node_address = {node_addr_width{1'b0}};
	   
	   assign source_address[router_addr_width:addr_width-1] = node_address;
	   
	   reg [0:node_addr_width-1]  random_node_address;
	   
	   always @(posedge clk, posedge reset)
	     begin
		if(reset | packet_sent)
		  begin
		     for(d = 0; d < num_dimensions; d = d + 1)
		       random_router_address[d*dim_addr_width +: dim_addr_width]
			 = (router_address[d*dim_addr_width +: dim_addr_width] +
			    $dist_uniform(seed, 0, num_routers_per_dim-1)) %
			   num_routers_per_dim;
		     random_node_address
		       = (node_address +
			  $dist_uniform(seed, 
					((port_id >= 
					  (num_ports - num_nodes_per_router)) &&
					 (random_router_address == 
					  router_address)) ? 1 : 0, 
					num_nodes_per_router - 1)) % 
			 num_nodes_per_router;
		     dest_info[dest_info_width-addr_width:dest_info_width-1]
		       = {random_router_address, random_node_address};
		  end		
	     end
	   
	end
      else
	begin
	   always @(posedge clk, posedge reset)
	     begin
		if(reset | packet_sent)
		  begin
		     for(d = 0; d < num_dimensions - 1; d = d + 1)
		       random_router_address[d*dim_addr_width +: dim_addr_width]
			 = (router_address[d*dim_addr_width +: dim_addr_width] +
			    $dist_uniform(seed, 0, num_routers_per_dim-1)) %
			   num_routers_per_dim;
		     random_router_address[router_addr_width-dim_addr_width:
					   router_addr_width-1]
		       = router_address[router_addr_width-dim_addr_width:
					router_addr_width-1];
		     random_router_address[router_addr_width-dim_addr_width:
					   router_addr_width-1]
		       = (router_address[router_addr_width-dim_addr_width:
					 router_addr_width-1] +
			  $dist_uniform(seed,
					((port_id >= 
					  (num_ports - num_nodes_per_router)) &&
					 (random_router_address == 
					  router_address)) ? 1 : 0,
					num_routers_per_dim - 1)) %
			 num_routers_per_dim;
		     dest_info[dest_info_width-addr_width:dest_info_width-1]
		       = random_router_address;
		  end
	     end
	end
      
      if(num_resource_classes > 1)
	begin
	   
	   reg [0:router_addr_width-1] last_router_address;
	   reg [0:router_addr_width-1] random_intm_address;
	   
	   always @(random_router_address)
	     begin
		last_router_address = random_router_address;
		for(i = num_resource_classes - 2; i >= 0; i = i - 1)
		  begin
		     for(d = 0; d < num_dimensions - 1; d = d + 1)
		       random_intm_address[d*dim_addr_width +: dim_addr_width]
			 = (last_router_address[d*dim_addr_width +: 
						dim_addr_width] +
			    $dist_uniform(seed, 0, num_routers_per_dim-1)) %
			   num_routers_per_dim;
		     random_intm_address[router_addr_width-dim_addr_width:
					 router_addr_width-1]
		       = last_router_address[router_addr_width-dim_addr_width:
					     router_addr_width-1];
		     random_intm_address[router_addr_width-dim_addr_width:
					 router_addr_width-1]
		       = (last_router_address[router_addr_width-dim_addr_width:
					      router_addr_width-1] +
			  $dist_uniform(seed, (random_router_address ==
					       last_router_address) ? 1 : 0, 
					num_routers_per_dim - 1)) % 
			 num_routers_per_dim;
		     dest_info[i*router_addr_width +: router_addr_width]
		       = random_intm_address;
		     last_router_address = random_intm_address;
		  end
	     end
	end
      
      assign header_info[lar_info_width:
			 route_info_width-1]
	       = dest_info;
      
      if(max_payload_length > 0)
	begin
	   
	   reg [0:packet_length_width-1] random_length_q;
	   reg [0:packet_length_width-1] flit_count_q;
	   reg 				 tail_q;
	   always @(posedge clk, posedge reset)
	     begin
		case(packet_length_mode)
		  0:
		    random_length_q <= $dist_uniform(seed, min_payload_length, 
						     max_payload_length);
		  1:
		    random_length_q <= ($dist_uniform(seed, 0, 1) < 1) ? 
				       min_payload_length : 
				       max_payload_length;
		endcase
		if(reset)
		  begin
		     flit_count_q <= min_payload_length;
		     tail_q <= (min_payload_length == 0);
		  end
		else if(packet_sent)
		  begin
		     flit_count_q <= random_length_q;
		     tail_q <= ~|random_length_q;
		  end
		else if(flit_sent)
		  begin
		     flit_count_q <= flit_count_q - |flit_count_q;
		     tail_q <= ~|(flit_count_q - |flit_count_q);
		  end
	     end
	   
	   wire head_s, head_q;
	   assign head_s = (head_q & ~flit_sent) | packet_sent;
	   c_dff
	     #(.width(1),
	       .reset_value(1'b1),
	       .reset_type(reset_type))
	   headq
	     (.clk(clk),
	      .reset(reset),
	      .active(1'b1),
	      .d(head_s),
	      .q(head_q));
	   
	   assign flit_head = head_q;
	   assign flit_tail = tail_q;
	   
	   if((packet_format == `PACKET_FORMAT_EXPLICIT_LENGTH) &&
	      (payload_length_width > 0))
	     begin
		wire [0:payload_length_width-1] payload_length;
		assign payload_length = (flit_count_q - min_payload_length);
		assign header_info[route_info_width:
				   route_info_width+
				   payload_length_width-1]
			 = payload_length;
	     end
	   
	end
      else
	begin
	   assign flit_head = 1'b1;
	   assign flit_tail = 1'b1;
	end
      
      if(num_vcs > 1)
	begin
	   
	   reg [0:vc_idx_width-1] random_vc;
	   
	   always @(posedge clk, posedge reset)
	     begin
		if(reset | packet_sent)
		  random_vc <= $dist_uniform(seed, 0, num_vcs-1);
	     end
	   
	   c_decode
	     #(.num_ports(num_vcs))
	   sel_ovc_dec
	     (.data_in(random_vc),
	      .data_out(sel_ovc));
	   
	   assign curr_dest_addr
	     = dest_info[((random_vc / num_vcs_per_class) % 
			   num_resource_classes)*router_addr_width +: 
			  router_addr_width];
	   
	end
      else
	begin
	   assign sel_ovc = 1'b1;
	   assign curr_dest_addr = dest_info[0:router_addr_width-1];
	end
      
   endgenerate
   
   assign error = |fcs_errors_ovc;
   
endmodule
