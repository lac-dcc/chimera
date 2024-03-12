// $Id: vcr_vc_alloc_wf.v 5188 2012-08-30 00:31:31Z dub $

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
// VC allocator variant based using wavefront allocation
//==============================================================================

module vcr_vc_alloc_wf
  (clk, reset, active, route_ip_ivc_op, route_ip_ivc_orc, elig_op_ovc, 
   req_ip_ivc, gnt_ip_ivc, sel_ip_ivc_ovc, gnt_op_ovc, sel_op_ovc_ip, 
   sel_op_ovc_ivc);
   
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
   
   // select which wavefront allocator variant to use
   parameter wf_alloc_type = `WF_ALLOC_TYPE_REP;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   
   // activity indicator
   input active;
   
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
	   
	   wire [0:num_ports*num_resource_classes*
		 num_vcs_per_class-1] req_ip_irc_icvc;
	   
	   wire [0:num_ports*num_resource_classes*num_vcs_per_class*num_ports*
		 num_resource_classes*
		 num_vcs_per_class-1] req_wf_ip_irc_icvc_op_orc_ocvc;
	   
	   wire 		      update_alloc;
	   assign update_alloc = |req_wf_ip_irc_icvc_op_orc_ocvc;
	   
	   wire [0:num_ports*num_resource_classes*num_vcs_per_class*num_ports*
		 num_resource_classes*
		 num_vcs_per_class-1] gnt_wf_ip_irc_icvc_op_orc_ocvc;
	   c_wf_alloc
	     #(.num_ports(num_ports*num_resource_classes*num_vcs_per_class),
	       .num_priorities(1),
	       .skip_empty_diags(1),
	       .wf_alloc_type(wf_alloc_type),
	       .reset_type(reset_type))
	   gnt_wf_ip_irc_icvc_op_orc_ocvc_alloc
	     (.clk(clk),
	      .reset(reset),
	      .active(active),
	      .update(update_alloc),
	      .req_pr(req_wf_ip_irc_icvc_op_orc_ocvc),
	      .gnt_pr(gnt_wf_ip_irc_icvc_op_orc_ocvc),
	      .gnt());
	   
	   
	   //-------------------------------------------------------------------
	   // handle interface to input controller
	   //-------------------------------------------------------------------
	   
	   genvar 		      ip;
	   
	   for(ip = 0; ip < num_ports; ip = ip + 1)
	     begin:ips
		
		assign req_ip_irc_icvc[ip*num_resource_classes*
				       num_vcs_per_class:
				       (ip+1)*num_resource_classes*
				       num_vcs_per_class-1]
		  = req_ip_ivc[(ip*num_message_classes+mc)*
			       num_resource_classes*num_vcs_per_class:
			       (ip*num_message_classes+mc+1)*
			       num_resource_classes*num_vcs_per_class-1];
		
		genvar irc;
		
		for(irc = 0; irc < num_resource_classes; irc = irc + 1)
		  begin:ircs
		     
		     genvar icvc;
		     
		     for(icvc = 0; icvc < num_vcs_per_class; icvc = icvc + 1)
		       begin:icvcs
			  
			  wire req;
			  assign req = req_ip_ivc[ip*num_vcs+
						  (mc*num_resource_classes+irc)*
						  num_vcs_per_class+icvc];
			  
			  wire [0:num_ports-1] route_op;
			  assign route_op
			    = route_ip_ivc_op[(ip*num_vcs+
					       (mc*num_resource_classes+irc)*
					       num_vcs_per_class+icvc)*
					      num_ports:
					      (ip*num_vcs+
					       (mc*num_resource_classes+irc)*
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
				num_vcs_per_class-1] 	  req_wf_op_orc_ocvc;
			  
			  genvar 			  op;
			  
			  for(op = 0; op < num_ports; op = op + 1)
			    begin:ops
			       
			       wire route;
			       assign route = route_op[op];
			       
			       wire [0:num_resource_classes-1] sel_orc;
			       assign sel_orc
				 = {num_resource_classes{req & route}} &
				   route_orc;
			       
			       wire [0:num_resource_classes*
				     num_vcs_per_class-1]      sel_orc_ocvc;
			       c_mat_mult
				 #(.dim1_width(num_resource_classes),
				   .dim2_width(1),
				   .dim3_width(num_vcs_per_class),
				   .prod_op(`BINARY_OP_AND),
				   .sum_op(`BINARY_OP_OR))
			       sel_orc_ocvc_mmult
				 (.input_a(sel_orc),
				  .input_b({num_vcs_per_class{1'b1}}),
				  .result(sel_orc_ocvc));
			       
			       wire [0:num_vcs-1] 	       sel_ovc;
			       c_align
				 #(.in_width(num_resource_classes*
					     num_vcs_per_class),
				   .out_width(num_vcs),
				   .offset(mc*num_resource_classes*
					   num_vcs_per_class))
			       sel_ovc_agn
				 (.data_in(sel_orc_ocvc),
				  .dest_in({num_vcs{1'b0}}),
				  .data_out(sel_ovc));
			       
			       wire [0:num_resource_classes*
				     num_vcs_per_class-1]      elig_orc_ocvc;
			       assign elig_orc_ocvc
				 = elig_op_ovc[(op*num_message_classes+mc)*
					       num_resource_classes*
					       num_vcs_per_class:
					       (op*num_message_classes+mc+1)*
					       num_resource_classes*
					       num_vcs_per_class-1];
			       
			       wire [0:num_resource_classes*
				     num_vcs_per_class-1]      req_wf_orc_ocvc;
			       assign req_wf_orc_ocvc
				 = sel_orc_ocvc & elig_orc_ocvc;
			       
			       assign req_wf_op_orc_ocvc[op*
							 num_resource_classes*
							 num_vcs_per_class:
							 (op+1)*
							 num_resource_classes*
							 num_vcs_per_class-1]
				 = req_wf_orc_ocvc;
			       
			    end
			  
			  assign req_wf_ip_irc_icvc_op_orc_ocvc
			    [((ip*num_resource_classes+irc)*
			      num_vcs_per_class+icvc)*
			     num_ports*num_resource_classes*num_vcs_per_class:
			     ((ip*num_resource_classes+irc)*
			      num_vcs_per_class+icvc+1)*
			     num_ports*num_resource_classes*num_vcs_per_class-1]
			    = req_wf_op_orc_ocvc;
			  
			  wire [0:num_ports*num_resource_classes*
				num_vcs_per_class-1] gnt_wf_op_orc_ocvc;
			  assign gnt_wf_op_orc_ocvc
			    = gnt_wf_ip_irc_icvc_op_orc_ocvc
			      [((ip*num_resource_classes+irc)*
				num_vcs_per_class+icvc)*
			       num_ports*num_resource_classes*
			       num_vcs_per_class:
			       ((ip*num_resource_classes+irc)*
				num_vcs_per_class+icvc+1)*
			       num_ports*num_resource_classes*
			       num_vcs_per_class-1];
			  
			  wire [0:num_resource_classes*
				num_vcs_per_class-1] gnt_wf_orc_ocvc;
			  c_binary_op
			    #(.num_ports(num_ports),
			      .width(num_resource_classes*num_vcs_per_class),
			      .op(`BINARY_OP_OR))
			  gnt_wf_orc_ocvc_or
			    (.data_in(gnt_wf_op_orc_ocvc),
			     .data_out(gnt_wf_orc_ocvc));
			  
			  wire [0:num_vcs-1] 	     gnt_wf_ovc;
			  c_align
			    #(.in_width(num_resource_classes*num_vcs_per_class),
			      .out_width(num_vcs),
			      .offset(mc*num_resource_classes*
				      num_vcs_per_class))
			  gnt_wf_ovc_agn
			    (.data_in(gnt_wf_orc_ocvc),
			     .dest_in({num_vcs{1'b0}}),
			     .data_out(gnt_wf_ovc));
			  
			  assign sel_ip_ivc_ovc[(ip*num_vcs+
						 (mc*num_resource_classes+irc)*
						 num_vcs_per_class+icvc)*
						num_vcs:
						(ip*num_vcs+
						 (mc*num_resource_classes+irc)*
						 num_vcs_per_class+icvc+1)*
						num_vcs-1]
			    = gnt_wf_ovc;
			  
			  assign gnt_ip_ivc[ip*num_vcs+
					    (mc*num_resource_classes+irc)*
					    num_vcs_per_class+icvc]
			    = |gnt_wf_ovc;
			  
		       end
		     
		  end
		
	     end
	   
	   
	   //-------------------------------------------------------------------
	   // handle interface to output controller
	   //-------------------------------------------------------------------
	   
	   wire [0:num_ports*num_resource_classes*num_vcs_per_class*num_ports*
		 num_resource_classes*
		 num_vcs_per_class-1] gnt_wf_op_orc_ocvc_ip_irc_icvc;
	   c_interleave
	     #(.width(num_ports*num_resource_classes*num_vcs_per_class*
		      num_ports*num_resource_classes*num_vcs_per_class),
	       .num_blocks(num_ports*num_resource_classes*num_vcs_per_class))
	   gnt_wf_op_orc_ocvc_ip_irc_icvc_intl
	     (.data_in(gnt_wf_ip_irc_icvc_op_orc_ocvc),
	      .data_out(gnt_wf_op_orc_ocvc_ip_irc_icvc));
	   
	   genvar 		      op;
	   
	   for(op = 0; op < num_ports; op = op + 1)
	     begin:ops
		
		genvar orc;
		
		for(orc = 0; orc < num_resource_classes; orc = orc + 1)
		  begin:orcs
		     
		     genvar ocvc;
		     
		     for(ocvc = 0; ocvc < num_vcs_per_class; ocvc = ocvc + 1)
		       begin:ocvcs
			  
			  wire [0:num_ports*num_resource_classes*
				num_vcs_per_class-1] gnt_wf_ip_irc_icvc;
			  assign gnt_wf_ip_irc_icvc
			    = gnt_wf_op_orc_ocvc_ip_irc_icvc
			      [((op*num_resource_classes+orc)*
				num_vcs_per_class+ocvc)*
			       num_ports*num_resource_classes*
			       num_vcs_per_class:
			       ((op*num_resource_classes+orc)*
				num_vcs_per_class+ocvc+1)*
			       num_ports*num_resource_classes*
			       num_vcs_per_class-1];
			  
			  wire [0:num_ports-1] 	     gnt_wf_ip;
			  c_reduce_bits
			    #(.num_ports(num_ports),
			      .width(num_resource_classes*num_vcs_per_class),
			      .op(`BINARY_OP_OR))
			  gnt_wf_ip_rb
			    (.data_in(gnt_wf_ip_irc_icvc),
			     .data_out(gnt_wf_ip));
			  
			  assign sel_op_ovc_ip[(op*num_vcs+
						(mc*num_resource_classes+orc)*
						num_vcs_per_class+ocvc)*
					       num_ports:
					       (op*num_vcs+
						(mc*num_resource_classes+orc)*
						num_vcs_per_class+ocvc+1)*
					       num_ports-1]
			    = gnt_wf_ip;
			  
			  assign gnt_op_ovc[op*num_vcs+
					    (mc*num_resource_classes+orc)*
					    num_vcs_per_class+ocvc]
			    = |gnt_wf_ip;
			  
			  wire [0:num_resource_classes*
				num_vcs_per_class-1] gnt_wf_irc_icvc;
			  c_binary_op
			    #(.num_ports(num_ports),
			      .width(num_resource_classes*num_vcs_per_class),
			      .op(`BINARY_OP_OR))
			  gnt_wf_irc_icvc_or
			    (.data_in(gnt_wf_ip_irc_icvc),
			     .data_out(gnt_wf_irc_icvc));
			  
			  wire [0:num_vcs-1] 	     gnt_wf_ivc;
			  c_align
			    #(.in_width(num_resource_classes*num_vcs_per_class),
			      .out_width(num_vcs),
			      .offset(mc*num_resource_classes*
				      num_vcs_per_class))
			  gnt_wf_ivc_alg
			    (.data_in(gnt_wf_irc_icvc),
			     .dest_in({num_vcs{1'b0}}),
			     .data_out(gnt_wf_ivc));
			  
			  assign sel_op_ovc_ivc[(op*num_vcs+
						 (mc*num_resource_classes+orc)*
						num_vcs_per_class+ocvc)*
						num_vcs:
						(op*num_vcs+
						 (mc*num_resource_classes+orc)*
						 num_vcs_per_class+ocvc+1)*
						num_vcs-1]
			    = gnt_wf_ivc;
			  
		       end
		     
		  end
		
	     end
	   
	end
      
   endgenerate
   
endmodule
