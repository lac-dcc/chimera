// $Id: vcr_vc_alloc_sep_of.v 5188 2012-08-30 00:31:31Z dub $

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
// VC allocator variant using separable output-first allocation
//==============================================================================

module vcr_vc_alloc_sep_of
  (clk, reset, active_ip, active_op, route_ip_ivc_op, route_ip_ivc_orc, 
   elig_op_ovc, req_ip_ivc, gnt_ip_ivc, sel_ip_ivc_ovc, gnt_op_ovc, 
   sel_op_ovc_ip, sel_op_ovc_ivc);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
`include "vcr_constants.v"
   
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
   
   // number of input and output ports on switch
   parameter num_ports = 5;
   
   // select which arbiter type to use in allocator
   parameter arbiter_type = `ARBITER_TYPE_ROUND_ROBIN_BINARY;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   
   // input-side activity indicator
   input [0:num_ports-1] active_ip;
   
   // output-side activity indicator
   input [0:num_ports-1] active_op;
   
   // destination port selects
   input [0:num_ports*num_vcs*num_ports-1] route_ip_ivc_op;
   
   // select next resource class
   input [0:num_ports*num_vcs*num_resource_classes-1] route_ip_ivc_orc;
   
   // output VC is eligible for allocation (i.e., not currently allocated)
   input [0:num_ports*num_vcs-1] 		      elig_op_ovc;
   
   // request VC allocation
   input [0:num_ports*num_vcs-1] 		      req_ip_ivc;
   
   // VC allocation successful (to input controller)
   output [0:num_ports*num_vcs-1] 		      gnt_ip_ivc;
   wire [0:num_ports*num_vcs-1] 		      gnt_ip_ivc;
   
   // granted output VC (to input controller)
   output [0:num_ports*num_vcs*num_vcs-1] 	      sel_ip_ivc_ovc;
   wire [0:num_ports*num_vcs*num_vcs-1] 	      sel_ip_ivc_ovc;
   
   // output VC was granted (to output controller)
   output [0:num_ports*num_vcs-1] 		      gnt_op_ovc;
   wire [0:num_ports*num_vcs-1] 		      gnt_op_ovc;
   
   // input port that each output VC was granted to
   output [0:num_ports*num_vcs*num_ports-1] 	      sel_op_ovc_ip;
   wire [0:num_ports*num_vcs*num_ports-1] 	      sel_op_ovc_ip;
   
   // input VC that each output VC was granted to
   output [0:num_ports*num_vcs*num_vcs-1] 	      sel_op_ovc_ivc;
   wire [0:num_ports*num_vcs*num_vcs-1] 	      sel_op_ovc_ivc;
   
   
   generate
      
      genvar 					      mc;
      
      for(mc = 0; mc < num_message_classes; mc = mc + 1)
	begin:mcs
	   
	   //-------------------------------------------------------------------
	   // global wires
	   //-------------------------------------------------------------------
	   
	   wire [0:num_ports*num_resource_classes*num_vcs_per_class*num_ports*
		 num_resource_classes*
		 num_vcs_per_class-1] req_out_ip_irc_icvc_op_orc_ocvc;
	   wire [0:num_ports*num_resource_classes*num_vcs_per_class*num_ports*
		 num_resource_classes*
		 num_vcs_per_class-1] gnt_out_ip_irc_icvc_op_orc_ocvc;
	   wire [0:num_ports*num_resource_classes*num_vcs_per_class*num_ports*
		 num_resource_classes*
		 num_vcs_per_class-1] gnt_in_ip_irc_icvc_op_orc_ocvc;
	   
	   
	   //-------------------------------------------------------------------
	   // input stage
	   //-------------------------------------------------------------------
	   
	   genvar 		      ip;
	   
	   for(ip = 0; ip < num_ports; ip = ip + 1)
	     begin:ips
		
		wire [0:num_resource_classes*num_vcs_per_class-1] req_irc_icvc;
		assign req_irc_icvc = req_ip_ivc[(ip*num_message_classes+mc)*
						 num_resource_classes*
						 num_vcs_per_class:
						 (ip*num_message_classes+mc+1)*
						 num_resource_classes*
						 num_vcs_per_class-1];
		
		wire 						  active;
		assign active = active_ip[ip];
		
		genvar 						  irc;
		
		for(irc = 0; irc < num_resource_classes; irc = irc + 1)
		  begin:ircs
		     
		     genvar icvc;
		     
		     for(icvc = 0; icvc < num_vcs_per_class; icvc = icvc + 1)
		       begin:icvcs
			  
			  //----------------------------------------------------
			  // generate requests for output stage
			  //----------------------------------------------------
			  
			  wire req;
			  assign req = req_irc_icvc[irc*num_vcs_per_class+icvc];
			  
			  wire [0:num_ports-1] route_op;
			  assign route_op
			    = route_ip_ivc_op[(((ip*num_message_classes+mc)*
						num_resource_classes+irc)*
					       num_vcs_per_class+icvc)*
					      num_ports:
					      (((ip*num_message_classes+mc)*
						num_resource_classes+irc)*
					       num_vcs_per_class+icvc+1)*
					      num_ports-1];
			  
			  wire [0:num_resource_classes-1] route_orc;
			  
			  if(irc == (num_resource_classes - 1))
			    assign route_orc = 'd1;
			  else
			    assign route_orc
			      = route_ip_ivc_orc[(((ip*num_message_classes+mc)*
						   num_resource_classes+irc)*
						  num_vcs_per_class+icvc)*
						 num_resource_classes:
						 (((ip*num_message_classes+mc)*
						   num_resource_classes+irc)*
						  num_vcs_per_class+icvc+1)*
						 num_resource_classes-1];
			  
			  wire [0:num_ports*num_resource_classes*
				num_vcs_per_class-1] req_out_op_orc_ocvc;
			  
			  genvar 		     op;
			  
			  for(op = 0; op < num_ports; op = op + 1)
			    begin:ops
			       
			       wire route;
			       assign route = route_op[op];
			       
			       wire [0:num_resource_classes-1] req_out_orc;
			       assign req_out_orc
				 = {num_resource_classes{req & route}} &
				   route_orc;
			       
			       wire [0:num_resource_classes*
				     num_vcs_per_class-1] req_out_orc_ocvc;
			       c_mat_mult
				 #(.dim1_width(num_resource_classes),
				   .dim2_width(1),
				   .dim3_width(num_vcs_per_class),
				   .prod_op(`BINARY_OP_AND),
				   .sum_op(`BINARY_OP_OR))
			       req_orc_ocvc_mmult
				 (.input_a(req_out_orc),
				  .input_b({num_vcs_per_class{1'b1}}),
				  .result(req_out_orc_ocvc));
			       
			       assign req_out_op_orc_ocvc[op*
							  num_resource_classes*
							  num_vcs_per_class:
							  (op+1)*
							  num_resource_classes*
							  num_vcs_per_class-1]
				 = req_out_orc_ocvc;
			       
			       wire [0:num_vcs-1] 	  req_out_ovc;
			       c_align
				 #(.in_width(num_resource_classes*
					     num_vcs_per_class),
				   .out_width(num_vcs),
				   .offset(mc*num_resource_classes*
					   num_vcs_per_class))
			       req_out_ovc_agn
				 (.data_in(req_out_orc_ocvc),
				  .dest_in({num_vcs{1'b0}}),
				  .data_out(req_out_ovc));
			       
			    end
			       
			  assign req_out_ip_irc_icvc_op_orc_ocvc
			    [((ip*num_resource_classes+irc)*
			      num_vcs_per_class+icvc)*
			     num_ports*num_resource_classes*
			     num_vcs_per_class:
			     ((ip*num_resource_classes+irc)*
			      num_vcs_per_class+icvc+1)*
			     num_ports*num_resource_classes*
			     num_vcs_per_class-1]
			    = req_out_op_orc_ocvc;
			  
			  
			  //----------------------------------------------------
			  // input arbitration stage (select output VC)
			  //----------------------------------------------------
			  
			  wire [0:num_ports*num_resource_classes*
				num_vcs_per_class-1] gnt_out_op_orc_ocvc;
			  assign gnt_out_op_orc_ocvc
			    = gnt_out_ip_irc_icvc_op_orc_ocvc
			      [((ip*num_resource_classes+irc)*
				num_vcs_per_class+icvc)*
			       num_ports*num_resource_classes*
			       num_vcs_per_class:
			       ((ip*num_resource_classes+irc)*
				num_vcs_per_class+icvc+1)*
			       num_ports*num_resource_classes*
			       num_vcs_per_class-1];
			  
			  // NOTE: Logically, what we want to do here is select 
			  // the subvector that corresponds to the current input
			  // VC's selected output port; however, because the 
			  // subvectors for all other ports will never have any 
			  // grants anyway, we can just OR all the subvectors
			  // instead of using a proper MUX.
			  wire [0:num_resource_classes*
				num_vcs_per_class-1] gnt_out_orc_ocvc;
			  c_binary_op
			    #(.width(num_resource_classes*num_vcs_per_class),
			      .num_ports(num_ports),
			      .op(`BINARY_OP_OR))
			  gnt_out_orc_ocvc_or
			    (.data_in(gnt_out_op_orc_ocvc),
			     .data_out(gnt_out_orc_ocvc));
			  
			  wire [0:num_resource_classes*
				num_vcs_per_class-1] req_in_orc_ocvc;
			  assign req_in_orc_ocvc = gnt_out_orc_ocvc;
			  
			  wire [0:num_resource_classes*
				num_vcs_per_class-1] gnt_in_orc_ocvc;
			  
			  genvar 		     orc;
			  
			  for(orc = 0; orc < num_resource_classes;
			      orc = orc + 1)
			    begin:orcs
			       
			       wire [0:num_vcs_per_class-1] gnt_out_ocvc;
			       assign gnt_out_ocvc
				 = gnt_out_orc_ocvc[orc*
						    num_vcs_per_class:
						    (orc+1)*
						    num_vcs_per_class-1];
			       
			       wire 			    update_arb;
			       assign update_arb = |gnt_out_ocvc;
			       
			       wire [0:num_vcs_per_class-1] req_in_ocvc;
			       assign req_in_ocvc
				 = req_in_orc_ocvc[orc*num_vcs_per_class:
						   (orc+1)*num_vcs_per_class-1];
			       
			       wire [0:num_vcs_per_class-1] gnt_in_ocvc;
			       c_arbiter
				 #(.num_ports(num_vcs_per_class),
				   .num_priorities(1),
				   .arbiter_type(arbiter_type),
				   .reset_type(reset_type))
			       gnt_in_ocvc_arb
				 (.clk(clk),
				  .reset(reset),
				  .active(active),
				  .update(update_arb),
				  .req_pr(req_in_ocvc),
				  .gnt_pr(gnt_in_ocvc),
				  .gnt());
			       
			       assign gnt_in_orc_ocvc[orc*
						      num_vcs_per_class:
						      (orc+1)*
						      num_vcs_per_class-1]
				 = gnt_in_ocvc;
			       
			    end
			  
			  wire [0:num_ports*num_resource_classes*
				num_vcs_per_class-1] gnt_in_op_orc_ocvc;
			  c_mat_mult
			    #(.dim1_width(num_ports),
			      .dim2_width(1),
			      .dim3_width(num_resource_classes*
					  num_vcs_per_class),
			      .prod_op(`BINARY_OP_AND),
			      .sum_op(`BINARY_OP_OR))
			  gnt_in_op_orc_ocvc_mmult
			    (.input_a(route_op),
			     .input_b(gnt_in_orc_ocvc),
			     .result(gnt_in_op_orc_ocvc));
			  
			  assign gnt_in_ip_irc_icvc_op_orc_ocvc
			    [((ip*num_resource_classes+irc)*
			      num_vcs_per_class+icvc)*
			     num_ports*num_resource_classes*
			     num_vcs_per_class:
			     ((ip*num_resource_classes+irc)*
			      num_vcs_per_class+icvc+1)*
			     num_ports*num_resource_classes*
			     num_vcs_per_class-1]
			    = gnt_in_op_orc_ocvc;
			  
			  
			  //----------------------------------------------------
			  // generate global grants
			  //----------------------------------------------------
			  
			  wire [0:num_vcs-1] 	     gnt_in_ovc;
			  c_align
			    #(.in_width(num_resource_classes*num_vcs_per_class),
			      .out_width(num_vcs),
			      .offset(mc*num_resource_classes*
				      num_vcs_per_class))
			  gnt_in_ovc_agn
			    (.data_in(gnt_in_orc_ocvc),
			     .dest_in({num_vcs{1'b0}}),
			     .data_out(gnt_in_ovc));
			  
			  assign sel_ip_ivc_ovc[(((ip*num_message_classes+mc)*
						  num_resource_classes+irc)*
						 num_vcs_per_class+icvc)*
						num_vcs:
						(((ip*num_message_classes+mc)*
						  num_resource_classes+irc)*
						 num_vcs_per_class+icvc+1)*
						num_vcs-1]
			    = gnt_in_ovc;
			  
			  assign gnt_ip_ivc[((ip*num_message_classes+mc)*
					     num_resource_classes+irc)*
					    num_vcs_per_class+icvc]
			    = |gnt_in_ovc;
			  
		       end
		     
		  end
		
	     end
	   
	   
	   //-------------------------------------------------------------------
	   // bit shuffling for changing sort order
	   //-------------------------------------------------------------------
	   
	   wire [0:num_ports*num_resource_classes*num_vcs_per_class*num_ports*
		 num_resource_classes*
		 num_vcs_per_class-1] gnt_in_op_orc_ocvc_ip_irc_icvc;
	   c_interleave
	     #(.width(num_ports*num_resource_classes*num_vcs_per_class*
		      num_ports*num_resource_classes*num_vcs_per_class),
	       .num_blocks(num_ports*num_resource_classes*num_vcs_per_class))
	   gnt_in_ip_irc_icvc_op_orc_ocvc_intl
	     (.data_in(gnt_in_ip_irc_icvc_op_orc_ocvc),
	      .data_out(gnt_in_op_orc_ocvc_ip_irc_icvc));
	   
	   wire [0:num_ports*num_resource_classes*num_vcs_per_class*num_ports*
		 num_resource_classes*
		 num_vcs_per_class-1] req_out_op_orc_ocvc_ip_irc_icvc;
	   c_interleave
	     #(.width(num_ports*num_resource_classes*num_vcs_per_class*
		      num_ports*num_resource_classes*num_vcs_per_class),
	       .num_blocks(num_ports*num_resource_classes*num_vcs_per_class))
	   req_out_op_orc_ocvc_ip_irc_icvc_intl
	     (.data_in(req_out_ip_irc_icvc_op_orc_ocvc),
	      .data_out(req_out_op_orc_ocvc_ip_irc_icvc));
	   
	   wire [0:num_ports*num_resource_classes*num_vcs_per_class*num_ports*
		 num_resource_classes*
		 num_vcs_per_class-1] gnt_out_op_orc_ocvc_ip_irc_icvc;
	   c_interleave
	     #(.width(num_ports*num_resource_classes*num_vcs_per_class*
		      num_ports*num_resource_classes*num_vcs_per_class),
	       .num_blocks(num_ports*num_resource_classes*num_vcs_per_class))
	   gnt_out_ip_irc_icvc_op_orc_ocvc_intl
	     (.data_in(gnt_out_op_orc_ocvc_ip_irc_icvc),
	      .data_out(gnt_out_ip_irc_icvc_op_orc_ocvc));
	   
	   
	   //-------------------------------------------------------------------
	   // output stage
	   //-------------------------------------------------------------------
	   
	   genvar 		      op;
	   
	   for (op = 0; op < num_ports; op = op + 1)
	     begin:ops
		
		wire active;
		assign active = active_op[op];
			  
		genvar orc;
		
		for(orc = 0; orc < num_resource_classes; orc = orc + 1)
		  begin:orcs
		     
		     genvar ocvc;
		     
		     for(ocvc = 0; ocvc < num_vcs_per_class; ocvc = ocvc + 1)
		       begin:ocvcs
			  
			  //----------------------------------------------------
			  // second stage arbitration (select input port and VC)
			  //----------------------------------------------------
			  
			  wire [0:num_ports*num_resource_classes*
				num_vcs_per_class-1] gnt_in_ip_irc_icvc;
			  assign gnt_in_ip_irc_icvc
			    = gnt_in_op_orc_ocvc_ip_irc_icvc
			      [((op*num_resource_classes+orc)*
				num_vcs_per_class+ocvc)*
			       num_ports*num_resource_classes*
			       num_vcs_per_class:
			       ((op*num_resource_classes+orc)*
				num_vcs_per_class+ocvc+1)*
			       num_ports*num_resource_classes*
			       num_vcs_per_class-1];
			  
			  wire 			     gnt_in;
			  assign gnt_in = |gnt_in_ip_irc_icvc;
			  
			  wire [0:num_ports*num_resource_classes*
				num_vcs_per_class-1] req_out_ip_irc_icvc;
			  assign req_out_ip_irc_icvc
			    = req_out_op_orc_ocvc_ip_irc_icvc
			      [((op*num_resource_classes+orc)*
				num_vcs_per_class+ocvc)*
			       num_ports*num_resource_classes*
			       num_vcs_per_class:
			       ((op*num_resource_classes+orc)*
				num_vcs_per_class+ocvc+1)*
			       num_ports*num_resource_classes*
			       num_vcs_per_class-1];
			  
			  wire 			     elig;
			  assign elig
			    = elig_op_ovc[((op*num_message_classes+mc)*
					   num_resource_classes+orc)*
					  num_vcs_per_class+ocvc];
			  
			  wire 			     update_arb;
			  assign update_arb = gnt_in;
			  
			  wire [0:num_ports-1] 	     req_out_ip;
			  
			  wire [0:num_ports-1] 	     gnt_out_ip;
			  c_arbiter
			    #(.num_ports(num_ports),
			      .num_priorities(1),
			      .arbiter_type(arbiter_type),
			      .reset_type(reset_type))
			  gnt_out_ip_arb
			    (.clk(clk),
			     .reset(reset),
			     .active(active),
			     .update(update_arb),
			     .req_pr(req_out_ip),
			     .gnt_pr(gnt_out_ip),
			     .gnt());
			  
			  wire [0:num_ports*num_resource_classes*
				num_vcs_per_class-1] gnt_raw_ip_irc_icvc;
			  wire [0:num_ports*num_resource_classes*
				num_vcs_per_class-1] gnt_out_ip_irc_icvc;
			  
			  genvar 		     ip;
			  
			  for(ip = 0; ip < num_ports; ip = ip + 1)
			    begin:ips
			       
			       wire update_arb;
			       assign update_arb = gnt_in & gnt_out_ip[ip];
			       
			       wire [0:num_resource_classes*
				     num_vcs_per_class-1] req_out_irc_icvc;
			       assign req_out_irc_icvc
				 = req_out_ip_irc_icvc[ip*
						       num_resource_classes*
						       num_vcs_per_class:
						       (ip+1)*
						       num_resource_classes*
						       num_vcs_per_class-1];
			       
			       assign req_out_ip[ip] = |req_out_irc_icvc;
			       
			       wire [0:num_resource_classes*
				     num_vcs_per_class-1] gnt_raw_irc_icvc;
			       c_arbiter
				 #(.num_ports(num_resource_classes*
					      num_vcs_per_class),
				   .num_priorities(1),
				   .arbiter_type(arbiter_type),
				   .reset_type(reset_type))
			       gnt_raw_irc_icvc_arb
				 (.clk(clk),
				  .reset(reset),
				  .active(active),
				  .update(update_arb),
				  .req_pr(req_out_irc_icvc),
				  .gnt_pr(gnt_raw_irc_icvc),
				  .gnt());
			       
			       assign gnt_raw_ip_irc_icvc[ip*
							  num_resource_classes*
							  num_vcs_per_class:
							  (ip+1)*
							  num_resource_classes*
							  num_vcs_per_class-1]
				 = gnt_raw_irc_icvc;
			       
			       wire [0:num_resource_classes*
				     num_vcs_per_class-1] gnt_out_irc_icvc;
			       assign gnt_out_irc_icvc
				 = gnt_raw_irc_icvc &
				   {(num_resource_classes*
				     num_vcs_per_class){gnt_out_ip[ip] & elig}};
			       
			       assign gnt_out_ip_irc_icvc[ip*
							  num_resource_classes*
							  num_vcs_per_class:
							  (ip+1)*
							  num_resource_classes*
							  num_vcs_per_class-1]
				 = gnt_out_irc_icvc;
			       
			    end
			  
			  wire [0:num_resource_classes*
				num_vcs_per_class-1] gnt_raw_irc_icvc;
			  c_select_1ofn
			    #(.num_ports(num_ports),
			      .width(num_resource_classes*num_vcs_per_class))
			  gnt_raw_irc_icvc_sel
			    (.select(gnt_out_ip),
			     .data_in(gnt_raw_ip_irc_icvc),
			     .data_out(gnt_raw_irc_icvc));
			  
			  wire [0:num_vcs-1] 	     gnt_raw_ivc;
			  c_align
			    #(.in_width(num_resource_classes*num_vcs_per_class),
			      .out_width(num_vcs),
			      .offset(mc*num_resource_classes*
				      num_vcs_per_class))
			  gnt_raw_ivc_alg
			    (.data_in(gnt_raw_irc_icvc),
			     .dest_in({num_vcs{1'b0}}),
			     .data_out(gnt_raw_ivc));
			  
			  assign gnt_out_op_orc_ocvc_ip_irc_icvc
			    [((op*num_resource_classes+orc)*
			      num_vcs_per_class+ocvc)*
			     num_ports*num_resource_classes*
			     num_vcs_per_class:
			     ((op*num_resource_classes+orc)*
			      num_vcs_per_class+ocvc+1)*
			     num_ports*num_resource_classes*
			     num_vcs_per_class-1]
			    = gnt_out_ip_irc_icvc;
			  
			  
			  //----------------------------------------------------
			  // generate control signals to output controller
			  //----------------------------------------------------
			  
			  assign gnt_op_ovc[((op*num_message_classes+mc)*
					     num_resource_classes+orc)*
					    num_vcs_per_class+ocvc]
			    = gnt_in;
			  
			  assign sel_op_ovc_ip[(((op*num_message_classes+mc)*
						 num_resource_classes+orc)*
						num_vcs_per_class+ocvc)*
					       num_ports:
					       (((op*num_message_classes+mc)*
						 num_resource_classes+orc)*
						num_vcs_per_class+ocvc+1)*
					       num_ports-1]
			    = gnt_out_ip;
			  
			  assign sel_op_ovc_ivc[(((op*num_message_classes+mc)
						  *num_resource_classes+orc)*
						 num_vcs_per_class+ocvc)*
						num_vcs:
						(((op*num_message_classes+mc)*
						  num_resource_classes+orc)*
						 num_vcs_per_class+ocvc+1)*
						num_vcs-1]
			    = gnt_raw_ivc;
			  
		       end
		     
		  end
		
	     end
	   
	end
      
   endgenerate
   
endmodule
