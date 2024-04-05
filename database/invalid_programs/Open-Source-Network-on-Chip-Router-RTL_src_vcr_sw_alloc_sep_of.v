// $Id: vcr_sw_alloc_sep_of.v 5188 2012-08-30 00:31:31Z dub $

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
// switch allocator variant using separable output-first allocation
//==============================================================================

module vcr_sw_alloc_sep_of
  (clk, reset, active_ip, active_op, route_ip_ivc_op, req_nonspec_ip_ivc, 
   req_spec_ip_ivc, gnt_ip, sel_ip_ivc, gnt_op, sel_op_ip, sel_op_ivc);
   
`include "c_functions.v"
`include "c_constants.v"
`include "vcr_constants.v"
   
   // number of VCs
   parameter num_vcs = 4;
   
   // number of input and output ports on switch
   parameter num_ports = 5;
   
   // select which arbiter type to use in allocator
   parameter arbiter_type = `ARBITER_TYPE_ROUND_ROBIN_BINARY;
   
   // select speculation type
   parameter spec_type = `SW_ALLOC_SPEC_TYPE_REQ;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   
   // clock enable signals
   input [0:num_ports-1] active_ip;
   input [0:num_ports-1] active_op;
   
   // destination port selects
   input [0:num_ports*num_vcs*num_ports-1] route_ip_ivc_op;
   
   // non-speculative switch requests
   input [0:num_ports*num_vcs-1] 	   req_nonspec_ip_ivc;
   
   // speculative switch requests
   input [0:num_ports*num_vcs-1] 	   req_spec_ip_ivc;
   
   // grants
   output [0:num_ports-1] 		   gnt_ip;
   wire [0:num_ports-1] 		   gnt_ip;
   
   // indicate which VC at a given port is granted
   output [0:num_ports*num_vcs-1] 	   sel_ip_ivc;
   wire [0:num_ports*num_vcs-1] 	   sel_ip_ivc;
   
   // grants for output ports
   output [0:num_ports-1] 		   gnt_op;
   wire [0:num_ports-1] 		   gnt_op;
   
   // selected input ports (if any)
   output [0:num_ports*num_ports-1] 	   sel_op_ip;
   wire [0:num_ports*num_ports-1] 	   sel_op_ip;
   
   // selected input VCs (if any)
   output [0:num_ports*num_vcs-1] 	   sel_op_ivc;
   wire [0:num_ports*num_vcs-1] 	   sel_op_ivc;
   
   
   //---------------------------------------------------------------------------
   // global wires
   //---------------------------------------------------------------------------
   
   wire [0:num_ports*num_ports-1] 	   gnt_in_nonspec_ip_op;
   wire [0:num_ports*num_ports-1] 	   req_out_nonspec_ip_op;
   wire [0:num_ports*num_ports-1] 	   gnt_out_nonspec_ip_op;
   
   wire [0:num_ports*num_ports-1] 	   gnt_in_spec_ip_op;
   wire [0:num_ports*num_ports-1] 	   req_out_spec_ip_op;
   wire [0:num_ports*num_ports-1] 	   gnt_out_spec_ip_op;
   
   wire [0:num_ports-1] 		   unused_by_nonspec_ip;
   wire [0:num_ports-1] 		   unused_by_nonspec_op;
   
   wire [0:num_ports*num_ports-1] 	   sel_ip_op;
   
   
   //---------------------------------------------------------------------------
   // input stage
   //---------------------------------------------------------------------------
   
   generate
      
      genvar 				   ip;
      
      for(ip = 0; ip < num_ports; ip = ip + 1)
	begin:ips
	   
	   wire active;
	   assign active = active_ip[ip];
	   
	   wire [0:num_vcs*num_ports-1] route_ivc_op;
	   assign route_ivc_op
	     = route_ip_ivc_op[ip*num_vcs*num_ports:(ip+1)*num_vcs*num_ports-1];
	   
	   
	   //-------------------------------------------------------------------
	   // combine requests from all VCs
	   //-------------------------------------------------------------------
	   
	   wire [0:num_vcs-1] 		req_nonspec_ivc;
	   assign req_nonspec_ivc
	     = req_nonspec_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1];
	   
	   wire [0:num_ports-1] 	req_out_nonspec_op;
	   c_select_mofn
	     #(.width(num_ports),
	       .num_ports(num_vcs))
	   req_out_nonspec_op_sel
	     (.select(req_nonspec_ivc),
	      .data_in(route_ivc_op),
	      .data_out(req_out_nonspec_op));
	   
	   assign req_out_nonspec_ip_op[ip*num_ports:(ip+1)*num_ports-1]
	     = req_out_nonspec_op;
	   
	   
	   //-------------------------------------------------------------------
	   // use output-side grants to filter out eligible input VCs
	   //-------------------------------------------------------------------
	   
	   wire [0:num_ports-1] 	gnt_out_nonspec_op;
	   assign gnt_out_nonspec_op
	     = gnt_out_nonspec_ip_op[ip*num_ports:(ip+1)*num_ports-1];
	   
	   wire [0:num_vcs-1] 		mask_nonspec_ivc;
	   c_mat_mult
	     #(.dim1_width(num_vcs),
	       .dim2_width(num_ports),
	       .dim3_width(1),
	       .prod_op(`BINARY_OP_AND),
	       .sum_op(`BINARY_OP_OR))
	   mask_nonspec_ivc_mmult
	     (.input_a(route_ivc_op),
	      .input_b(gnt_out_nonspec_op),
	      .result(mask_nonspec_ivc));
	   
	   wire [0:num_vcs-1] 		req_in_nonspec_ivc;
	   assign req_in_nonspec_ivc = req_nonspec_ivc & mask_nonspec_ivc;
	   
	   
	   //-------------------------------------------------------------------
	   // perform input-side arbitration
	   //-------------------------------------------------------------------
	   
	   wire 			gnt_out_nonspec;
	   assign gnt_out_nonspec = |gnt_out_nonspec_op;
	   
	   wire 			update_arb_nonspec;
	   assign update_arb_nonspec = gnt_out_nonspec;
	   
	   wire [0:num_vcs-1] 		gnt_in_nonspec_ivc;
	   
	   if(spec_type != `SW_ALLOC_SPEC_TYPE_PRIO)
	     begin
		
		c_arbiter
		  #(.num_ports(num_vcs),
		    .num_priorities(1),
		    .reset_type(reset_type),
		    .arbiter_type(arbiter_type))
		gnt_in_nonspec_ivc_arb
		  (.clk(clk),
		   .reset(reset),
		   .active(active),
		   .update(update_arb_nonspec),
		   .req_pr(req_in_nonspec_ivc),
		   .gnt_pr(gnt_in_nonspec_ivc),
		   .gnt());
		
	     end
	   
	   
	   //-------------------------------------------------------------------
	   // generate global grants
	   //-------------------------------------------------------------------
	   
	   // since multiple ports may have been granted in the output stage, we
	   // must select the winning one
	   wire [0:num_ports-1] 	gnt_in_nonspec_op;
	   c_select_mofn
	     #(.width(num_ports),
	       .num_ports(num_vcs))
	   gnt_in_nonspec_op_sel
	     (.select(gnt_in_nonspec_ivc),
	      .data_in(route_ivc_op),
	      .data_out(gnt_in_nonspec_op));
	   
	   
	   //-------------------------------------------------------------------
	   // handle speculative requests
	   //-------------------------------------------------------------------
	   
	   wire [0:num_ports-1] 	req_out_spec_op;
	   wire [0:num_ports-1] 	gnt_in_spec_op;
	   wire 			gnt;
	   wire [0:num_vcs-1] 		sel_ivc;
	   wire [0:num_ports-1] 	sel_op;
	   
	   if(spec_type != `SW_ALLOC_SPEC_TYPE_NONE)
	     begin
		
		//--------------------------------------------------------------
		// combine requests from all VCs
		//--------------------------------------------------------------
		
		wire [0:num_vcs-1] req_spec_ivc;
		assign req_spec_ivc
		  = req_spec_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1];
		
		c_select_mofn
		  #(.width(num_ports),
		    .num_ports(num_vcs))
		req_out_spec_op_sel
		  (.select(req_spec_ivc),
		   .data_in(route_ivc_op),
		   .data_out(req_out_spec_op));
		
		
		//--------------------------------------------------------------
		// use output-side grants to filter out eligible input VCs
		//--------------------------------------------------------------
		
		wire [0:num_ports-1] gnt_out_spec_op;
		assign gnt_out_spec_op
		  = gnt_out_spec_ip_op[ip*num_ports:(ip+1)*num_ports-1];
		
		wire [0:num_vcs-1]   mask_spec_ivc;
		c_mat_mult
		  #(.dim1_width(num_vcs),
		    .dim2_width(num_ports),
		    .dim3_width(1),
		    .prod_op(`BINARY_OP_AND),
		    .sum_op(`BINARY_OP_OR))
		mask_spec_ivc_mmult
		  (.input_a(route_ivc_op),
		   .input_b(gnt_out_spec_op),
		   .result(mask_spec_ivc));
		
		wire [0:num_vcs-1]   req_in_spec_ivc;
		assign req_in_spec_ivc = req_spec_ivc & mask_spec_ivc;
		
		
		//--------------------------------------------------------------
		// perform input-side arbitration
		//--------------------------------------------------------------
		
		wire 		     gnt_out_spec;
		assign gnt_out_spec = |gnt_out_spec_op;
		
		wire 		     update_arb_spec;
		assign update_arb_spec = gnt_out_spec;
		
		wire [0:num_vcs-1]   gnt_in_spec_ivc;
		
		if(spec_type == `SW_ALLOC_SPEC_TYPE_PRIO)
		  begin
		     
		     wire update_arb;
		     assign update_arb = update_arb_nonspec | update_arb_spec;
		     
		     c_arbiter
		       #(.num_ports(num_vcs),
			 .num_priorities(2),
			 .reset_type(reset_type),
			 .arbiter_type(arbiter_type))
		     gnt_in_spec_ivc_arb
		       (.clk(clk),
			.reset(reset),
			.active(active),
			.update(update_arb),
			.req_pr({req_in_nonspec_ivc, req_in_spec_ivc}),
			.gnt_pr({gnt_in_nonspec_ivc, gnt_in_spec_ivc}),
			.gnt(sel_ivc));
		     
		     assign gnt = gnt_out_nonspec | gnt_out_spec;
		     assign sel_op = gnt_in_nonspec_op | gnt_in_spec_op;
		     
		  end
		else
		  begin
		     
		     c_arbiter
		       #(.num_ports(num_vcs),
			 .num_priorities(1),
			 .reset_type(reset_type),
			 .arbiter_type(arbiter_type))
		     gnt_in_spec_ivc_arb
		       (.clk(clk),
			.reset(reset),
			.active(active),
			.update(update_arb_spec),
			.req_pr(req_in_spec_ivc),
			.gnt_pr(gnt_in_spec_ivc),
			.gnt());
		     
		     wire unused_by_nonspec;
		     assign unused_by_nonspec = unused_by_nonspec_ip[ip];
		     
		     wire [0:num_ports-1] gnt_in_spec_qual_op;
		     assign gnt_in_spec_qual_op
		       = gnt_in_spec_op & unused_by_nonspec_op & 
			 {num_ports{unused_by_nonspec}};
		     
		     wire gnt_in_spec_qual;
		     assign gnt_in_spec_qual = |gnt_in_spec_qual_op;
		     
		     assign gnt = gnt_out_nonspec | gnt_in_spec_qual;
		     assign sel_op = gnt_in_nonspec_op | gnt_in_spec_qual_op;
		     
		     case(spec_type)
		       
		       `SW_ALLOC_SPEC_TYPE_REQ:
			 begin
			    
			    wire req_nonspec;
			    assign req_nonspec = |req_nonspec_ivc;
			    
			    assign sel_ivc = req_nonspec ? 
					     gnt_in_nonspec_ivc :
					     gnt_in_spec_ivc;
			    
			 end
		       
		       `SW_ALLOC_SPEC_TYPE_GNT:
			 begin
			    
			    assign sel_ivc = gnt_out_nonspec ? 
					     gnt_in_nonspec_ivc : 
					     gnt_in_spec_ivc;
			    
			 end
		       
		     endcase
		     
		  end
		
		// since multiple ports may have been granted in the output
		// stage, we must select the winning one
		c_select_mofn
		  #(.width(num_ports),
		    .num_ports(num_vcs))
		gnt_in_spec_op_sel
		  (.select(gnt_in_spec_ivc),
		   .data_in(route_ivc_op),
		   .data_out(gnt_in_spec_op));
		
	     end
	   else
	     begin
		assign req_out_spec_op = {num_ports{1'b0}};
		assign gnt_in_spec_op = {num_ports{1'b0}};
		assign sel_ivc = gnt_in_nonspec_ivc;
		assign gnt = gnt_out_nonspec;
		assign sel_op = gnt_in_nonspec_op;
	     end
	   
	   
	   //-------------------------------------------------------------------
	   // combine global grants
	   //-------------------------------------------------------------------
	   
	   assign req_out_spec_ip_op[ip*num_ports:(ip+1)*num_ports-1]
	     = req_out_spec_op;
	   assign gnt_in_nonspec_ip_op[ip*num_ports:(ip+1)*num_ports-1]
	     = gnt_in_nonspec_op;
	   assign gnt_in_spec_ip_op[ip*num_ports:(ip+1)*num_ports-1]
	     = gnt_in_spec_op;
	   assign sel_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1] = sel_ivc;
	   assign gnt_ip[ip] = gnt;
	   assign sel_ip_op[ip*num_ports:(ip+1)*num_ports-1] = sel_op;
	   
	end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // bit shuffling for changing sort order
   //---------------------------------------------------------------------------
   
   wire [0:num_ports*num_ports-1] gnt_in_nonspec_op_ip;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   gnt_in_nonspec_op_ip_intl
     (.data_in(gnt_in_nonspec_ip_op),
      .data_out(gnt_in_nonspec_op_ip));
   
   wire [0:num_ports*num_ports-1] req_out_nonspec_op_ip;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   req_out_nonspec_op_ip_intl
     (.data_in(req_out_nonspec_ip_op),
      .data_out(req_out_nonspec_op_ip));
   
   wire [0:num_ports*num_ports-1] gnt_out_nonspec_op_ip;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   gnt_out_nonspec_ip_op_intl
     (.data_in(gnt_out_nonspec_op_ip),
      .data_out(gnt_out_nonspec_ip_op));
   
   wire [0:num_ports*num_ports-1] gnt_in_spec_op_ip;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   gnt_in_spec_op_ip_intl
     (.data_in(gnt_in_spec_ip_op),
      .data_out(gnt_in_spec_op_ip));
   
   wire [0:num_ports*num_ports-1] req_out_spec_op_ip;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   req_out_spec_op_ip_intl
     (.data_in(req_out_spec_ip_op),
      .data_out(req_out_spec_op_ip));
   
   wire [0:num_ports*num_ports-1] gnt_out_spec_op_ip;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   gnt_out_spec_ip_op_intl
     (.data_in(gnt_out_spec_op_ip),
      .data_out(gnt_out_spec_ip_op));
   
   
   //---------------------------------------------------------------------------
   // mask speculative requests that conflict with non-speculative ones
   //---------------------------------------------------------------------------
   
   generate
      
      case(spec_type)
	
	`SW_ALLOC_SPEC_TYPE_NONE, `SW_ALLOC_SPEC_TYPE_PRIO:
	  begin
	     
	     assign unused_by_nonspec_ip = {num_ports{1'b0}};
	     assign unused_by_nonspec_op = {num_ports{1'b0}};
	     
	  end
	
	`SW_ALLOC_SPEC_TYPE_REQ:
	  begin
	     
	     c_binary_op
	       #(.width(num_ports),
		 .num_ports(num_ports),
		 .op(`BINARY_OP_NOR))
	     unused_by_nonspec_ip_nor
	       (.data_in(req_out_nonspec_op_ip),
		.data_out(unused_by_nonspec_ip));
	     
	     c_binary_op
	       #(.width(num_ports),
		 .num_ports(num_ports),
		 .op(`BINARY_OP_NOR))
	     unused_by_nonspec_op_nor
	       (.data_in(req_out_nonspec_ip_op),
		.data_out(unused_by_nonspec_op));
	     
	  end
	
	`SW_ALLOC_SPEC_TYPE_GNT:
	  begin
	     
	     // An input is granted if and only if there are any input-stage 
	     // requests (and thus, eiquvalently, output-stage grants) for it; 
	     // thus, it is sufficient to look at the input-side arbiter inputs,
	     // corresponding to the output-side grants, here.
	     c_binary_op
	       #(.width(num_ports),
		 .num_ports(num_ports),
		 .op(`BINARY_OP_NOR))
	     unused_by_nonspec_ip_nor
	       (.data_in(gnt_out_nonspec_op_ip),
		.data_out(unused_by_nonspec_ip));
	     
	     // However, we can make no such simplification to determine which
	     // output ports are used: A given input may have been granted 
	     // multiple outputs, but will only actually use one of them.
	     c_binary_op
	       #(.width(num_ports),
		 .num_ports(num_ports),
		 .op(`BINARY_OP_NOR))
	     unused_by_nonspec_op_nor
	       (.data_in(gnt_in_nonspec_ip_op),
		.data_out(unused_by_nonspec_op));
	     
	  end
	
      endcase
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // output stage
   //---------------------------------------------------------------------------
   
   generate
      
      genvar 				    op;
      
      for (op = 0; op < num_ports; op = op + 1)
	begin:ops
	   
	   wire active;
	   assign active = active_op[op];
	   
	   
	   //-------------------------------------------------------------------
	   // output-side arbitration stage (select input port)
	   //-------------------------------------------------------------------
	   
	   wire [0:num_ports-1] req_out_nonspec_ip;
	   assign req_out_nonspec_ip
	     = req_out_nonspec_op_ip[op*num_ports:(op+1)*num_ports-1];
	   
	   wire [0:num_ports-1] gnt_in_nonspec_ip;
	   assign gnt_in_nonspec_ip
	     = gnt_in_nonspec_op_ip[op*num_ports:(op+1)*num_ports-1];
	   
	   wire 		gnt_in_nonspec;
	   assign gnt_in_nonspec = |gnt_in_nonspec_ip;
	   
	   // if any VC requesting this output port was granted at any input
	   // port in the first stage, the corresponding second-stage grant must
	   // have taken place before that, so we can update priorities
	   wire 		update_arb_nonspec;
	   assign update_arb_nonspec = gnt_in_nonspec;
	   
	   wire [0:num_ports-1] gnt_out_nonspec_ip;
	   wire [0:num_vcs-1] 	sel_ivc;
	   
	   if(spec_type != `SW_ALLOC_SPEC_TYPE_PRIO)
	     begin
		
		c_arbiter
		  #(.num_ports(num_ports),
		    .num_priorities(1),
		    .arbiter_type(arbiter_type),
		    .reset_type(reset_type))
		gnt_out_nonspec_ip_arb
		  (.clk(clk),
		   .reset(reset),
		   .active(active),
		   .update(update_arb_nonspec),
		   .req_pr(req_out_nonspec_ip),
		   .gnt_pr(gnt_out_nonspec_ip),
		   .gnt());
		
		wire [0:num_ports-1] sel_ip;
		assign sel_ip = sel_op_ip[op*num_ports:(op+1)*num_ports-1];
		
		c_select_1ofn
		  #(.num_ports(num_ports),
		    .width(num_vcs))
		sel_ivc_sel
		  (.select(sel_ip),
		   .data_in(sel_ip_ivc),
		   .data_out(sel_ivc));
		
	     end
	   
	   assign gnt_out_nonspec_op_ip[op*num_ports:(op+1)*num_ports-1]
		    = gnt_out_nonspec_ip;
	   
	   
	   //-------------------------------------------------------------------
	   // handle speculative requests
	   //-------------------------------------------------------------------
	   
	   wire [0:num_ports-1] gnt_out_spec_ip;
	   wire 		gnt;
	   
	   if(spec_type != `SW_ALLOC_SPEC_TYPE_NONE)
	     begin
		
		//--------------------------------------------------------------
		// output-side arbitration stage (select input port)
		//--------------------------------------------------------------
		
		wire [0:num_ports-1] req_out_spec_ip;
		assign req_out_spec_ip
		  = req_out_spec_op_ip[op*num_ports:(op+1)*num_ports-1];
		
		wire [0:num_ports-1] gnt_in_spec_ip;
		assign gnt_in_spec_ip
		  = gnt_in_spec_op_ip[op*num_ports:(op+1)*num_ports-1];
		
		wire 		     gnt_in_spec;
		assign gnt_in_spec = |gnt_in_spec_ip;
		
		// if any VC requesting this output port was granted at any 
		// input port in the first stage, the corresponding second-stage
		// grant must have taken place before that, so we can update
		// priorities
		wire 		     update_arb_spec;
		assign update_arb_spec = gnt_in_spec;
		
		if(spec_type == `SW_ALLOC_SPEC_TYPE_PRIO)
		  begin
		     
		     wire update_arb;
		     assign update_arb = update_arb_nonspec | update_arb_spec;
		     
		     wire [0:num_ports-1] gnt_out_ip;
		     c_arbiter
		       #(.num_ports(num_ports),
			 .num_priorities(2),
			 .arbiter_type(arbiter_type),
			 .reset_type(reset_type))
		     gnt_out_ip_arb
		       (.clk(clk),
			.reset(reset),
			.active(active),
			.update(update_arb),
			.req_pr({req_out_nonspec_ip, req_out_spec_ip}),
			.gnt_pr({gnt_out_nonspec_ip, gnt_out_spec_ip}),
			.gnt(gnt_out_ip));
		     
		     c_select_1ofn
		       #(.num_ports(num_ports),
			 .width(num_vcs))
		     sel_ivc_sel
		       (.select(gnt_out_ip),
			.data_in(sel_ip_ivc),
			.data_out(sel_ivc));
		     
		     assign gnt = gnt_in_nonspec | gnt_in_spec;
		     
		  end
		else
		  begin
		     
		     c_arbiter
		       #(.num_ports(num_ports),
			 .num_priorities(1),
			 .arbiter_type(arbiter_type),
			 .reset_type(reset_type))
		     gnt_out_spec_ip_arb
		       (.clk(clk),
			.reset(reset),
			.active(active),
			.update(update_arb_spec),
			.req_pr(req_out_spec_ip),
			.gnt_pr(gnt_out_spec_ip),
			.gnt());
		     
		     wire unused_by_nonspec;
		     assign unused_by_nonspec = unused_by_nonspec_op[op];
		     
		     wire [0:num_ports-1] gnt_in_spec_qual_ip;
		     assign gnt_in_spec_qual_ip
		       = gnt_in_spec_ip & unused_by_nonspec_ip & 
			 {num_ports{unused_by_nonspec}};
		     
		     wire 		  gnt_in_spec_qual;
		     assign gnt_in_spec_qual = |gnt_in_spec_qual_ip;
		     
		     assign gnt = gnt_in_nonspec | gnt_in_spec_qual;
		     
		  end
		
	     end
	   else
	     begin
		assign gnt_out_spec_ip = {num_ports{1'b0}};
		assign gnt = gnt_in_nonspec;
	     end
	   
	   assign gnt_out_spec_op_ip[op*num_ports:(op+1)*num_ports-1]
	     = gnt_out_spec_ip;
	   
	   assign gnt_op[op] = gnt;
	   assign sel_op_ivc[op*num_vcs:(op+1)*num_vcs-1] = sel_ivc;
	   
	end
      
   endgenerate
   
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   sel_op_ip_intl
     (.data_in(sel_ip_op),
      .data_out(sel_op_ip));
   
endmodule
