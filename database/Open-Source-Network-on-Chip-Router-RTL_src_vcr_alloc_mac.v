// $Id: vcr_alloc_mac.v 5188 2012-08-30 00:31:31Z dub $

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
// VC and switch allocators for VC router
//==============================================================================

module vcr_alloc_mac
  (clk, reset, route_ip_ivc_op, route_ip_ivc_orc, allocated_ip_ivc, 
   flit_valid_ip_ivc, flit_head_ip_ivc, flit_tail_ip_ivc, elig_op_ovc, 
   free_nonspec_ip_ivc, vc_active_op, vc_gnt_ip_ivc, vc_sel_ip_ivc_ovc, 
   vc_gnt_op_ovc, vc_sel_op_ovc_ip, vc_sel_op_ovc_ivc, sw_active_op, 
   sw_gnt_ip, sw_sel_ip_ivc, sw_gnt_op, sw_sel_op_ip, sw_sel_op_ivc, 
   flit_head_op, flit_tail_op, xbr_ctrl_op_ip);
   
`include "c_functions.v"
`include "c_constants.v"
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
   
   // number of input and output ports on router
   parameter num_ports = 5;
   
   // width required to select an individual port
   localparam port_idx_width = clogb(num_ports);
   
   // select implementation variant for VC allocator
   parameter vc_allocator_type = `SW_ALLOC_TYPE_SEP_IF;
   
   // select which arbiter type to use in VC allocator
   parameter vc_arbiter_type = `ARBITER_TYPE_ROUND_ROBIN_BINARY;
   
   // select implementation variant for VC switch allocator
   parameter sw_allocator_type = `VC_ALLOC_TYPE_SEP_IF;
   
   // select which arbiter type to use in switch allocator
   parameter sw_arbiter_type = `ARBITER_TYPE_ROUND_ROBIN_BINARY;
   
   // select speculation type
   parameter spec_type = `SW_ALLOC_SPEC_TYPE_REQ;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   
   // destination port selects
   input [0:num_ports*num_vcs*num_ports-1] route_ip_ivc_op;
   
   // select next resource class
   input [0:num_ports*num_vcs*num_resource_classes-1] route_ip_ivc_orc;
   
   // VC has output VC allocated to it
   input [0:num_ports*num_vcs-1] 		      allocated_ip_ivc;
   
   // VC has flit available
   input [0:num_ports*num_vcs-1] 		      flit_valid_ip_ivc;
   
   // flit is head flit
   input [0:num_ports*num_vcs-1] 		      flit_head_ip_ivc;
   
   // flit is tail flit
   input [0:num_ports*num_vcs-1] 		      flit_tail_ip_ivc;
   
   // output VC is eligible for allocation (i.e., not currently allocated)
   input [0:num_ports*num_vcs-1] 		      elig_op_ovc;
   
   // credit availability if output VC has been allocated
   input [0:num_ports*num_vcs-1] 		      free_nonspec_ip_ivc;
   
   // VC allocation activity (to output controller)
   output [0:num_ports-1] 			      vc_active_op;
   wire [0:num_ports-1] 			      vc_active_op;
   
   // VC allocation successful (to input controller)
   output [0:num_ports*num_vcs-1] 		      vc_gnt_ip_ivc;
   wire [0:num_ports*num_vcs-1] 		      vc_gnt_ip_ivc;
   
   // granted output VC (to input controller)
   output [0:num_ports*num_vcs*num_vcs-1] 	      vc_sel_ip_ivc_ovc;
   wire [0:num_ports*num_vcs*num_vcs-1] 	      vc_sel_ip_ivc_ovc;
   
   // output VC was granted (to output controller)
   output [0:num_ports*num_vcs-1] 		      vc_gnt_op_ovc;
   wire [0:num_ports*num_vcs-1] 		      vc_gnt_op_ovc;
   
   // input port that each output VC was granted to (to output controller)
   output [0:num_ports*num_vcs*num_ports-1] 	      vc_sel_op_ovc_ip;
   wire [0:num_ports*num_vcs*num_ports-1] 	      vc_sel_op_ovc_ip;
   
   // input VC that each output VC was granted to (to output controller)
   output [0:num_ports*num_vcs*num_vcs-1] 	      vc_sel_op_ovc_ivc;
   wire [0:num_ports*num_vcs*num_vcs-1] 	      vc_sel_op_ovc_ivc;
   
   // switch allocation activity (to output controller)
   output [0:num_ports-1] 			      sw_active_op;
   wire [0:num_ports-1] 			      sw_active_op;
   
   // port grants (to input controller)
   output [0:num_ports-1] 			      sw_gnt_ip;
   wire [0:num_ports-1] 			      sw_gnt_ip;
   
   // indicate which VC at a given port is granted (to input controller)
   output [0:num_ports*num_vcs-1] 		      sw_sel_ip_ivc;
   wire [0:num_ports*num_vcs-1] 		      sw_sel_ip_ivc;
   
   // output port grants
   output [0:num_ports-1] 			      sw_gnt_op;
   wire [0:num_ports-1] 			      sw_gnt_op;
   
   // selected output ports for grants
   output [0:num_ports*num_ports-1] 		      sw_sel_op_ip;
   wire [0:num_ports*num_ports-1] 		      sw_sel_op_ip;
   
   // selected output VCs for grants
   output [0:num_ports*num_vcs-1] 		      sw_sel_op_ivc;
   wire [0:num_ports*num_vcs-1] 		      sw_sel_op_ivc;
   
   // which grants are for head flits
   output [0:num_ports-1] 			      flit_head_op;
   wire [0:num_ports-1] 			      flit_head_op;
   
   // which grants are for tail flits
   output [0:num_ports-1] 			      flit_tail_op;
   wire [0:num_ports-1] 			      flit_tail_op;
   
   // crossbar control signals
   output [0:num_ports*num_ports-1] 		      xbr_ctrl_op_ip;
   wire [0:num_ports*num_ports-1] 		      xbr_ctrl_op_ip;
   
   wire [0:num_ports*num_vcs-1] 		      vc_req_ip_ivc;
   assign vc_req_ip_ivc = flit_valid_ip_ivc & ~allocated_ip_ivc;
   
   wire [0:num_ports-1] 			      vc_active_ip;
   c_reduce_bits
     #(.num_ports(num_ports),
       .width(num_vcs),
       .op(`BINARY_OP_OR))
   vc_active_ip_rb
     (.data_in(vc_req_ip_ivc),
      .data_out(vc_active_ip));
   
   c_select_mofn
     #(.num_ports(num_ports*num_vcs),
       .width(num_ports))
   vc_active_op_sel
     (.select(vc_req_ip_ivc),
      .data_in(route_ip_ivc_op),
      .data_out(vc_active_op));
   
   generate
      
      if(vc_allocator_type == `VC_ALLOC_TYPE_SEP_IF)
	begin
	   
	   vcr_vc_alloc_sep_if
	     #(.num_message_classes(num_message_classes),
	       .num_resource_classes(num_resource_classes),
	       .num_vcs_per_class(num_vcs_per_class),
	       .num_ports(num_ports),
	       .arbiter_type(vc_arbiter_type),
	       .reset_type(reset_type))
	   vc_core_sep_if
	     (.clk(clk),
	      .reset(reset),
	      .active_ip(vc_active_ip),
	      .active_op(vc_active_op),
	      .route_ip_ivc_op(route_ip_ivc_op),
	      .route_ip_ivc_orc(route_ip_ivc_orc),
	      .elig_op_ovc(elig_op_ovc),
	      .req_ip_ivc(vc_req_ip_ivc),
	      .gnt_ip_ivc(vc_gnt_ip_ivc),
	      .sel_ip_ivc_ovc(vc_sel_ip_ivc_ovc),
	      .gnt_op_ovc(vc_gnt_op_ovc),
	      .sel_op_ovc_ip(vc_sel_op_ovc_ip),
	      .sel_op_ovc_ivc(vc_sel_op_ovc_ivc));
	   
	end
      else if(vc_allocator_type == `VC_ALLOC_TYPE_SEP_OF)
	begin
	   
	   vcr_vc_alloc_sep_of
	     #(.num_message_classes(num_message_classes),
	       .num_resource_classes(num_resource_classes),
	       .num_vcs_per_class(num_vcs_per_class),
	       .num_ports(num_ports),
	       .arbiter_type(vc_arbiter_type),
	       .reset_type(reset_type))
	   vc_core_sep_of
	     (.clk(clk),
	      .reset(reset),
	      .active_ip(vc_active_ip),
	      .active_op(vc_active_op),
	      .route_ip_ivc_op(route_ip_ivc_op),
	      .route_ip_ivc_orc(route_ip_ivc_orc),
	      .elig_op_ovc(elig_op_ovc),
	      .req_ip_ivc(vc_req_ip_ivc),
	      .gnt_ip_ivc(vc_gnt_ip_ivc),
	      .sel_ip_ivc_ovc(vc_sel_ip_ivc_ovc),
	      .gnt_op_ovc(vc_gnt_op_ovc),
	      .sel_op_ovc_ip(vc_sel_op_ovc_ip),
	      .sel_op_ovc_ivc(vc_sel_op_ovc_ivc));
	   
	end
      else if((vc_allocator_type >= `VC_ALLOC_TYPE_WF_BASE) &&
	      (vc_allocator_type <= `VC_ALLOC_TYPE_WF_LIMIT))
	begin
	   
	   wire vc_active;
	   assign vc_active = |vc_active_ip;
	   
	   vcr_vc_alloc_wf
	     #(.num_message_classes(num_message_classes),
	       .num_resource_classes(num_resource_classes),
	       .num_vcs_per_class(num_vcs_per_class),
	       .num_ports(num_ports),
	       .wf_alloc_type(vc_allocator_type - `VC_ALLOC_TYPE_WF_BASE),
	       .reset_type(reset_type))
	   vc_core_wf
	     (.clk(clk),
	      .reset(reset),
	      .active(vc_active),
	      .route_ip_ivc_op(route_ip_ivc_op),
	      .route_ip_ivc_orc(route_ip_ivc_orc),
	      .elig_op_ovc(elig_op_ovc),
	      .req_ip_ivc(vc_req_ip_ivc),
	      .gnt_ip_ivc(vc_gnt_ip_ivc),
	      .sel_ip_ivc_ovc(vc_sel_ip_ivc_ovc),
	      .gnt_op_ovc(vc_gnt_op_ovc),
	      .sel_op_ovc_ip(vc_sel_op_ovc_ip),
	      .sel_op_ovc_ivc(vc_sel_op_ovc_ivc));
	   
	end
      
   endgenerate
   
   wire [0:num_ports*num_vcs-1] sw_req_nonspec_ip_ivc;
   assign sw_req_nonspec_ip_ivc
     = allocated_ip_ivc & flit_valid_ip_ivc & free_nonspec_ip_ivc;
   
   wire [0:num_ports*num_vcs-1] sw_req_spec_ip_ivc;
   assign sw_req_spec_ip_ivc = ~allocated_ip_ivc & flit_valid_ip_ivc;
   
   wire [0:num_ports-1] 	sw_active_ip;
   c_reduce_bits
     #(.num_ports(num_ports),
       .width(num_vcs),
       .op(`BINARY_OP_OR))
   sw_active_ip_rb
     (.data_in(flit_valid_ip_ivc),
      .data_out(sw_active_ip));
   
   c_select_mofn
     #(.num_ports(num_ports*num_vcs),
       .width(num_ports))
   sw_active_op_sel
     (.select(flit_valid_ip_ivc),
      .data_in(route_ip_ivc_op),
      .data_out(sw_active_op));
   
   generate
      
      if(sw_allocator_type == `SW_ALLOC_TYPE_SEP_IF)
	begin
	   
	   vcr_sw_alloc_sep_if
	     #(.num_vcs(num_vcs),
	       .num_ports(num_ports),
	       .arbiter_type(sw_arbiter_type),
	       .spec_type(spec_type),
	       .reset_type(reset_type))
	   sw_core_sep_if
	     (.clk(clk),
	      .reset(reset),
	      .active_ip(sw_active_ip),
	      .active_op(sw_active_op),
	      .route_ip_ivc_op(route_ip_ivc_op),
	      .req_nonspec_ip_ivc(sw_req_nonspec_ip_ivc),
	      .req_spec_ip_ivc(sw_req_spec_ip_ivc),
	      .sel_ip_ivc(sw_sel_ip_ivc),
	      .gnt_ip(sw_gnt_ip),
	      .gnt_op(sw_gnt_op),
	      .sel_op_ip(sw_sel_op_ip),
	      .sel_op_ivc(sw_sel_op_ivc));
	   
	end
      else if(sw_allocator_type == `SW_ALLOC_TYPE_SEP_OF)
	begin
	   
	   vcr_sw_alloc_sep_of
	     #(.num_vcs(num_vcs),
	       .num_ports(num_ports),
	       .arbiter_type(sw_arbiter_type),
	       .spec_type(spec_type),
	       .reset_type(reset_type))
	   sw_core_sep_of
	     (.clk(clk),
	      .reset(reset),
	      .active_ip(sw_active_ip),
	      .active_op(sw_active_op),
	      .route_ip_ivc_op(route_ip_ivc_op),
	      .req_nonspec_ip_ivc(sw_req_nonspec_ip_ivc),
	      .req_spec_ip_ivc(sw_req_spec_ip_ivc),
	      .sel_ip_ivc(sw_sel_ip_ivc),
	      .gnt_ip(sw_gnt_ip),
	      .gnt_op(sw_gnt_op),
	      .sel_op_ip(sw_sel_op_ip),
	      .sel_op_ivc(sw_sel_op_ivc));
	   
	end
      else if((sw_allocator_type >= `SW_ALLOC_TYPE_WF_BASE) &&
	      (sw_allocator_type <= `SW_ALLOC_TYPE_WF_LIMIT))
	begin
	   
	   vcr_sw_alloc_wf
	     #(.num_vcs(num_vcs),
	       .num_ports(num_ports),
	       .wf_alloc_type(sw_allocator_type - `SW_ALLOC_TYPE_WF_BASE),
	       .arbiter_type(sw_arbiter_type),
	       .spec_type(spec_type),
	       .reset_type(reset_type))
	   sw_core_wf
	     (.clk(clk),
	      .reset(reset),
	      .active_ip(sw_active_ip),
	      .route_ip_ivc_op(route_ip_ivc_op),
	      .req_nonspec_ip_ivc(sw_req_nonspec_ip_ivc),
	      .req_spec_ip_ivc(sw_req_spec_ip_ivc),
	      .sel_ip_ivc(sw_sel_ip_ivc),
	      .gnt_ip(sw_gnt_ip),
	      .gnt_op(sw_gnt_op),
	      .sel_op_ip(sw_sel_op_ip),
	      .sel_op_ivc(sw_sel_op_ivc));
	   
	end
      
   endgenerate
   
   wire [0:num_ports-1] flit_head_ip;
   wire [0:num_ports-1] flit_tail_ip;
   
   genvar ip;
   
   generate
      
      for(ip = 0; ip < num_ports; ip = ip + 1)
	begin:ips
	   
	   wire [0:num_vcs-1] sw_sel_ivc;
	   assign sw_sel_ivc = sw_sel_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1];
	   
	   wire [0:num_vcs-1] flit_head_ivc;
	   assign flit_head_ivc = flit_head_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1];
	   
	   wire 	      flit_head;
	   c_select_1ofn
	     #(.num_ports(num_vcs),
	       .width(1))
	   flit_head_sel
	     (.select(sw_sel_ivc),
	      .data_in(flit_head_ivc),
	      .data_out(flit_head));
	   
	   assign flit_head_ip[ip] = flit_head;
	   
	   wire [0:num_vcs-1] flit_tail_ivc;
	   assign flit_tail_ivc = flit_tail_ip_ivc[ip*num_vcs:(ip+1)*num_vcs-1];
	   
	   wire 	      flit_tail;
	   c_select_1ofn
	     #(.num_ports(num_vcs),
	       .width(1))
	   flit_tail_sel
	     (.select(sw_sel_ivc),
	      .data_in(flit_tail_ivc),
	      .data_out(flit_tail));
	   
	   assign flit_tail_ip[ip] = flit_tail;
	   
	end
      
   endgenerate
   
   genvar op;
   
   generate
      
      for(op = 0; op < num_ports; op = op + 1)
	begin:ops
	   
	   wire [0:num_ports-1] sw_sel_ip;
	   assign sw_sel_ip = sw_sel_op_ip[op*num_ports:(op+1)*num_ports-1];
	   
	   wire 		flit_head;
	   c_select_1ofn
	     #(.num_ports(num_ports),
	       .width(1))
	   flit_head_sel
	     (.select(sw_sel_ip),
	      .data_in(flit_head_ip),
	      .data_out(flit_head));
	   
	   assign flit_head_op[op] = flit_head;
	   
	   wire 		flit_tail;
	   c_select_1ofn
	     #(.num_ports(num_ports),
	       .width(1))
	   flit_tail_sel
	     (.select(sw_sel_ip),
	      .data_in(flit_tail_ip),
	      .data_out(flit_tail));
	   
	   assign flit_tail_op[op] = flit_tail;
	   
	   wire [0:num_ports-1] xbr_ctrl_ip;
	   
	   wire 		sw_active;
	   assign sw_active = sw_active_op[op];
	   
	   wire 		active;
	   assign active = sw_active | (|xbr_ctrl_ip);
	   
	   wire [0:num_ports-1] xbr_ctrl_ip_s, xbr_ctrl_ip_q;
	   assign xbr_ctrl_ip_s = sw_sel_ip;
	   c_dff
	     #(.width(num_ports),
	       .reset_type(reset_type))
	   xbr_ctrl_ipq
	     (.clk(clk),
	      .reset(reset),
	      .active(active),
	      .d(xbr_ctrl_ip_s),
	      .q(xbr_ctrl_ip_q));
	   
	   assign xbr_ctrl_ip = xbr_ctrl_ip_q;
	   
	   assign xbr_ctrl_op_ip[op*num_ports:(op+1)*num_ports-1] = xbr_ctrl_ip;
	   
	end
      
   endgenerate
   
endmodule
