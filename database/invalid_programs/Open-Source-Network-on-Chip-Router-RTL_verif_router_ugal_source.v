// $Id: ugal_source.v 5188 2012-08-30 00:31:31Z dub $

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
// a rudimentary traffic source that implements UGAL routing
//==============================================================================

module ugal_source(/*autoarg*/
   // Outputs
   intm_router_address, route_min,
   // Inputs
   clk, reset, flit_valid, flit_head, src_router_address, sel_mc, dest_info,
   credit_count
   );
   
`include "c_functions.v"
`include "c_constants.v"

   parameter ugal_threshold 	     = 3;
   
   // flit bufwfer entries
   parameter buffer_size 	     = 16;
   
   // number of message classes (e.g. request, reply)
   parameter num_message_classes     = 1;
   
   // nuber of resource classes (e.g. minimal, adaptive)
   localparam num_resource_classes    = 2; // NOTE: UGAL requires this to be 2!
   
   // total number of packet classes
   localparam num_packet_classes     = num_message_classes * num_resource_classes;
   
   // number of VCs per class
   parameter num_vcs_per_class 	     = 1;
   
   // number of VCs
   localparam num_vcs 		     = num_packet_classes * num_vcs_per_class;
   //
   parameter port_id 		     = 6;
   
   // number of routers in each dimension
   parameter num_routers_per_dim     = 4;
   
   // width required to select individual router in a dimension
   localparam dim_addr_width 	     = clogb(num_routers_per_dim);
   
   // number of dimensions in network
   parameter num_dimensions 	     = 2;
   
   // width required to select individual router in network
   localparam router_addr_width      = num_dimensions * dim_addr_width;
   
   // number of nodes per router (a.k.a. consentration factor)
   parameter num_nodes_per_router    = 4;
   
   // width required to select individual node at current router
   localparam node_addr_width 	     = clogb(num_nodes_per_router);
   
   // width of global addresses
   localparam addr_width 	     = router_addr_width + node_addr_width;
   
   // connectivity within each dimension
   parameter connectivity 	     = `CONNECTIVITY_FULL;
   
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
   localparam port_idx_width 	   = clogb(num_ports);
   
   // select routing function type
   parameter routing_type 	   = `ROUTING_TYPE_PHASED_DOR;
   
   // select order of dimension traversal
   parameter dim_order 		   = `DIM_ORDER_ASCENDING;
   
   // total number of bits required for storing routing information
   localparam dest_info_width
     = (routing_type == `ROUTING_TYPE_PHASED_DOR) ? 
       (num_resource_classes * router_addr_width + node_addr_width) : 
       -1;
   
   parameter reset_type 	   = `RESET_TYPE_ASYNC;


   
   input clk;
   input reset;
   input flit_valid;
   input flit_head;
 
	 
   // current router's address
   input [0:router_addr_width-1] src_router_address;
   // current message class
   input [0:num_message_classes-1] sel_mc;
   //destination address
   input [0:addr_width-1] dest_info;
   
   localparam credit_count_width  = clogb(buffer_size)+1;
   //credit count from the ugal_sniffer
   input [0:(num_ports-num_nodes_per_router)*credit_count_width-1] credit_count;
   
   // modified routing data
   output [0:router_addr_width-1] intm_router_address;
   // modified resource class
   output route_min;
   
   //normal routing on the min path
   localparam [0:num_resource_classes-1] sel_irc
     = (1 << (num_resource_classes - 1 - 1));
   wire [0:num_ports-1] min_route_unmasked;
   wire [0:num_resource_classes-1] route_orc;
    rtr_routing_logic
      #(.num_resource_classes(num_resource_classes),
	.num_routers_per_dim(num_routers_per_dim),
	.num_vcs_per_class(num_vcs_per_class),
	.num_dimensions(num_dimensions),
	.num_nodes_per_router(num_nodes_per_router),
	.connectivity(connectivity),
	.routing_type(routing_type),
	.dim_order(dim_order))
    min_routing
      (.router_address(src_router_address),
       .sel_mc('d1),
       .sel_irc(sel_irc),
       .dest_info({src_router_address,dest_info}),
       .route_op(min_route_unmasked),
       .route_orc(route_orc));

   //normal routing on nonmin route
   localparam [0:num_resource_classes-1] sel_irc_nonmin
     = (1 << (num_resource_classes - 1 - 0));

   wire [0:num_ports-1] nonmin_route_unmasked;
   wire [0:num_resource_classes-1] route_orc_nonmin;
   rtr_routing_logic
      #(.num_resource_classes(num_resource_classes),
	.num_routers_per_dim(num_routers_per_dim),
	.num_vcs_per_class(num_vcs_per_class),
	.num_dimensions(num_dimensions),
	.num_nodes_per_router(num_nodes_per_router),
	.connectivity(connectivity),
	.routing_type(routing_type),
	.dim_order(dim_order))
    nonmin_routing
      (.router_address(src_router_address),
       .sel_mc('d1),
       .sel_irc(sel_irc_nonmin),
       .dest_info({intm_router_address,dest_info}),
       .route_op(nonmin_route_unmasked),
       .route_orc(route_orc_nonmin));


   wire [0:credit_count_width-1] min_count;
   wire [0:credit_count_width-1] nonmin_count;

   //select the credit count for min/nonmin ports
   c_select_1ofn
     #(// Parameters
       .num_ports			(num_ports-num_nodes_per_router),
       .width				(credit_count_width))
   min_count_select
     (
      // Outputs
      .data_out				(min_count[0:credit_count_width-1]),
      // Inputs
      .select				(min_route_unmasked[0:num_ports-num_nodes_per_router-1]),
      .data_in				( credit_count[0:(num_ports-num_nodes_per_router)*credit_count_width-1]));
   c_select_1ofn
     #(// Parameters
       .num_ports			(num_ports-num_nodes_per_router),
       .width				(credit_count_width))
   nonmin_count_select
     (
      // Outputs
      .data_out				(nonmin_count[0:credit_count_width-1]),
      // Inputs
      .select				(nonmin_route_unmasked[0:num_ports-num_nodes_per_router-1]),
      .data_in				( credit_count[0:(num_ports-num_nodes_per_router)*credit_count_width-1]));


   wire compare ;
   wire compare_q;

   //shift the nonmin count by 1 (X2) and compare
   
   wire [0:credit_count_width-1+2] ext_min_count;
   assign  ext_min_count [0:credit_count_width-1+2] = {min_count[0:credit_count_width-1],2'b0};
   wire [0:credit_count_width-1+2] ext_nonmin_count;
   assign  ext_nonmin_count [0:credit_count_width-1+2] = {1'b0,nonmin_count[0:credit_count_width-1],1'b0};
   
   assign compare 	=( (ext_nonmin_count+ugal_threshold) > ext_min_count);

   //keep resource classes of multiflit packet consistent 
   wire decision 	= (flit_head&flit_valid)?compare:compare_q;

   localparam eligible 	= num_ports-num_nodes_per_router;

   //select the resource class
   assign route_min 	= |(min_route_unmasked[eligible:num_ports-1])|decision;
   //assign route_min 	= 1'b1;
   
   //remember the routing decision for multiflit packets
   c_dff
     #(       // Parameters
       .width				(1),
       .reset_type			(reset_type),
       .reset_value			(1'b1))
   last_compare
     (
      // Outputs
      .q				(compare_q),
      // Inputs
      .clk				(clk),
      .reset				(reset),
      .active				(active),
      .d				((flit_head&flit_valid)?compare:compare_q));
   

   //LFSR that generate a random router address
   //note only 1 feedback value is used, could be really 'not" random
   
   wire [0:router_addr_width-1] rand_value;
   wire [0:router_addr_width-1] rand_feedback;
   
   c_fbgen
     #(.width(router_addr_width),
       .index(1))
   rand_fbgen
     (.feedback(rand_feedback));
   c_lfsr
     #(
       // Parameters
       .width			( router_addr_width),
       .iterations	       	( router_addr_width),
       .reset_type		(reset_type))
   rand_gen
     (
      // Outputs
      .q			(rand_value[0:router_addr_width-1]),
      // Inputs
      .clk			(clk),
      .reset			(reset),
      .load			(reset),
      .run			(flit_head&flit_valid),
      .feedback			(rand_feedback[0:router_addr_width-1]),
      .complete			(1'b0),
      .d			(rand_value[0:router_addr_width-1]));

   wire carry;
   //select a random intermediate router if necessary.
   assign {intm_router_address[0:router_addr_width-1],carry} = {src_router_address[0:router_addr_width-1],1'b0}+{rand_value[0:router_addr_width-1],1'b0}; 
   //assign intm_router_address[0:router_addr_width-1] = 6'b0;
   
endmodule

